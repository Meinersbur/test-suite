#include <stdint.h>

// NoAlias
void slp1(float (* restrict C)[2028], float (* restrict A)[2028], float (* restrict B)[2028], float delta, int64_t i, int64_t j) {
  int64_t shl = i << 3;
  int64_t base = 16*j;
  int64_t i0 = base + (shl | 0);
  int64_t i1 = base + (shl | 1);
  int64_t i2 = base + (shl | 2);
  int64_t i3 = base + (shl | 3);
  C[0][i0] = delta * A[0][i0] * B[0][i0];
  C[0][i1] = delta * A[0][i1] * B[0][i1];
  C[0][i2] = delta * A[0][i2] * B[0][i2]; 
  C[0][i3] = delta * A[0][i3] * B[0][i3]; 
}

// PartialAlias
void slp0(void * restrict Cp, void * restrict Ap,void * restrict Bp, float delta, int64_t i, int64_t j) {
  float *C = Cp;
  float *A = Ap;
  float *B = Bp;
  int64_t shl = i << 3l;
  int64_t base = 16*j;
  int64_t i0 = base + (shl | 0);
  int64_t i1 = base + (shl | 1);
  int64_t i2 = base + (shl | 2);
  int64_t i3 = base + (shl | 3);
  C[i0] = delta * A[i0] * B[i0];
  C[i1] = delta * A[i1] * B[i1];
  C[i2] = delta * A[i2] * B[i2]; 
  C[i3] = delta * A[i3] * B[i3]; 
}

