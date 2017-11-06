; ModuleID = 'gemm.c'
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
  br label %entry.split

entry.split:                                      ; preds = %entry
  %0 = bitcast i8** %ret to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %0) #5
  store i8* null, i8** %ret, align 8, !tbaa !2
  %call18 = call i32 @posix_memalign(i8** nonnull %ret, i64 4096, i64 36800000) #5
  %1 = load i8*, i8** %ret, align 8, !tbaa !2
  %tobool = icmp eq i8* %1, null
  %tobool2 = icmp ne i32 %call18, 0
  %or.cond = or i1 %tobool2, %tobool
  br i1 %or.cond, label %if.then, label %polybench_alloc_data.exit

if.then:                                          ; preds = %entry.split
  call void @exit(i32 1) #6
  unreachable

polybench_alloc_data.exit:                        ; preds = %entry.split
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
  call void @main2(i8* %3, i8* %5, i8* %1) #5
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
define internal void @main2(i8* noalias nocapture %AA, i8* noalias nocapture %BB, i8* noalias nocapture %CC) unnamed_addr #4 {
entry:
  %Packed_B = alloca [256 x [384 x [4 x double]]], align 64
  %Packed_A = alloca [16 x [384 x [4 x double]]], align 64
  br label %entry.split

entry.split:                                      ; preds = %entry
  %arraydecay = bitcast i8* %CC to [2300 x double]*
  %arraydecay1 = bitcast i8* %AA to [2600 x double]*
  br label %polly.split_new_and_old

polly.split_new_and_old:                          ; preds = %entry.split
  br i1 true, label %polly.start, label %for.cond1.preheader.pre_entry_bb

for.cond1.preheader.pre_entry_bb:                 ; preds = %polly.split_new_and_old
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond1.preheader.pre_entry_bb, %for.inc7
  %indvars.iv24 = phi i64 [ %indvars.iv.next25, %for.inc7 ], [ 0, %for.cond1.preheader.pre_entry_bb ]
  br label %for.body32

for.body32:                                       ; preds = %for.body32, %for.cond1.preheader
  %indvars.iv19 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next20, %for.body32 ]
  %0 = mul nuw nsw i64 %indvars.iv19, %indvars.iv24
  %1 = add nuw nsw i64 %0, 1
  %2 = trunc i64 %1 to i32
  %rem = srem i32 %2, 2000
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 2.000000e+03
  %arrayidx6 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay, i64 %indvars.iv24, i64 %indvars.iv19
  store double %div, double* %arrayidx6, align 8, !tbaa !6, !alias.scope !8, !noalias !13
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next20, 2300
  br i1 %exitcond23, label %for.inc7, label %for.body32

for.inc7:                                         ; preds = %for.body32
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next25, 2000
  br i1 %exitcond26, label %for.cond14.preheader.preheader, label %for.cond1.preheader

for.cond14.preheader.preheader:                   ; preds = %for.inc7
  %arraydecay2 = bitcast i8* %BB to [2300 x double]*
  br label %for.cond14.preheader

for.cond14.preheader:                             ; preds = %for.cond14.preheader.preheader, %for.inc31
  %indvars.iv16 = phi i64 [ %indvars.iv.next17, %for.inc31 ], [ 0, %for.cond14.preheader.preheader ]
  br label %for.body17

for.body17:                                       ; preds = %for.body17, %for.cond14.preheader
  %indvars.iv12 = phi i64 [ 0, %for.cond14.preheader ], [ %indvars.iv.next13, %for.body17 ]
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %3 = mul nuw nsw i64 %indvars.iv.next13, %indvars.iv16
  %4 = trunc i64 %3 to i32
  %rem20 = srem i32 %4, 2600
  %conv21 = sitofp i32 %rem20 to double
  %div23 = fdiv double %conv21, 2.600000e+03
  %arrayidx27 = getelementptr inbounds [2600 x double], [2600 x double]* %arraydecay1, i64 %indvars.iv16, i64 %indvars.iv12
  store double %div23, double* %arrayidx27, align 8, !tbaa !6, !alias.scope !18, !noalias !19
  %exitcond15 = icmp eq i64 %indvars.iv.next13, 2600
  br i1 %exitcond15, label %for.inc31, label %for.body17

for.inc31:                                        ; preds = %for.body17
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next17, 2000
  br i1 %exitcond18, label %for.cond38.preheader, label %for.cond14.preheader

for.cond38.preheader:                             ; preds = %for.inc31, %for.inc55
  %indvars.iv9 = phi i64 [ %indvars.iv.next10, %for.inc55 ], [ 0, %for.inc31 ]
  br label %for.body41

for.body41:                                       ; preds = %for.body41, %for.cond38.preheader
  %indvars.iv = phi i64 [ 0, %for.cond38.preheader ], [ %indvars.iv.next, %for.body41 ]
  %5 = add nuw nsw i64 %indvars.iv, 2
  %6 = mul nuw nsw i64 %5, %indvars.iv9
  %7 = trunc i64 %6 to i32
  %rem44 = srem i32 %7, 2300
  %conv45 = sitofp i32 %rem44 to double
  %div47 = fdiv double %conv45, 2.300000e+03
  %arrayidx51 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay2, i64 %indvars.iv9, i64 %indvars.iv
  store double %div47, double* %arrayidx51, align 8, !tbaa !6, !alias.scope !20, !noalias !21
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2300
  br i1 %exitcond, label %for.inc55, label %for.body41

for.inc55:                                        ; preds = %for.body41
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next10, 2600
  br i1 %exitcond11, label %for.cond1.preheader3, label %for.cond38.preheader

for.cond1.preheader3:                             ; preds = %for.inc55, %for.inc32
  %indvars.iv17 = phi i64 [ %indvars.iv.next18, %for.inc32 ], [ 0, %for.inc55 ]
  br label %for.body3

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader3
  %indvars.iv8 = phi i64 [ 0, %for.cond1.preheader3 ], [ %indvars.iv.next9, %for.body3 ]
  %arrayidx5 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay, i64 %indvars.iv17, i64 %indvars.iv8
  %8 = load double, double* %arrayidx5, align 8, !tbaa !6, !alias.scope !22, !noalias !23
  %mul = fmul double %8, 1.200000e+00
  store double %mul, double* %arrayidx5, align 8, !tbaa !6, !alias.scope !22, !noalias !23
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next9, 2300
  br i1 %exitcond10, label %for.cond9.preheader, label %for.body3

for.cond9.preheader:                              ; preds = %for.body3, %for.inc29
  %indvars.iv14 = phi i64 [ %indvars.iv.next15, %for.inc29 ], [ 0, %for.body3 ]
  %arrayidx15 = getelementptr inbounds [2600 x double], [2600 x double]* %arraydecay1, i64 %indvars.iv17, i64 %indvars.iv14
  %9 = load double, double* %arrayidx15, align 8, !tbaa !6, !alias.scope !24, !noalias !25
  %mul16 = fmul double %9, 1.500000e+00
  br label %for.body11

for.body11:                                       ; preds = %for.body11, %for.cond9.preheader
  %indvars.iv11 = phi i64 [ 0, %for.cond9.preheader ], [ %indvars.iv.next12, %for.body11 ]
  %arrayidx20 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay2, i64 %indvars.iv14, i64 %indvars.iv11
  %10 = load double, double* %arrayidx20, align 8, !tbaa !6, !alias.scope !26, !noalias !27
  %mul21 = fmul double %mul16, %10
  %arrayidx25 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay, i64 %indvars.iv17, i64 %indvars.iv11
  %11 = load double, double* %arrayidx25, align 8, !tbaa !6, !alias.scope !22, !noalias !23
  %add = fadd double %11, %mul21
  store double %add, double* %arrayidx25, align 8, !tbaa !6, !alias.scope !22, !noalias !23
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next12, 2300
  br i1 %exitcond13, label %for.inc29, label %for.body11

for.inc29:                                        ; preds = %for.body11
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next15, 2600
  br i1 %exitcond16, label %for.inc32, label %for.cond9.preheader

for.inc32:                                        ; preds = %for.inc29
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next18, 2000
  br i1 %exitcond19, label %polly.merge_new_and_old, label %for.cond1.preheader3

polly.merge_new_and_old:                          ; preds = %polly.exiting, %for.inc32
  br label %kernel_gemm.exit

kernel_gemm.exit:                                 ; preds = %polly.merge_new_and_old
  ret void

polly.start:                                      ; preds = %polly.split_new_and_old
  br label %polly.loop_preheader

polly.loop_exit:                                  ; preds = %polly.loop_exit14
  br label %polly.loop_preheader32

polly.loop_exit33:                                ; preds = %polly.loop_exit39
  br label %polly.loop_preheader58

polly.loop_exit59:                                ; preds = %polly.loop_exit65
  br label %polly.loop_preheader84

polly.loop_exit85:                                ; preds = %polly.loop_exit91
  br label %polly.loop_preheader110

polly.loop_exit111:                               ; preds = %polly.loop_exit117
  br label %polly.exiting

polly.exiting:                                    ; preds = %polly.loop_exit111
  br label %polly.merge_new_and_old

polly.loop_header:                                ; preds = %polly.loop_exit14, %polly.loop_preheader
  %polly.indvar = phi i64 [ 0, %polly.loop_preheader ], [ %polly.indvar_next, %polly.loop_exit14 ]
  br label %polly.loop_preheader13

polly.loop_exit14:                                ; preds = %polly.loop_exit20
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp sle i64 %polly.indvar_next, 62
  br i1 %polly.loop_cond, label %polly.loop_header, label %polly.loop_exit

polly.loop_preheader:                             ; preds = %polly.start
  br label %polly.loop_header

polly.loop_header12:                              ; preds = %polly.loop_exit20, %polly.loop_preheader13
  %polly.indvar15 = phi i64 [ 0, %polly.loop_preheader13 ], [ %polly.indvar_next16, %polly.loop_exit20 ]
  %12 = mul nsw i64 -32, %polly.indvar
  %13 = add nsw i64 %12, 1999
  %14 = icmp slt i64 31, %13
  %15 = select i1 %14, i64 31, i64 %13
  br label %polly.loop_preheader19

polly.loop_exit20:                                ; preds = %polly.loop_exit26
  %polly.indvar_next16 = add nsw i64 %polly.indvar15, 1
  %polly.loop_cond17 = icmp sle i64 %polly.indvar_next16, 81
  br i1 %polly.loop_cond17, label %polly.loop_header12, label %polly.loop_exit14

polly.loop_preheader13:                           ; preds = %polly.loop_header
  br label %polly.loop_header12

polly.loop_header18:                              ; preds = %polly.loop_exit26, %polly.loop_preheader19
  %polly.indvar21 = phi i64 [ 0, %polly.loop_preheader19 ], [ %polly.indvar_next22, %polly.loop_exit26 ]
  %16 = mul nsw i64 -32, %polly.indvar15
  %17 = add nsw i64 %16, 2599
  %18 = icmp slt i64 31, %17
  %19 = select i1 %18, i64 31, i64 %17
  br label %polly.loop_preheader25

polly.loop_exit26:                                ; preds = %polly.stmt.for.body17
  %polly.indvar_next22 = add nsw i64 %polly.indvar21, 1
  %polly.loop_cond23 = icmp sle i64 %polly.indvar_next22, %15
  br i1 %polly.loop_cond23, label %polly.loop_header18, label %polly.loop_exit20

