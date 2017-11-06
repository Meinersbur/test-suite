/**
 * This version is stamped on May 10, 2016
 *
 * Contact:
 *   Louis-Noel Pouchet <pouchet.ohio-state.edu>
 *   Tomofumi Yuki <tomofumi.yuki.fr>
 *
 * Web address: http://polybench.sourceforge.net
 */
/* correlation.c: this file is part of PolyBench/C */

#include <boost/numeric/ublas/vector.hpp>
#include <boost/numeric/ublas/matrix.hpp>
#include <boost/numeric/ublas/io.hpp>
using namespace boost::numeric::ublas;

#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <math.h>

/* Include polybench common header. */
#include <polybench.h>

/* Include benchmark-specific header. */
#include "correlation.h"



/* Array initialization. */
static
void init_array (int m,
		 int n,
		 DATA_TYPE &float_n,
		 matrix<DATA_TYPE> &data)
{
  int i, j;

  float_n = (DATA_TYPE)N;

  for (i = 0; i < N; i++)
    for (j = 0; j < M; j++)
      data(i,j) = (DATA_TYPE)(i*j)/M + i;
}


/* DCE code. Must scan the entire live-out data.
   Can be used also to check the correctness of the output. */
static
void print_array(int m,
      matrix<DATA_TYPE> &corr)

{
  int i, j;

  POLYBENCH_DUMP_START;
  POLYBENCH_DUMP_BEGIN("corr");
  for (i = 0; i < m; i++)
    for (j = 0; j < m; j++) {
      if ((i * m + j) % 20 == 0) fprintf (POLYBENCH_DUMP_TARGET, "\n");
      fprintf (POLYBENCH_DUMP_TARGET, DATA_PRINTF_MODIFIER, corr(i,j));
    }
  POLYBENCH_DUMP_END("corr");
  POLYBENCH_DUMP_FINISH;
}


/* Main computational kernel. The whole function will be timed,
   including the call and return. */
static __attribute__ ((noinline))
void kernel_correlation(int m, int n,
			DATA_TYPE float_n,
			matrix<DATA_TYPE> &data,
			matrix<DATA_TYPE> &corr,
			vector<DATA_TYPE> &mean,
			vector<DATA_TYPE> &stddev)
{

  DATA_TYPE eps = SCALAR_VAL(0.1);
  
  for (int j = 0; j < _PB_M; j++) {
      mean(j) = SCALAR_VAL(0.0);
      for (int i = 0; i < _PB_N; i++)
        mean(j) += data(i,j);
      mean(j) /= float_n;
    }

   for (int j = 0; j < _PB_M; j++) {
      stddev(j) = SCALAR_VAL(0.0);
      for (int i = 0; i < _PB_N; i++)
        stddev(j) += (data(i,j) - mean(j)) * (data(i,j) - mean(j));
      stddev(j) /= float_n;
      stddev(j) = SQRT_FUN(stddev(j));
      /* The following in an inelegant but usual way to handle
         near-zero std. dev. values, which below would cause a zero-
         divide. */
      stddev(j) = stddev(j) <= eps ? SCALAR_VAL(1.0) : stddev(j);
    }

  /* Center and reduce the column vectors. */
  for (int i = 0; i < _PB_N; i++)
    for (int j = 0; j < _PB_M; j++) {
        data(i,j) -= mean(j);
        data(i,j) /= SQRT_FUN(float_n) * stddev(j);
      }

  /* Calculate the m * m correlation matrix. */
  for (int i = 0; i < _PB_M-1; i++) {
      corr(i,i) = SCALAR_VAL(1.0);
      for (int j = i+1; j < _PB_M; j++)
        {
          corr(i,j) = SCALAR_VAL(0.0);
          for (int k = 0; k < _PB_N; k++)
            corr(i,j) += (data(k,i) * data(k,j));
          corr(j,i) = corr(i,j);
        }
    }
  corr(_PB_M-1,_PB_M-1) = SCALAR_VAL(1.0);
  
#if 0
#pragma scop
  for (j = 0; j < _PB_M; j++)
    {
      mean[j] = SCALAR_VAL(0.0);
      for (i = 0; i < _PB_N; i++)
	mean[j] += data[i][j];
      mean[j] /= float_n;
    }


   for (j = 0; j < _PB_M; j++)
    {
      stddev[j] = SCALAR_VAL(0.0);
      for (i = 0; i < _PB_N; i++)
        stddev[j] += (data[i][j] - mean[j]) * (data[i][j] - mean[j]);
      stddev[j] /= float_n;
      stddev[j] = SQRT_FUN(stddev[j]);
      /* The following in an inelegant but usual way to handle
         near-zero std. dev. values, which below would cause a zero-
         divide. */
      stddev[j] = stddev[j] <= eps ? SCALAR_VAL(1.0) : stddev[j];
    }

  /* Center and reduce the column vectors. */
  for (i = 0; i < _PB_N; i++)
    for (j = 0; j < _PB_M; j++)
      {
        data[i][j] -= mean[j];
        data[i][j] /= SQRT_FUN(float_n) * stddev[j];
      }

  /* Calculate the m * m correlation matrix. */
  for (i = 0; i < _PB_M-1; i++)
    {
      corr[i][i] = SCALAR_VAL(1.0);
      for (j = i+1; j < _PB_M; j++)
        {
          corr[i][j] = SCALAR_VAL(0.0);
          for (k = 0; k < _PB_N; k++)
            corr[i][j] += (data[k][i] * data[k][j]);
          corr[j][i] = corr[i][j];
        }
    }
  corr[_PB_M-1][_PB_M-1] = SCALAR_VAL(1.0);
#pragma endscop
#endif
}


int main(int argc, char** argv)
{
  /* Retrieve problem size. */
  int n = N;
  int m = M;

  /* Variable declaration/allocation. */
  DATA_TYPE float_n;
  matrix<DATA_TYPE> data(n,m),corr(m,m);
  vector<DATA_TYPE> mean(m), stddev(m);
  
  /* Initialize array(s). */
  init_array (m, n, float_n, data);

  /* Start timer. */
  polybench_start_instruments;

  /* Run kernel. */
  kernel_correlation (m, n, float_n,
		      data,
		      corr,
		      mean,
		      stddev);

  /* Stop and print timer. */
  polybench_stop_instruments;
  polybench_print_instruments;

  /* Prevent dead-code elimination. All live-out data must be printed
     by the function call in argument. */
  polybench_prevent_dce(print_array(m, corr));

  /* Be clean. */
  //POLYBENCH_FREE_ARRAY(data);
  //POLYBENCH_FREE_ARRAY(corr);
  //POLYBENCH_FREE_ARRAY(mean);
  //POLYBENCH_FREE_ARRAY(stddev);

  return 0;
}
