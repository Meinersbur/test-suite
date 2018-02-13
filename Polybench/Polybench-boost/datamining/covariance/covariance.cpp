/**
 * This version is stamped on May 10, 2016
 *
 * Contact:
 *   Louis-Noel Pouchet <pouchet.ohio-state.edu>
 *   Tomofumi Yuki <tomofumi.yuki.fr>
 *
 * Web address: http://polybench.sourceforge.net
 */
/* covariance.c: this file is part of PolyBench/C */

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
#include "covariance.h"


/* Array initialization. */
static
void init_array (int m,
		 int n,
		 DATA_TYPE &float_n,
		 matrix<DATA_TYPE> &data)
{
  int i, j;

  float_n = (DATA_TYPE)n;

  for (i = 0; i < N; i++)
    for (j = 0; j < M; j++)
      data(i,j) = ((DATA_TYPE) i*j) / M;
}


/* DCE code. Must scan the entire live-out data.
   Can be used also to check the correctness of the output. */
static
void print_array(int m,
		 matrix<DATA_TYPE> &cov)

{
  int i, j;

  POLYBENCH_DUMP_START;
  POLYBENCH_DUMP_BEGIN("cov");
  for (i = 0; i < m; i++)
    for (j = 0; j < m; j++) {
      if ((i * m + j) % 20 == 0) fprintf (POLYBENCH_DUMP_TARGET, "\n");
      fprintf (POLYBENCH_DUMP_TARGET, DATA_PRINTF_MODIFIER, cov(i,j));
    }
  POLYBENCH_DUMP_END("cov");
  POLYBENCH_DUMP_FINISH;
}


/* Main computational kernel. The whole function will be timed,
   including the call and return. */
static __attribute__ ((noinline))
void kernel_covariance(int m, int n,
		       DATA_TYPE float_n,
		       matrix<DATA_TYPE> &data,
		       matrix<DATA_TYPE> &cov,
		       vector<DATA_TYPE> &mean)
{
  for (int j = 0; j < _PB_M; j++) {
      mean(j) = SCALAR_VAL(0.0);
      for (int i = 0; i < _PB_N; i++)
        mean(j) += data(i,j);
      mean(j) /= float_n;
  }

  for (int i = 0; i < _PB_N; i++)
    for (int j = 0; j < _PB_M; j++)
      data(i,j) -= mean(j);

  for (int i = 0; i < _PB_M; i++)
    for (int j = i; j < _PB_M; j++) {
        cov(i,j) = SCALAR_VAL(0.0);
        for (int k = 0; k < _PB_N; k++)
          cov(i,j) += data(k,i) * data(k,i);
        cov(i,j) /= (float_n - SCALAR_VAL(1.0));
        cov(j,i) = cov(i,j);
      }

#if 0
  int i, j, k;

#pragma scop
  for (j = 0; j < _PB_M; j++)
    {
      mean[j] = SCALAR_VAL(0.0);
      for (i = 0; i < _PB_N; i++)
        mean[j] += data[i][j];
      mean[j] /= float_n;
    }

  for (i = 0; i < _PB_N; i++)
    for (j = 0; j < _PB_M; j++)
      data[i][j] -= mean[j];

  for (i = 0; i < _PB_M; i++)
    for (j = i; j < _PB_M; j++)
      {
        cov[i][j] = SCALAR_VAL(0.0);
        for (k = 0; k < _PB_N; k++)
	  cov[i][j] += data[k][i] * data[k][j];
        cov[i][j] /= (float_n - SCALAR_VAL(1.0));
        cov[j][i] = cov[i][j];
      }
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
  matrix<DATA_TYPE> data(n,m), cov(m,m);
  vector<DATA_TYPE> mean(m);


  /* Initialize array(s). */
  init_array (m, n, float_n, data);

  /* Start timer. */
  polybench_start_instruments;

  /* Run kernel. */
  kernel_covariance (m, n, float_n,
		     data,
		     cov,
		     mean);

  /* Stop and print timer. */
  polybench_stop_instruments;
  polybench_print_instruments;

  /* Prevent dead-code elimination. All live-out data must be printed
     by the function call in argument. */
  polybench_prevent_dce(print_array(m, cov));

  /* Be clean. */
  //POLYBENCH_FREE_ARRAY(data);
  //POLYBENCH_FREE_ARRAY(cov);
  //POLYBENCH_FREE_ARRAY(mean);

  return 0;
}