polly.loop_preheader19:                           ; preds = %polly.loop_header12
  br label %polly.loop_header18

polly.loop_header24:                              ; preds = %polly.stmt.for.body17, %polly.loop_preheader25
  %polly.indvar27 = phi i64 [ 0, %polly.loop_preheader25 ], [ %polly.indvar_next28, %polly.stmt.for.body17 ]
  %20 = mul nsw i64 32, %polly.indvar
  %21 = add nsw i64 %20, %polly.indvar21
  %22 = mul nsw i64 32, %polly.indvar15
  %23 = add nsw i64 %22, %polly.indvar27
  br label %polly.stmt.for.body17

polly.stmt.for.body17:                            ; preds = %polly.loop_header24
  %24 = trunc i64 %23 to i32
  %25 = add i32 %24, 1
  %26 = trunc i64 %21 to i32
  %27 = mul i32 %25, %26
  %p_rem20 = srem i32 %27, 2600
  %p_conv21 = sitofp i32 %p_rem20 to double
  %p_div23 = fdiv double %p_conv21, 2.600000e+03
  %28 = mul i64 %21, 20800
  %29 = shl i64 %23, 3
  %30 = add i64 %28, %29
  %scevgep = getelementptr i8, i8* %AA, i64 %30
  %scevgep30 = bitcast i8* %scevgep to double*
  store double %p_div23, double* %scevgep30, align 8, !alias.scope !28, !noalias !30
  %polly.indvar_next28 = add nsw i64 %polly.indvar27, 1
  %polly.loop_cond29 = icmp sle i64 %polly.indvar_next28, %19
  br i1 %polly.loop_cond29, label %polly.loop_header24, label %polly.loop_exit26

polly.loop_preheader25:                           ; preds = %polly.loop_header18
  br label %polly.loop_header24

polly.loop_header31:                              ; preds = %polly.loop_exit39, %polly.loop_preheader32
  %polly.indvar34 = phi i64 [ 0, %polly.loop_preheader32 ], [ %polly.indvar_next35, %polly.loop_exit39 ]
  br label %polly.loop_preheader38

polly.loop_exit39:                                ; preds = %polly.loop_exit45
  %polly.indvar_next35 = add nsw i64 %polly.indvar34, 1
  %polly.loop_cond36 = icmp sle i64 %polly.indvar_next35, 62
  br i1 %polly.loop_cond36, label %polly.loop_header31, label %polly.loop_exit33

polly.loop_preheader32:                           ; preds = %polly.loop_exit
  br label %polly.loop_header31

polly.loop_header37:                              ; preds = %polly.loop_exit45, %polly.loop_preheader38
  %polly.indvar40 = phi i64 [ 0, %polly.loop_preheader38 ], [ %polly.indvar_next41, %polly.loop_exit45 ]
  %31 = mul nsw i64 -32, %polly.indvar34
  %32 = add nsw i64 %31, 1999
  %33 = icmp slt i64 31, %32
  %34 = select i1 %33, i64 31, i64 %32
  br label %polly.loop_preheader44

polly.loop_exit45:                                ; preds = %polly.loop_exit51
  %polly.indvar_next41 = add nsw i64 %polly.indvar40, 1
  %polly.loop_cond42 = icmp sle i64 %polly.indvar_next41, 71
  br i1 %polly.loop_cond42, label %polly.loop_header37, label %polly.loop_exit39

polly.loop_preheader38:                           ; preds = %polly.loop_header31
  br label %polly.loop_header37

polly.loop_header43:                              ; preds = %polly.loop_exit51, %polly.loop_preheader44
  %polly.indvar46 = phi i64 [ 0, %polly.loop_preheader44 ], [ %polly.indvar_next47, %polly.loop_exit51 ]
  %35 = mul nsw i64 -32, %polly.indvar40
  %36 = add nsw i64 %35, 2299
  %37 = icmp slt i64 31, %36
  %38 = select i1 %37, i64 31, i64 %36
  br label %polly.loop_preheader50

polly.loop_exit51:                                ; preds = %polly.stmt.for.body32
  %polly.indvar_next47 = add nsw i64 %polly.indvar46, 1
  %polly.loop_cond48 = icmp sle i64 %polly.indvar_next47, %34
  br i1 %polly.loop_cond48, label %polly.loop_header43, label %polly.loop_exit45

polly.loop_preheader44:                           ; preds = %polly.loop_header37
  br label %polly.loop_header43

polly.loop_header49:                              ; preds = %polly.stmt.for.body32, %polly.loop_preheader50
  %polly.indvar52 = phi i64 [ 0, %polly.loop_preheader50 ], [ %polly.indvar_next53, %polly.stmt.for.body32 ]
  %39 = mul nsw i64 32, %polly.indvar34
  %40 = add nsw i64 %39, %polly.indvar46
  %41 = mul nsw i64 32, %polly.indvar40
  %42 = add nsw i64 %41, %polly.indvar52
  br label %polly.stmt.for.body32

polly.stmt.for.body32:                            ; preds = %polly.loop_header49
  %43 = trunc i64 %42 to i32
  %44 = trunc i64 %40 to i32
  %45 = mul i32 %43, %44
  %46 = add i32 %45, 1
  %p_rem = srem i32 %46, 2000
  %p_conv = sitofp i32 %p_rem to double
  %p_div = fdiv double %p_conv, 2.000000e+03
  %47 = mul i64 %40, 18400
  %48 = shl i64 %42, 3
  %49 = add i64 %47, %48
  %scevgep55 = getelementptr i8, i8* %CC, i64 %49
  %scevgep5556 = bitcast i8* %scevgep55 to double*
  store double %p_div, double* %scevgep5556, align 8, !alias.scope !33, !noalias !35
  %polly.indvar_next53 = add nsw i64 %polly.indvar52, 1
  %polly.loop_cond54 = icmp sle i64 %polly.indvar_next53, %38
  br i1 %polly.loop_cond54, label %polly.loop_header49, label %polly.loop_exit51

polly.loop_preheader50:                           ; preds = %polly.loop_header43
  br label %polly.loop_header49

polly.loop_header57:                              ; preds = %polly.loop_exit65, %polly.loop_preheader58
  %polly.indvar60 = phi i64 [ 0, %polly.loop_preheader58 ], [ %polly.indvar_next61, %polly.loop_exit65 ]
  br label %polly.loop_preheader64

polly.loop_exit65:                                ; preds = %polly.loop_exit71
  %polly.indvar_next61 = add nsw i64 %polly.indvar60, 1
  %polly.loop_cond62 = icmp sle i64 %polly.indvar_next61, 81
  br i1 %polly.loop_cond62, label %polly.loop_header57, label %polly.loop_exit59

polly.loop_preheader58:                           ; preds = %polly.loop_exit33
  br label %polly.loop_header57

polly.loop_header63:                              ; preds = %polly.loop_exit71, %polly.loop_preheader64
  %polly.indvar66 = phi i64 [ 0, %polly.loop_preheader64 ], [ %polly.indvar_next67, %polly.loop_exit71 ]
  %50 = mul nsw i64 -32, %polly.indvar60
  %51 = add nsw i64 %50, 2599
  %52 = icmp slt i64 31, %51
  %53 = select i1 %52, i64 31, i64 %51
  br label %polly.loop_preheader70

polly.loop_exit71:                                ; preds = %polly.loop_exit77
  %polly.indvar_next67 = add nsw i64 %polly.indvar66, 1
  %polly.loop_cond68 = icmp sle i64 %polly.indvar_next67, 71
  br i1 %polly.loop_cond68, label %polly.loop_header63, label %polly.loop_exit65

polly.loop_preheader64:                           ; preds = %polly.loop_header57
  br label %polly.loop_header63

polly.loop_header69:                              ; preds = %polly.loop_exit77, %polly.loop_preheader70
  %polly.indvar72 = phi i64 [ 0, %polly.loop_preheader70 ], [ %polly.indvar_next73, %polly.loop_exit77 ]
  %54 = mul nsw i64 -32, %polly.indvar66
  %55 = add nsw i64 %54, 2299
  %56 = icmp slt i64 31, %55
  %57 = select i1 %56, i64 31, i64 %55
  br label %polly.loop_preheader76

polly.loop_exit77:                                ; preds = %polly.stmt.for.body41
  %polly.indvar_next73 = add nsw i64 %polly.indvar72, 1
  %polly.loop_cond74 = icmp sle i64 %polly.indvar_next73, %53
  br i1 %polly.loop_cond74, label %polly.loop_header69, label %polly.loop_exit71

polly.loop_preheader70:                           ; preds = %polly.loop_header63
  br label %polly.loop_header69

polly.loop_header75:                              ; preds = %polly.stmt.for.body41, %polly.loop_preheader76
  %polly.indvar78 = phi i64 [ 0, %polly.loop_preheader76 ], [ %polly.indvar_next79, %polly.stmt.for.body41 ]
  %58 = mul nsw i64 32, %polly.indvar60
  %59 = add nsw i64 %58, %polly.indvar72
  %60 = mul nsw i64 32, %polly.indvar66
  %61 = add nsw i64 %60, %polly.indvar78
  br label %polly.stmt.for.body41

polly.stmt.for.body41:                            ; preds = %polly.loop_header75
  %62 = trunc i64 %61 to i32
  %63 = add i32 %62, 2
  %64 = trunc i64 %59 to i32
  %65 = mul i32 %63, %64
  %p_rem44 = srem i32 %65, 2300
  %p_conv45 = sitofp i32 %p_rem44 to double
  %p_div47 = fdiv double %p_conv45, 2.300000e+03
  %66 = mul i64 %59, 18400
  %67 = shl i64 %61, 3
  %68 = add i64 %66, %67
  %scevgep81 = getelementptr i8, i8* %BB, i64 %68
  %scevgep8182 = bitcast i8* %scevgep81 to double*
  store double %p_div47, double* %scevgep8182, align 8, !alias.scope !34, !noalias !36
  %polly.indvar_next79 = add nsw i64 %polly.indvar78, 1
  %polly.loop_cond80 = icmp sle i64 %polly.indvar_next79, %57
  br i1 %polly.loop_cond80, label %polly.loop_header75, label %polly.loop_exit77

polly.loop_preheader76:                           ; preds = %polly.loop_header69
  br label %polly.loop_header75

polly.loop_header83:                              ; preds = %polly.loop_exit91, %polly.loop_preheader84
  %polly.indvar86 = phi i64 [ 0, %polly.loop_preheader84 ], [ %polly.indvar_next87, %polly.loop_exit91 ]
  br label %polly.loop_preheader90

polly.loop_exit91:                                ; preds = %polly.loop_exit97
  %polly.indvar_next87 = add nsw i64 %polly.indvar86, 1
  %polly.loop_cond88 = icmp sle i64 %polly.indvar_next87, 62
  br i1 %polly.loop_cond88, label %polly.loop_header83, label %polly.loop_exit85

polly.loop_preheader84:                           ; preds = %polly.loop_exit59
  br label %polly.loop_header83

