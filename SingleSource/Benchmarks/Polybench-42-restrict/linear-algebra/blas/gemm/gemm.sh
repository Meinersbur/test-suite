#! /bin/bash
set -e -o xtrace

SCRIPTDIR=$(dirname $0)
cd $SCRIPTDIR

BUILDDIR="${HOME}/build/llvm/release"
CLANG="${BUILDDIR}/bin/clang"
(cd $BUILDDIR && ninja clang)

COMMON="gemm.c -O3 -DPOLYBENCH_USE_RESTRICT -DEXTRALARGE_DATASET -I${SCRIPTDIR}/../../../utilities -DPOLYBENCH_DUMP_ARRAYS -mllvm -polly-use-llvm-names -ffast-math -march=native  -fomit-frame-pointer" 
# -mllvm -basicaa-no-hack
# -DPOLYBENCH_USE_C99_PROTO
# -DPOLYBENCH_TIME

$CLANG $COMMON -O0 -emit-llvm -S -o gemm-raw.ll

$CLANG $COMMON -o gemm-O3

$CLANG $COMMON -mllvm -polly -mllvm -polly-run-inliner -o gemm-early
$CLANG $COMMON -mllvm -polly -mllvm -polly-run-inliner -emit-llvm -S -mllvm -debug-only=polly-ast -o gemm-early.ll

$CLANG $COMMON -mllvm -polly -mllvm -polly-position=before-vectorizer -o gemm-late

$CLANG $COMMON -mllvm -polly -mllvm -polly-position=before-vectorizer -mllvm -polly-enable-known -mllvm -polly-enable-delicm -mllvm -polly-delicm-partial-writes -mllvm -polly-enable-simplify -mllvm -polly-pattern-matching-based-opts=0 -o gemm-known-nomatmul

$CLANG $COMMON -mllvm -polly -mllvm -polly-position=before-vectorizer -mllvm -polly-enable-known -mllvm -polly-enable-delicm -mllvm -polly-delicm-partial-writes -mllvm -polly-enable-simplify -o gemm-known -mllvm -polly-dump-before-file=gemm-known-before.ll -mllvm -polly-dump-after-file=gemm-known-after.ll -mllvm -polly-dump-cleanup-file=gemm-known-cleanup.ll -save-stats  -mllvm -debug-only=polly-ast -v

$CLANG -O3 gemm-known-after.ll -o gemm-post
$CLANG -O3 gemm-known-after.ll -emit-llvm -S -o gemm-post.ll
$CLANG -O3 gemm-known-after.ll -mllvm -polly -mllvm -polly-position=before-vectorizer -mllvm -polly-dump-before-file=gemm-known-after-O3.ll -o /dev/null

time ./gemm-O3
time ./gemm-early
time ./gemm-late
time ./gemm-known-nomatmul
time ./gemm-known
time ./gemm-post
