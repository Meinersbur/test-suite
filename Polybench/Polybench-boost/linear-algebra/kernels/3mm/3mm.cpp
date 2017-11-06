/**
 * This version is stamped on May 10, 2016
 *
 * Contact:
 *   Louis-Noel Pouchet <pouchet.ohio-state.edu>
 *   Tomofumi Yuki <tomofumi.yuki.fr>
 *
 * Web address: http://polybench.sourceforge.net
 */
/* 3mm.c: this file is part of PolyBench/C */

#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <math.h>

/* Include polybench common header. */
#include <polybench.h>

/* Include benchmark-specific header. */
#include "3mm.h"

#include <boost/numeric/ublas/vector.hpp>
#include <boost/numeric/ublas/matrix.hpp>
#include <boost/numeric/ublas/io.hpp>
using namespace boost::numeric::ublas;

/* Array initialization. */
static
void init_array(int ni, int nj, int nk, int nl, int nm,
		matrix<DATA_TYPE> &A,
		matrix<DATA_TYPE> &B,
		matrix<DATA_TYPE> &C,
		matrix<DATA_TYPE> &D)
{
  int i, j;

  for (i = 0; i < ni; i++)
    for (j = 0; j < nk; j++)
      A(i,j) = (DATA_TYPE) ((i*j+1) % ni) / (5*ni);
  for (i = 0; i < nk; i++)
    for (j = 0; j < nj; j++)
      B(i,j) = (DATA_TYPE) ((i*(j+1)+2) % nj) / (5*nj);
  for (i = 0; i < nj; i++)
    for (j = 0; j < nm; j++)
      C(i,j) = (DATA_TYPE) (i*(j+3) % nl) / (5*nl);
  for (i = 0; i < nm; i++)
    for (j = 0; j < nl; j++)
      D(i,j) = (DATA_TYPE) ((i*(j+2)+2) % nk) / (5*nk);
}


/* DCE code. Must scan the entire live-out data.
   Can be used also to check the correctness of the output. */
static
void print_array(int ni, int nl,
		 matrix<DATA_TYPE> &G)
{
  int i, j;

  POLYBENCH_DUMP_START;
  POLYBENCH_DUMP_BEGIN("G");
  for (i = 0; i < ni; i++)
    for (j = 0; j < nl; j++) {
	if ((i * ni + j) % 20 == 0) fprintf (POLYBENCH_DUMP_TARGET, "\n");
	fprintf (POLYBENCH_DUMP_TARGET, DATA_PRINTF_MODIFIER, G(i,j));
    }
  POLYBENCH_DUMP_END("G");
  POLYBENCH_DUMP_FINISH;
}


/* Main computational kernel. The whole function will be timed,
   including the call and return. */
static __attribute__ ((noinline))
void kernel_3mm(int ni, int nj, int nk, int nl, int nm,
		matrix<DATA_TYPE> &E,
		matrix<DATA_TYPE> &A,
		matrix<DATA_TYPE> &B,
		matrix<DATA_TYPE> &F,
		matrix<DATA_TYPE> &C,
		matrix<DATA_TYPE> &D,
		matrix<DATA_TYPE> &G)
{
  E = prod(A,B);
  F = prod(C,D);
  G = prod(E,F);
#if 0
  int i, j, k;

#pragma scop
  /* E := A*B */
  for (i = 0; i < _PB_NI; i++)
    for (j = 0; j < _PB_NJ; j++)
      {
	E[i][j] = SCALAR_VAL(0.0);
	for (k = 0; k < _PB_NK; ++k)
	  E[i][j] += A[i][k] * B[k][j];
      }
  /* F := C*D */
  for (i = 0; i < _PB_NJ; i++)
    for (j = 0; j < _PB_NL; j++)
      {
	F[i][j] = SCALAR_VAL(0.0);
	for (k = 0; k < _PB_NM; ++k)
	  F[i][j] += C[i][k] * D[k][j];
      }
  /* G := E*F */
  for (i = 0; i < _PB_NI; i++)
    for (j = 0; j < _PB_NL; j++)
      {
	G[i][j] = SCALAR_VAL(0.0);
	for (k = 0; k < _PB_NJ; ++k)
	  G[i][j] += E[i][k] * F[k][j];
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
  int nm = NM;

  /* Variable declaration/allocation. */
  matrix<DATA_TYPE> E(ni,nj),A(ni,nk),B(nk,nj),F(nj,nl),C(nj,nm),D(nm,nl),G(ni,nl);

  /* Initialize array(s). */
  init_array (ni, nj, nk, nl, nm,
	      A,
	      B,
	      C,
	      D);

  /* Start timer. */
  polybench_start_instruments;

  /* Run kernel. */
  kernel_3mm (ni, nj, nk, nl, nm,
	      E,
	      A,
	      B,
	      F,
	      C,
	      D,
	      G);

  /* Stop and print timer. */
  polybench_stop_instruments;
  polybench_print_instruments;

  /* Prevent dead-code elimination. All live-out data must be printed
     by the function call in argument. */
  polybench_prevent_dce(print_array(ni, nl, G));

  /* Be clean. */
  //POLYBENCH_FREE_ARRAY(E);
  //POLYBENCH_FREE_ARRAY(A);
  //POLYBENCH_FREE_ARRAY(B);
  //POLYBENCH_FREE_ARRAY(F);
  //POLYBENCH_FREE_ARRAY(C);
  //POLYBENCH_FREE_ARRAY(D);
  //POLYBENCH_FREE_ARRAY(G);

  return 0;
}