polly.loop_header89:                              ; preds = %polly.loop_exit97, %polly.loop_preheader90
  %polly.indvar92 = phi i64 [ 0, %polly.loop_preheader90 ], [ %polly.indvar_next93, %polly.loop_exit97 ]
  %69 = mul nsw i64 -32, %polly.indvar86
  %70 = add nsw i64 %69, 1999
  %71 = icmp slt i64 31, %70
  %72 = select i1 %71, i64 31, i64 %70
  br label %polly.loop_preheader96

polly.loop_exit97:                                ; preds = %polly.loop_exit103
  %polly.indvar_next93 = add nsw i64 %polly.indvar92, 1
  %polly.loop_cond94 = icmp sle i64 %polly.indvar_next93, 71
  br i1 %polly.loop_cond94, label %polly.loop_header89, label %polly.loop_exit91

polly.loop_preheader90:                           ; preds = %polly.loop_header83
  br label %polly.loop_header89

polly.loop_header95:                              ; preds = %polly.loop_exit103, %polly.loop_preheader96
  %polly.indvar98 = phi i64 [ 0, %polly.loop_preheader96 ], [ %polly.indvar_next99, %polly.loop_exit103 ]
  %73 = mul nsw i64 -32, %polly.indvar92
  %74 = add nsw i64 %73, 2299
  %75 = icmp slt i64 31, %74
  %76 = select i1 %75, i64 31, i64 %74
  br label %polly.loop_preheader102

polly.loop_exit103:                               ; preds = %polly.stmt.for.body3
  %polly.indvar_next99 = add nsw i64 %polly.indvar98, 1
  %polly.loop_cond100 = icmp sle i64 %polly.indvar_next99, %72
  br i1 %polly.loop_cond100, label %polly.loop_header95, label %polly.loop_exit97

polly.loop_preheader96:                           ; preds = %polly.loop_header89
  br label %polly.loop_header95

polly.loop_header101:                             ; preds = %polly.stmt.for.body3, %polly.loop_preheader102
  %polly.indvar104 = phi i64 [ 0, %polly.loop_preheader102 ], [ %polly.indvar_next105, %polly.stmt.for.body3 ]
  %77 = mul nsw i64 32, %polly.indvar86
  %78 = add nsw i64 %77, %polly.indvar98
  %79 = mul nsw i64 32, %polly.indvar92
  %80 = add nsw i64 %79, %polly.indvar104
  br label %polly.stmt.for.body3

polly.stmt.for.body3:                             ; preds = %polly.loop_header101
  %81 = mul i64 %78, 18400
  %82 = shl i64 %80, 3
  %83 = add i64 %81, %82
  %scevgep107 = getelementptr i8, i8* %CC, i64 %83
  %scevgep107108 = bitcast i8* %scevgep107 to double*
  %_p_scalar_ = load double, double* %scevgep107108, align 8, !alias.scope !33, !noalias !35
  %p_mul = fmul double %_p_scalar_, 1.200000e+00
  store double %p_mul, double* %scevgep107108, align 8, !alias.scope !33, !noalias !35
  %polly.indvar_next105 = add nsw i64 %polly.indvar104, 1
  %polly.loop_cond106 = icmp sle i64 %polly.indvar_next105, %76
  br i1 %polly.loop_cond106, label %polly.loop_header101, label %polly.loop_exit103

polly.loop_preheader102:                          ; preds = %polly.loop_header95
  br label %polly.loop_header101

polly.loop_header109:                             ; preds = %polly.loop_exit117, %polly.loop_preheader110
  %polly.indvar112 = phi i64 [ 0, %polly.loop_preheader110 ], [ %polly.indvar_next113, %polly.loop_exit117 ]
  br label %polly.loop_preheader116

polly.loop_exit117:                               ; preds = %polly.loop_exit139
  %polly.indvar_next113 = add nsw i64 %polly.indvar112, 1
  %polly.loop_cond114 = icmp sle i64 %polly.indvar_next113, 2
  br i1 %polly.loop_cond114, label %polly.loop_header109, label %polly.loop_exit111

polly.loop_preheader110:                          ; preds = %polly.loop_exit85
  br label %polly.loop_header109

polly.loop_header115:                             ; preds = %polly.loop_exit139, %polly.loop_preheader116
  %polly.indvar118 = phi i64 [ 0, %polly.loop_preheader116 ], [ %polly.indvar_next119, %polly.loop_exit139 ]
  %84 = mul nsw i64 384, %polly.indvar118
  %85 = mul nsw i64 384, %polly.indvar118
  %86 = add nsw i64 %85, 383
  %87 = icmp slt i64 2599, %86
  %88 = select i1 %87, i64 2599, i64 %86
  br label %polly.loop_if

polly.loop_exit123:                               ; preds = %polly.loop_exit130, %polly.loop_if
  br label %polly.loop_preheader138

polly.loop_exit139:                               ; preds = %polly.loop_exit165
  %polly.indvar_next119 = add nsw i64 %polly.indvar118, 1
  %polly.loop_cond120 = icmp sle i64 %polly.indvar_next119, 6
  br i1 %polly.loop_cond120, label %polly.loop_header115, label %polly.loop_exit117

polly.loop_preheader116:                          ; preds = %polly.loop_header109
  br label %polly.loop_header115

polly.loop_if:                                    ; preds = %polly.loop_header115
  %polly.loop_guard = icmp sle i64 %84, %88
  br i1 %polly.loop_guard, label %polly.loop_preheader122, label %polly.loop_exit123

polly.loop_header121:                             ; preds = %polly.loop_exit130, %polly.loop_preheader122
  %polly.indvar124 = phi i64 [ %84, %polly.loop_preheader122 ], [ %polly.indvar_next125, %polly.loop_exit130 ]
  %89 = mul nsw i64 1024, %polly.indvar112
  %90 = mul nsw i64 1024, %polly.indvar112
  %91 = add nsw i64 %90, 1023
  %92 = icmp slt i64 2299, %91
  %93 = select i1 %92, i64 2299, i64 %91
  br label %polly.loop_if127

polly.loop_exit130:                               ; preds = %polly.loop_header128, %polly.loop_if127
  %polly.indvar_next125 = add nsw i64 %polly.indvar124, 1
  %polly.loop_cond126 = icmp sle i64 %polly.indvar_next125, %88
  br i1 %polly.loop_cond126, label %polly.loop_header121, label %polly.loop_exit123

polly.loop_preheader122:                          ; preds = %polly.loop_if
  br label %polly.loop_header121

polly.loop_if127:                                 ; preds = %polly.loop_header121
  %polly.loop_guard131 = icmp sle i64 %89, %93
  br i1 %polly.loop_guard131, label %polly.loop_preheader129, label %polly.loop_exit130

polly.loop_header128:                             ; preds = %polly.loop_header128, %polly.loop_preheader129
  %polly.indvar132 = phi i64 [ %89, %polly.loop_preheader129 ], [ %polly.indvar_next133, %polly.loop_header128 ]
  %polly.access.cast.BB = bitcast i8* %BB to double*
  %polly.access.mul.BB = mul nsw i64 %polly.indvar124, 2300
  %polly.access.add.BB = add nsw i64 %polly.access.mul.BB, %polly.indvar132
  %polly.access.BB = getelementptr double, double* %polly.access.cast.BB, i64 %polly.access.add.BB
  %polly.access.BB.load = load double, double* %polly.access.BB, !alias.scope !34, !noalias !36
  %polly.access.cast.Packed_B = bitcast [256 x [384 x [4 x double]]]* %Packed_B to double*
  %94 = mul nsw i64 -256, %polly.indvar112
  %pexp.p_div_q = udiv i64 %polly.indvar132, 4
  %95 = add nsw i64 %94, %pexp.p_div_q
  %polly.access.mul.Packed_B = mul nsw i64 %95, 384
  %96 = mul nsw i64 -384, %polly.indvar118
  %97 = add nsw i64 %96, %polly.indvar124
  %polly.access.add.Packed_B = add nsw i64 %polly.access.mul.Packed_B, %97
  %polly.access.mul.Packed_B135 = mul nsw i64 %polly.access.add.Packed_B, 4
  %98 = sub nsw i64 0, %polly.indvar132
  %99 = add nsw i64 %98, 2299
  %pexp.pdiv_r = urem i64 %99, 4
  %100 = sub nsw i64 0, %pexp.pdiv_r
  %101 = add nsw i64 %100, 3
  %polly.access.add.Packed_B136 = add nsw i64 %polly.access.mul.Packed_B135, %101
  %polly.access.Packed_B = getelementptr double, double* %polly.access.cast.Packed_B, i64 %polly.access.add.Packed_B136
  store double %polly.access.BB.load, double* %polly.access.Packed_B
  %polly.indvar_next133 = add nsw i64 %polly.indvar132, 1
  %polly.loop_cond134 = icmp sle i64 %polly.indvar_next133, %93
  br i1 %polly.loop_cond134, label %polly.loop_header128, label %polly.loop_exit130

polly.loop_preheader129:                          ; preds = %polly.loop_if127
  br label %polly.loop_header128

polly.loop_header137:                             ; preds = %polly.loop_exit165, %polly.loop_preheader138
  %polly.indvar140 = phi i64 [ 0, %polly.loop_preheader138 ], [ %polly.indvar_next141, %polly.loop_exit165 ]
  br label %polly.cond

polly.cond:                                       ; preds = %polly.loop_header137
  %102 = icmp eq i64 %polly.indvar112, 0
  br i1 %102, label %polly.then, label %polly.else

polly.merge:                                      ; preds = %polly.else, %polly.loop_exit146
  %103 = mul nsw i64 -256, %polly.indvar112
  %104 = add nsw i64 %103, 574
  %105 = icmp slt i64 255, %104
  %106 = select i1 %105, i64 255, i64 %104
  br label %polly.loop_preheader164

polly.loop_exit165:                               ; preds = %polly.loop_exit171
  %polly.indvar_next141 = add nsw i64 %polly.indvar140, 1
  %polly.loop_cond142 = icmp sle i64 %polly.indvar_next141, 31
  br i1 %polly.loop_cond142, label %polly.loop_header137, label %polly.loop_exit139

polly.loop_preheader138:                          ; preds = %polly.loop_exit123
  br label %polly.loop_header137

polly.then:                                       ; preds = %polly.cond
  %107 = mul nsw i64 64, %polly.indvar140
  %108 = mul nsw i64 64, %polly.indvar140
  %109 = add nsw i64 %108, 63
  %110 = icmp slt i64 1999, %109
  %111 = select i1 %110, i64 1999, i64 %109
  br label %polly.loop_if143

polly.loop_exit146:                               ; preds = %polly.loop_exit154, %polly.loop_if143
  br label %polly.merge

polly.else:                                       ; preds = %polly.cond
  br label %polly.merge

polly.loop_if143:                                 ; preds = %polly.then
  %polly.loop_guard147 = icmp sle i64 %107, %111
  br i1 %polly.loop_guard147, label %polly.loop_preheader145, label %polly.loop_exit146

polly.loop_header144:                             ; preds = %polly.loop_exit154, %polly.loop_preheader145
  %polly.indvar148 = phi i64 [ %107, %polly.loop_preheader145 ], [ %polly.indvar_next149, %polly.loop_exit154 ]
  %112 = mul nsw i64 384, %polly.indvar118
  %113 = mul nsw i64 384, %polly.indvar118
  %114 = add nsw i64 %113, 383
  %115 = icmp slt i64 2599, %114
  %116 = select i1 %115, i64 2599, i64 %114
  br label %polly.loop_if151

