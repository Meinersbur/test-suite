#! /bin/bash
set -e -o xtrace

SCRIPTDIR=$(dirname $0)
cd $SCRIPTDIR

BUILDDIR="${HOME}/build/llvm/release"
CLANG="${BUILDDIR}/bin/clang"
(cd $BUILDDIR && ninja clang)

$CLANG gemm-known-after_fast.ll -O3 -o gemm-known-after_fast > alias_fast.txt
time ./gemm-known-after_fast


$CLANG gemm-known-after_slow.ll -O3 -o gemm-known-after_slow > alias_slow.txt
time ./gemm-known-after_slow
