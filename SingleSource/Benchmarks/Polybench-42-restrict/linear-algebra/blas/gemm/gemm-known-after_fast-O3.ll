; ModuleID = 'gemm-known-after_fast.ll'
source_filename = "gemm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@polybench_t_start = common local_unnamed_addr global double 0.000000e+00, align 8
@polybench_t_end = common local_unnamed_addr global double 0.000000e+00, align 8
@polybench_c_start = common local_unnamed_addr global i64 0, align 8
@polybench_c_end = common local_unnamed_addr global i64 0, align 8

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readnone %argv) local_unnamed_addr #0 {
entry:
  %ret18 = alloca i8*, align 8
  %ret10 = alloca i8*, align 8
  %ret = alloca i8*, align 8
  %0 = bitcast i8** %ret to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %0) #5
  store i8* null, i8** %ret, align 8, !tbaa !2
  %call18 = call i32 @posix_memalign(i8** nonnull %ret, i64 4096, i64 36800000) #5
  %1 = load i8*, i8** %ret, align 8, !tbaa !2
  %tobool = icmp eq i8* %1, null
  %tobool2 = icmp ne i32 %call18, 0
  %or.cond = or i1 %tobool2, %tobool
  br i1 %or.cond, label %if.then, label %polybench_alloc_data.exit

if.then:                                          ; preds = %entry
  call void @exit(i32 1) #6
  unreachable

polybench_alloc_data.exit:                        ; preds = %entry
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %0) #5
  %2 = bitcast i8** %ret10 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %2) #5
  store i8* null, i8** %ret10, align 8, !tbaa !2
  %call111 = call i32 @posix_memalign(i8** nonnull %ret10, i64 4096, i64 41600000) #5
  %3 = load i8*, i8** %ret10, align 8, !tbaa !2
  %tobool12 = icmp eq i8* %3, null
  %tobool213 = icmp ne i32 %call111, 0
  %or.cond14 = or i1 %tobool213, %tobool12
  br i1 %or.cond14, label %if.then16, label %polybench_alloc_data.exit17

if.then16:                                        ; preds = %polybench_alloc_data.exit
  call void @exit(i32 1) #6
  unreachable

polybench_alloc_data.exit17:                      ; preds = %polybench_alloc_data.exit
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %2) #5
  %4 = bitcast i8** %ret18 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %4) #5
  store i8* null, i8** %ret18, align 8, !tbaa !2
  %call1 = call i32 @posix_memalign(i8** nonnull %ret18, i64 4096, i64 47840000) #5
  %5 = load i8*, i8** %ret18, align 8, !tbaa !2
  %tobool19 = icmp eq i8* %5, null
  %tobool220 = icmp ne i32 %call1, 0
  %or.cond21 = or i1 %tobool220, %tobool19
  br i1 %or.cond21, label %if.then23, label %polybench_alloc_data.exit24

if.then23:                                        ; preds = %polybench_alloc_data.exit17
  call void @exit(i32 1) #6
  unreachable

polybench_alloc_data.exit24:                      ; preds = %polybench_alloc_data.exit17
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %4) #5
  %arraydecay = bitcast i8* %1 to [2300 x double]*
  %arraydecay1 = bitcast i8* %3 to [2600 x double]*
  %arraydecay2 = bitcast i8* %5 to [2300 x double]*
  call fastcc void @kernel_gemm([2300 x double]* %arraydecay, [2600 x double]* %arraydecay1, [2300 x double]* %arraydecay2) #5
  ret i32 0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #1

; Function Attrs: nounwind
declare i32 @posix_memalign(i8**, i64, i64) local_unnamed_addr #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) local_unnamed_addr #3

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_gemm([2300 x double]* noalias nocapture %C, [2600 x double]* noalias nocapture %A, [2300 x double]* noalias nocapture %B) unnamed_addr #4 {
entry:
  %Packed_B = alloca [256 x [384 x [4 x double]]], align 64
  %Packed_A = alloca [16 x [384 x [4 x double]]], align 64
  br label %polly.loop_header

polly.exiting:                                    ; preds = %polly.loop_exit121
  ret void

polly.loop_header:                                ; preds = %polly.loop_exit22, %entry
  %polly.indvar = phi i64 [ 0, %entry ], [ %polly.indvar_next, %polly.loop_exit22 ]
  %0 = mul nsw i64 %polly.indvar, -32
  %1 = add nsw i64 %0, 1999
  %2 = icmp slt i64 %1, 31
  %3 = select i1 %2, i64 %1, i64 31
  %4 = shl nsw i64 %polly.indvar, 5
  br label %polly.loop_header20

polly.loop_exit22:                                ; preds = %polly.loop_exit28
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond36 = icmp eq i64 %polly.indvar_next, 63
  br i1 %exitcond36, label %polly.loop_header38, label %polly.loop_header

polly.loop_header20:                              ; preds = %polly.loop_exit28, %polly.loop_header
  %polly.indvar23 = phi i64 [ 0, %polly.loop_header ], [ %polly.indvar_next24, %polly.loop_exit28 ]
  %5 = mul nsw i64 %polly.indvar23, -32
  %6 = add nsw i64 %5, 2599
  %7 = icmp slt i64 %6, 31
  %8 = select i1 %7, i64 %6, i64 31
  %9 = shl nsw i64 %polly.indvar23, 5
  br label %polly.loop_header26

polly.loop_exit28:                                ; preds = %polly.loop_exit34
  %polly.indvar_next24 = add nuw nsw i64 %polly.indvar23, 1
  %exitcond35 = icmp eq i64 %polly.indvar_next24, 82
  br i1 %exitcond35, label %polly.loop_exit22, label %polly.loop_header20

polly.loop_header26:                              ; preds = %polly.loop_header20, %polly.loop_exit34
  %polly.indvar29 = phi i64 [ 0, %polly.loop_header20 ], [ %polly.indvar_next30, %polly.loop_exit34 ]
  %10 = add nuw nsw i64 %polly.indvar29, %4
  %11 = trunc i64 %10 to i32
  br label %polly.loop_header32

polly.loop_exit34:                                ; preds = %polly.loop_header32
  %polly.indvar_next30 = add nuw nsw i64 %polly.indvar29, 1
  %polly.loop_cond31 = icmp slt i64 %polly.indvar29, %3
  br i1 %polly.loop_cond31, label %polly.loop_header26, label %polly.loop_exit28