polly.loop_exit154:                               ; preds = %polly.loop_header152, %polly.loop_if151
  %polly.indvar_next149 = add nsw i64 %polly.indvar148, 1
  %polly.loop_cond150 = icmp sle i64 %polly.indvar_next149, %111
  br i1 %polly.loop_cond150, label %polly.loop_header144, label %polly.loop_exit146

polly.loop_preheader145:                          ; preds = %polly.loop_if143
  br label %polly.loop_header144

polly.loop_if151:                                 ; preds = %polly.loop_header144
  %polly.loop_guard155 = icmp sle i64 %112, %116
  br i1 %polly.loop_guard155, label %polly.loop_preheader153, label %polly.loop_exit154

polly.loop_header152:                             ; preds = %polly.loop_header152, %polly.loop_preheader153
  %polly.indvar156 = phi i64 [ %112, %polly.loop_preheader153 ], [ %polly.indvar_next157, %polly.loop_header152 ]
  %polly.access.cast.AA = bitcast i8* %AA to double*
  %polly.access.mul.AA = mul nsw i64 %polly.indvar148, 2600
  %polly.access.add.AA = add nsw i64 %polly.access.mul.AA, %polly.indvar156
  %polly.access.AA = getelementptr double, double* %polly.access.cast.AA, i64 %polly.access.add.AA
  %polly.access.AA.load = load double, double* %polly.access.AA, !alias.scope !28, !noalias !30
  %polly.access.cast.Packed_A = bitcast [16 x [384 x [4 x double]]]* %Packed_A to double*
  %117 = mul nsw i64 -16, %polly.indvar140
  %pexp.p_div_q159 = udiv i64 %polly.indvar148, 4
  %118 = add nsw i64 %117, %pexp.p_div_q159
  %polly.access.mul.Packed_A = mul nsw i64 %118, 384
  %119 = mul nsw i64 -384, %polly.indvar118
  %120 = add nsw i64 %119, %polly.indvar156
  %polly.access.add.Packed_A = add nsw i64 %polly.access.mul.Packed_A, %120
  %polly.access.mul.Packed_A160 = mul nsw i64 %polly.access.add.Packed_A, 4
  %121 = sub nsw i64 0, %polly.indvar148
  %122 = add nsw i64 %121, 1999
  %pexp.pdiv_r161 = urem i64 %122, 4
  %123 = sub nsw i64 0, %pexp.pdiv_r161
  %124 = add nsw i64 %123, 3
  %polly.access.add.Packed_A162 = add nsw i64 %polly.access.mul.Packed_A160, %124
  %polly.access.Packed_A = getelementptr double, double* %polly.access.cast.Packed_A, i64 %polly.access.add.Packed_A162
  store double %polly.access.AA.load, double* %polly.access.Packed_A
  %polly.indvar_next157 = add nsw i64 %polly.indvar156, 1
  %polly.loop_cond158 = icmp sle i64 %polly.indvar_next157, %116
  br i1 %polly.loop_cond158, label %polly.loop_header152, label %polly.loop_exit154

polly.loop_preheader153:                          ; preds = %polly.loop_if151
  br label %polly.loop_header152

polly.loop_header163:                             ; preds = %polly.loop_exit171, %polly.loop_preheader164
  %polly.indvar166 = phi i64 [ 0, %polly.loop_preheader164 ], [ %polly.indvar_next167, %polly.loop_exit171 ]
  %125 = mul nsw i64 -16, %polly.indvar140
  %126 = add nsw i64 %125, 499
  %127 = icmp slt i64 15, %126
  %128 = select i1 %127, i64 15, i64 %126
  br label %polly.loop_preheader170

polly.loop_exit171:                               ; preds = %polly.loop_exit177
  %polly.indvar_next167 = add nsw i64 %polly.indvar166, 1
  %polly.loop_cond168 = icmp sle i64 %polly.indvar_next167, %106
  br i1 %polly.loop_cond168, label %polly.loop_header163, label %polly.loop_exit165

polly.loop_preheader164:                          ; preds = %polly.merge
  br label %polly.loop_header163

polly.loop_header169:                             ; preds = %polly.loop_exit177, %polly.loop_preheader170
  %polly.indvar172 = phi i64 [ 0, %polly.loop_preheader170 ], [ %polly.indvar_next173, %polly.loop_exit177 ]
  %129 = mul nsw i64 -384, %polly.indvar118
  %130 = add nsw i64 %129, 2599
  %131 = icmp slt i64 383, %130
  %132 = select i1 %131, i64 383, i64 %130
  br label %polly.loop_preheader176

polly.loop_exit177:                               ; preds = %polly.stmt.for.body11492
  %polly.indvar_next173 = add nsw i64 %polly.indvar172, 1
  %polly.loop_cond174 = icmp sle i64 %polly.indvar_next173, %128
  br i1 %polly.loop_cond174, label %polly.loop_header169, label %polly.loop_exit171

polly.loop_preheader170:                          ; preds = %polly.loop_header163
  br label %polly.loop_header169

polly.loop_header175:                             ; preds = %polly.stmt.for.body11492, %polly.loop_preheader176
  %polly.indvar178 = phi i64 [ 0, %polly.loop_preheader176 ], [ %polly.indvar_next179, %polly.stmt.for.body11492 ]
  %133 = mul nsw i64 64, %polly.indvar140
  %134 = mul nsw i64 4, %polly.indvar172
  %135 = add nsw i64 %133, %134
  %136 = mul nsw i64 384, %polly.indvar118
  %137 = add nsw i64 %136, %polly.indvar178
  %138 = mul nsw i64 1024, %polly.indvar112
  %139 = mul nsw i64 4, %polly.indvar166
  %140 = add nsw i64 %138, %139
  br label %polly.stmt.for.body11

polly.stmt.for.body11:                            ; preds = %polly.loop_header175
  %polly.access.cast.Packed_A181 = bitcast [16 x [384 x [4 x double]]]* %Packed_A to double*
  %polly.access.mul.Packed_A182 = mul nsw i64 %polly.indvar172, 384
  %polly.access.add.Packed_A183 = add nsw i64 %polly.access.mul.Packed_A182, %polly.indvar178
  %polly.access.mul.Packed_A184 = mul nsw i64 %polly.access.add.Packed_A183, 4
  %polly.access.add.Packed_A185 = add nsw i64 %polly.access.mul.Packed_A184, 0
  %polly.access.Packed_A186 = getelementptr double, double* %polly.access.cast.Packed_A181, i64 %polly.access.add.Packed_A185
  %_p_scalar_187 = load double, double* %polly.access.Packed_A186, align 8
  %p_mul16 = fmul double %_p_scalar_187, 1.500000e+00
  %polly.access.cast.Packed_B188 = bitcast [256 x [384 x [4 x double]]]* %Packed_B to double*
  %polly.access.mul.Packed_B189 = mul nsw i64 %polly.indvar166, 384
  %polly.access.add.Packed_B190 = add nsw i64 %polly.access.mul.Packed_B189, %polly.indvar178
  %polly.access.mul.Packed_B191 = mul nsw i64 %polly.access.add.Packed_B190, 4
  %polly.access.add.Packed_B192 = add nsw i64 %polly.access.mul.Packed_B191, 0
  %polly.access.Packed_B193 = getelementptr double, double* %polly.access.cast.Packed_B188, i64 %polly.access.add.Packed_B192
  %_p_scalar_194 = load double, double* %polly.access.Packed_B193, align 8
  %p_mul21 = fmul double %p_mul16, %_p_scalar_194
  %141 = mul i64 %135, 18400
  %142 = shl i64 %140, 3
  %143 = add i64 %141, %142
  %scevgep195 = getelementptr i8, i8* %CC, i64 %143
  %scevgep195196 = bitcast i8* %scevgep195 to double*
  %_p_scalar_197 = load double, double* %scevgep195196, align 8, !alias.scope !37, !noalias !35
  %p_add = fadd double %_p_scalar_197, %p_mul21
  store double %p_add, double* %scevgep195196, align 8, !alias.scope !37, !noalias !35
  %144 = mul nsw i64 64, %polly.indvar140
  %145 = mul nsw i64 4, %polly.indvar172
  %146 = add nsw i64 %144, %145
  %147 = mul nsw i64 384, %polly.indvar118
  %148 = add nsw i64 %147, %polly.indvar178
  %149 = mul nsw i64 1024, %polly.indvar112
  %150 = mul nsw i64 4, %polly.indvar166
  %151 = add nsw i64 %149, %150
  %152 = add nsw i64 %151, 1
  br label %polly.stmt.for.body11198

polly.stmt.for.body11198:                         ; preds = %polly.stmt.for.body11
  %polly.access.cast.Packed_A199 = bitcast [16 x [384 x [4 x double]]]* %Packed_A to double*
  %polly.access.mul.Packed_A200 = mul nsw i64 %polly.indvar172, 384
  %polly.access.add.Packed_A201 = add nsw i64 %polly.access.mul.Packed_A200, %polly.indvar178
  %polly.access.mul.Packed_A202 = mul nsw i64 %polly.access.add.Packed_A201, 4
  %polly.access.add.Packed_A203 = add nsw i64 %polly.access.mul.Packed_A202, 0
  %polly.access.Packed_A204 = getelementptr double, double* %polly.access.cast.Packed_A199, i64 %polly.access.add.Packed_A203
  %_p_scalar_205 = load double, double* %polly.access.Packed_A204, align 8
  %p_mul16206 = fmul double %_p_scalar_205, 1.500000e+00
  %polly.access.cast.Packed_B207 = bitcast [256 x [384 x [4 x double]]]* %Packed_B to double*
  %polly.access.mul.Packed_B208 = mul nsw i64 %polly.indvar166, 384
  %polly.access.add.Packed_B209 = add nsw i64 %polly.access.mul.Packed_B208, %polly.indvar178
  %polly.access.mul.Packed_B210 = mul nsw i64 %polly.access.add.Packed_B209, 4
  %polly.access.add.Packed_B211 = add nsw i64 %polly.access.mul.Packed_B210, 1
  %polly.access.Packed_B212 = getelementptr double, double* %polly.access.cast.Packed_B207, i64 %polly.access.add.Packed_B211
  %_p_scalar_213 = load double, double* %polly.access.Packed_B212, align 8
  %p_mul21214 = fmul double %p_mul16206, %_p_scalar_213
  %153 = mul i64 %146, 18400
  %154 = shl i64 %152, 3
  %155 = add i64 %153, %154
  %scevgep215 = getelementptr i8, i8* %CC, i64 %155
  %scevgep215216 = bitcast i8* %scevgep215 to double*
  %_p_scalar_217 = load double, double* %scevgep215216, align 8, !alias.scope !38, !noalias !39
  %p_add218 = fadd double %_p_scalar_217, %p_mul21214
  store double %p_add218, double* %scevgep215216, align 8, !alias.scope !38, !noalias !39
  %156 = mul nsw i64 64, %polly.indvar140
  %157 = mul nsw i64 4, %polly.indvar172
  %158 = add nsw i64 %156, %157
  %159 = mul nsw i64 384, %polly.indvar118
  %160 = add nsw i64 %159, %polly.indvar178
  %161 = mul nsw i64 1024, %polly.indvar112
  %162 = mul nsw i64 4, %polly.indvar166
  %163 = add nsw i64 %161, %162
  %164 = add nsw i64 %163, 2
  br label %polly.stmt.for.body11219

