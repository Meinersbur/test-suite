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
#include <string.h>
#include <math.h>

/* Include polybench common header. */
#include <polybench.h>

/* Include benchmark-specific header. */
#include "gemv.h"


/* Array initialization. */
static
void init_array(int ni, int nk,
		DATA_TYPE *alpha,
		DATA_TYPE *beta,
		DATA_TYPE POLYBENCH_1D(C,NI,ni),
		DATA_TYPE POLYBENCH_2D(A,NI,NK,ni,nk),
		DATA_TYPE POLYBENCH_1D(B,NK,nj))
{
  int i, j;

  *alpha = 1.5;
  *beta = 1.2;
  for (i = 0; i < ni; i++)
      C[i] = (DATA_TYPE) (i % ni) / ni;
  for (i = 0; i < ni; i++)
    for (j = 0; j < nk; j++)
      A[i][j] = (DATA_TYPE) (i*(j+1) % nk) / nk;
  for (i = 0; i < nk; i++)
      B[i] = (DATA_TYPE) (i % ni) / ni;
}


/* DCE code. Must scan the entire live-out data.
   Can be used also to check the correctness of the output. */
static
void print_array(int ni, 
		 DATA_TYPE POLYBENCH_1D(C,NI,ni))
{
  int i;

  POLYBENCH_DUMP_START;
  POLYBENCH_DUMP_BEGIN("C");
  for (i = 0; i < ni; i++) {
	  if (i % 20 == 0) fprintf (POLYBENCH_DUMP_TARGET, "\n");
	  fprintf (POLYBENCH_DUMP_TARGET, DATA_PRINTF_MODIFIER, C[i]);
  }
  POLYBENCH_DUMP_END("C");
  POLYBENCH_DUMP_FINISH;
}


/* Main computational kernel. The whole function will be timed,
   including the call and return. */
static
void kernel_gemv(int ni, int nk,
		 DATA_TYPE alpha,
		 DATA_TYPE beta,
		 DATA_TYPE POLYBENCH_1D(C,NI,ni),
		 DATA_TYPE POLYBENCH_2D(A,NI,NK,ni,nk),
		 DATA_TYPE POLYBENCH_1D(B,NK,nk))
{
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
	    C[i] = 0;
      for (k = 0; k < _PB_NK; k++) 
	      C[i] += A[i][k] * B[k];
  }
#pragma endscop
}


int main(int argc, char** argv)
{
  /* Retrieve problem size. */
  int ni = NI;
  int nk = NK;

  /* Variable declaration/allocation. */
  DATA_TYPE alpha;
  DATA_TYPE beta;
  POLYBENCH_1D_ARRAY_DECL(C,DATA_TYPE,NI,ni);
  POLYBENCH_2D_ARRAY_DECL(A,DATA_TYPE,NI,NK,ni,nk);
  POLYBENCH_1D_ARRAY_DECL(B,DATA_TYPE,NK,nk);

  /* Initialize array(s). */
  init_array (ni, nk, &alpha, &beta,
	      POLYBENCH_ARRAY(C),
	      POLYBENCH_ARRAY(A),
	      POLYBENCH_ARRAY(B));

  /* Start timer. */
  polybench_start_instruments;

  /* Run kernel. */
  kernel_gemv (ni, nk,
	       alpha, beta,
	       POLYBENCH_ARRAY(C),
	       POLYBENCH_ARRAY(A),
	       POLYBENCH_ARRAY(B));

  /* Stop and print timer. */
  polybench_stop_instruments;
  polybench_print_instruments;

  /* Prevent dead-code elimination. All live-out data must be printed
     by the function call in argument. */
  polybench_prevent_dce(print_array(ni, POLYBENCH_ARRAY(C)));

  /* Be clean. */
  POLYBENCH_FREE_ARRAY(C);
  POLYBENCH_FREE_ARRAY(A);
  POLYBENCH_FREE_ARRAY(B);

  return 0;
}