polly.loop_header32:                              ; preds = %polly.loop_header26, %polly.loop_header32
  %polly.indvar35 = phi i64 [ 0, %polly.loop_header26 ], [ %polly.indvar_next36, %polly.loop_header32 ]
  %12 = add nuw nsw i64 %polly.indvar35, %9
  %13 = trunc i64 %12 to i32
  %14 = add i32 %13, 1
  %15 = mul i32 %14, %11
  %p_rem20 = srem i32 %15, 2600
  %p_conv21 = sitofp i32 %p_rem20 to double
  %p_div23 = fdiv double %p_conv21, 2.600000e+03
  %scevgep = getelementptr [2600 x double], [2600 x double]* %A, i64 %10, i64 %12
  store double %p_div23, double* %scevgep, align 8, !alias.scope !6, !noalias !8
  %polly.indvar_next36 = add nuw nsw i64 %polly.indvar35, 1
  %polly.loop_cond37 = icmp slt i64 %polly.indvar35, %8
  br i1 %polly.loop_cond37, label %polly.loop_header32, label %polly.loop_exit34

polly.loop_header38:                              ; preds = %polly.loop_exit22, %polly.loop_exit46
  %polly.indvar41 = phi i64 [ %polly.indvar_next42, %polly.loop_exit46 ], [ 0, %polly.loop_exit22 ]
  %16 = mul nsw i64 %polly.indvar41, -32
  %17 = add nsw i64 %16, 1999
  %18 = icmp slt i64 %17, 31
  %19 = select i1 %18, i64 %17, i64 31
  %20 = shl nsw i64 %polly.indvar41, 5
  br label %polly.loop_header44

polly.loop_exit46:                                ; preds = %polly.loop_exit52
  %polly.indvar_next42 = add nuw nsw i64 %polly.indvar41, 1
  %exitcond34 = icmp eq i64 %polly.indvar_next42, 63
  br i1 %exitcond34, label %polly.loop_header63, label %polly.loop_header38

polly.loop_header44:                              ; preds = %polly.loop_exit52, %polly.loop_header38
  %polly.indvar47 = phi i64 [ 0, %polly.loop_header38 ], [ %polly.indvar_next48, %polly.loop_exit52 ]
  %21 = mul nsw i64 %polly.indvar47, -32
  %22 = add nsw i64 %21, 2299
  %23 = icmp slt i64 %22, 31
  %24 = select i1 %23, i64 %22, i64 31
  %25 = shl nsw i64 %polly.indvar47, 5
  br label %polly.loop_header50

polly.loop_exit52:                                ; preds = %polly.loop_exit58
  %polly.indvar_next48 = add nuw nsw i64 %polly.indvar47, 1
  %exitcond33 = icmp eq i64 %polly.indvar_next48, 72
  br i1 %exitcond33, label %polly.loop_exit46, label %polly.loop_header44

polly.loop_header50:                              ; preds = %polly.loop_header44, %polly.loop_exit58
  %polly.indvar53 = phi i64 [ 0, %polly.loop_header44 ], [ %polly.indvar_next54, %polly.loop_exit58 ]
  %26 = add nuw nsw i64 %polly.indvar53, %20
  %27 = trunc i64 %26 to i32
  br label %polly.loop_header56

polly.loop_exit58:                                ; preds = %polly.loop_header56
  %polly.indvar_next54 = add nuw nsw i64 %polly.indvar53, 1
  %polly.loop_cond55 = icmp slt i64 %polly.indvar53, %19
  br i1 %polly.loop_cond55, label %polly.loop_header50, label %polly.loop_exit52

polly.loop_header56:                              ; preds = %polly.loop_header50, %polly.loop_header56
  %polly.indvar59 = phi i64 [ 0, %polly.loop_header50 ], [ %polly.indvar_next60, %polly.loop_header56 ]
  %28 = add nuw nsw i64 %polly.indvar59, %25
  %29 = trunc i64 %28 to i32
  %30 = mul i32 %29, %27
  %31 = add i32 %30, 1
  %p_rem = srem i32 %31, 2000
  %p_conv = sitofp i32 %p_rem to double
  %p_div = fdiv double %p_conv, 2.000000e+03
  %scevgep62 = getelementptr [2300 x double], [2300 x double]* %C, i64 %26, i64 %28
  store double %p_div, double* %scevgep62, align 8, !alias.scope !12, !noalias !13
  %polly.indvar_next60 = add nuw nsw i64 %polly.indvar59, 1
  %polly.loop_cond61 = icmp slt i64 %polly.indvar59, %24
  br i1 %polly.loop_cond61, label %polly.loop_header56, label %polly.loop_exit58

polly.loop_header63:                              ; preds = %polly.loop_exit46, %polly.loop_exit71
  %polly.indvar66 = phi i64 [ %polly.indvar_next67, %polly.loop_exit71 ], [ 0, %polly.loop_exit46 ]
  %32 = mul nsw i64 %polly.indvar66, -32
  %33 = add nsw i64 %32, 2599
  %34 = icmp slt i64 %33, 31
  %35 = select i1 %34, i64 %33, i64 31
  %36 = shl nsw i64 %polly.indvar66, 5
  br label %polly.loop_header69

polly.loop_exit71:                                ; preds = %polly.loop_exit77
  %polly.indvar_next67 = add nuw nsw i64 %polly.indvar66, 1
  %exitcond32 = icmp eq i64 %polly.indvar_next67, 82
  br i1 %exitcond32, label %polly.loop_header88, label %polly.loop_header63

polly.loop_header69:                              ; preds = %polly.loop_exit77, %polly.loop_header63
  %polly.indvar72 = phi i64 [ 0, %polly.loop_header63 ], [ %polly.indvar_next73, %polly.loop_exit77 ]
  %37 = mul nsw i64 %polly.indvar72, -32
  %38 = add nsw i64 %37, 2299
  %39 = icmp slt i64 %38, 31
  %40 = select i1 %39, i64 %38, i64 31
  %41 = shl nsw i64 %polly.indvar72, 5
  br label %polly.loop_header75

polly.loop_exit77:                                ; preds = %polly.loop_exit83
  %polly.indvar_next73 = add nuw nsw i64 %polly.indvar72, 1
  %exitcond31 = icmp eq i64 %polly.indvar_next73, 72
  br i1 %exitcond31, label %polly.loop_exit71, label %polly.loop_header69

polly.loop_header75:                              ; preds = %polly.loop_header69, %polly.loop_exit83
  %polly.indvar78 = phi i64 [ 0, %polly.loop_header69 ], [ %polly.indvar_next79, %polly.loop_exit83 ]
  %42 = add nuw nsw i64 %polly.indvar78, %36
  %43 = trunc i64 %42 to i32
  br label %polly.loop_header81

