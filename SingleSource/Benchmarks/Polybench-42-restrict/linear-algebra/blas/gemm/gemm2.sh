#! /bin/bash
set -e -o xtrace

SCRIPTDIR=$(dirname $0)
cd $SCRIPTDIR

BUILDDIR="${HOME}/build/llvm/release"
CLANG="${BUILDDIR}/bin/clang"
(cd $BUILDDIR && ninja clang)

COMMON="gemm.c -g -O3 -DPOLYBENCH_USE_RESTRICT -DNI=10 -DNJ=2 -DNK=2 -I${SCRIPTDIR}/../../../utilities -DPOLYBENCH_DUMP_ARRAYS -mllvm -polly-use-llvm-names -ffast-math -march=native  -fomit-frame-pointer" 
# -mllvm -basicaa-no-hack
# -DPOLYBENCH_USE_C99_PROTO
# -DPOLYBENCH_TIME


$CLANG $COMMON -o gemm-O3

$CLANG $COMMON -mllvm -polly -mllvm -polly-run-inliner -o gemm-early
$CLANG $COMMON -mllvm -polly -mllvm -polly-run-inliner -emit-llvm -S -mllvm -debug-only=polly-ast -o gemm-early.ll

time ./gemm-O3
time ./gemm-early

valgrind ./gemm-early