polly.stmt.for.body11219:                         ; preds = %polly.stmt.for.body11198
  %polly.access.cast.Packed_A220 = bitcast [16 x [384 x [4 x double]]]* %Packed_A to double*
  %polly.access.mul.Packed_A221 = mul nsw i64 %polly.indvar172, 384
  %polly.access.add.Packed_A222 = add nsw i64 %polly.access.mul.Packed_A221, %polly.indvar178
  %polly.access.mul.Packed_A223 = mul nsw i64 %polly.access.add.Packed_A222, 4
  %polly.access.add.Packed_A224 = add nsw i64 %polly.access.mul.Packed_A223, 0
  %polly.access.Packed_A225 = getelementptr double, double* %polly.access.cast.Packed_A220, i64 %polly.access.add.Packed_A224
  %_p_scalar_226 = load double, double* %polly.access.Packed_A225, align 8
  %p_mul16227 = fmul double %_p_scalar_226, 1.500000e+00
  %polly.access.cast.Packed_B228 = bitcast [256 x [384 x [4 x double]]]* %Packed_B to double*
  %polly.access.mul.Packed_B229 = mul nsw i64 %polly.indvar166, 384
  %polly.access.add.Packed_B230 = add nsw i64 %polly.access.mul.Packed_B229, %polly.indvar178
  %polly.access.mul.Packed_B231 = mul nsw i64 %polly.access.add.Packed_B230, 4
  %polly.access.add.Packed_B232 = add nsw i64 %polly.access.mul.Packed_B231, 2
  %polly.access.Packed_B233 = getelementptr double, double* %polly.access.cast.Packed_B228, i64 %polly.access.add.Packed_B232
  %_p_scalar_234 = load double, double* %polly.access.Packed_B233, align 8
  %p_mul21235 = fmul double %p_mul16227, %_p_scalar_234
  %165 = mul i64 %158, 18400
  %166 = shl i64 %164, 3
  %167 = add i64 %165, %166
  %scevgep236 = getelementptr i8, i8* %CC, i64 %167
  %scevgep236237 = bitcast i8* %scevgep236 to double*
  %_p_scalar_238 = load double, double* %scevgep236237, align 8, !alias.scope !40, !noalias !41
  %p_add239 = fadd double %_p_scalar_238, %p_mul21235
  store double %p_add239, double* %scevgep236237, align 8, !alias.scope !40, !noalias !41
  %168 = mul nsw i64 64, %polly.indvar140
  %169 = mul nsw i64 4, %polly.indvar172
  %170 = add nsw i64 %168, %169
  %171 = mul nsw i64 384, %polly.indvar118
  %172 = add nsw i64 %171, %polly.indvar178
  %173 = mul nsw i64 1024, %polly.indvar112
  %174 = mul nsw i64 4, %polly.indvar166
  %175 = add nsw i64 %173, %174
  %176 = add nsw i64 %175, 3
  br label %polly.stmt.for.body11240

polly.stmt.for.body11240:                         ; preds = %polly.stmt.for.body11219
  %polly.access.cast.Packed_A241 = bitcast [16 x [384 x [4 x double]]]* %Packed_A to double*
  %polly.access.mul.Packed_A242 = mul nsw i64 %polly.indvar172, 384
  %polly.access.add.Packed_A243 = add nsw i64 %polly.access.mul.Packed_A242, %polly.indvar178
  %polly.access.mul.Packed_A244 = mul nsw i64 %polly.access.add.Packed_A243, 4
  %polly.access.add.Packed_A245 = add nsw i64 %polly.access.mul.Packed_A244, 0
  %polly.access.Packed_A246 = getelementptr double, double* %polly.access.cast.Packed_A241, i64 %polly.access.add.Packed_A245
  %_p_scalar_247 = load double, double* %polly.access.Packed_A246, align 8
  %p_mul16248 = fmul double %_p_scalar_247, 1.500000e+00
  %polly.access.cast.Packed_B249 = bitcast [256 x [384 x [4 x double]]]* %Packed_B to double*
  %polly.access.mul.Packed_B250 = mul nsw i64 %polly.indvar166, 384
  %polly.access.add.Packed_B251 = add nsw i64 %polly.access.mul.Packed_B250, %polly.indvar178
  %polly.access.mul.Packed_B252 = mul nsw i64 %polly.access.add.Packed_B251, 4
  %polly.access.add.Packed_B253 = add nsw i64 %polly.access.mul.Packed_B252, 3
  %polly.access.Packed_B254 = getelementptr double, double* %polly.access.cast.Packed_B249, i64 %polly.access.add.Packed_B253
  %_p_scalar_255 = load double, double* %polly.access.Packed_B254, align 8
  %p_mul21256 = fmul double %p_mul16248, %_p_scalar_255
  %177 = mul i64 %170, 18400
  %178 = shl i64 %176, 3
  %179 = add i64 %177, %178
  %scevgep257 = getelementptr i8, i8* %CC, i64 %179
  %scevgep257258 = bitcast i8* %scevgep257 to double*
  %_p_scalar_259 = load double, double* %scevgep257258, align 8, !alias.scope !42, !noalias !43
  %p_add260 = fadd double %_p_scalar_259, %p_mul21256
  store double %p_add260, double* %scevgep257258, align 8, !alias.scope !42, !noalias !43
  %180 = mul nsw i64 64, %polly.indvar140
  %181 = mul nsw i64 4, %polly.indvar172
  %182 = add nsw i64 %180, %181
  %183 = add nsw i64 %182, 1
  %184 = mul nsw i64 384, %polly.indvar118
  %185 = add nsw i64 %184, %polly.indvar178
  %186 = mul nsw i64 1024, %polly.indvar112
  %187 = mul nsw i64 4, %polly.indvar166
  %188 = add nsw i64 %186, %187
  br label %polly.stmt.for.body11261

polly.stmt.for.body11261:                         ; preds = %polly.stmt.for.body11240
  %polly.access.cast.Packed_A262 = bitcast [16 x [384 x [4 x double]]]* %Packed_A to double*
  %polly.access.mul.Packed_A263 = mul nsw i64 %polly.indvar172, 384
  %polly.access.add.Packed_A264 = add nsw i64 %polly.access.mul.Packed_A263, %polly.indvar178
  %polly.access.mul.Packed_A265 = mul nsw i64 %polly.access.add.Packed_A264, 4
  %polly.access.add.Packed_A266 = add nsw i64 %polly.access.mul.Packed_A265, 1
  %polly.access.Packed_A267 = getelementptr double, double* %polly.access.cast.Packed_A262, i64 %polly.access.add.Packed_A266
  %_p_scalar_268 = load double, double* %polly.access.Packed_A267, align 8
  %p_mul16269 = fmul double %_p_scalar_268, 1.500000e+00
  %polly.access.cast.Packed_B270 = bitcast [256 x [384 x [4 x double]]]* %Packed_B to double*
  %polly.access.mul.Packed_B271 = mul nsw i64 %polly.indvar166, 384
  %polly.access.add.Packed_B272 = add nsw i64 %polly.access.mul.Packed_B271, %polly.indvar178
  %polly.access.mul.Packed_B273 = mul nsw i64 %polly.access.add.Packed_B272, 4
  %polly.access.add.Packed_B274 = add nsw i64 %polly.access.mul.Packed_B273, 0
  %polly.access.Packed_B275 = getelementptr double, double* %polly.access.cast.Packed_B270, i64 %polly.access.add.Packed_B274
  %_p_scalar_276 = load double, double* %polly.access.Packed_B275, align 8
  %p_mul21277 = fmul double %p_mul16269, %_p_scalar_276
  %189 = mul i64 %183, 18400
  %190 = shl i64 %188, 3
  %191 = add i64 %189, %190
  %scevgep278 = getelementptr i8, i8* %CC, i64 %191
  %scevgep278279 = bitcast i8* %scevgep278 to double*
  %_p_scalar_280 = load double, double* %scevgep278279, align 8, !alias.scope !44, !noalias !45
  %p_add281 = fadd double %_p_scalar_280, %p_mul21277
  store double %p_add281, double* %scevgep278279, align 8, !alias.scope !44, !noalias !45
  %192 = mul nsw i64 64, %polly.indvar140
  %193 = mul nsw i64 4, %polly.indvar172
  %194 = add nsw i64 %192, %193
  %195 = add nsw i64 %194, 1
  %196 = mul nsw i64 384, %polly.indvar118
  %197 = add nsw i64 %196, %polly.indvar178
  %198 = mul nsw i64 1024, %polly.indvar112
  %199 = mul nsw i64 4, %polly.indvar166
  %200 = add nsw i64 %198, %199
  %201 = add nsw i64 %200, 1
  br label %polly.stmt.for.body11282

polly.stmt.for.body11282:                         ; preds = %polly.stmt.for.body11261
  %polly.access.cast.Packed_A283 = bitcast [16 x [384 x [4 x double]]]* %Packed_A to double*
  %polly.access.mul.Packed_A284 = mul nsw i64 %polly.indvar172, 384
  %polly.access.add.Packed_A285 = add nsw i64 %polly.access.mul.Packed_A284, %polly.indvar178
  %polly.access.mul.Packed_A286 = mul nsw i64 %polly.access.add.Packed_A285, 4
  %polly.access.add.Packed_A287 = add nsw i64 %polly.access.mul.Packed_A286, 1
  %polly.access.Packed_A288 = getelementptr double, double* %polly.access.cast.Packed_A283, i64 %polly.access.add.Packed_A287
  %_p_scalar_289 = load double, double* %polly.access.Packed_A288, align 8
  %p_mul16290 = fmul double %_p_scalar_289, 1.500000e+00
  %polly.access.cast.Packed_B291 = bitcast [256 x [384 x [4 x double]]]* %Packed_B to double*
  %polly.access.mul.Packed_B292 = mul nsw i64 %polly.indvar166, 384
  %polly.access.add.Packed_B293 = add nsw i64 %polly.access.mul.Packed_B292, %polly.indvar178
  %polly.access.mul.Packed_B294 = mul nsw i64 %polly.access.add.Packed_B293, 4
  %polly.access.add.Packed_B295 = add nsw i64 %polly.access.mul.Packed_B294, 1
  %polly.access.Packed_B296 = getelementptr double, double* %polly.access.cast.Packed_B291, i64 %polly.access.add.Packed_B295
  %_p_scalar_297 = load double, double* %polly.access.Packed_B296, align 8
  %p_mul21298 = fmul double %p_mul16290, %_p_scalar_297
  %202 = mul i64 %195, 18400
  %203 = shl i64 %201, 3
  %204 = add i64 %202, %203
  %scevgep299 = getelementptr i8, i8* %CC, i64 %204
  %scevgep299300 = bitcast i8* %scevgep299 to double*
  %_p_scalar_301 = load double, double* %scevgep299300, align 8, !alias.scope !46, !noalias !47
  %p_add302 = fadd double %_p_scalar_301, %p_mul21298
  store double %p_add302, double* %scevgep299300, align 8, !alias.scope !46, !noalias !47
  %205 = mul nsw i64 64, %polly.indvar140
  %206 = mul nsw i64 4, %polly.indvar172
  %207 = add nsw i64 %205, %206
  %208 = add nsw i64 %207, 1
  %209 = mul nsw i64 384, %polly.indvar118
  %210 = add nsw i64 %209, %polly.indvar178
  %211 = mul nsw i64 1024, %polly.indvar112
  %212 = mul nsw i64 4, %polly.indvar166
  %213 = add nsw i64 %211, %212
  %214 = add nsw i64 %213, 2
  br label %polly.stmt.for.body11303