polly.loop_exit83:                                ; preds = %polly.loop_header81
  %polly.indvar_next79 = add nuw nsw i64 %polly.indvar78, 1
  %polly.loop_cond80 = icmp slt i64 %polly.indvar78, %35
  br i1 %polly.loop_cond80, label %polly.loop_header75, label %polly.loop_exit77

polly.loop_header81:                              ; preds = %polly.loop_header75, %polly.loop_header81
  %polly.indvar84 = phi i64 [ 0, %polly.loop_header75 ], [ %polly.indvar_next85, %polly.loop_header81 ]
  %44 = add nuw nsw i64 %polly.indvar84, %41
  %45 = trunc i64 %44 to i32
  %46 = add i32 %45, 2
  %47 = mul i32 %46, %43
  %p_rem44 = srem i32 %47, 2300
  %p_conv45 = sitofp i32 %p_rem44 to double
  %p_div47 = fdiv double %p_conv45, 2.300000e+03
  %scevgep87 = getelementptr [2300 x double], [2300 x double]* %B, i64 %42, i64 %44
  store double %p_div47, double* %scevgep87, align 8, !alias.scope !10, !noalias !14
  %polly.indvar_next85 = add nuw nsw i64 %polly.indvar84, 1
  %polly.loop_cond86 = icmp slt i64 %polly.indvar84, %40
  br i1 %polly.loop_cond86, label %polly.loop_header81, label %polly.loop_exit83

polly.loop_header88:                              ; preds = %polly.loop_exit71, %polly.loop_exit96
  %polly.indvar91 = phi i64 [ %polly.indvar_next92, %polly.loop_exit96 ], [ 0, %polly.loop_exit71 ]
  %48 = mul nsw i64 %polly.indvar91, -32
  %49 = add nsw i64 %48, 1999
  %50 = icmp slt i64 %49, 31
  %51 = select i1 %50, i64 %49, i64 31
  %52 = shl i64 %polly.indvar91, 5
  br label %polly.loop_header94

polly.loop_exit96:                                ; preds = %polly.loop_exit102
  %polly.indvar_next92 = add nuw nsw i64 %polly.indvar91, 1
  %exitcond30 = icmp eq i64 %polly.indvar_next92, 63
  br i1 %exitcond30, label %polly.loop_header113, label %polly.loop_header88

polly.loop_header94:                              ; preds = %polly.loop_exit102, %polly.loop_header88
  %polly.indvar97 = phi i64 [ 0, %polly.loop_header88 ], [ %polly.indvar_next98, %polly.loop_exit102 ]
  %53 = mul nsw i64 %polly.indvar97, -32
  %54 = add nsw i64 %53, 2299
  %55 = icmp slt i64 %54, 31
  %56 = select i1 %55, i64 %54, i64 31
  %57 = shl i64 %polly.indvar97, 5
  %58 = or i64 %57, 2
  %polly.loop_cond111.3 = icmp sgt i64 %56, 3
  %59 = or i64 %57, 4
  %60 = or i64 %57, 6
  %polly.loop_cond111.3.1 = icmp sgt i64 %56, 7
  %61 = or i64 %57, 8
  %62 = or i64 %57, 10
  %polly.loop_cond111.3.2 = icmp sgt i64 %56, 11
  %63 = or i64 %57, 12
  %64 = or i64 %57, 14
  %polly.loop_cond111.3.3 = icmp sgt i64 %56, 15
  %65 = or i64 %57, 16
  %66 = or i64 %57, 18
  %polly.loop_cond111.3.4 = icmp sgt i64 %56, 19
  %67 = or i64 %57, 20
  %68 = or i64 %57, 22
  %polly.loop_cond111.3.5 = icmp sgt i64 %56, 23
  %69 = or i64 %57, 24
  %70 = or i64 %57, 26
  %polly.loop_cond111.3.6 = icmp sgt i64 %56, 27
  %71 = or i64 %57, 28
  %72 = or i64 %57, 30
  br label %polly.loop_header100

polly.loop_exit102:                               ; preds = %polly.loop_exit108
  %polly.indvar_next98 = add nuw nsw i64 %polly.indvar97, 1
  %exitcond29 = icmp eq i64 %polly.indvar_next98, 72
  br i1 %exitcond29, label %polly.loop_exit96, label %polly.loop_header94

polly.loop_header100:                             ; preds = %polly.loop_header94, %polly.loop_exit108
  %polly.indvar103 = phi i64 [ 0, %polly.loop_header94 ], [ %polly.indvar_next104, %polly.loop_exit108 ]
  %73 = add nuw nsw i64 %polly.indvar103, %52
  %scevgep112 = getelementptr [2300 x double], [2300 x double]* %C, i64 %73, i64 %57
  %74 = bitcast double* %scevgep112 to <2 x double>*
  %75 = load <2 x double>, <2 x double>* %74, align 8, !alias.scope !12, !noalias !13
  %76 = fmul <2 x double> %75, <double 1.200000e+00, double 1.200000e+00>
  %77 = bitcast double* %scevgep112 to <2 x double>*
  store <2 x double> %76, <2 x double>* %77, align 8, !alias.scope !12, !noalias !13
  %scevgep112.2 = getelementptr [2300 x double], [2300 x double]* %C, i64 %73, i64 %58
  %78 = bitcast double* %scevgep112.2 to <2 x double>*
  %79 = load <2 x double>, <2 x double>* %78, align 8, !alias.scope !12, !noalias !13
  %80 = fmul <2 x double> %79, <double 1.200000e+00, double 1.200000e+00>
  %81 = bitcast double* %scevgep112.2 to <2 x double>*
  store <2 x double> %80, <2 x double>* %81, align 8, !alias.scope !12, !noalias !13
  br i1 %polly.loop_cond111.3, label %polly.loop_header106.1, label %polly.loop_exit108

polly.loop_exit108:                               ; preds = %polly.loop_header106.7, %polly.loop_header106.6, %polly.loop_header106.5, %polly.loop_header106.4, %polly.loop_header106.3, %polly.loop_header106.2, %polly.loop_header106.1, %polly.loop_header100
  %polly.indvar_next104 = add nuw nsw i64 %polly.indvar103, 1
  %polly.loop_cond105 = icmp slt i64 %polly.indvar103, %51
  br i1 %polly.loop_cond105, label %polly.loop_header100, label %polly.loop_exit102

