/**
 * This version is stamped on May 10, 2016
 *
 * Contact:
 *   Louis-Noel Pouchet <pouchet.ohio-state.edu>
 *   Tomofumi Yuki <tomofumi.yuki.fr>
 *
 * Web address: http://polybench.sourceforge.net
 */
/* 2mm.c: this file is part of PolyBench/C */

#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <math.h>

/* Include polybench common header. */
#include <polybench.h>

/* Include benchmark-specific header. */
#include "2mm.h"

#include <boost/numeric/ublas/vector.hpp>
#include <boost/numeric/ublas/matrix.hpp>
#include <boost/numeric/ublas/io.hpp>
using namespace boost::numeric::ublas;

/* Array initialization. */
static
void init_array(int ni, int nj, int nk, int nl,
		DATA_TYPE &alpha,
		DATA_TYPE &beta,
		matrix<DATA_TYPE> &A,
		matrix<DATA_TYPE> &B,
		matrix<DATA_TYPE> &C,
		matrix<DATA_TYPE> &D)
{
  int i, j;

  alpha = 1.5;
  beta = 1.2;
  A = matrix<DATA_TYPE>(ni,nk);
  for (i = 0; i < ni; i++)
    for (j = 0; j < nk; j++)
      A(i,j) = (DATA_TYPE) ((i*j+1) % ni) / ni;
  B = matrix<DATA_TYPE>(nk,nj);
  for (i = 0; i < nk; i++)
    for (j = 0; j < nj; j++)
      B(i,j) = (DATA_TYPE) (i*(j+1) % nj) / nj;
  C = matrix<DATA_TYPE>(nj,nl);
  for (i = 0; i < nj; i++)
    for (j = 0; j < nl; j++)
      C(i,j) = (DATA_TYPE) ((i*(j+3)+1) % nl) / nl;
  D = matrix<DATA_TYPE>(ni,nl);
  for (i = 0; i < ni; i++)
    for (j = 0; j < nl; j++)
      D(i,j) = (DATA_TYPE) (i*(j+2) % nk) / nk;
}


/* DCE code. Must scan the entire live-out data.
   Can be used also to check the correctness of the output. */
static
void print_array(int ni, int nl,
     matrix<DATA_TYPE> &D)
{
  int i, j;

  POLYBENCH_DUMP_START;
  POLYBENCH_DUMP_BEGIN("D");
  for (i = 0; i < ni; i++)
    for (j = 0; j < nl; j++) {
	if ((i * ni + j) % 20 == 0) fprintf (POLYBENCH_DUMP_TARGET, "\n");
	fprintf (POLYBENCH_DUMP_TARGET, DATA_PRINTF_MODIFIER, D(i,j));
    }
  POLYBENCH_DUMP_END("D");
  POLYBENCH_DUMP_FINISH;
}


/* Main computational kernel. The whole function will be timed,
   including the call and return. */
static __attribute__ ((noinline))
void kernel_2mm(int ni, int nj, int nk, int nl,
		DATA_TYPE alpha,
		DATA_TYPE beta,
		matrix<DATA_TYPE> &tmp,
		matrix<DATA_TYPE> &A,
		matrix<DATA_TYPE> &B,
		matrix<DATA_TYPE> &C,
		matrix<DATA_TYPE> &D)
{
  tmp = alpha*prod(A, B);
  D = beta*D + prod(tmp, C);
#if 0
  int i, j, k;

#pragma scop
  /* D := alpha*A*B*C + beta*D */
  for (i = 0; i < _PB_NI; i++)
    for (j = 0; j < _PB_NJ; j++)
      {
	tmp[i][j] = SCALAR_VAL(0.0);
	for (k = 0; k < _PB_NK; ++k)
	  tmp[i][j] += alpha * A[i][k] * B[k][j];
      }
  for (i = 0; i < _PB_NI; i++)
    for (j = 0; j < _PB_NL; j++)
      {
	D[i][j] *= beta;
	for (k = 0; k < _PB_NJ; ++k)
	  D[i][j] += tmp[i][k] * C[k][j];
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
  int nl = NL;

  /* Variable declaration/allocation. */
  DATA_TYPE alpha;
  DATA_TYPE beta;
  matrix<DATA_TYPE> tmp(ni,nj),A,B,C,D;


  /* Initialize array(s). */
  init_array (ni, nj, nk, nl, alpha, beta,
	      A,
	      B,
	      C,
	      D);

  /* Start timer. */
  polybench_start_instruments;

  /* Run kernel. */
  kernel_2mm (ni, nj, nk, nl,
	      alpha, beta,
	      tmp,
	      A,
	      B,
	      C,
	      D);

  /* Stop and print timer. */
  polybench_stop_instruments;
  polybench_print_instruments;

  /* Prevent dead-code elimination. All live-out data must be printed
     by the function call in argument. */
  polybench_prevent_dce(print_array(ni, nl, D));

  /* Be clean. */
  //POLYBENCH_FREE_ARRAY(tmp);
  //POLYBENCH_FREE_ARRAY(A);
  //POLYBENCH_FREE_ARRAY(B);
  //POLYBENCH_FREE_ARRAY(C);
  //POLYBENCH_FREE_ARRAY(D);

  return 0;
}