polly.stmt.for.body11303:                         ; preds = %polly.stmt.for.body11282
  %polly.access.cast.Packed_A304 = bitcast [16 x [384 x [4 x double]]]* %Packed_A to double*
  %polly.access.mul.Packed_A305 = mul nsw i64 %polly.indvar172, 384
  %polly.access.add.Packed_A306 = add nsw i64 %polly.access.mul.Packed_A305, %polly.indvar178
  %polly.access.mul.Packed_A307 = mul nsw i64 %polly.access.add.Packed_A306, 4
  %polly.access.add.Packed_A308 = add nsw i64 %polly.access.mul.Packed_A307, 1
  %polly.access.Packed_A309 = getelementptr double, double* %polly.access.cast.Packed_A304, i64 %polly.access.add.Packed_A308
  %_p_scalar_310 = load double, double* %polly.access.Packed_A309, align 8
  %p_mul16311 = fmul double %_p_scalar_310, 1.500000e+00
  %polly.access.cast.Packed_B312 = bitcast [256 x [384 x [4 x double]]]* %Packed_B to double*
  %polly.access.mul.Packed_B313 = mul nsw i64 %polly.indvar166, 384
  %polly.access.add.Packed_B314 = add nsw i64 %polly.access.mul.Packed_B313, %polly.indvar178
  %polly.access.mul.Packed_B315 = mul nsw i64 %polly.access.add.Packed_B314, 4
  %polly.access.add.Packed_B316 = add nsw i64 %polly.access.mul.Packed_B315, 2
  %polly.access.Packed_B317 = getelementptr double, double* %polly.access.cast.Packed_B312, i64 %polly.access.add.Packed_B316
  %_p_scalar_318 = load double, double* %polly.access.Packed_B317, align 8
  %p_mul21319 = fmul double %p_mul16311, %_p_scalar_318
  %215 = mul i64 %208, 18400
  %216 = shl i64 %214, 3
  %217 = add i64 %215, %216
  %scevgep320 = getelementptr i8, i8* %CC, i64 %217
  %scevgep320321 = bitcast i8* %scevgep320 to double*
  %_p_scalar_322 = load double, double* %scevgep320321, align 8, !alias.scope !48, !noalias !49
  %p_add323 = fadd double %_p_scalar_322, %p_mul21319
  store double %p_add323, double* %scevgep320321, align 8, !alias.scope !48, !noalias !49
  %218 = mul nsw i64 64, %polly.indvar140
  %219 = mul nsw i64 4, %polly.indvar172
  %220 = add nsw i64 %218, %219
  %221 = add nsw i64 %220, 1
  %222 = mul nsw i64 384, %polly.indvar118
  %223 = add nsw i64 %222, %polly.indvar178
  %224 = mul nsw i64 1024, %polly.indvar112
  %225 = mul nsw i64 4, %polly.indvar166
  %226 = add nsw i64 %224, %225
  %227 = add nsw i64 %226, 3
  br label %polly.stmt.for.body11324

polly.stmt.for.body11324:                         ; preds = %polly.stmt.for.body11303
  %polly.access.cast.Packed_A325 = bitcast [16 x [384 x [4 x double]]]* %Packed_A to double*
  %polly.access.mul.Packed_A326 = mul nsw i64 %polly.indvar172, 384
  %polly.access.add.Packed_A327 = add nsw i64 %polly.access.mul.Packed_A326, %polly.indvar178
  %polly.access.mul.Packed_A328 = mul nsw i64 %polly.access.add.Packed_A327, 4
  %polly.access.add.Packed_A329 = add nsw i64 %polly.access.mul.Packed_A328, 1
  %polly.access.Packed_A330 = getelementptr double, double* %polly.access.cast.Packed_A325, i64 %polly.access.add.Packed_A329
  %_p_scalar_331 = load double, double* %polly.access.Packed_A330, align 8
  %p_mul16332 = fmul double %_p_scalar_331, 1.500000e+00
  %polly.access.cast.Packed_B333 = bitcast [256 x [384 x [4 x double]]]* %Packed_B to double*
  %polly.access.mul.Packed_B334 = mul nsw i64 %polly.indvar166, 384
  %polly.access.add.Packed_B335 = add nsw i64 %polly.access.mul.Packed_B334, %polly.indvar178
  %polly.access.mul.Packed_B336 = mul nsw i64 %polly.access.add.Packed_B335, 4
  %polly.access.add.Packed_B337 = add nsw i64 %polly.access.mul.Packed_B336, 3
  %polly.access.Packed_B338 = getelementptr double, double* %polly.access.cast.Packed_B333, i64 %polly.access.add.Packed_B337
  %_p_scalar_339 = load double, double* %polly.access.Packed_B338, align 8
  %p_mul21340 = fmul double %p_mul16332, %_p_scalar_339
  %228 = mul i64 %221, 18400
  %229 = shl i64 %227, 3
  %230 = add i64 %228, %229
  %scevgep341 = getelementptr i8, i8* %CC, i64 %230
  %scevgep341342 = bitcast i8* %scevgep341 to double*
  %_p_scalar_343 = load double, double* %scevgep341342, align 8, !alias.scope !50, !noalias !51
  %p_add344 = fadd double %_p_scalar_343, %p_mul21340
  store double %p_add344, double* %scevgep341342, align 8, !alias.scope !50, !noalias !51
  %231 = mul nsw i64 64, %polly.indvar140
  %232 = mul nsw i64 4, %polly.indvar172
  %233 = add nsw i64 %231, %232
  %234 = add nsw i64 %233, 2
  %235 = mul nsw i64 384, %polly.indvar118
  %236 = add nsw i64 %235, %polly.indvar178
  %237 = mul nsw i64 1024, %polly.indvar112
  %238 = mul nsw i64 4, %polly.indvar166
  %239 = add nsw i64 %237, %238
  br label %polly.stmt.for.body11345

polly.stmt.for.body11345:                         ; preds = %polly.stmt.for.body11324
  %polly.access.cast.Packed_A346 = bitcast [16 x [384 x [4 x double]]]* %Packed_A to double*
  %polly.access.mul.Packed_A347 = mul nsw i64 %polly.indvar172, 384
  %polly.access.add.Packed_A348 = add nsw i64 %polly.access.mul.Packed_A347, %polly.indvar178
  %polly.access.mul.Packed_A349 = mul nsw i64 %polly.access.add.Packed_A348, 4
  %polly.access.add.Packed_A350 = add nsw i64 %polly.access.mul.Packed_A349, 2
  %polly.access.Packed_A351 = getelementptr double, double* %polly.access.cast.Packed_A346, i64 %polly.access.add.Packed_A350
  %_p_scalar_352 = load double, double* %polly.access.Packed_A351, align 8
  %p_mul16353 = fmul double %_p_scalar_352, 1.500000e+00
  %polly.access.cast.Packed_B354 = bitcast [256 x [384 x [4 x double]]]* %Packed_B to double*
  %polly.access.mul.Packed_B355 = mul nsw i64 %polly.indvar166, 384
  %polly.access.add.Packed_B356 = add nsw i64 %polly.access.mul.Packed_B355, %polly.indvar178
  %polly.access.mul.Packed_B357 = mul nsw i64 %polly.access.add.Packed_B356, 4
  %polly.access.add.Packed_B358 = add nsw i64 %polly.access.mul.Packed_B357, 0
  %polly.access.Packed_B359 = getelementptr double, double* %polly.access.cast.Packed_B354, i64 %polly.access.add.Packed_B358
  %_p_scalar_360 = load double, double* %polly.access.Packed_B359, align 8
  %p_mul21361 = fmul double %p_mul16353, %_p_scalar_360
  %240 = mul i64 %234, 18400
  %241 = shl i64 %239, 3
  %242 = add i64 %240, %241
  %scevgep362 = getelementptr i8, i8* %CC, i64 %242
  %scevgep362363 = bitcast i8* %scevgep362 to double*
  %_p_scalar_364 = load double, double* %scevgep362363, align 8, !alias.scope !52, !noalias !53
  %p_add365 = fadd double %_p_scalar_364, %p_mul21361
  store double %p_add365, double* %scevgep362363, align 8, !alias.scope !52, !noalias !53
  %243 = mul nsw i64 64, %polly.indvar140
  %244 = mul nsw i64 4, %polly.indvar172
  %245 = add nsw i64 %243, %244
  %246 = add nsw i64 %245, 2
  %247 = mul nsw i64 384, %polly.indvar118
  %248 = add nsw i64 %247, %polly.indvar178
  %249 = mul nsw i64 1024, %polly.indvar112
  %250 = mul nsw i64 4, %polly.indvar166
  %251 = add nsw i64 %249, %250
  %252 = add nsw i64 %251, 1
  br label %polly.stmt.for.body11366

polly.stmt.for.body11366:                         ; preds = %polly.stmt.for.body11345
  %polly.access.cast.Packed_A367 = bitcast [16 x [384 x [4 x double]]]* %Packed_A to double*
  %polly.access.mul.Packed_A368 = mul nsw i64 %polly.indvar172, 384
  %polly.access.add.Packed_A369 = add nsw i64 %polly.access.mul.Packed_A368, %polly.indvar178
  %polly.access.mul.Packed_A370 = mul nsw i64 %polly.access.add.Packed_A369, 4
  %polly.access.add.Packed_A371 = add nsw i64 %polly.access.mul.Packed_A370, 2
  %polly.access.Packed_A372 = getelementptr double, double* %polly.access.cast.Packed_A367, i64 %polly.access.add.Packed_A371
  %_p_scalar_373 = load double, double* %polly.access.Packed_A372, align 8
  %p_mul16374 = fmul double %_p_scalar_373, 1.500000e+00
  %polly.access.cast.Packed_B375 = bitcast [256 x [384 x [4 x double]]]* %Packed_B to double*
  %polly.access.mul.Packed_B376 = mul nsw i64 %polly.indvar166, 384
  %polly.access.add.Packed_B377 = add nsw i64 %polly.access.mul.Packed_B376, %polly.indvar178
  %polly.access.mul.Packed_B378 = mul nsw i64 %polly.access.add.Packed_B377, 4
  %polly.access.add.Packed_B379 = add nsw i64 %polly.access.mul.Packed_B378, 1
  %polly.access.Packed_B380 = getelementptr double, double* %polly.access.cast.Packed_B375, i64 %polly.access.add.Packed_B379
  %_p_scalar_381 = load double, double* %polly.access.Packed_B380, align 8
  %p_mul21382 = fmul double %p_mul16374, %_p_scalar_381
  %253 = mul i64 %246, 18400
  %254 = shl i64 %252, 3
  %255 = add i64 %253, %254
  %scevgep383 = getelementptr i8, i8* %CC, i64 %255
  %scevgep383384 = bitcast i8* %scevgep383 to double*
  %_p_scalar_385 = load double, double* %scevgep383384, align 8, !alias.scope !54, !noalias !55
  %p_add386 = fadd double %_p_scalar_385, %p_mul21382
  store double %p_add386, double* %scevgep383384, align 8, !alias.scope !54, !noalias !55
  %256 = mul nsw i64 64, %polly.indvar140
  %257 = mul nsw i64 4, %polly.indvar172
  %258 = add nsw i64 %256, %257
  %259 = add nsw i64 %258, 2
  %260 = mul nsw i64 384, %polly.indvar118
  %261 = add nsw i64 %260, %polly.indvar178
  %262 = mul nsw i64 1024, %polly.indvar112
  %263 = mul nsw i64 4, %polly.indvar166
  %264 = add nsw i64 %262, %263
  %265 = add nsw i64 %264, 2
  br label %polly.stmt.for.body11387