polly.loop_header113:                             ; preds = %polly.loop_exit96, %polly.loop_exit121
  %polly.indvar116 = phi i64 [ %polly.indvar_next117, %polly.loop_exit121 ], [ 0, %polly.loop_exit96 ]
  %82 = shl nsw i64 %polly.indvar116, 10
  %83 = or i64 %82, 1023
  %84 = icmp slt i64 %83, 2299
  %85 = select i1 %84, i64 %83, i64 2299
  %polly.loop_guard135 = icmp sgt i64 %82, %85
  %86 = mul nsw i64 %polly.indvar116, -256
  %87 = icmp eq i64 %polly.indvar116, 0
  %88 = add nsw i64 %86, 574
  %89 = icmp slt i64 %88, 255
  %90 = select i1 %89, i64 %88, i64 255
  br label %polly.loop_header119

polly.loop_exit121:                               ; preds = %polly.loop_exit143
  %polly.indvar_next117 = add nuw nsw i64 %polly.indvar116, 1
  %exitcond28 = icmp eq i64 %polly.indvar_next117, 3
  br i1 %exitcond28, label %polly.exiting, label %polly.loop_header113

polly.loop_header119:                             ; preds = %polly.loop_exit143, %polly.loop_header113
  %polly.indvar122 = phi i64 [ 0, %polly.loop_header113 ], [ %polly.indvar_next123, %polly.loop_exit143 ]
  %91 = mul nuw nsw i64 %polly.indvar122, 384
  %92 = add nuw nsw i64 %91, 383
  %93 = icmp slt i64 %92, 2599
  %94 = select i1 %93, i64 %92, i64 2599
  %polly.loop_guard = icmp sle i64 %91, %94
  br i1 %polly.loop_guard, label %polly.loop_header125.preheader, label %polly.loop_header141.preheader

polly.loop_header125.preheader:                   ; preds = %polly.loop_header119
  %95 = sub nsw i64 %86, %polly.indvar122
  br i1 %polly.loop_guard135, label %polly.loop_header141.preheader, label %polly.loop_header125

polly.loop_exit143:                               ; preds = %polly.loop_exit169
  %polly.indvar_next123 = add nuw nsw i64 %polly.indvar122, 1
  %exitcond27 = icmp eq i64 %polly.indvar_next123, 7
  br i1 %exitcond27, label %polly.loop_exit121, label %polly.loop_header119

polly.loop_header125:                             ; preds = %polly.loop_header125.preheader, %polly.loop_exit134
  %polly.indvar128 = phi i64 [ %polly.indvar_next129, %polly.loop_exit134 ], [ %91, %polly.loop_header125.preheader ]
  %polly.access.mul.B = mul nuw nsw i64 %polly.indvar128, 2300
  br label %polly.loop_header132

polly.loop_exit134:                               ; preds = %polly.loop_header132
  %polly.indvar_next129 = add nuw nsw i64 %polly.indvar128, 1
  %polly.loop_cond130 = icmp slt i64 %polly.indvar128, %94
  br i1 %polly.loop_cond130, label %polly.loop_header125, label %polly.loop_header141.preheader

polly.loop_header141.preheader:                   ; preds = %polly.loop_exit134, %polly.loop_header125.preheader, %polly.loop_header119
  %96 = mul nsw i64 %polly.indvar122, -384
  %97 = add nsw i64 %96, 2599
  %98 = icmp slt i64 %97, 383
  %99 = select i1 %98, i64 %97, i64 383
  br label %polly.loop_header141

