#! /bin/bash
set -e -o xtrace

SCRIPTDIR=$(dirname $0)
cd $SCRIPTDIR

BUILDDIR="${HOME}/build/llvm/release"
CLANG="${BUILDDIR}/bin/clang"
OPT="${BUILDDIR}/bin/opt"
LLC="${BUILDDIR}/bin/llc"
(cd $BUILDDIR && ninja clang opt llc)

$CLANG gemm-known-after_fast.ll -O3 -mllvm -debug-pass=Arguments

$OPT  -tti -targetlibinfo -tbaa -scoped-noalias -assumption-cache-tracker -verify -simplifycfg -domtree -sroa -early-cse -lower-expect   gemm-known-after_fast.ll -tti -targetlibinfo -tbaa -scoped-noalias -assumption-cache-tracker -profile-summary-info -forceattrs -inferattrs -ipsccp -globalopt -domtree -mem2reg -deadargelim -domtree -basicaa -aa -instcombine -simplifycfg -basiccg -globals-aa -prune-eh -inline -functionattrs -argpromotion -domtree -sroa -early-cse -domtree -basicaa -aa -lazy-value-info -jump-threading -correlated-propagation -simplifycfg -domtree -basicaa -aa -instcombine -libcalls-shrinkwrap -loops -branch-prob -block-freq -pgo-memop-opt -tailcallelim -simplifycfg -reassociate -domtree -loops -loop-simplify -lcssa-verification -lcssa -basicaa -aa -scalar-evolution -loop-rotate -licm -loop-unswitch -simplifycfg -domtree -basicaa -aa -instcombine -loops -loop-simplify -lcssa-verification -lcssa -scalar-evolution -indvars -loop-idiom -loop-deletion -loop-unroll -mldst-motion -aa -memdep -lazy-branch-prob -lazy-block-freq -opt-remark-emitter -gvn -basicaa -aa -memdep -memcpyopt -sccp -domtree -demanded-bits -bdce -basicaa -aa -instcombine -lazy-value-info -jump-threading -correlated-propagation -domtree -basicaa -aa -memdep -dse -loops -loop-simplify -lcssa-verification -lcssa -aa -scalar-evolution -licm -postdomtree -adce -simplifycfg -domtree -basicaa -aa -instcombine -barrier -elim-avail-extern -basiccg -rpo-functionattrs -globals-aa -float2int -domtree -loops -loop-simplify -lcssa-verification -lcssa -basicaa -aa -scalar-evolution -loop-rotate -loop-accesses -lazy-branch-prob -lazy-block-freq -opt-remark-emitter -loop-distribute -branch-prob -block-freq -scalar-evolution -basicaa -aa -loop-accesses -demanded-bits -lazy-branch-prob -lazy-block-freq -opt-remark-emitter -loop-vectorize -loop-simplify -scalar-evolution -aa -loop-accesses -loop-load-elim -basicaa -aa -instcombine -scalar-evolution -demanded-bits -lazy-branch-prob -lazy-block-freq -opt-remark-emitter -slp-vectorizer -latesimplifycfg -domtree -basicaa -aa -instcombine -loops -loop-simplify -lcssa-verification -lcssa -scalar-evolution -loop-unroll -instcombine -loop-simplify -lcssa-verification -lcssa -scalar-evolution -licm -alignment-from-assumptions -strip-dead-prototypes -globaldce -constmerge -domtree -loops -branch-prob -block-freq -loop-simplify -lcssa-verification -lcssa -basicaa -aa -scalar-evolution -branch-prob -block-freq -loop-sink -lazy-branch-prob -lazy-block-freq -opt-remark-emitter -instsimplify -simplifycfg -S -o gemm-known-after_fast-O3.ll 
$CLANG gemm-known-after_fast-O3.ll  -o gemm-llc
time ./gemm-llc