polly.stmt.for.body11387:                         ; preds = %polly.stmt.for.body11366
  %polly.access.cast.Packed_A388 = bitcast [16 x [384 x [4 x double]]]* %Packed_A to double*
  %polly.access.mul.Packed_A389 = mul nsw i64 %polly.indvar172, 384
  %polly.access.add.Packed_A390 = add nsw i64 %polly.access.mul.Packed_A389, %polly.indvar178
  %polly.access.mul.Packed_A391 = mul nsw i64 %polly.access.add.Packed_A390, 4
  %polly.access.add.Packed_A392 = add nsw i64 %polly.access.mul.Packed_A391, 2
  %polly.access.Packed_A393 = getelementptr double, double* %polly.access.cast.Packed_A388, i64 %polly.access.add.Packed_A392
  %_p_scalar_394 = load double, double* %polly.access.Packed_A393, align 8
  %p_mul16395 = fmul double %_p_scalar_394, 1.500000e+00
  %polly.access.cast.Packed_B396 = bitcast [256 x [384 x [4 x double]]]* %Packed_B to double*
  %polly.access.mul.Packed_B397 = mul nsw i64 %polly.indvar166, 384
  %polly.access.add.Packed_B398 = add nsw i64 %polly.access.mul.Packed_B397, %polly.indvar178
  %polly.access.mul.Packed_B399 = mul nsw i64 %polly.access.add.Packed_B398, 4
  %polly.access.add.Packed_B400 = add nsw i64 %polly.access.mul.Packed_B399, 2
  %polly.access.Packed_B401 = getelementptr double, double* %polly.access.cast.Packed_B396, i64 %polly.access.add.Packed_B400
  %_p_scalar_402 = load double, double* %polly.access.Packed_B401, align 8
  %p_mul21403 = fmul double %p_mul16395, %_p_scalar_402
  %266 = mul i64 %259, 18400
  %267 = shl i64 %265, 3
  %268 = add i64 %266, %267
  %scevgep404 = getelementptr i8, i8* %CC, i64 %268
  %scevgep404405 = bitcast i8* %scevgep404 to double*
  %_p_scalar_406 = load double, double* %scevgep404405, align 8, !alias.scope !56, !noalias !57
  %p_add407 = fadd double %_p_scalar_406, %p_mul21403
  store double %p_add407, double* %scevgep404405, align 8, !alias.scope !56, !noalias !57
  %269 = mul nsw i64 64, %polly.indvar140
  %270 = mul nsw i64 4, %polly.indvar172
  %271 = add nsw i64 %269, %270
  %272 = add nsw i64 %271, 2
  %273 = mul nsw i64 384, %polly.indvar118
  %274 = add nsw i64 %273, %polly.indvar178
  %275 = mul nsw i64 1024, %polly.indvar112
  %276 = mul nsw i64 4, %polly.indvar166
  %277 = add nsw i64 %275, %276
  %278 = add nsw i64 %277, 3
  br label %polly.stmt.for.body11408

polly.stmt.for.body11408:                         ; preds = %polly.stmt.for.body11387
  %polly.access.cast.Packed_A409 = bitcast [16 x [384 x [4 x double]]]* %Packed_A to double*
  %polly.access.mul.Packed_A410 = mul nsw i64 %polly.indvar172, 384
  %polly.access.add.Packed_A411 = add nsw i64 %polly.access.mul.Packed_A410, %polly.indvar178
  %polly.access.mul.Packed_A412 = mul nsw i64 %polly.access.add.Packed_A411, 4
  %polly.access.add.Packed_A413 = add nsw i64 %polly.access.mul.Packed_A412, 2
  %polly.access.Packed_A414 = getelementptr double, double* %polly.access.cast.Packed_A409, i64 %polly.access.add.Packed_A413
  %_p_scalar_415 = load double, double* %polly.access.Packed_A414, align 8
  %p_mul16416 = fmul double %_p_scalar_415, 1.500000e+00
  %polly.access.cast.Packed_B417 = bitcast [256 x [384 x [4 x double]]]* %Packed_B to double*
  %polly.access.mul.Packed_B418 = mul nsw i64 %polly.indvar166, 384
  %polly.access.add.Packed_B419 = add nsw i64 %polly.access.mul.Packed_B418, %polly.indvar178
  %polly.access.mul.Packed_B420 = mul nsw i64 %polly.access.add.Packed_B419, 4
  %polly.access.add.Packed_B421 = add nsw i64 %polly.access.mul.Packed_B420, 3
  %polly.access.Packed_B422 = getelementptr double, double* %polly.access.cast.Packed_B417, i64 %polly.access.add.Packed_B421
  %_p_scalar_423 = load double, double* %polly.access.Packed_B422, align 8
  %p_mul21424 = fmul double %p_mul16416, %_p_scalar_423
  %279 = mul i64 %272, 18400
  %280 = shl i64 %278, 3
  %281 = add i64 %279, %280
  %scevgep425 = getelementptr i8, i8* %CC, i64 %281
  %scevgep425426 = bitcast i8* %scevgep425 to double*
  %_p_scalar_427 = load double, double* %scevgep425426, align 8, !alias.scope !58, !noalias !59
  %p_add428 = fadd double %_p_scalar_427, %p_mul21424
  store double %p_add428, double* %scevgep425426, align 8, !alias.scope !58, !noalias !59
  %282 = mul nsw i64 64, %polly.indvar140
  %283 = mul nsw i64 4, %polly.indvar172
  %284 = add nsw i64 %282, %283
  %285 = add nsw i64 %284, 3
  %286 = mul nsw i64 384, %polly.indvar118
  %287 = add nsw i64 %286, %polly.indvar178
  %288 = mul nsw i64 1024, %polly.indvar112
  %289 = mul nsw i64 4, %polly.indvar166
  %290 = add nsw i64 %288, %289
  br label %polly.stmt.for.body11429

polly.stmt.for.body11429:                         ; preds = %polly.stmt.for.body11408
  %polly.access.cast.Packed_A430 = bitcast [16 x [384 x [4 x double]]]* %Packed_A to double*
  %polly.access.mul.Packed_A431 = mul nsw i64 %polly.indvar172, 384
  %polly.access.add.Packed_A432 = add nsw i64 %polly.access.mul.Packed_A431, %polly.indvar178
  %polly.access.mul.Packed_A433 = mul nsw i64 %polly.access.add.Packed_A432, 4
  %polly.access.add.Packed_A434 = add nsw i64 %polly.access.mul.Packed_A433, 3
  %polly.access.Packed_A435 = getelementptr double, double* %polly.access.cast.Packed_A430, i64 %polly.access.add.Packed_A434
  %_p_scalar_436 = load double, double* %polly.access.Packed_A435, align 8
  %p_mul16437 = fmul double %_p_scalar_436, 1.500000e+00
  %polly.access.cast.Packed_B438 = bitcast [256 x [384 x [4 x double]]]* %Packed_B to double*
  %polly.access.mul.Packed_B439 = mul nsw i64 %polly.indvar166, 384
  %polly.access.add.Packed_B440 = add nsw i64 %polly.access.mul.Packed_B439, %polly.indvar178
  %polly.access.mul.Packed_B441 = mul nsw i64 %polly.access.add.Packed_B440, 4
  %polly.access.add.Packed_B442 = add nsw i64 %polly.access.mul.Packed_B441, 0
  %polly.access.Packed_B443 = getelementptr double, double* %polly.access.cast.Packed_B438, i64 %polly.access.add.Packed_B442
  %_p_scalar_444 = load double, double* %polly.access.Packed_B443, align 8
  %p_mul21445 = fmul double %p_mul16437, %_p_scalar_444
  %291 = mul i64 %285, 18400
  %292 = shl i64 %290, 3
  %293 = add i64 %291, %292
  %scevgep446 = getelementptr i8, i8* %CC, i64 %293
  %scevgep446447 = bitcast i8* %scevgep446 to double*
  %_p_scalar_448 = load double, double* %scevgep446447, align 8, !alias.scope !60, !noalias !61
  %p_add449 = fadd double %_p_scalar_448, %p_mul21445
  store double %p_add449, double* %scevgep446447, align 8, !alias.scope !60, !noalias !61
  %294 = mul nsw i64 64, %polly.indvar140
  %295 = mul nsw i64 4, %polly.indvar172
  %296 = add nsw i64 %294, %295
  %297 = add nsw i64 %296, 3
  %298 = mul nsw i64 384, %polly.indvar118
  %299 = add nsw i64 %298, %polly.indvar178
  %300 = mul nsw i64 1024, %polly.indvar112
  %301 = mul nsw i64 4, %polly.indvar166
  %302 = add nsw i64 %300, %301
  %303 = add nsw i64 %302, 1
  br label %polly.stmt.for.body11450

polly.stmt.for.body11450:                         ; preds = %polly.stmt.for.body11429
  %polly.access.cast.Packed_A451 = bitcast [16 x [384 x [4 x double]]]* %Packed_A to double*
  %polly.access.mul.Packed_A452 = mul nsw i64 %polly.indvar172, 384
  %polly.access.add.Packed_A453 = add nsw i64 %polly.access.mul.Packed_A452, %polly.indvar178
  %polly.access.mul.Packed_A454 = mul nsw i64 %polly.access.add.Packed_A453, 4
  %polly.access.add.Packed_A455 = add nsw i64 %polly.access.mul.Packed_A454, 3
  %polly.access.Packed_A456 = getelementptr double, double* %polly.access.cast.Packed_A451, i64 %polly.access.add.Packed_A455
  %_p_scalar_457 = load double, double* %polly.access.Packed_A456, align 8
  %p_mul16458 = fmul double %_p_scalar_457, 1.500000e+00
  %polly.access.cast.Packed_B459 = bitcast [256 x [384 x [4 x double]]]* %Packed_B to double*
  %polly.access.mul.Packed_B460 = mul nsw i64 %polly.indvar166, 384
  %polly.access.add.Packed_B461 = add nsw i64 %polly.access.mul.Packed_B460, %polly.indvar178
  %polly.access.mul.Packed_B462 = mul nsw i64 %polly.access.add.Packed_B461, 4
  %polly.access.add.Packed_B463 = add nsw i64 %polly.access.mul.Packed_B462, 1
  %polly.access.Packed_B464 = getelementptr double, double* %polly.access.cast.Packed_B459, i64 %polly.access.add.Packed_B463
  %_p_scalar_465 = load double, double* %polly.access.Packed_B464, align 8
  %p_mul21466 = fmul double %p_mul16458, %_p_scalar_465
  %304 = mul i64 %297, 18400
  %305 = shl i64 %303, 3
  %306 = add i64 %304, %305
  %scevgep467 = getelementptr i8, i8* %CC, i64 %306
  %scevgep467468 = bitcast i8* %scevgep467 to double*
  %_p_scalar_469 = load double, double* %scevgep467468, align 8, !alias.scope !62, !noalias !63
  %p_add470 = fadd double %_p_scalar_469, %p_mul21466
  store double %p_add470, double* %scevgep467468, align 8, !alias.scope !62, !noalias !63
  %307 = mul nsw i64 64, %polly.indvar140
  %308 = mul nsw i64 4, %polly.indvar172
  %309 = add nsw i64 %307, %308
  %310 = add nsw i64 %309, 3
  %311 = mul nsw i64 384, %polly.indvar118
  %312 = add nsw i64 %311, %polly.indvar178
  %313 = mul nsw i64 1024, %polly.indvar112
  %314 = mul nsw i64 4, %polly.indvar166
  %315 = add nsw i64 %313, %314
  %316 = add nsw i64 %315, 2
  br label %polly.stmt.for.body11471