polly.loop_header132:                             ; preds = %polly.loop_header125, %polly.loop_header132
  %polly.indvar136 = phi i64 [ %polly.indvar_next137, %polly.loop_header132 ], [ %82, %polly.loop_header125 ]
  %polly.access.add.B = add nuw nsw i64 %polly.indvar136, %polly.access.mul.B
  %polly.access.B = getelementptr [2300 x double], [2300 x double]* %B, i64 0, i64 %polly.access.add.B
  %100 = bitcast double* %polly.access.B to i64*
  %polly.access.B.load2 = load i64, i64* %100, align 8, !alias.scope !10, !noalias !14
  %pexp.p_div_q = lshr i64 %polly.indvar136, 2
  %tmp = add i64 %95, %pexp.p_div_q
  %tmp3 = mul i64 %tmp, 384
  %polly.access.add.Packed_B = add i64 %tmp3, %polly.indvar128
  %101 = shl nsw i64 %polly.access.add.Packed_B, 2
  %102 = sub nsw i64 3, %polly.indvar136
  %pexp.pdiv_r = and i64 %102, 3
  %polly.access.mul.Packed_B139 = or i64 %101, %pexp.pdiv_r
  %polly.access.add.Packed_B140 = xor i64 %polly.access.mul.Packed_B139, 3
  %polly.access.Packed_B = getelementptr [256 x [384 x [4 x double]]], [256 x [384 x [4 x double]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B140
  %103 = bitcast double* %polly.access.Packed_B to i64*
  store i64 %polly.access.B.load2, i64* %103, align 8
  %polly.indvar_next137 = add nuw nsw i64 %polly.indvar136, 1
  %polly.loop_cond138 = icmp slt i64 %polly.indvar136, %85
  br i1 %polly.loop_cond138, label %polly.loop_header132, label %polly.loop_exit134

polly.loop_header141:                             ; preds = %polly.loop_exit169, %polly.loop_header141.preheader
  %polly.indvar144 = phi i64 [ %polly.indvar_next145, %polly.loop_exit169 ], [ 0, %polly.loop_header141.preheader ]
  %104 = shl nsw i64 %polly.indvar144, 6
  br i1 %87, label %polly.then, label %polly.merge

polly.merge:                                      ; preds = %polly.loop_exit158.loopexit.us, %polly.loop_header141, %polly.loop_header148.preheader, %polly.then
  %105 = mul nsw i64 %polly.indvar144, -16
  %106 = add nsw i64 %105, 499
  %107 = icmp slt i64 %106, 15
  %108 = select i1 %107, i64 %106, i64 15
  br label %polly.loop_header167

polly.loop_exit169:                               ; preds = %polly.loop_exit175
  %polly.indvar_next145 = add nuw nsw i64 %polly.indvar144, 1
  %exitcond = icmp eq i64 %polly.indvar_next145, 32
  br i1 %exitcond, label %polly.loop_exit143, label %polly.loop_header141

polly.then:                                       ; preds = %polly.loop_header141
  %109 = or i64 %104, 63
  %110 = icmp slt i64 %109, 1999
  %111 = select i1 %110, i64 %109, i64 1999
  %polly.loop_guard151 = icmp sgt i64 %104, %111
  br i1 %polly.loop_guard151, label %polly.merge, label %polly.loop_header148.preheader

polly.loop_header148.preheader:                   ; preds = %polly.then
  %112 = mul nsw i64 %polly.indvar144, -16
  %113 = sub nsw i64 %112, %polly.indvar122
  br i1 %polly.loop_guard, label %polly.loop_header148.us, label %polly.merge

polly.loop_header148.us:                          ; preds = %polly.loop_header148.preheader, %polly.loop_exit158.loopexit.us
  %polly.indvar152.us = phi i64 [ %polly.indvar_next153.us, %polly.loop_exit158.loopexit.us ], [ %104, %polly.loop_header148.preheader ]
  %polly.access.mul.A.us = mul nuw nsw i64 %polly.indvar152.us, 2600
  %pexp.p_div_q163.us = lshr i64 %polly.indvar152.us, 2
  %tmp5.us = add i64 %113, %pexp.p_div_q163.us
  %tmp6.us = mul i64 %tmp5.us, 384
  %114 = sub nsw i64 3, %polly.indvar152.us
  %pexp.pdiv_r165.us = and i64 %114, 3
  br label %polly.loop_header156.us

polly.loop_header156.us:                          ; preds = %polly.loop_header148.us, %polly.loop_header156.us
  %polly.indvar160.us = phi i64 [ %polly.indvar_next161.us, %polly.loop_header156.us ], [ %91, %polly.loop_header148.us ]
  %polly.access.add.A.us = add nuw nsw i64 %polly.indvar160.us, %polly.access.mul.A.us
  %polly.access.A.us = getelementptr [2600 x double], [2600 x double]* %A, i64 0, i64 %polly.access.add.A.us
  %115 = bitcast double* %polly.access.A.us to i64*
  %polly.access.A.load1.us = load i64, i64* %115, align 8, !alias.scope !6, !noalias !8
  %polly.access.add.Packed_A.us = add i64 %polly.indvar160.us, %tmp6.us
  %116 = shl nsw i64 %polly.access.add.Packed_A.us, 2
  %polly.access.mul.Packed_A164.us = or i64 %116, %pexp.pdiv_r165.us
  %polly.access.add.Packed_A166.us = xor i64 %polly.access.mul.Packed_A164.us, 3
  %polly.access.Packed_A.us = getelementptr [16 x [384 x [4 x double]]], [16 x [384 x [4 x double]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A166.us
  %117 = bitcast double* %polly.access.Packed_A.us to i64*
  store i64 %polly.access.A.load1.us, i64* %117, align 8
  %polly.indvar_next161.us = add nuw nsw i64 %polly.indvar160.us, 1
  %polly.loop_cond162.us = icmp slt i64 %polly.indvar160.us, %94
  br i1 %polly.loop_cond162.us, label %polly.loop_header156.us, label %polly.loop_exit158.loopexit.us

polly.loop_exit158.loopexit.us:                   ; preds = %polly.loop_header156.us
  %polly.indvar_next153.us = add nuw nsw i64 %polly.indvar152.us, 1
  %polly.loop_cond154.us = icmp slt i64 %polly.indvar152.us, %111
  br i1 %polly.loop_cond154.us, label %polly.loop_header148.us, label %polly.merge

polly.loop_header167:                             ; preds = %polly.merge, %polly.loop_exit175
  %polly.indvar170 = phi i64 [ 0, %polly.merge ], [ %polly.indvar_next171, %polly.loop_exit175 ]
  %118 = shl nsw i64 %polly.indvar170, 2
  %119 = add nuw nsw i64 %118, %82
  %polly.access.mul.Packed_B193 = mul nuw nsw i64 %polly.indvar170, 384
  %120 = or i64 %119, 2
  br label %polly.loop_header173

polly.loop_exit175:                               ; preds = %polly.loop_exit181
  %polly.indvar_next171 = add nuw nsw i64 %polly.indvar170, 1
  %polly.loop_cond172 = icmp slt i64 %polly.indvar170, %90
  br i1 %polly.loop_cond172, label %polly.loop_header167, label %polly.loop_exit169

polly.loop_header173:                             ; preds = %polly.loop_header167, %polly.loop_exit181
  %polly.indvar176 = phi i64 [ 0, %polly.loop_header167 ], [ %polly.indvar_next177, %polly.loop_exit181 ]
  %121 = shl nsw i64 %polly.indvar176, 2
  %122 = add nuw nsw i64 %121, %104
  %polly.access.mul.Packed_A186 = mul nuw nsw i64 %polly.indvar176, 384
  %scevgep199 = getelementptr [2300 x double], [2300 x double]* %C, i64 %122, i64 %119
  %scevgep238 = getelementptr [2300 x double], [2300 x double]* %C, i64 %122, i64 %120
  %123 = or i64 %122, 1
  %scevgep278 = getelementptr [2300 x double], [2300 x double]* %C, i64 %123, i64 %119
  %scevgep318 = getelementptr [2300 x double], [2300 x double]* %C, i64 %123, i64 %120
  %124 = or i64 %122, 2
  %scevgep358 = getelementptr [2300 x double], [2300 x double]* %C, i64 %124, i64 %119
  %scevgep398 = getelementptr [2300 x double], [2300 x double]* %C, i64 %124, i64 %120
  %125 = or i64 %122, 3
  %scevgep438 = getelementptr [2300 x double], [2300 x double]* %C, i64 %125, i64 %119
  %scevgep478 = getelementptr [2300 x double], [2300 x double]* %C, i64 %125, i64 %120
  %126 = bitcast double* %scevgep199 to <2 x double>*
  %127 = load <2 x double>, <2 x double>* %126, align 8, !alias.scope !15, !noalias !13
  %128 = bitcast double* %scevgep238 to <2 x double>*
  %129 = load <2 x double>, <2 x double>* %128, align 8, !alias.scope !18, !noalias !21
  %130 = bitcast double* %scevgep278 to <2 x double>*
  %131 = load <2 x double>, <2 x double>* %130, align 8, !alias.scope !22, !noalias !25
  %132 = bitcast double* %scevgep318 to <2 x double>*
  %133 = load <2 x double>, <2 x double>* %132, align 8, !alias.scope !26, !noalias !29
  %134 = bitcast double* %scevgep358 to <2 x double>*
  %135 = load <2 x double>, <2 x double>* %134, align 8, !alias.scope !30, !noalias !33
  %136 = bitcast double* %scevgep398 to <2 x double>*
  %137 = load <2 x double>, <2 x double>* %136, align 8, !alias.scope !34, !noalias !37
  %138 = bitcast double* %scevgep438 to <2 x double>*
  %139 = load <2 x double>, <2 x double>* %138, align 8, !alias.scope !38, !noalias !41
  %140 = bitcast double* %scevgep478 to <2 x double>*
  %141 = load <2 x double>, <2 x double>* %140, align 8, !alias.scope !42, !noalias !45
  br label %polly.loop_header179

polly.loop_exit181:                               ; preds = %polly.loop_header179
  %142 = bitcast double* %scevgep199 to <2 x double>*
  store <2 x double> %163, <2 x double>* %142, align 8, !alias.scope !15, !noalias !13
  %143 = bitcast double* %scevgep238 to <2 x double>*
  store <2 x double> %167, <2 x double>* %143, align 8, !alias.scope !18, !noalias !21
  %144 = bitcast double* %scevgep278 to <2 x double>*
  store <2 x double> %171, <2 x double>* %144, align 8, !alias.scope !22, !noalias !25
  %145 = bitcast double* %scevgep318 to <2 x double>*
  store <2 x double> %173, <2 x double>* %145, align 8, !alias.scope !26, !noalias !29
  %146 = bitcast double* %scevgep358 to <2 x double>*
  store <2 x double> %177, <2 x double>* %146, align 8, !alias.scope !30, !noalias !33
  %147 = bitcast double* %scevgep398 to <2 x double>*
  store <2 x double> %179, <2 x double>* %147, align 8, !alias.scope !34, !noalias !37
  %148 = bitcast double* %scevgep438 to <2 x double>*
  store <2 x double> %183, <2 x double>* %148, align 8, !alias.scope !38, !noalias !41
  %149 = bitcast double* %scevgep478 to <2 x double>*
  store <2 x double> %185, <2 x double>* %149, align 8, !alias.scope !42, !noalias !45
  %polly.indvar_next177 = add nuw nsw i64 %polly.indvar176, 1
  %polly.loop_cond178 = icmp slt i64 %polly.indvar176, %108
  br i1 %polly.loop_cond178, label %polly.loop_header173, label %polly.loop_exit175

polly.loop_header179:                             ; preds = %polly.loop_header173, %polly.loop_header179
  %polly.indvar182 = phi i64 [ 0, %polly.loop_header173 ], [ %polly.indvar_next183, %polly.loop_header179 ]
  %150 = phi <2 x double> [ %127, %polly.loop_header173 ], [ %163, %polly.loop_header179 ]
  %151 = phi <2 x double> [ %129, %polly.loop_header173 ], [ %167, %polly.loop_header179 ]
  %152 = phi <2 x double> [ %131, %polly.loop_header173 ], [ %171, %polly.loop_header179 ]
  %153 = phi <2 x double> [ %133, %polly.loop_header173 ], [ %173, %polly.loop_header179 ]
  %154 = phi <2 x double> [ %135, %polly.loop_header173 ], [ %177, %polly.loop_header179 ]
  %155 = phi <2 x double> [ %137, %polly.loop_header173 ], [ %179, %polly.loop_header179 ]
  %156 = phi <2 x double> [ %139, %polly.loop_header173 ], [ %183, %polly.loop_header179 ]
  %157 = phi <2 x double> [ %141, %polly.loop_header173 ], [ %185, %polly.loop_header179 ]
  %polly.access.add.Packed_A187 = add nuw nsw i64 %polly.indvar182, %polly.access.mul.Packed_A186
  %polly.access.mul.Packed_A188 = shl nsw i64 %polly.access.add.Packed_A187, 2
  %polly.access.Packed_A190 = getelementptr [16 x [384 x [4 x double]]], [16 x [384 x [4 x double]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.mul.Packed_A188
  %_p_scalar_191 = load double, double* %polly.access.Packed_A190, align 32
  %p_mul16 = fmul double %_p_scalar_191, 1.500000e+00
  %polly.access.add.Packed_B194 = add nuw nsw i64 %polly.indvar182, %polly.access.mul.Packed_B193
  %polly.access.mul.Packed_B195 = shl nsw i64 %polly.access.add.Packed_B194, 2
  %polly.access.Packed_B197 = getelementptr [256 x [384 x [4 x double]]], [256 x [384 x [4 x double]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.mul.Packed_B195
  %158 = bitcast double* %polly.access.Packed_B197 to <2 x double>*
  %159 = load <2 x double>, <2 x double>* %158, align 32
  %160 = insertelement <2 x double> undef, double %p_mul16, i32 0
  %161 = shufflevector <2 x double> %160, <2 x double> undef, <2 x i32> zeroinitializer
  %162 = fmul <2 x double> %161, %159
  %163 = fadd <2 x double> %150, %162
  %polly.access.add.Packed_B234 = or i64 %polly.access.mul.Packed_B195, 2
  %polly.access.Packed_B235 = getelementptr [256 x [384 x [4 x double]]], [256 x [384 x [4 x double]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B234
  %164 = bitcast double* %polly.access.Packed_B235 to <2 x double>*
  %165 = load <2 x double>, <2 x double>* %164, align 16
  %166 = fmul <2 x double> %161, %165
  %167 = fadd <2 x double> %151, %166
  %polly.access.add.Packed_A266 = or i64 %polly.access.mul.Packed_A188, 1
  %polly.access.Packed_A267 = getelementptr [16 x [384 x [4 x double]]], [16 x [384 x [4 x double]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A266
  %_p_scalar_268 = load double, double* %polly.access.Packed_A267, align 8
  %p_mul16269 = fmul double %_p_scalar_268, 1.500000e+00
  %168 = insertelement <2 x double> undef, double %p_mul16269, i32 0
  %169 = shufflevector <2 x double> %168, <2 x double> undef, <2 x i32> zeroinitializer
  %170 = fmul <2 x double> %169, %159
  %171 = fadd <2 x double> %152, %170
  %172 = fmul <2 x double> %169, %165
  %173 = fadd <2 x double> %153, %172
  %polly.access.add.Packed_A346 = or i64 %polly.access.mul.Packed_A188, 2
  %polly.access.Packed_A347 = getelementptr [16 x [384 x [4 x double]]], [16 x [384 x [4 x double]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A346
  %_p_scalar_348 = load double, double* %polly.access.Packed_A347, align 16
  %p_mul16349 = fmul double %_p_scalar_348, 1.500000e+00
  %174 = insertelement <2 x double> undef, double %p_mul16349, i32 0
  %175 = shufflevector <2 x double> %174, <2 x double> undef, <2 x i32> zeroinitializer
  %176 = fmul <2 x double> %175, %159
  %177 = fadd <2 x double> %154, %176
  %178 = fmul <2 x double> %175, %165
  %179 = fadd <2 x double> %155, %178
  %polly.access.add.Packed_A426 = or i64 %polly.access.mul.Packed_A188, 3
  %polly.access.Packed_A427 = getelementptr [16 x [384 x [4 x double]]], [16 x [384 x [4 x double]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A426
  %_p_scalar_428 = load double, double* %polly.access.Packed_A427, align 8
  %p_mul16429 = fmul double %_p_scalar_428, 1.500000e+00
  %180 = insertelement <2 x double> undef, double %p_mul16429, i32 0
  %181 = shufflevector <2 x double> %180, <2 x double> undef, <2 x i32> zeroinitializer
  %182 = fmul <2 x double> %181, %159
  %183 = fadd <2 x double> %156, %182
  %184 = fmul <2 x double> %181, %165
  %185 = fadd <2 x double> %157, %184
  %polly.indvar_next183 = add nuw nsw i64 %polly.indvar182, 1
  %polly.loop_cond184 = icmp slt i64 %polly.indvar182, %99
  br i1 %polly.loop_cond184, label %polly.loop_header179, label %polly.loop_exit181

polly.loop_header106.1:                           ; preds = %polly.loop_header100
  %scevgep112.1 = getelementptr [2300 x double], [2300 x double]* %C, i64 %73, i64 %59
  %186 = bitcast double* %scevgep112.1 to <2 x double>*
  %187 = load <2 x double>, <2 x double>* %186, align 8, !alias.scope !12, !noalias !13
  %188 = fmul <2 x double> %187, <double 1.200000e+00, double 1.200000e+00>
  %189 = bitcast double* %scevgep112.1 to <2 x double>*
  store <2 x double> %188, <2 x double>* %189, align 8, !alias.scope !12, !noalias !13
  %scevgep112.2.1 = getelementptr [2300 x double], [2300 x double]* %C, i64 %73, i64 %60
  %190 = bitcast double* %scevgep112.2.1 to <2 x double>*
  %191 = load <2 x double>, <2 x double>* %190, align 8, !alias.scope !12, !noalias !13
  %192 = fmul <2 x double> %191, <double 1.200000e+00, double 1.200000e+00>
  %193 = bitcast double* %scevgep112.2.1 to <2 x double>*
  store <2 x double> %192, <2 x double>* %193, align 8, !alias.scope !12, !noalias !13
  br i1 %polly.loop_cond111.3.1, label %polly.loop_header106.2, label %polly.loop_exit108

polly.loop_header106.2:                           ; preds = %polly.loop_header106.1
  %scevgep112.247 = getelementptr [2300 x double], [2300 x double]* %C, i64 %73, i64 %61
  %194 = bitcast double* %scevgep112.247 to <2 x double>*
  %195 = load <2 x double>, <2 x double>* %194, align 8, !alias.scope !12, !noalias !13
  %196 = fmul <2 x double> %195, <double 1.200000e+00, double 1.200000e+00>
  %197 = bitcast double* %scevgep112.247 to <2 x double>*
  store <2 x double> %196, <2 x double>* %197, align 8, !alias.scope !12, !noalias !13
  %scevgep112.2.2 = getelementptr [2300 x double], [2300 x double]* %C, i64 %73, i64 %62
  %198 = bitcast double* %scevgep112.2.2 to <2 x double>*
  %199 = load <2 x double>, <2 x double>* %198, align 8, !alias.scope !12, !noalias !13
  %200 = fmul <2 x double> %199, <double 1.200000e+00, double 1.200000e+00>
  %201 = bitcast double* %scevgep112.2.2 to <2 x double>*
  store <2 x double> %200, <2 x double>* %201, align 8, !alias.scope !12, !noalias !13
  br i1 %polly.loop_cond111.3.2, label %polly.loop_header106.3, label %polly.loop_exit108

polly.loop_header106.3:                           ; preds = %polly.loop_header106.2
  %scevgep112.3 = getelementptr [2300 x double], [2300 x double]* %C, i64 %73, i64 %63
  %202 = bitcast double* %scevgep112.3 to <2 x double>*
  %203 = load <2 x double>, <2 x double>* %202, align 8, !alias.scope !12, !noalias !13
  %204 = fmul <2 x double> %203, <double 1.200000e+00, double 1.200000e+00>
  %205 = bitcast double* %scevgep112.3 to <2 x double>*
  store <2 x double> %204, <2 x double>* %205, align 8, !alias.scope !12, !noalias !13
  %scevgep112.2.3 = getelementptr [2300 x double], [2300 x double]* %C, i64 %73, i64 %64
  %206 = bitcast double* %scevgep112.2.3 to <2 x double>*
  %207 = load <2 x double>, <2 x double>* %206, align 8, !alias.scope !12, !noalias !13
  %208 = fmul <2 x double> %207, <double 1.200000e+00, double 1.200000e+00>
  %209 = bitcast double* %scevgep112.2.3 to <2 x double>*
  store <2 x double> %208, <2 x double>* %209, align 8, !alias.scope !12, !noalias !13
  br i1 %polly.loop_cond111.3.3, label %polly.loop_header106.4, label %polly.loop_exit108

polly.loop_header106.4:                           ; preds = %polly.loop_header106.3
  %scevgep112.4 = getelementptr [2300 x double], [2300 x double]* %C, i64 %73, i64 %65
  %210 = bitcast double* %scevgep112.4 to <2 x double>*
  %211 = load <2 x double>, <2 x double>* %210, align 8, !alias.scope !12, !noalias !13
  %212 = fmul <2 x double> %211, <double 1.200000e+00, double 1.200000e+00>
  %213 = bitcast double* %scevgep112.4 to <2 x double>*
  store <2 x double> %212, <2 x double>* %213, align 8, !alias.scope !12, !noalias !13
  %scevgep112.2.4 = getelementptr [2300 x double], [2300 x double]* %C, i64 %73, i64 %66
  %214 = bitcast double* %scevgep112.2.4 to <2 x double>*
  %215 = load <2 x double>, <2 x double>* %214, align 8, !alias.scope !12, !noalias !13
  %216 = fmul <2 x double> %215, <double 1.200000e+00, double 1.200000e+00>
  %217 = bitcast double* %scevgep112.2.4 to <2 x double>*
  store <2 x double> %216, <2 x double>* %217, align 8, !alias.scope !12, !noalias !13
  br i1 %polly.loop_cond111.3.4, label %polly.loop_header106.5, label %polly.loop_exit108

polly.loop_header106.5:                           ; preds = %polly.loop_header106.4
  %scevgep112.5 = getelementptr [2300 x double], [2300 x double]* %C, i64 %73, i64 %67
  %218 = bitcast double* %scevgep112.5 to <2 x double>*
  %219 = load <2 x double>, <2 x double>* %218, align 8, !alias.scope !12, !noalias !13
  %220 = fmul <2 x double> %219, <double 1.200000e+00, double 1.200000e+00>
  %221 = bitcast double* %scevgep112.5 to <2 x double>*
  store <2 x double> %220, <2 x double>* %221, align 8, !alias.scope !12, !noalias !13
  %scevgep112.2.5 = getelementptr [2300 x double], [2300 x double]* %C, i64 %73, i64 %68
  %222 = bitcast double* %scevgep112.2.5 to <2 x double>*
  %223 = load <2 x double>, <2 x double>* %222, align 8, !alias.scope !12, !noalias !13
  %224 = fmul <2 x double> %223, <double 1.200000e+00, double 1.200000e+00>
  %225 = bitcast double* %scevgep112.2.5 to <2 x double>*
  store <2 x double> %224, <2 x double>* %225, align 8, !alias.scope !12, !noalias !13
  br i1 %polly.loop_cond111.3.5, label %polly.loop_header106.6, label %polly.loop_exit108

polly.loop_header106.6:                           ; preds = %polly.loop_header106.5
  %scevgep112.6 = getelementptr [2300 x double], [2300 x double]* %C, i64 %73, i64 %69
  %226 = bitcast double* %scevgep112.6 to <2 x double>*
  %227 = load <2 x double>, <2 x double>* %226, align 8, !alias.scope !12, !noalias !13
  %228 = fmul <2 x double> %227, <double 1.200000e+00, double 1.200000e+00>
  %229 = bitcast double* %scevgep112.6 to <2 x double>*
  store <2 x double> %228, <2 x double>* %229, align 8, !alias.scope !12, !noalias !13
  %scevgep112.2.6 = getelementptr [2300 x double], [2300 x double]* %C, i64 %73, i64 %70
  %230 = bitcast double* %scevgep112.2.6 to <2 x double>*
  %231 = load <2 x double>, <2 x double>* %230, align 8, !alias.scope !12, !noalias !13
  %232 = fmul <2 x double> %231, <double 1.200000e+00, double 1.200000e+00>
  %233 = bitcast double* %scevgep112.2.6 to <2 x double>*
  store <2 x double> %232, <2 x double>* %233, align 8, !alias.scope !12, !noalias !13
  br i1 %polly.loop_cond111.3.6, label %polly.loop_header106.7, label %polly.loop_exit108

polly.loop_header106.7:                           ; preds = %polly.loop_header106.6
  %scevgep112.7 = getelementptr [2300 x double], [2300 x double]* %C, i64 %73, i64 %71
  %234 = bitcast double* %scevgep112.7 to <2 x double>*
  %235 = load <2 x double>, <2 x double>* %234, align 8, !alias.scope !12, !noalias !13
  %236 = fmul <2 x double> %235, <double 1.200000e+00, double 1.200000e+00>
  %237 = bitcast double* %scevgep112.7 to <2 x double>*
  store <2 x double> %236, <2 x double>* %237, align 8, !alias.scope !12, !noalias !13
  %scevgep112.2.7 = getelementptr [2300 x double], [2300 x double]* %C, i64 %73, i64 %72
  %238 = bitcast double* %scevgep112.2.7 to <2 x double>*
  %239 = load <2 x double>, <2 x double>* %238, align 8, !alias.scope !12, !noalias !13
  %240 = fmul <2 x double> %239, <double 1.200000e+00, double 1.200000e+00>
  %241 = bitcast double* %scevgep112.2.7 to <2 x double>*
  store <2 x double> %240, <2 x double>* %241, align 8, !alias.scope !12, !noalias !13
  br label %polly.loop_exit108
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 5.0.0 (trunk 304791)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"any pointer", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = distinct !{!6, !7, !"polly.alias.scope.MemRefA"}
!7 = distinct !{!7, !"polly.alias.scope.domain"}
!8 = !{!9, !10, !11, !12}
!9 = distinct !{!9, !7, !"polly.alias.scope.Packed_A"}
!10 = distinct !{!10, !7, !"polly.alias.scope.MemRefB"}
!11 = distinct !{!11, !7, !"polly.alias.scope.MemRefmul16"}
!12 = distinct !{!12, !7, !"polly.alias.scope.MemRefC"}
!13 = !{!9, !10, !11, !6}
!14 = !{!9, !11, !12, !6}
!15 = !{!16, !12, !"second level alias metadata", !17}
!16 = distinct !{!16, !12, !"second level alias metadata"}
!17 = distinct !{!17, !12, !"second level alias metadata"}
!18 = !{!19, !12, !"second level alias metadata", !20}
!19 = distinct !{!19, !12, !"second level alias metadata"}
!20 = distinct !{!20, !12, !"second level alias metadata"}
!21 = !{!9, !10, !11, !6, !16, !17}
!22 = !{!23, !12, !"second level alias metadata", !24}
!23 = distinct !{!23, !12, !"second level alias metadata"}
!24 = distinct !{!24, !12, !"second level alias metadata"}
!25 = !{!9, !10, !11, !6, !16, !17, !19, !20}
!26 = !{!27, !12, !"second level alias metadata", !28}
!27 = distinct !{!27, !12, !"second level alias metadata"}
!28 = distinct !{!28, !12, !"second level alias metadata"}
!29 = !{!9, !10, !11, !6, !16, !17, !19, !20, !23, !24}
!30 = !{!31, !12, !"second level alias metadata", !32}
!31 = distinct !{!31, !12, !"second level alias metadata"}
!32 = distinct !{!32, !12, !"second level alias metadata"}
!33 = !{!9, !10, !11, !6, !16, !17, !19, !20, !23, !24, !27, !28}
!34 = !{!35, !12, !"second level alias metadata", !36}
!35 = distinct !{!35, !12, !"second level alias metadata"}
!36 = distinct !{!36, !12, !"second level alias metadata"}
!37 = !{!9, !10, !11, !6, !16, !17, !19, !20, !23, !24, !27, !28, !31, !32}
!38 = !{!39, !12, !"second level alias metadata", !40}
!39 = distinct !{!39, !12, !"second level alias metadata"}
!40 = distinct !{!40, !12, !"second level alias metadata"}
!41 = !{!9, !10, !11, !6, !16, !17, !19, !20, !23, !24, !27, !28, !31, !32, !35, !36}
!42 = !{!43, !12, !"second level alias metadata", !44}
!43 = distinct !{!43, !12, !"second level alias metadata"}
!44 = distinct !{!44, !12, !"second level alias metadata"}
!45 = !{!9, !10, !11, !6, !16, !17, !19, !20, !23, !24, !27, !28, !31, !32, !35, !36, !39, !40}
