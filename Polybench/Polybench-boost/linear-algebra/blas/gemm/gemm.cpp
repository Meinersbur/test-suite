/**
 * This version is stamped on May 10, 2016
 *
 * Contact:
 *   Louis-Noel Pouchet <pouchet.ohio-state.edu>
 *   Tomofumi Yuki <tomofumi.yuki.fr>
 *
 * Web address: http://polybench.sourceforge.net
 */
/* gemm.c: this file is part of PolyBench/C */

#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <math.h>

/* Include polybench common header. */
#include <polybench.h>

/* Include benchmark-specific header. */
#include "gemm.h"

#include <boost/numeric/ublas/vector.hpp>
#include <boost/numeric/ublas/matrix.hpp>
#include <boost/numeric/ublas/io.hpp>
using namespace boost::numeric::ublas;


/* Array initialization. */
static
void init_array(int ni, int nj, int nk,
		DATA_TYPE &alpha,
		DATA_TYPE &beta,
		matrix<DATA_TYPE> &C,
		matrix<DATA_TYPE> &A,
		matrix<DATA_TYPE> &B)
{
  int i, j;

  alpha = 1.5;
  beta = 1.2;
  C = matrix<DATA_TYPE>(ni,nj);
  for (i = 0; i < ni; i++)
    for (j = 0; j < nj; j++)
      C(i,j) = (DATA_TYPE) ((i*j+1) % ni) / ni;
  A = matrix<DATA_TYPE>(ni,nk);
  for (i = 0; i < ni; i++)
    for (j = 0; j < nk; j++)
      A(i,j) = (DATA_TYPE) (i*(j+1) % nk) / nk;
  B = matrix<DATA_TYPE>(nk,nj);
  for (i = 0; i < nk; i++)
    for (j = 0; j < nj; j++)
      B(i,j) = (DATA_TYPE) (i*(j+2) % nj) / nj;
}


/* DCE code. Must scan the entire live-out data.
   Can be used also to check the correctness of the output. */
static
void print_array(int ni, int nj,
     const matrix<DATA_TYPE> &C)
{
  int i, j;

  POLYBENCH_DUMP_START;
  POLYBENCH_DUMP_BEGIN("C");
  for (i = 0; i < ni; i++)
    for (j = 0; j < nj; j++) {
	if ((i * ni + j) % 20 == 0) fprintf (POLYBENCH_DUMP_TARGET, "\n");
	fprintf (POLYBENCH_DUMP_TARGET, DATA_PRINTF_MODIFIER, C(i,j));
    }
  POLYBENCH_DUMP_END("C");
  POLYBENCH_DUMP_FINISH;
}


/* Main computational kernel. The whole function will be timed,
   including the call and return. */
static __attribute__ ((noinline))
void kernel_gemm(int ni, int nj, int nk,
		 DATA_TYPE alpha,
		 DATA_TYPE beta,
		  matrix<DATA_TYPE> &C,
	  	matrix<DATA_TYPE> &A,
	  	matrix<DATA_TYPE> &B)
{
  C = beta*C + alpha*prod(A, B);
#if 0
  int i, j, k;

//BLAS PARAMS
//TRANSA = 'N'
//TRANSB = 'N'
// => Form C := alpha*A*B + beta*C,
//A is NIxNK
//B is NKxNJ
//C is NIxNJ
#pragma scop
  for (i = 0; i < _PB_NI; i++) {
    for (j = 0; j < _PB_NJ; j++)
	C[i][j] *= beta;
    for (k = 0; k < _PB_NK; k++) {
       for (j = 0; j < _PB_NJ; j++)
	  C[i][j] += alpha * A[i][k] * B[k][j];
    }
  }
#pragma endscop
#endif
}


int main(int argc, char** argv)
{
  /* Retrieve problem size. */
  int ni = NI;
  int nj = NJ;
  int nk = NK;

  /* Variable declaration/allocation. */
  DATA_TYPE alpha;
  DATA_TYPE beta;
  matrix<DATA_TYPE> C,A,B;

  /* Initialize array(s). */
  init_array (ni, nj, nk, alpha, beta,
	      C,
	      A,
	      B);

  /* Start timer. */
  polybench_start_instruments;

  /* Run kernel. */
  kernel_gemm (ni, nj, nk,
	       alpha, beta,
	       C,
	       A,
	       B);

  /* Stop and print timer. */
  polybench_stop_instruments;
  polybench_print_instruments;

  /* Prevent dead-code elimination. All live-out data must be printed
     by the function call in argument. */
  polybench_prevent_dce(print_array(ni, nj, C));

  /* Be clean. */
  //POLYBENCH_FREE_ARRAY(C);
  //POLYBENCH_FREE_ARRAY(A);
  //POLYBENCH_FREE_ARRAY(B);

  return 0;
}