polly.stmt.for.body11471:                         ; preds = %polly.stmt.for.body11450
  %polly.access.cast.Packed_A472 = bitcast [16 x [384 x [4 x double]]]* %Packed_A to double*
  %polly.access.mul.Packed_A473 = mul nsw i64 %polly.indvar172, 384
  %polly.access.add.Packed_A474 = add nsw i64 %polly.access.mul.Packed_A473, %polly.indvar178
  %polly.access.mul.Packed_A475 = mul nsw i64 %polly.access.add.Packed_A474, 4
  %polly.access.add.Packed_A476 = add nsw i64 %polly.access.mul.Packed_A475, 3
  %polly.access.Packed_A477 = getelementptr double, double* %polly.access.cast.Packed_A472, i64 %polly.access.add.Packed_A476
  %_p_scalar_478 = load double, double* %polly.access.Packed_A477, align 8
  %p_mul16479 = fmul double %_p_scalar_478, 1.500000e+00
  %polly.access.cast.Packed_B480 = bitcast [256 x [384 x [4 x double]]]* %Packed_B to double*
  %polly.access.mul.Packed_B481 = mul nsw i64 %polly.indvar166, 384
  %polly.access.add.Packed_B482 = add nsw i64 %polly.access.mul.Packed_B481, %polly.indvar178
  %polly.access.mul.Packed_B483 = mul nsw i64 %polly.access.add.Packed_B482, 4
  %polly.access.add.Packed_B484 = add nsw i64 %polly.access.mul.Packed_B483, 2
  %polly.access.Packed_B485 = getelementptr double, double* %polly.access.cast.Packed_B480, i64 %polly.access.add.Packed_B484
  %_p_scalar_486 = load double, double* %polly.access.Packed_B485, align 8
  %p_mul21487 = fmul double %p_mul16479, %_p_scalar_486
  %317 = mul i64 %310, 18400
  %318 = shl i64 %316, 3
  %319 = add i64 %317, %318
  %scevgep488 = getelementptr i8, i8* %CC, i64 %319
  %scevgep488489 = bitcast i8* %scevgep488 to double*
  %_p_scalar_490 = load double, double* %scevgep488489, align 8, !alias.scope !64, !noalias !65
  %p_add491 = fadd double %_p_scalar_490, %p_mul21487
  store double %p_add491, double* %scevgep488489, align 8, !alias.scope !64, !noalias !65
  %320 = mul nsw i64 64, %polly.indvar140
  %321 = mul nsw i64 4, %polly.indvar172
  %322 = add nsw i64 %320, %321
  %323 = add nsw i64 %322, 3
  %324 = mul nsw i64 384, %polly.indvar118
  %325 = add nsw i64 %324, %polly.indvar178
  %326 = mul nsw i64 1024, %polly.indvar112
  %327 = mul nsw i64 4, %polly.indvar166
  %328 = add nsw i64 %326, %327
  %329 = add nsw i64 %328, 3
  br label %polly.stmt.for.body11492

polly.stmt.for.body11492:                         ; preds = %polly.stmt.for.body11471
  %polly.access.cast.Packed_A493 = bitcast [16 x [384 x [4 x double]]]* %Packed_A to double*
  %polly.access.mul.Packed_A494 = mul nsw i64 %polly.indvar172, 384
  %polly.access.add.Packed_A495 = add nsw i64 %polly.access.mul.Packed_A494, %polly.indvar178
  %polly.access.mul.Packed_A496 = mul nsw i64 %polly.access.add.Packed_A495, 4
  %polly.access.add.Packed_A497 = add nsw i64 %polly.access.mul.Packed_A496, 3
  %polly.access.Packed_A498 = getelementptr double, double* %polly.access.cast.Packed_A493, i64 %polly.access.add.Packed_A497
  %_p_scalar_499 = load double, double* %polly.access.Packed_A498, align 8
  %p_mul16500 = fmul double %_p_scalar_499, 1.500000e+00
  %polly.access.cast.Packed_B501 = bitcast [256 x [384 x [4 x double]]]* %Packed_B to double*
  %polly.access.mul.Packed_B502 = mul nsw i64 %polly.indvar166, 384
  %polly.access.add.Packed_B503 = add nsw i64 %polly.access.mul.Packed_B502, %polly.indvar178
  %polly.access.mul.Packed_B504 = mul nsw i64 %polly.access.add.Packed_B503, 4
  %polly.access.add.Packed_B505 = add nsw i64 %polly.access.mul.Packed_B504, 3
  %polly.access.Packed_B506 = getelementptr double, double* %polly.access.cast.Packed_B501, i64 %polly.access.add.Packed_B505
  %_p_scalar_507 = load double, double* %polly.access.Packed_B506, align 8
  %p_mul21508 = fmul double %p_mul16500, %_p_scalar_507
  %330 = mul i64 %323, 18400
  %331 = shl i64 %329, 3
  %332 = add i64 %330, %331
  %scevgep509 = getelementptr i8, i8* %CC, i64 %332
  %scevgep509510 = bitcast i8* %scevgep509 to double*
  %_p_scalar_511 = load double, double* %scevgep509510, align 8, !alias.scope !66, !noalias !67
  %p_add512 = fadd double %_p_scalar_511, %p_mul21508
  store double %p_add512, double* %scevgep509510, align 8, !alias.scope !66, !noalias !67
  %polly.indvar_next179 = add nsw i64 %polly.indvar178, 1
  %polly.loop_cond180 = icmp sle i64 %polly.indvar_next179, %132
  br i1 %polly.loop_cond180, label %polly.loop_header175, label %polly.loop_exit177

polly.loop_preheader176:                          ; preds = %polly.loop_header169
  br label %polly.loop_header175
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
!6 = !{!7, !7, i64 0}
!7 = !{!"double", !4, i64 0}
!8 = !{!9, !11}
!9 = distinct !{!9, !10, !"init_array: %C"}
!10 = distinct !{!10, !"init_array"}
!11 = distinct !{!11, !12, !"kernel_gemm: %C"}
!12 = distinct !{!12, !"kernel_gemm"}
!13 = !{!14, !15, !16, !17}
!14 = distinct !{!14, !10, !"init_array: %A"}
!15 = distinct !{!15, !10, !"init_array: %B"}
!16 = distinct !{!16, !12, !"kernel_gemm: %A"}
!17 = distinct !{!17, !12, !"kernel_gemm: %B"}
!18 = !{!14, !16}
!19 = !{!9, !15, !11, !17}
!20 = !{!15, !17}
!21 = !{!9, !14, !11, !16}
!22 = !{!11}
!23 = !{!16, !17}
!24 = !{!16}
!25 = !{!11, !17}
!26 = !{!17}
!27 = !{!11, !16}
!28 = distinct !{!28, !29, !"polly.alias.scope.MemRefAA"}
!29 = distinct !{!29, !"polly.alias.scope.domain"}
!30 = !{!31, !32, !33, !34}
!31 = distinct !{!31, !29, !"polly.alias.scope.Packed_A"}
!32 = distinct !{!32, !29, !"polly.alias.scope.MemRefmul16"}
!33 = distinct !{!33, !29, !"polly.alias.scope.MemRefCC"}
!34 = distinct !{!34, !29, !"polly.alias.scope.MemRefBB"}
!35 = !{!31, !32, !34, !28}
!36 = !{!31, !32, !33, !28}
!37 = distinct !{!37, !33, !"second level alias metadata"}
!38 = distinct !{!38, !33, !"second level alias metadata"}
!39 = !{!31, !32, !34, !28, !37}
!40 = distinct !{!40, !33, !"second level alias metadata"}
!41 = !{!31, !32, !34, !28, !37, !38}
!42 = distinct !{!42, !33, !"second level alias metadata"}
!43 = !{!31, !32, !34, !28, !37, !38, !40}
!44 = distinct !{!44, !33, !"second level alias metadata"}
!45 = !{!31, !32, !34, !28, !37, !38, !40, !42}
!46 = distinct !{!46, !33, !"second level alias metadata"}
!47 = !{!31, !32, !34, !28, !37, !38, !40, !42, !44}
!48 = distinct !{!48, !33, !"second level alias metadata"}
!49 = !{!31, !32, !34, !28, !37, !38, !40, !42, !44, !46}
!50 = distinct !{!50, !33, !"second level alias metadata"}
!51 = !{!31, !32, !34, !28, !37, !38, !40, !42, !44, !46, !48}
!52 = distinct !{!52, !33, !"second level alias metadata"}
!53 = !{!31, !32, !34, !28, !37, !38, !40, !42, !44, !46, !48, !50}
!54 = distinct !{!54, !33, !"second level alias metadata"}
!55 = !{!31, !32, !34, !28, !37, !38, !40, !42, !44, !46, !48, !50, !52}
!56 = distinct !{!56, !33, !"second level alias metadata"}
!57 = !{!31, !32, !34, !28, !37, !38, !40, !42, !44, !46, !48, !50, !52, !54}
!58 = distinct !{!58, !33, !"second level alias metadata"}
!59 = !{!31, !32, !34, !28, !37, !38, !40, !42, !44, !46, !48, !50, !52, !54, !56}
!60 = distinct !{!60, !33, !"second level alias metadata"}
!61 = !{!31, !32, !34, !28, !37, !38, !40, !42, !44, !46, !48, !50, !52, !54, !56, !58}
!62 = distinct !{!62, !33, !"second level alias metadata"}
!63 = !{!31, !32, !34, !28, !37, !38, !40, !42, !44, !46, !48, !50, !52, !54, !56, !58, !60}
!64 = distinct !{!64, !33, !"second level alias metadata"}
!65 = !{!31, !32, !34, !28, !37, !38, !40, !42, !44, !46, !48, !50, !52, !54, !56, !58, !60, !62}
!66 = distinct !{!66, !33, !"second level alias metadata"}
!67 = !{!31, !32, !34, !28, !37, !38, !40, !42, !44, !46, !48, !50, !52, !54, !56, !58, !60, !62, !64}
