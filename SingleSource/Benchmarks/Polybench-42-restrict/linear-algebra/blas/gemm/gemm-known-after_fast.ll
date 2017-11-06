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
  br label %entry.split

entry.split:                                      ; preds = %entry
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
  %arrayidx6 = getelementptr inbounds [2300 x double], [2300 x double]* %C, i64 %indvars.iv24, i64 %indvars.iv19
  store double %div, double* %arrayidx6, align 8, !tbaa !6, !alias.scope !8, !noalias !11
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next20, 2300
  br i1 %exitcond23, label %for.inc7, label %for.body32

for.inc7:                                         ; preds = %for.body32
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next25, 2000
  br i1 %exitcond26, label %for.cond14.preheader, label %for.cond1.preheader

for.cond14.preheader:                             ; preds = %for.inc7, %for.inc31
  %indvars.iv16 = phi i64 [ %indvars.iv.next17, %for.inc31 ], [ 0, %for.inc7 ]
  br label %for.body17

for.body17:                                       ; preds = %for.body17, %for.cond14.preheader
  %indvars.iv12 = phi i64 [ 0, %for.cond14.preheader ], [ %indvars.iv.next13, %for.body17 ]
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %3 = mul nuw nsw i64 %indvars.iv.next13, %indvars.iv16
  %4 = trunc i64 %3 to i32
  %rem20 = srem i32 %4, 2600
  %conv21 = sitofp i32 %rem20 to double
  %div23 = fdiv double %conv21, 2.600000e+03
  %arrayidx27 = getelementptr inbounds [2600 x double], [2600 x double]* %A, i64 %indvars.iv16, i64 %indvars.iv12
  store double %div23, double* %arrayidx27, align 8, !tbaa !6, !alias.scope !14, !noalias !15
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
  %arrayidx51 = getelementptr inbounds [2300 x double], [2300 x double]* %B, i64 %indvars.iv9, i64 %indvars.iv
  store double %div47, double* %arrayidx51, align 8, !tbaa !6, !alias.scope !16, !noalias !17
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
  %arrayidx5 = getelementptr inbounds [2300 x double], [2300 x double]* %C, i64 %indvars.iv17, i64 %indvars.iv8
  %8 = load double, double* %arrayidx5, align 8, !tbaa !6
  %mul = fmul double %8, 1.200000e+00
  store double %mul, double* %arrayidx5, align 8, !tbaa !6
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next9, 2300
  br i1 %exitcond10, label %for.cond9.preheader, label %for.body3

for.cond9.preheader:                              ; preds = %for.body3, %for.inc29
  %indvars.iv14 = phi i64 [ %indvars.iv.next15, %for.inc29 ], [ 0, %for.body3 ]
  %arrayidx15 = getelementptr inbounds [2600 x double], [2600 x double]* %A, i64 %indvars.iv17, i64 %indvars.iv14
  %9 = load double, double* %arrayidx15, align 8, !tbaa !6
  %mul16 = fmul double %9, 1.500000e+00
  br label %for.body11

for.body11:                                       ; preds = %for.body11, %for.cond9.preheader
  %indvars.iv11 = phi i64 [ 0, %for.cond9.preheader ], [ %indvars.iv.next12, %for.body11 ]
  %arrayidx20 = getelementptr inbounds [2300 x double], [2300 x double]* %B, i64 %indvars.iv14, i64 %indvars.iv11
  %10 = load double, double* %arrayidx20, align 8, !tbaa !6
  %mul21 = fmul double %mul16, %10
  %arrayidx25 = getelementptr inbounds [2300 x double], [2300 x double]* %C, i64 %indvars.iv17, i64 %indvars.iv11
  %11 = load double, double* %arrayidx25, align 8, !tbaa !6
  %add = fadd double %11, %mul21
  store double %add, double* %arrayidx25, align 8, !tbaa !6
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
  br label %for.end34

for.end34:                                        ; preds = %polly.merge_new_and_old
  ret void

polly.start:                                      ; preds = %polly.split_new_and_old
  br label %polly.loop_preheader

polly.loop_exit:                                  ; preds = %polly.loop_exit22
  br label %polly.loop_preheader39

polly.loop_exit40:                                ; preds = %polly.loop_exit46
  br label %polly.loop_preheader64

polly.loop_exit65:                                ; preds = %polly.loop_exit71
  br label %polly.loop_preheader89

polly.loop_exit90:                                ; preds = %polly.loop_exit96
  br label %polly.loop_preheader114

polly.loop_exit115:                               ; preds = %polly.loop_exit121
  br label %polly.exiting

polly.exiting:                                    ; preds = %polly.loop_exit115
  br label %polly.merge_new_and_old

polly.loop_header:                                ; preds = %polly.loop_exit22, %polly.loop_preheader
  %polly.indvar = phi i64 [ 0, %polly.loop_preheader ], [ %polly.indvar_next, %polly.loop_exit22 ]
  br label %polly.loop_preheader21

polly.loop_exit22:                                ; preds = %polly.loop_exit28
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp sle i64 %polly.indvar_next, 62
  br i1 %polly.loop_cond, label %polly.loop_header, label %polly.loop_exit

polly.loop_preheader:                             ; preds = %polly.start
  br label %polly.loop_header

polly.loop_header20:                              ; preds = %polly.loop_exit28, %polly.loop_preheader21
  %polly.indvar23 = phi i64 [ 0, %polly.loop_preheader21 ], [ %polly.indvar_next24, %polly.loop_exit28 ]
  %12 = mul nsw i64 -32, %polly.indvar
  %13 = add nsw i64 %12, 1999
  %14 = icmp slt i64 31, %13
  %15 = select i1 %14, i64 31, i64 %13
  br label %polly.loop_preheader27

polly.loop_exit28:                                ; preds = %polly.loop_exit34
  %polly.indvar_next24 = add nsw i64 %polly.indvar23, 1
  %polly.loop_cond25 = icmp sle i64 %polly.indvar_next24, 81
  br i1 %polly.loop_cond25, label %polly.loop_header20, label %polly.loop_exit22

polly.loop_preheader21:                           ; preds = %polly.loop_header
  br label %polly.loop_header20

polly.loop_header26:                              ; preds = %polly.loop_exit34, %polly.loop_preheader27
  %polly.indvar29 = phi i64 [ 0, %polly.loop_preheader27 ], [ %polly.indvar_next30, %polly.loop_exit34 ]
  %16 = mul nsw i64 -32, %polly.indvar23
  %17 = add nsw i64 %16, 2599
  %18 = icmp slt i64 31, %17
  %19 = select i1 %18, i64 31, i64 %17
  br label %polly.loop_preheader33

polly.loop_exit34:                                ; preds = %polly.stmt.for.body17
  %polly.indvar_next30 = add nsw i64 %polly.indvar29, 1
  %polly.loop_cond31 = icmp sle i64 %polly.indvar_next30, %15
  br i1 %polly.loop_cond31, label %polly.loop_header26, label %polly.loop_exit28

polly.loop_preheader27:                           ; preds = %polly.loop_header20
  br label %polly.loop_header26

polly.loop_header32:                              ; preds = %polly.stmt.for.body17, %polly.loop_preheader33
  %polly.indvar35 = phi i64 [ 0, %polly.loop_preheader33 ], [ %polly.indvar_next36, %polly.stmt.for.body17 ]
  %20 = mul nsw i64 32, %polly.indvar
  %21 = add nsw i64 %20, %polly.indvar29
  %22 = mul nsw i64 32, %polly.indvar23
  %23 = add nsw i64 %22, %polly.indvar35
  br label %polly.stmt.for.body17

polly.stmt.for.body17:                            ; preds = %polly.loop_header32
  %24 = trunc i64 %23 to i32
  %25 = add i32 %24, 1
  %26 = trunc i64 %21 to i32
  %27 = mul i32 %25, %26
  %p_rem20 = srem i32 %27, 2600
  %p_conv21 = sitofp i32 %p_rem20 to double
  %p_div23 = fdiv double %p_conv21, 2.600000e+03
  %scevgep = getelementptr [2600 x double], [2600 x double]* %A, i64 %21, i64 %23
  store double %p_div23, double* %scevgep, align 8, !alias.scope !18, !noalias !20
  %polly.indvar_next36 = add nsw i64 %polly.indvar35, 1
  %polly.loop_cond37 = icmp sle i64 %polly.indvar_next36, %19
  br i1 %polly.loop_cond37, label %polly.loop_header32, label %polly.loop_exit34

polly.loop_preheader33:                           ; preds = %polly.loop_header26
  br label %polly.loop_header32

polly.loop_header38:                              ; preds = %polly.loop_exit46, %polly.loop_preheader39
  %polly.indvar41 = phi i64 [ 0, %polly.loop_preheader39 ], [ %polly.indvar_next42, %polly.loop_exit46 ]
  br label %polly.loop_preheader45

polly.loop_exit46:                                ; preds = %polly.loop_exit52
  %polly.indvar_next42 = add nsw i64 %polly.indvar41, 1
  %polly.loop_cond43 = icmp sle i64 %polly.indvar_next42, 62
  br i1 %polly.loop_cond43, label %polly.loop_header38, label %polly.loop_exit40

polly.loop_preheader39:                           ; preds = %polly.loop_exit
  br label %polly.loop_header38

polly.loop_header44:                              ; preds = %polly.loop_exit52, %polly.loop_preheader45
  %polly.indvar47 = phi i64 [ 0, %polly.loop_preheader45 ], [ %polly.indvar_next48, %polly.loop_exit52 ]
  %28 = mul nsw i64 -32, %polly.indvar41
  %29 = add nsw i64 %28, 1999
  %30 = icmp slt i64 31, %29
  %31 = select i1 %30, i64 31, i64 %29
  br label %polly.loop_preheader51

polly.loop_exit52:                                ; preds = %polly.loop_exit58
  %polly.indvar_next48 = add nsw i64 %polly.indvar47, 1
  %polly.loop_cond49 = icmp sle i64 %polly.indvar_next48, 71
  br i1 %polly.loop_cond49, label %polly.loop_header44, label %polly.loop_exit46

polly.loop_preheader45:                           ; preds = %polly.loop_header38
  br label %polly.loop_header44

polly.loop_header50:                              ; preds = %polly.loop_exit58, %polly.loop_preheader51
  %polly.indvar53 = phi i64 [ 0, %polly.loop_preheader51 ], [ %polly.indvar_next54, %polly.loop_exit58 ]
  %32 = mul nsw i64 -32, %polly.indvar47
  %33 = add nsw i64 %32, 2299
  %34 = icmp slt i64 31, %33
  %35 = select i1 %34, i64 31, i64 %33
  br label %polly.loop_preheader57

polly.loop_exit58:                                ; preds = %polly.stmt.for.body32
  %polly.indvar_next54 = add nsw i64 %polly.indvar53, 1
  %polly.loop_cond55 = icmp sle i64 %polly.indvar_next54, %31
  br i1 %polly.loop_cond55, label %polly.loop_header50, label %polly.loop_exit52

polly.loop_preheader51:                           ; preds = %polly.loop_header44
  br label %polly.loop_header50

polly.loop_header56:                              ; preds = %polly.stmt.for.body32, %polly.loop_preheader57
  %polly.indvar59 = phi i64 [ 0, %polly.loop_preheader57 ], [ %polly.indvar_next60, %polly.stmt.for.body32 ]
  %36 = mul nsw i64 32, %polly.indvar41
  %37 = add nsw i64 %36, %polly.indvar53
  %38 = mul nsw i64 32, %polly.indvar47
  %39 = add nsw i64 %38, %polly.indvar59
  br label %polly.stmt.for.body32

polly.stmt.for.body32:                            ; preds = %polly.loop_header56
  %40 = trunc i64 %39 to i32
  %41 = trunc i64 %37 to i32
  %42 = mul i32 %40, %41
  %43 = add i32 %42, 1
  %p_rem = srem i32 %43, 2000
  %p_conv = sitofp i32 %p_rem to double
  %p_div = fdiv double %p_conv, 2.000000e+03
  %scevgep62 = getelementptr [2300 x double], [2300 x double]* %C, i64 %37, i64 %39
  store double %p_div, double* %scevgep62, align 8, !alias.scope !24, !noalias !25
  %polly.indvar_next60 = add nsw i64 %polly.indvar59, 1
  %polly.loop_cond61 = icmp sle i64 %polly.indvar_next60, %35
  br i1 %polly.loop_cond61, label %polly.loop_header56, label %polly.loop_exit58

polly.loop_preheader57:                           ; preds = %polly.loop_header50
  br label %polly.loop_header56

polly.loop_header63:                              ; preds = %polly.loop_exit71, %polly.loop_preheader64
  %polly.indvar66 = phi i64 [ 0, %polly.loop_preheader64 ], [ %polly.indvar_next67, %polly.loop_exit71 ]
  br label %polly.loop_preheader70

polly.loop_exit71:                                ; preds = %polly.loop_exit77
  %polly.indvar_next67 = add nsw i64 %polly.indvar66, 1
  %polly.loop_cond68 = icmp sle i64 %polly.indvar_next67, 81
  br i1 %polly.loop_cond68, label %polly.loop_header63, label %polly.loop_exit65

polly.loop_preheader64:                           ; preds = %polly.loop_exit40
  br label %polly.loop_header63

polly.loop_header69:                              ; preds = %polly.loop_exit77, %polly.loop_preheader70
  %polly.indvar72 = phi i64 [ 0, %polly.loop_preheader70 ], [ %polly.indvar_next73, %polly.loop_exit77 ]
  %44 = mul nsw i64 -32, %polly.indvar66
  %45 = add nsw i64 %44, 2599
  %46 = icmp slt i64 31, %45
  %47 = select i1 %46, i64 31, i64 %45
  br label %polly.loop_preheader76

polly.loop_exit77:                                ; preds = %polly.loop_exit83
  %polly.indvar_next73 = add nsw i64 %polly.indvar72, 1
  %polly.loop_cond74 = icmp sle i64 %polly.indvar_next73, 71
  br i1 %polly.loop_cond74, label %polly.loop_header69, label %polly.loop_exit71

polly.loop_preheader70:                           ; preds = %polly.loop_header63
  br label %polly.loop_header69

polly.loop_header75:                              ; preds = %polly.loop_exit83, %polly.loop_preheader76
  %polly.indvar78 = phi i64 [ 0, %polly.loop_preheader76 ], [ %polly.indvar_next79, %polly.loop_exit83 ]
  %48 = mul nsw i64 -32, %polly.indvar72
  %49 = add nsw i64 %48, 2299
  %50 = icmp slt i64 31, %49
  %51 = select i1 %50, i64 31, i64 %49
  br label %polly.loop_preheader82

polly.loop_exit83:                                ; preds = %polly.stmt.for.body41
  %polly.indvar_next79 = add nsw i64 %polly.indvar78, 1
  %polly.loop_cond80 = icmp sle i64 %polly.indvar_next79, %47
  br i1 %polly.loop_cond80, label %polly.loop_header75, label %polly.loop_exit77

polly.loop_preheader76:                           ; preds = %polly.loop_header69
  br label %polly.loop_header75

polly.loop_header81:                              ; preds = %polly.stmt.for.body41, %polly.loop_preheader82
  %polly.indvar84 = phi i64 [ 0, %polly.loop_preheader82 ], [ %polly.indvar_next85, %polly.stmt.for.body41 ]
  %52 = mul nsw i64 32, %polly.indvar66
  %53 = add nsw i64 %52, %polly.indvar78
  %54 = mul nsw i64 32, %polly.indvar72
  %55 = add nsw i64 %54, %polly.indvar84
  br label %polly.stmt.for.body41

polly.stmt.for.body41:                            ; preds = %polly.loop_header81
  %56 = trunc i64 %55 to i32
  %57 = add i32 %56, 2
  %58 = trunc i64 %53 to i32
  %59 = mul i32 %57, %58
  %p_rem44 = srem i32 %59, 2300
  %p_conv45 = sitofp i32 %p_rem44 to double
  %p_div47 = fdiv double %p_conv45, 2.300000e+03
  %scevgep87 = getelementptr [2300 x double], [2300 x double]* %B, i64 %53, i64 %55
  store double %p_div47, double* %scevgep87, align 8, !alias.scope !22, !noalias !26
  %polly.indvar_next85 = add nsw i64 %polly.indvar84, 1
  %polly.loop_cond86 = icmp sle i64 %polly.indvar_next85, %51
  br i1 %polly.loop_cond86, label %polly.loop_header81, label %polly.loop_exit83

polly.loop_preheader82:                           ; preds = %polly.loop_header75
  br label %polly.loop_header81

polly.loop_header88:                              ; preds = %polly.loop_exit96, %polly.loop_preheader89
  %polly.indvar91 = phi i64 [ 0, %polly.loop_preheader89 ], [ %polly.indvar_next92, %polly.loop_exit96 ]
  br label %polly.loop_preheader95

polly.loop_exit96:                                ; preds = %polly.loop_exit102
  %polly.indvar_next92 = add nsw i64 %polly.indvar91, 1
  %polly.loop_cond93 = icmp sle i64 %polly.indvar_next92, 62
  br i1 %polly.loop_cond93, label %polly.loop_header88, label %polly.loop_exit90

polly.loop_preheader89:                           ; preds = %polly.loop_exit65
  br label %polly.loop_header88

polly.loop_header94:                              ; preds = %polly.loop_exit102, %polly.loop_preheader95
  %polly.indvar97 = phi i64 [ 0, %polly.loop_preheader95 ], [ %polly.indvar_next98, %polly.loop_exit102 ]
  %60 = mul nsw i64 -32, %polly.indvar91
  %61 = add nsw i64 %60, 1999
  %62 = icmp slt i64 31, %61
  %63 = select i1 %62, i64 31, i64 %61
  br label %polly.loop_preheader101

polly.loop_exit102:                               ; preds = %polly.loop_exit108
  %polly.indvar_next98 = add nsw i64 %polly.indvar97, 1
  %polly.loop_cond99 = icmp sle i64 %polly.indvar_next98, 71
  br i1 %polly.loop_cond99, label %polly.loop_header94, label %polly.loop_exit96

polly.loop_preheader95:                           ; preds = %polly.loop_header88
  br label %polly.loop_header94

polly.loop_header100:                             ; preds = %polly.loop_exit108, %polly.loop_preheader101
  %polly.indvar103 = phi i64 [ 0, %polly.loop_preheader101 ], [ %polly.indvar_next104, %polly.loop_exit108 ]
  %64 = mul nsw i64 -32, %polly.indvar97
  %65 = add nsw i64 %64, 2299
  %66 = icmp slt i64 31, %65
  %67 = select i1 %66, i64 31, i64 %65
  br label %polly.loop_preheader107

polly.loop_exit108:                               ; preds = %polly.stmt.for.body3
  %polly.indvar_next104 = add nsw i64 %polly.indvar103, 1
  %polly.loop_cond105 = icmp sle i64 %polly.indvar_next104, %63
  br i1 %polly.loop_cond105, label %polly.loop_header100, label %polly.loop_exit102

polly.loop_preheader101:                          ; preds = %polly.loop_header94
  br label %polly.loop_header100

polly.loop_header106:                             ; preds = %polly.stmt.for.body3, %polly.loop_preheader107
  %polly.indvar109 = phi i64 [ 0, %polly.loop_preheader107 ], [ %polly.indvar_next110, %polly.stmt.for.body3 ]
  %68 = mul nsw i64 32, %polly.indvar91
  %69 = add nsw i64 %68, %polly.indvar103
  %70 = mul nsw i64 32, %polly.indvar97
  %71 = add nsw i64 %70, %polly.indvar109
  br label %polly.stmt.for.body3

polly.stmt.for.body3:                             ; preds = %polly.loop_header106
  %scevgep112 = getelementptr [2300 x double], [2300 x double]* %C, i64 %69, i64 %71
  %_p_scalar_ = load double, double* %scevgep112, align 8, !alias.scope !24, !noalias !25
  %p_mul = fmul double %_p_scalar_, 1.200000e+00
  store double %p_mul, double* %scevgep112, align 8, !alias.scope !24, !noalias !25
  %polly.indvar_next110 = add nsw i64 %polly.indvar109, 1
  %polly.loop_cond111 = icmp sle i64 %polly.indvar_next110, %67
  br i1 %polly.loop_cond111, label %polly.loop_header106, label %polly.loop_exit108

polly.loop_preheader107:                          ; preds = %polly.loop_header100
  br label %polly.loop_header106

polly.loop_header113:                             ; preds = %polly.loop_exit121, %polly.loop_preheader114
  %polly.indvar116 = phi i64 [ 0, %polly.loop_preheader114 ], [ %polly.indvar_next117, %polly.loop_exit121 ]
  br label %polly.loop_preheader120

polly.loop_exit121:                               ; preds = %polly.loop_exit143
  %polly.indvar_next117 = add nsw i64 %polly.indvar116, 1
  %polly.loop_cond118 = icmp sle i64 %polly.indvar_next117, 2
  br i1 %polly.loop_cond118, label %polly.loop_header113, label %polly.loop_exit115

polly.loop_preheader114:                          ; preds = %polly.loop_exit90
  br label %polly.loop_header113

polly.loop_header119:                             ; preds = %polly.loop_exit143, %polly.loop_preheader120
  %polly.indvar122 = phi i64 [ 0, %polly.loop_preheader120 ], [ %polly.indvar_next123, %polly.loop_exit143 ]
  %72 = mul nsw i64 384, %polly.indvar122
  %73 = mul nsw i64 384, %polly.indvar122
  %74 = add nsw i64 %73, 383
  %75 = icmp slt i64 2599, %74
  %76 = select i1 %75, i64 2599, i64 %74
  br label %polly.loop_if

polly.loop_exit127:                               ; preds = %polly.loop_exit134, %polly.loop_if
  br label %polly.loop_preheader142

polly.loop_exit143:                               ; preds = %polly.loop_exit169
  %polly.indvar_next123 = add nsw i64 %polly.indvar122, 1
  %polly.loop_cond124 = icmp sle i64 %polly.indvar_next123, 6
  br i1 %polly.loop_cond124, label %polly.loop_header119, label %polly.loop_exit121

polly.loop_preheader120:                          ; preds = %polly.loop_header113
  br label %polly.loop_header119

polly.loop_if:                                    ; preds = %polly.loop_header119
  %polly.loop_guard = icmp sle i64 %72, %76
  br i1 %polly.loop_guard, label %polly.loop_preheader126, label %polly.loop_exit127

polly.loop_header125:                             ; preds = %polly.loop_exit134, %polly.loop_preheader126
  %polly.indvar128 = phi i64 [ %72, %polly.loop_preheader126 ], [ %polly.indvar_next129, %polly.loop_exit134 ]
  %77 = mul nsw i64 1024, %polly.indvar116
  %78 = mul nsw i64 1024, %polly.indvar116
  %79 = add nsw i64 %78, 1023
  %80 = icmp slt i64 2299, %79
  %81 = select i1 %80, i64 2299, i64 %79
  br label %polly.loop_if131

polly.loop_exit134:                               ; preds = %polly.loop_header132, %polly.loop_if131
  %polly.indvar_next129 = add nsw i64 %polly.indvar128, 1
  %polly.loop_cond130 = icmp sle i64 %polly.indvar_next129, %76
  br i1 %polly.loop_cond130, label %polly.loop_header125, label %polly.loop_exit127

polly.loop_preheader126:                          ; preds = %polly.loop_if
  br label %polly.loop_header125

polly.loop_if131:                                 ; preds = %polly.loop_header125
  %polly.loop_guard135 = icmp sle i64 %77, %81
  br i1 %polly.loop_guard135, label %polly.loop_preheader133, label %polly.loop_exit134

polly.loop_header132:                             ; preds = %polly.loop_header132, %polly.loop_preheader133
  %polly.indvar136 = phi i64 [ %77, %polly.loop_preheader133 ], [ %polly.indvar_next137, %polly.loop_header132 ]
  %polly.access.cast.B = bitcast [2300 x double]* %B to double*
  %polly.access.mul.B = mul nsw i64 %polly.indvar128, 2300
  %polly.access.add.B = add nsw i64 %polly.access.mul.B, %polly.indvar136
  %polly.access.B = getelementptr double, double* %polly.access.cast.B, i64 %polly.access.add.B
  %polly.access.B.load = load double, double* %polly.access.B, !alias.scope !22, !noalias !26
  %polly.access.cast.Packed_B = bitcast [256 x [384 x [4 x double]]]* %Packed_B to double*
  %82 = mul nsw i64 -256, %polly.indvar116
  %pexp.p_div_q = udiv i64 %polly.indvar136, 4
  %83 = add nsw i64 %82, %pexp.p_div_q
  %polly.access.mul.Packed_B = mul nsw i64 %83, 384
  %84 = mul nsw i64 -384, %polly.indvar122
  %85 = add nsw i64 %84, %polly.indvar128
  %polly.access.add.Packed_B = add nsw i64 %polly.access.mul.Packed_B, %85
  %polly.access.mul.Packed_B139 = mul nsw i64 %polly.access.add.Packed_B, 4
  %86 = sub nsw i64 0, %polly.indvar136
  %87 = add nsw i64 %86, 2299
  %pexp.pdiv_r = urem i64 %87, 4
  %88 = sub nsw i64 0, %pexp.pdiv_r
  %89 = add nsw i64 %88, 3
  %polly.access.add.Packed_B140 = add nsw i64 %polly.access.mul.Packed_B139, %89
  %polly.access.Packed_B = getelementptr double, double* %polly.access.cast.Packed_B, i64 %polly.access.add.Packed_B140
  store double %polly.access.B.load, double* %polly.access.Packed_B
  %polly.indvar_next137 = add nsw i64 %polly.indvar136, 1
  %polly.loop_cond138 = icmp sle i64 %polly.indvar_next137, %81
  br i1 %polly.loop_cond138, label %polly.loop_header132, label %polly.loop_exit134

polly.loop_preheader133:                          ; preds = %polly.loop_if131
  br label %polly.loop_header132

polly.loop_header141:                             ; preds = %polly.loop_exit169, %polly.loop_preheader142
  %polly.indvar144 = phi i64 [ 0, %polly.loop_preheader142 ], [ %polly.indvar_next145, %polly.loop_exit169 ]
  br label %polly.cond

polly.cond:                                       ; preds = %polly.loop_header141
  %90 = icmp eq i64 %polly.indvar116, 0
  br i1 %90, label %polly.then, label %polly.else

polly.merge:                                      ; preds = %polly.else, %polly.loop_exit150
  %91 = mul nsw i64 -256, %polly.indvar116
  %92 = add nsw i64 %91, 574
  %93 = icmp slt i64 255, %92
  %94 = select i1 %93, i64 255, i64 %92
  br label %polly.loop_preheader168

polly.loop_exit169:                               ; preds = %polly.loop_exit175
  %polly.indvar_next145 = add nsw i64 %polly.indvar144, 1
  %polly.loop_cond146 = icmp sle i64 %polly.indvar_next145, 31
  br i1 %polly.loop_cond146, label %polly.loop_header141, label %polly.loop_exit143

polly.loop_preheader142:                          ; preds = %polly.loop_exit127
  br label %polly.loop_header141

polly.then:                                       ; preds = %polly.cond
  %95 = mul nsw i64 64, %polly.indvar144
  %96 = mul nsw i64 64, %polly.indvar144
  %97 = add nsw i64 %96, 63
  %98 = icmp slt i64 1999, %97
  %99 = select i1 %98, i64 1999, i64 %97
  br label %polly.loop_if147

polly.loop_exit150:                               ; preds = %polly.loop_exit158, %polly.loop_if147
  br label %polly.merge

polly.else:                                       ; preds = %polly.cond
  br label %polly.merge

polly.loop_if147:                                 ; preds = %polly.then
  %polly.loop_guard151 = icmp sle i64 %95, %99
  br i1 %polly.loop_guard151, label %polly.loop_preheader149, label %polly.loop_exit150

polly.loop_header148:                             ; preds = %polly.loop_exit158, %polly.loop_preheader149
  %polly.indvar152 = phi i64 [ %95, %polly.loop_preheader149 ], [ %polly.indvar_next153, %polly.loop_exit158 ]
  %100 = mul nsw i64 384, %polly.indvar122
  %101 = mul nsw i64 384, %polly.indvar122
  %102 = add nsw i64 %101, 383
  %103 = icmp slt i64 2599, %102
  %104 = select i1 %103, i64 2599, i64 %102
  br label %polly.loop_if155

polly.loop_exit158:                               ; preds = %polly.loop_header156, %polly.loop_if155
  %polly.indvar_next153 = add nsw i64 %polly.indvar152, 1
  %polly.loop_cond154 = icmp sle i64 %polly.indvar_next153, %99
  br i1 %polly.loop_cond154, label %polly.loop_header148, label %polly.loop_exit150

polly.loop_preheader149:                          ; preds = %polly.loop_if147
  br label %polly.loop_header148

polly.loop_if155:                                 ; preds = %polly.loop_header148
  %polly.loop_guard159 = icmp sle i64 %100, %104
  br i1 %polly.loop_guard159, label %polly.loop_preheader157, label %polly.loop_exit158

polly.loop_header156:                             ; preds = %polly.loop_header156, %polly.loop_preheader157
  %polly.indvar160 = phi i64 [ %100, %polly.loop_preheader157 ], [ %polly.indvar_next161, %polly.loop_header156 ]
  %polly.access.cast.A = bitcast [2600 x double]* %A to double*
  %polly.access.mul.A = mul nsw i64 %polly.indvar152, 2600
  %polly.access.add.A = add nsw i64 %polly.access.mul.A, %polly.indvar160
  %polly.access.A = getelementptr double, double* %polly.access.cast.A, i64 %polly.access.add.A
  %polly.access.A.load = load double, double* %polly.access.A, !alias.scope !18, !noalias !20
  %polly.access.cast.Packed_A = bitcast [16 x [384 x [4 x double]]]* %Packed_A to double*
  %105 = mul nsw i64 -16, %polly.indvar144
  %pexp.p_div_q163 = udiv i64 %polly.indvar152, 4
  %106 = add nsw i64 %105, %pexp.p_div_q163
  %polly.access.mul.Packed_A = mul nsw i64 %106, 384
  %107 = mul nsw i64 -384, %polly.indvar122
  %108 = add nsw i64 %107, %polly.indvar160
  %polly.access.add.Packed_A = add nsw i64 %polly.access.mul.Packed_A, %108
  %polly.access.mul.Packed_A164 = mul nsw i64 %polly.access.add.Packed_A, 4
  %109 = sub nsw i64 0, %polly.indvar152
  %110 = add nsw i64 %109, 1999
  %pexp.pdiv_r165 = urem i64 %110, 4
  %111 = sub nsw i64 0, %pexp.pdiv_r165
  %112 = add nsw i64 %111, 3
  %polly.access.add.Packed_A166 = add nsw i64 %polly.access.mul.Packed_A164, %112
  %polly.access.Packed_A = getelementptr double, double* %polly.access.cast.Packed_A, i64 %polly.access.add.Packed_A166
  store double %polly.access.A.load, double* %polly.access.Packed_A
  %polly.indvar_next161 = add nsw i64 %polly.indvar160, 1
  %polly.loop_cond162 = icmp sle i64 %polly.indvar_next161, %104
  br i1 %polly.loop_cond162, label %polly.loop_header156, label %polly.loop_exit158

polly.loop_preheader157:                          ; preds = %polly.loop_if155
  br label %polly.loop_header156

polly.loop_header167:                             ; preds = %polly.loop_exit175, %polly.loop_preheader168
  %polly.indvar170 = phi i64 [ 0, %polly.loop_preheader168 ], [ %polly.indvar_next171, %polly.loop_exit175 ]
  %113 = mul nsw i64 -16, %polly.indvar144
  %114 = add nsw i64 %113, 499
  %115 = icmp slt i64 15, %114
  %116 = select i1 %115, i64 15, i64 %114
  br label %polly.loop_preheader174

polly.loop_exit175:                               ; preds = %polly.loop_exit181
  %polly.indvar_next171 = add nsw i64 %polly.indvar170, 1
  %polly.loop_cond172 = icmp sle i64 %polly.indvar_next171, %94
  br i1 %polly.loop_cond172, label %polly.loop_header167, label %polly.loop_exit169

polly.loop_preheader168:                          ; preds = %polly.merge
  br label %polly.loop_header167

polly.loop_header173:                             ; preds = %polly.loop_exit181, %polly.loop_preheader174
  %polly.indvar176 = phi i64 [ 0, %polly.loop_preheader174 ], [ %polly.indvar_next177, %polly.loop_exit181 ]
  %117 = mul nsw i64 -384, %polly.indvar122
  %118 = add nsw i64 %117, 2599
  %119 = icmp slt i64 383, %118
  %120 = select i1 %119, i64 383, i64 %118
  br label %polly.loop_preheader180

polly.loop_exit181:                               ; preds = %polly.stmt.for.body11481
  %polly.indvar_next177 = add nsw i64 %polly.indvar176, 1
  %polly.loop_cond178 = icmp sle i64 %polly.indvar_next177, %116
  br i1 %polly.loop_cond178, label %polly.loop_header173, label %polly.loop_exit175

polly.loop_preheader174:                          ; preds = %polly.loop_header167
  br label %polly.loop_header173

polly.loop_header179:                             ; preds = %polly.stmt.for.body11481, %polly.loop_preheader180
  %polly.indvar182 = phi i64 [ 0, %polly.loop_preheader180 ], [ %polly.indvar_next183, %polly.stmt.for.body11481 ]
  %121 = mul nsw i64 64, %polly.indvar144
  %122 = mul nsw i64 4, %polly.indvar176
  %123 = add nsw i64 %121, %122
  %124 = mul nsw i64 384, %polly.indvar122
  %125 = add nsw i64 %124, %polly.indvar182
  %126 = mul nsw i64 1024, %polly.indvar116
  %127 = mul nsw i64 4, %polly.indvar170
  %128 = add nsw i64 %126, %127
  br label %polly.stmt.for.body11

polly.stmt.for.body11:                            ; preds = %polly.loop_header179
  %polly.access.cast.Packed_A185 = bitcast [16 x [384 x [4 x double]]]* %Packed_A to double*
  %polly.access.mul.Packed_A186 = mul nsw i64 %polly.indvar176, 384
  %polly.access.add.Packed_A187 = add nsw i64 %polly.access.mul.Packed_A186, %polly.indvar182
  %polly.access.mul.Packed_A188 = mul nsw i64 %polly.access.add.Packed_A187, 4
  %polly.access.add.Packed_A189 = add nsw i64 %polly.access.mul.Packed_A188, 0
  %polly.access.Packed_A190 = getelementptr double, double* %polly.access.cast.Packed_A185, i64 %polly.access.add.Packed_A189
  %_p_scalar_191 = load double, double* %polly.access.Packed_A190, align 8
  %p_mul16 = fmul double %_p_scalar_191, 1.500000e+00
  %polly.access.cast.Packed_B192 = bitcast [256 x [384 x [4 x double]]]* %Packed_B to double*
  %polly.access.mul.Packed_B193 = mul nsw i64 %polly.indvar170, 384
  %polly.access.add.Packed_B194 = add nsw i64 %polly.access.mul.Packed_B193, %polly.indvar182
  %polly.access.mul.Packed_B195 = mul nsw i64 %polly.access.add.Packed_B194, 4
  %polly.access.add.Packed_B196 = add nsw i64 %polly.access.mul.Packed_B195, 0
  %polly.access.Packed_B197 = getelementptr double, double* %polly.access.cast.Packed_B192, i64 %polly.access.add.Packed_B196
  %_p_scalar_198 = load double, double* %polly.access.Packed_B197, align 8
  %p_mul21 = fmul double %p_mul16, %_p_scalar_198
  %scevgep199 = getelementptr [2300 x double], [2300 x double]* %C, i64 %123, i64 %128
  %_p_scalar_200 = load double, double* %scevgep199, align 8, !alias.scope !27, !noalias !25
  %p_add = fadd double %_p_scalar_200, %p_mul21
  store double %p_add, double* %scevgep199, align 8, !alias.scope !27, !noalias !25
  %129 = mul nsw i64 64, %polly.indvar144
  %130 = mul nsw i64 4, %polly.indvar176
  %131 = add nsw i64 %129, %130
  %132 = mul nsw i64 384, %polly.indvar122
  %133 = add nsw i64 %132, %polly.indvar182
  %134 = mul nsw i64 1024, %polly.indvar116
  %135 = mul nsw i64 4, %polly.indvar170
  %136 = add nsw i64 %134, %135
  %137 = add nsw i64 %136, 1
  br label %polly.stmt.for.body11201

polly.stmt.for.body11201:                         ; preds = %polly.stmt.for.body11
  %polly.access.cast.Packed_A202 = bitcast [16 x [384 x [4 x double]]]* %Packed_A to double*
  %polly.access.mul.Packed_A203 = mul nsw i64 %polly.indvar176, 384
  %polly.access.add.Packed_A204 = add nsw i64 %polly.access.mul.Packed_A203, %polly.indvar182
  %polly.access.mul.Packed_A205 = mul nsw i64 %polly.access.add.Packed_A204, 4
  %polly.access.add.Packed_A206 = add nsw i64 %polly.access.mul.Packed_A205, 0
  %polly.access.Packed_A207 = getelementptr double, double* %polly.access.cast.Packed_A202, i64 %polly.access.add.Packed_A206
  %_p_scalar_208 = load double, double* %polly.access.Packed_A207, align 8
  %p_mul16209 = fmul double %_p_scalar_208, 1.500000e+00
  %polly.access.cast.Packed_B210 = bitcast [256 x [384 x [4 x double]]]* %Packed_B to double*
  %polly.access.mul.Packed_B211 = mul nsw i64 %polly.indvar170, 384
  %polly.access.add.Packed_B212 = add nsw i64 %polly.access.mul.Packed_B211, %polly.indvar182
  %polly.access.mul.Packed_B213 = mul nsw i64 %polly.access.add.Packed_B212, 4
  %polly.access.add.Packed_B214 = add nsw i64 %polly.access.mul.Packed_B213, 1
  %polly.access.Packed_B215 = getelementptr double, double* %polly.access.cast.Packed_B210, i64 %polly.access.add.Packed_B214
  %_p_scalar_216 = load double, double* %polly.access.Packed_B215, align 8
  %p_mul21217 = fmul double %p_mul16209, %_p_scalar_216
  %scevgep218 = getelementptr [2300 x double], [2300 x double]* %C, i64 %131, i64 %137
  %_p_scalar_219 = load double, double* %scevgep218, align 8, !alias.scope !28, !noalias !29
  %p_add220 = fadd double %_p_scalar_219, %p_mul21217
  store double %p_add220, double* %scevgep218, align 8, !alias.scope !28, !noalias !29
  %138 = mul nsw i64 64, %polly.indvar144
  %139 = mul nsw i64 4, %polly.indvar176
  %140 = add nsw i64 %138, %139
  %141 = mul nsw i64 384, %polly.indvar122
  %142 = add nsw i64 %141, %polly.indvar182
  %143 = mul nsw i64 1024, %polly.indvar116
  %144 = mul nsw i64 4, %polly.indvar170
  %145 = add nsw i64 %143, %144
  %146 = add nsw i64 %145, 2
  br label %polly.stmt.for.body11221

polly.stmt.for.body11221:                         ; preds = %polly.stmt.for.body11201
  %polly.access.cast.Packed_A222 = bitcast [16 x [384 x [4 x double]]]* %Packed_A to double*
  %polly.access.mul.Packed_A223 = mul nsw i64 %polly.indvar176, 384
  %polly.access.add.Packed_A224 = add nsw i64 %polly.access.mul.Packed_A223, %polly.indvar182
  %polly.access.mul.Packed_A225 = mul nsw i64 %polly.access.add.Packed_A224, 4
  %polly.access.add.Packed_A226 = add nsw i64 %polly.access.mul.Packed_A225, 0
  %polly.access.Packed_A227 = getelementptr double, double* %polly.access.cast.Packed_A222, i64 %polly.access.add.Packed_A226
  %_p_scalar_228 = load double, double* %polly.access.Packed_A227, align 8
  %p_mul16229 = fmul double %_p_scalar_228, 1.500000e+00
  %polly.access.cast.Packed_B230 = bitcast [256 x [384 x [4 x double]]]* %Packed_B to double*
  %polly.access.mul.Packed_B231 = mul nsw i64 %polly.indvar170, 384
  %polly.access.add.Packed_B232 = add nsw i64 %polly.access.mul.Packed_B231, %polly.indvar182
  %polly.access.mul.Packed_B233 = mul nsw i64 %polly.access.add.Packed_B232, 4
  %polly.access.add.Packed_B234 = add nsw i64 %polly.access.mul.Packed_B233, 2
  %polly.access.Packed_B235 = getelementptr double, double* %polly.access.cast.Packed_B230, i64 %polly.access.add.Packed_B234
  %_p_scalar_236 = load double, double* %polly.access.Packed_B235, align 8
  %p_mul21237 = fmul double %p_mul16229, %_p_scalar_236
  %scevgep238 = getelementptr [2300 x double], [2300 x double]* %C, i64 %140, i64 %146
  %_p_scalar_239 = load double, double* %scevgep238, align 8, !alias.scope !30, !noalias !31
  %p_add240 = fadd double %_p_scalar_239, %p_mul21237
  store double %p_add240, double* %scevgep238, align 8, !alias.scope !30, !noalias !31
  %147 = mul nsw i64 64, %polly.indvar144
  %148 = mul nsw i64 4, %polly.indvar176
  %149 = add nsw i64 %147, %148
  %150 = mul nsw i64 384, %polly.indvar122
  %151 = add nsw i64 %150, %polly.indvar182
  %152 = mul nsw i64 1024, %polly.indvar116
  %153 = mul nsw i64 4, %polly.indvar170
  %154 = add nsw i64 %152, %153
  %155 = add nsw i64 %154, 3
  br label %polly.stmt.for.body11241

polly.stmt.for.body11241:                         ; preds = %polly.stmt.for.body11221
  %polly.access.cast.Packed_A242 = bitcast [16 x [384 x [4 x double]]]* %Packed_A to double*
  %polly.access.mul.Packed_A243 = mul nsw i64 %polly.indvar176, 384
  %polly.access.add.Packed_A244 = add nsw i64 %polly.access.mul.Packed_A243, %polly.indvar182
  %polly.access.mul.Packed_A245 = mul nsw i64 %polly.access.add.Packed_A244, 4
  %polly.access.add.Packed_A246 = add nsw i64 %polly.access.mul.Packed_A245, 0
  %polly.access.Packed_A247 = getelementptr double, double* %polly.access.cast.Packed_A242, i64 %polly.access.add.Packed_A246
  %_p_scalar_248 = load double, double* %polly.access.Packed_A247, align 8
  %p_mul16249 = fmul double %_p_scalar_248, 1.500000e+00
  %polly.access.cast.Packed_B250 = bitcast [256 x [384 x [4 x double]]]* %Packed_B to double*
  %polly.access.mul.Packed_B251 = mul nsw i64 %polly.indvar170, 384
  %polly.access.add.Packed_B252 = add nsw i64 %polly.access.mul.Packed_B251, %polly.indvar182
  %polly.access.mul.Packed_B253 = mul nsw i64 %polly.access.add.Packed_B252, 4
  %polly.access.add.Packed_B254 = add nsw i64 %polly.access.mul.Packed_B253, 3
  %polly.access.Packed_B255 = getelementptr double, double* %polly.access.cast.Packed_B250, i64 %polly.access.add.Packed_B254
  %_p_scalar_256 = load double, double* %polly.access.Packed_B255, align 8
  %p_mul21257 = fmul double %p_mul16249, %_p_scalar_256
  %scevgep258 = getelementptr [2300 x double], [2300 x double]* %C, i64 %149, i64 %155
  %_p_scalar_259 = load double, double* %scevgep258, align 8, !alias.scope !32, !noalias !33
  %p_add260 = fadd double %_p_scalar_259, %p_mul21257
  store double %p_add260, double* %scevgep258, align 8, !alias.scope !32, !noalias !33
  %156 = mul nsw i64 64, %polly.indvar144
  %157 = mul nsw i64 4, %polly.indvar176
  %158 = add nsw i64 %156, %157
  %159 = add nsw i64 %158, 1
  %160 = mul nsw i64 384, %polly.indvar122
  %161 = add nsw i64 %160, %polly.indvar182
  %162 = mul nsw i64 1024, %polly.indvar116
  %163 = mul nsw i64 4, %polly.indvar170
  %164 = add nsw i64 %162, %163
  br label %polly.stmt.for.body11261

polly.stmt.for.body11261:                         ; preds = %polly.stmt.for.body11241
  %polly.access.cast.Packed_A262 = bitcast [16 x [384 x [4 x double]]]* %Packed_A to double*
  %polly.access.mul.Packed_A263 = mul nsw i64 %polly.indvar176, 384
  %polly.access.add.Packed_A264 = add nsw i64 %polly.access.mul.Packed_A263, %polly.indvar182
  %polly.access.mul.Packed_A265 = mul nsw i64 %polly.access.add.Packed_A264, 4
  %polly.access.add.Packed_A266 = add nsw i64 %polly.access.mul.Packed_A265, 1
  %polly.access.Packed_A267 = getelementptr double, double* %polly.access.cast.Packed_A262, i64 %polly.access.add.Packed_A266
  %_p_scalar_268 = load double, double* %polly.access.Packed_A267, align 8
  %p_mul16269 = fmul double %_p_scalar_268, 1.500000e+00
  %polly.access.cast.Packed_B270 = bitcast [256 x [384 x [4 x double]]]* %Packed_B to double*
  %polly.access.mul.Packed_B271 = mul nsw i64 %polly.indvar170, 384
  %polly.access.add.Packed_B272 = add nsw i64 %polly.access.mul.Packed_B271, %polly.indvar182
  %polly.access.mul.Packed_B273 = mul nsw i64 %polly.access.add.Packed_B272, 4
  %polly.access.add.Packed_B274 = add nsw i64 %polly.access.mul.Packed_B273, 0
  %polly.access.Packed_B275 = getelementptr double, double* %polly.access.cast.Packed_B270, i64 %polly.access.add.Packed_B274
  %_p_scalar_276 = load double, double* %polly.access.Packed_B275, align 8
  %p_mul21277 = fmul double %p_mul16269, %_p_scalar_276
  %scevgep278 = getelementptr [2300 x double], [2300 x double]* %C, i64 %159, i64 %164
  %_p_scalar_279 = load double, double* %scevgep278, align 8, !alias.scope !34, !noalias !35
  %p_add280 = fadd double %_p_scalar_279, %p_mul21277
  store double %p_add280, double* %scevgep278, align 8, !alias.scope !34, !noalias !35
  %165 = mul nsw i64 64, %polly.indvar144
  %166 = mul nsw i64 4, %polly.indvar176
  %167 = add nsw i64 %165, %166
  %168 = add nsw i64 %167, 1
  %169 = mul nsw i64 384, %polly.indvar122
  %170 = add nsw i64 %169, %polly.indvar182
  %171 = mul nsw i64 1024, %polly.indvar116
  %172 = mul nsw i64 4, %polly.indvar170
  %173 = add nsw i64 %171, %172
  %174 = add nsw i64 %173, 1
  br label %polly.stmt.for.body11281

polly.stmt.for.body11281:                         ; preds = %polly.stmt.for.body11261
  %polly.access.cast.Packed_A282 = bitcast [16 x [384 x [4 x double]]]* %Packed_A to double*
  %polly.access.mul.Packed_A283 = mul nsw i64 %polly.indvar176, 384
  %polly.access.add.Packed_A284 = add nsw i64 %polly.access.mul.Packed_A283, %polly.indvar182
  %polly.access.mul.Packed_A285 = mul nsw i64 %polly.access.add.Packed_A284, 4
  %polly.access.add.Packed_A286 = add nsw i64 %polly.access.mul.Packed_A285, 1
  %polly.access.Packed_A287 = getelementptr double, double* %polly.access.cast.Packed_A282, i64 %polly.access.add.Packed_A286
  %_p_scalar_288 = load double, double* %polly.access.Packed_A287, align 8
  %p_mul16289 = fmul double %_p_scalar_288, 1.500000e+00
  %polly.access.cast.Packed_B290 = bitcast [256 x [384 x [4 x double]]]* %Packed_B to double*
  %polly.access.mul.Packed_B291 = mul nsw i64 %polly.indvar170, 384
  %polly.access.add.Packed_B292 = add nsw i64 %polly.access.mul.Packed_B291, %polly.indvar182
  %polly.access.mul.Packed_B293 = mul nsw i64 %polly.access.add.Packed_B292, 4
  %polly.access.add.Packed_B294 = add nsw i64 %polly.access.mul.Packed_B293, 1
  %polly.access.Packed_B295 = getelementptr double, double* %polly.access.cast.Packed_B290, i64 %polly.access.add.Packed_B294
  %_p_scalar_296 = load double, double* %polly.access.Packed_B295, align 8
  %p_mul21297 = fmul double %p_mul16289, %_p_scalar_296
  %scevgep298 = getelementptr [2300 x double], [2300 x double]* %C, i64 %168, i64 %174
  %_p_scalar_299 = load double, double* %scevgep298, align 8, !alias.scope !36, !noalias !37
  %p_add300 = fadd double %_p_scalar_299, %p_mul21297
  store double %p_add300, double* %scevgep298, align 8, !alias.scope !36, !noalias !37
  %175 = mul nsw i64 64, %polly.indvar144
  %176 = mul nsw i64 4, %polly.indvar176
  %177 = add nsw i64 %175, %176
  %178 = add nsw i64 %177, 1
  %179 = mul nsw i64 384, %polly.indvar122
  %180 = add nsw i64 %179, %polly.indvar182
  %181 = mul nsw i64 1024, %polly.indvar116
  %182 = mul nsw i64 4, %polly.indvar170
  %183 = add nsw i64 %181, %182
  %184 = add nsw i64 %183, 2
  br label %polly.stmt.for.body11301

polly.stmt.for.body11301:                         ; preds = %polly.stmt.for.body11281
  %polly.access.cast.Packed_A302 = bitcast [16 x [384 x [4 x double]]]* %Packed_A to double*
  %polly.access.mul.Packed_A303 = mul nsw i64 %polly.indvar176, 384
  %polly.access.add.Packed_A304 = add nsw i64 %polly.access.mul.Packed_A303, %polly.indvar182
  %polly.access.mul.Packed_A305 = mul nsw i64 %polly.access.add.Packed_A304, 4
  %polly.access.add.Packed_A306 = add nsw i64 %polly.access.mul.Packed_A305, 1
  %polly.access.Packed_A307 = getelementptr double, double* %polly.access.cast.Packed_A302, i64 %polly.access.add.Packed_A306
  %_p_scalar_308 = load double, double* %polly.access.Packed_A307, align 8
  %p_mul16309 = fmul double %_p_scalar_308, 1.500000e+00
  %polly.access.cast.Packed_B310 = bitcast [256 x [384 x [4 x double]]]* %Packed_B to double*
  %polly.access.mul.Packed_B311 = mul nsw i64 %polly.indvar170, 384
  %polly.access.add.Packed_B312 = add nsw i64 %polly.access.mul.Packed_B311, %polly.indvar182
  %polly.access.mul.Packed_B313 = mul nsw i64 %polly.access.add.Packed_B312, 4
  %polly.access.add.Packed_B314 = add nsw i64 %polly.access.mul.Packed_B313, 2
  %polly.access.Packed_B315 = getelementptr double, double* %polly.access.cast.Packed_B310, i64 %polly.access.add.Packed_B314
  %_p_scalar_316 = load double, double* %polly.access.Packed_B315, align 8
  %p_mul21317 = fmul double %p_mul16309, %_p_scalar_316
  %scevgep318 = getelementptr [2300 x double], [2300 x double]* %C, i64 %178, i64 %184
  %_p_scalar_319 = load double, double* %scevgep318, align 8, !alias.scope !38, !noalias !39
  %p_add320 = fadd double %_p_scalar_319, %p_mul21317
  store double %p_add320, double* %scevgep318, align 8, !alias.scope !38, !noalias !39
  %185 = mul nsw i64 64, %polly.indvar144
  %186 = mul nsw i64 4, %polly.indvar176
  %187 = add nsw i64 %185, %186
  %188 = add nsw i64 %187, 1
  %189 = mul nsw i64 384, %polly.indvar122
  %190 = add nsw i64 %189, %polly.indvar182
  %191 = mul nsw i64 1024, %polly.indvar116
  %192 = mul nsw i64 4, %polly.indvar170
  %193 = add nsw i64 %191, %192
  %194 = add nsw i64 %193, 3
  br label %polly.stmt.for.body11321

polly.stmt.for.body11321:                         ; preds = %polly.stmt.for.body11301
  %polly.access.cast.Packed_A322 = bitcast [16 x [384 x [4 x double]]]* %Packed_A to double*
  %polly.access.mul.Packed_A323 = mul nsw i64 %polly.indvar176, 384
  %polly.access.add.Packed_A324 = add nsw i64 %polly.access.mul.Packed_A323, %polly.indvar182
  %polly.access.mul.Packed_A325 = mul nsw i64 %polly.access.add.Packed_A324, 4
  %polly.access.add.Packed_A326 = add nsw i64 %polly.access.mul.Packed_A325, 1
  %polly.access.Packed_A327 = getelementptr double, double* %polly.access.cast.Packed_A322, i64 %polly.access.add.Packed_A326
  %_p_scalar_328 = load double, double* %polly.access.Packed_A327, align 8
  %p_mul16329 = fmul double %_p_scalar_328, 1.500000e+00
  %polly.access.cast.Packed_B330 = bitcast [256 x [384 x [4 x double]]]* %Packed_B to double*
  %polly.access.mul.Packed_B331 = mul nsw i64 %polly.indvar170, 384
  %polly.access.add.Packed_B332 = add nsw i64 %polly.access.mul.Packed_B331, %polly.indvar182
  %polly.access.mul.Packed_B333 = mul nsw i64 %polly.access.add.Packed_B332, 4
  %polly.access.add.Packed_B334 = add nsw i64 %polly.access.mul.Packed_B333, 3
  %polly.access.Packed_B335 = getelementptr double, double* %polly.access.cast.Packed_B330, i64 %polly.access.add.Packed_B334
  %_p_scalar_336 = load double, double* %polly.access.Packed_B335, align 8
  %p_mul21337 = fmul double %p_mul16329, %_p_scalar_336
  %scevgep338 = getelementptr [2300 x double], [2300 x double]* %C, i64 %188, i64 %194
  %_p_scalar_339 = load double, double* %scevgep338, align 8, !alias.scope !40, !noalias !41
  %p_add340 = fadd double %_p_scalar_339, %p_mul21337
  store double %p_add340, double* %scevgep338, align 8, !alias.scope !40, !noalias !41
  %195 = mul nsw i64 64, %polly.indvar144
  %196 = mul nsw i64 4, %polly.indvar176
  %197 = add nsw i64 %195, %196
  %198 = add nsw i64 %197, 2
  %199 = mul nsw i64 384, %polly.indvar122
  %200 = add nsw i64 %199, %polly.indvar182
  %201 = mul nsw i64 1024, %polly.indvar116
  %202 = mul nsw i64 4, %polly.indvar170
  %203 = add nsw i64 %201, %202
  br label %polly.stmt.for.body11341

polly.stmt.for.body11341:                         ; preds = %polly.stmt.for.body11321
  %polly.access.cast.Packed_A342 = bitcast [16 x [384 x [4 x double]]]* %Packed_A to double*
  %polly.access.mul.Packed_A343 = mul nsw i64 %polly.indvar176, 384
  %polly.access.add.Packed_A344 = add nsw i64 %polly.access.mul.Packed_A343, %polly.indvar182
  %polly.access.mul.Packed_A345 = mul nsw i64 %polly.access.add.Packed_A344, 4
  %polly.access.add.Packed_A346 = add nsw i64 %polly.access.mul.Packed_A345, 2
  %polly.access.Packed_A347 = getelementptr double, double* %polly.access.cast.Packed_A342, i64 %polly.access.add.Packed_A346
  %_p_scalar_348 = load double, double* %polly.access.Packed_A347, align 8
  %p_mul16349 = fmul double %_p_scalar_348, 1.500000e+00
  %polly.access.cast.Packed_B350 = bitcast [256 x [384 x [4 x double]]]* %Packed_B to double*
  %polly.access.mul.Packed_B351 = mul nsw i64 %polly.indvar170, 384
  %polly.access.add.Packed_B352 = add nsw i64 %polly.access.mul.Packed_B351, %polly.indvar182
  %polly.access.mul.Packed_B353 = mul nsw i64 %polly.access.add.Packed_B352, 4
  %polly.access.add.Packed_B354 = add nsw i64 %polly.access.mul.Packed_B353, 0
  %polly.access.Packed_B355 = getelementptr double, double* %polly.access.cast.Packed_B350, i64 %polly.access.add.Packed_B354
  %_p_scalar_356 = load double, double* %polly.access.Packed_B355, align 8
  %p_mul21357 = fmul double %p_mul16349, %_p_scalar_356
  %scevgep358 = getelementptr [2300 x double], [2300 x double]* %C, i64 %198, i64 %203
  %_p_scalar_359 = load double, double* %scevgep358, align 8, !alias.scope !42, !noalias !43
  %p_add360 = fadd double %_p_scalar_359, %p_mul21357
  store double %p_add360, double* %scevgep358, align 8, !alias.scope !42, !noalias !43
  %204 = mul nsw i64 64, %polly.indvar144
  %205 = mul nsw i64 4, %polly.indvar176
  %206 = add nsw i64 %204, %205
  %207 = add nsw i64 %206, 2
  %208 = mul nsw i64 384, %polly.indvar122
  %209 = add nsw i64 %208, %polly.indvar182
  %210 = mul nsw i64 1024, %polly.indvar116
  %211 = mul nsw i64 4, %polly.indvar170
  %212 = add nsw i64 %210, %211
  %213 = add nsw i64 %212, 1
  br label %polly.stmt.for.body11361

polly.stmt.for.body11361:                         ; preds = %polly.stmt.for.body11341
  %polly.access.cast.Packed_A362 = bitcast [16 x [384 x [4 x double]]]* %Packed_A to double*
  %polly.access.mul.Packed_A363 = mul nsw i64 %polly.indvar176, 384
  %polly.access.add.Packed_A364 = add nsw i64 %polly.access.mul.Packed_A363, %polly.indvar182
  %polly.access.mul.Packed_A365 = mul nsw i64 %polly.access.add.Packed_A364, 4
  %polly.access.add.Packed_A366 = add nsw i64 %polly.access.mul.Packed_A365, 2
  %polly.access.Packed_A367 = getelementptr double, double* %polly.access.cast.Packed_A362, i64 %polly.access.add.Packed_A366
  %_p_scalar_368 = load double, double* %polly.access.Packed_A367, align 8
  %p_mul16369 = fmul double %_p_scalar_368, 1.500000e+00
  %polly.access.cast.Packed_B370 = bitcast [256 x [384 x [4 x double]]]* %Packed_B to double*
  %polly.access.mul.Packed_B371 = mul nsw i64 %polly.indvar170, 384
  %polly.access.add.Packed_B372 = add nsw i64 %polly.access.mul.Packed_B371, %polly.indvar182
  %polly.access.mul.Packed_B373 = mul nsw i64 %polly.access.add.Packed_B372, 4
  %polly.access.add.Packed_B374 = add nsw i64 %polly.access.mul.Packed_B373, 1
  %polly.access.Packed_B375 = getelementptr double, double* %polly.access.cast.Packed_B370, i64 %polly.access.add.Packed_B374
  %_p_scalar_376 = load double, double* %polly.access.Packed_B375, align 8
  %p_mul21377 = fmul double %p_mul16369, %_p_scalar_376
  %scevgep378 = getelementptr [2300 x double], [2300 x double]* %C, i64 %207, i64 %213
  %_p_scalar_379 = load double, double* %scevgep378, align 8, !alias.scope !44, !noalias !45
  %p_add380 = fadd double %_p_scalar_379, %p_mul21377
  store double %p_add380, double* %scevgep378, align 8, !alias.scope !44, !noalias !45
  %214 = mul nsw i64 64, %polly.indvar144
  %215 = mul nsw i64 4, %polly.indvar176
  %216 = add nsw i64 %214, %215
  %217 = add nsw i64 %216, 2
  %218 = mul nsw i64 384, %polly.indvar122
  %219 = add nsw i64 %218, %polly.indvar182
  %220 = mul nsw i64 1024, %polly.indvar116
  %221 = mul nsw i64 4, %polly.indvar170
  %222 = add nsw i64 %220, %221
  %223 = add nsw i64 %222, 2
  br label %polly.stmt.for.body11381

polly.stmt.for.body11381:                         ; preds = %polly.stmt.for.body11361
  %polly.access.cast.Packed_A382 = bitcast [16 x [384 x [4 x double]]]* %Packed_A to double*
  %polly.access.mul.Packed_A383 = mul nsw i64 %polly.indvar176, 384
  %polly.access.add.Packed_A384 = add nsw i64 %polly.access.mul.Packed_A383, %polly.indvar182
  %polly.access.mul.Packed_A385 = mul nsw i64 %polly.access.add.Packed_A384, 4
  %polly.access.add.Packed_A386 = add nsw i64 %polly.access.mul.Packed_A385, 2
  %polly.access.Packed_A387 = getelementptr double, double* %polly.access.cast.Packed_A382, i64 %polly.access.add.Packed_A386
  %_p_scalar_388 = load double, double* %polly.access.Packed_A387, align 8
  %p_mul16389 = fmul double %_p_scalar_388, 1.500000e+00
  %polly.access.cast.Packed_B390 = bitcast [256 x [384 x [4 x double]]]* %Packed_B to double*
  %polly.access.mul.Packed_B391 = mul nsw i64 %polly.indvar170, 384
  %polly.access.add.Packed_B392 = add nsw i64 %polly.access.mul.Packed_B391, %polly.indvar182
  %polly.access.mul.Packed_B393 = mul nsw i64 %polly.access.add.Packed_B392, 4
  %polly.access.add.Packed_B394 = add nsw i64 %polly.access.mul.Packed_B393, 2
  %polly.access.Packed_B395 = getelementptr double, double* %polly.access.cast.Packed_B390, i64 %polly.access.add.Packed_B394
  %_p_scalar_396 = load double, double* %polly.access.Packed_B395, align 8
  %p_mul21397 = fmul double %p_mul16389, %_p_scalar_396
  %scevgep398 = getelementptr [2300 x double], [2300 x double]* %C, i64 %217, i64 %223
  %_p_scalar_399 = load double, double* %scevgep398, align 8, !alias.scope !46, !noalias !47
  %p_add400 = fadd double %_p_scalar_399, %p_mul21397
  store double %p_add400, double* %scevgep398, align 8, !alias.scope !46, !noalias !47
  %224 = mul nsw i64 64, %polly.indvar144
  %225 = mul nsw i64 4, %polly.indvar176
  %226 = add nsw i64 %224, %225
  %227 = add nsw i64 %226, 2
  %228 = mul nsw i64 384, %polly.indvar122
  %229 = add nsw i64 %228, %polly.indvar182
  %230 = mul nsw i64 1024, %polly.indvar116
  %231 = mul nsw i64 4, %polly.indvar170
  %232 = add nsw i64 %230, %231
  %233 = add nsw i64 %232, 3
  br label %polly.stmt.for.body11401

polly.stmt.for.body11401:                         ; preds = %polly.stmt.for.body11381
  %polly.access.cast.Packed_A402 = bitcast [16 x [384 x [4 x double]]]* %Packed_A to double*
  %polly.access.mul.Packed_A403 = mul nsw i64 %polly.indvar176, 384
  %polly.access.add.Packed_A404 = add nsw i64 %polly.access.mul.Packed_A403, %polly.indvar182
  %polly.access.mul.Packed_A405 = mul nsw i64 %polly.access.add.Packed_A404, 4
  %polly.access.add.Packed_A406 = add nsw i64 %polly.access.mul.Packed_A405, 2
  %polly.access.Packed_A407 = getelementptr double, double* %polly.access.cast.Packed_A402, i64 %polly.access.add.Packed_A406
  %_p_scalar_408 = load double, double* %polly.access.Packed_A407, align 8
  %p_mul16409 = fmul double %_p_scalar_408, 1.500000e+00
  %polly.access.cast.Packed_B410 = bitcast [256 x [384 x [4 x double]]]* %Packed_B to double*
  %polly.access.mul.Packed_B411 = mul nsw i64 %polly.indvar170, 384
  %polly.access.add.Packed_B412 = add nsw i64 %polly.access.mul.Packed_B411, %polly.indvar182
  %polly.access.mul.Packed_B413 = mul nsw i64 %polly.access.add.Packed_B412, 4
  %polly.access.add.Packed_B414 = add nsw i64 %polly.access.mul.Packed_B413, 3
  %polly.access.Packed_B415 = getelementptr double, double* %polly.access.cast.Packed_B410, i64 %polly.access.add.Packed_B414
  %_p_scalar_416 = load double, double* %polly.access.Packed_B415, align 8
  %p_mul21417 = fmul double %p_mul16409, %_p_scalar_416
  %scevgep418 = getelementptr [2300 x double], [2300 x double]* %C, i64 %227, i64 %233
  %_p_scalar_419 = load double, double* %scevgep418, align 8, !alias.scope !48, !noalias !49
  %p_add420 = fadd double %_p_scalar_419, %p_mul21417
  store double %p_add420, double* %scevgep418, align 8, !alias.scope !48, !noalias !49
  %234 = mul nsw i64 64, %polly.indvar144
  %235 = mul nsw i64 4, %polly.indvar176
  %236 = add nsw i64 %234, %235
  %237 = add nsw i64 %236, 3
  %238 = mul nsw i64 384, %polly.indvar122
  %239 = add nsw i64 %238, %polly.indvar182
  %240 = mul nsw i64 1024, %polly.indvar116
  %241 = mul nsw i64 4, %polly.indvar170
  %242 = add nsw i64 %240, %241
  br label %polly.stmt.for.body11421

polly.stmt.for.body11421:                         ; preds = %polly.stmt.for.body11401
  %polly.access.cast.Packed_A422 = bitcast [16 x [384 x [4 x double]]]* %Packed_A to double*
  %polly.access.mul.Packed_A423 = mul nsw i64 %polly.indvar176, 384
  %polly.access.add.Packed_A424 = add nsw i64 %polly.access.mul.Packed_A423, %polly.indvar182
  %polly.access.mul.Packed_A425 = mul nsw i64 %polly.access.add.Packed_A424, 4
  %polly.access.add.Packed_A426 = add nsw i64 %polly.access.mul.Packed_A425, 3
  %polly.access.Packed_A427 = getelementptr double, double* %polly.access.cast.Packed_A422, i64 %polly.access.add.Packed_A426
  %_p_scalar_428 = load double, double* %polly.access.Packed_A427, align 8
  %p_mul16429 = fmul double %_p_scalar_428, 1.500000e+00
  %polly.access.cast.Packed_B430 = bitcast [256 x [384 x [4 x double]]]* %Packed_B to double*
  %polly.access.mul.Packed_B431 = mul nsw i64 %polly.indvar170, 384
  %polly.access.add.Packed_B432 = add nsw i64 %polly.access.mul.Packed_B431, %polly.indvar182
  %polly.access.mul.Packed_B433 = mul nsw i64 %polly.access.add.Packed_B432, 4
  %polly.access.add.Packed_B434 = add nsw i64 %polly.access.mul.Packed_B433, 0
  %polly.access.Packed_B435 = getelementptr double, double* %polly.access.cast.Packed_B430, i64 %polly.access.add.Packed_B434
  %_p_scalar_436 = load double, double* %polly.access.Packed_B435, align 8
  %p_mul21437 = fmul double %p_mul16429, %_p_scalar_436
  %scevgep438 = getelementptr [2300 x double], [2300 x double]* %C, i64 %237, i64 %242
  %_p_scalar_439 = load double, double* %scevgep438, align 8, !alias.scope !50, !noalias !51
  %p_add440 = fadd double %_p_scalar_439, %p_mul21437
  store double %p_add440, double* %scevgep438, align 8, !alias.scope !50, !noalias !51
  %243 = mul nsw i64 64, %polly.indvar144
  %244 = mul nsw i64 4, %polly.indvar176
  %245 = add nsw i64 %243, %244
  %246 = add nsw i64 %245, 3
  %247 = mul nsw i64 384, %polly.indvar122
  %248 = add nsw i64 %247, %polly.indvar182
  %249 = mul nsw i64 1024, %polly.indvar116
  %250 = mul nsw i64 4, %polly.indvar170
  %251 = add nsw i64 %249, %250
  %252 = add nsw i64 %251, 1
  br label %polly.stmt.for.body11441

polly.stmt.for.body11441:                         ; preds = %polly.stmt.for.body11421
  %polly.access.cast.Packed_A442 = bitcast [16 x [384 x [4 x double]]]* %Packed_A to double*
  %polly.access.mul.Packed_A443 = mul nsw i64 %polly.indvar176, 384
  %polly.access.add.Packed_A444 = add nsw i64 %polly.access.mul.Packed_A443, %polly.indvar182
  %polly.access.mul.Packed_A445 = mul nsw i64 %polly.access.add.Packed_A444, 4
  %polly.access.add.Packed_A446 = add nsw i64 %polly.access.mul.Packed_A445, 3
  %polly.access.Packed_A447 = getelementptr double, double* %polly.access.cast.Packed_A442, i64 %polly.access.add.Packed_A446
  %_p_scalar_448 = load double, double* %polly.access.Packed_A447, align 8
  %p_mul16449 = fmul double %_p_scalar_448, 1.500000e+00
  %polly.access.cast.Packed_B450 = bitcast [256 x [384 x [4 x double]]]* %Packed_B to double*
  %polly.access.mul.Packed_B451 = mul nsw i64 %polly.indvar170, 384
  %polly.access.add.Packed_B452 = add nsw i64 %polly.access.mul.Packed_B451, %polly.indvar182
  %polly.access.mul.Packed_B453 = mul nsw i64 %polly.access.add.Packed_B452, 4
  %polly.access.add.Packed_B454 = add nsw i64 %polly.access.mul.Packed_B453, 1
  %polly.access.Packed_B455 = getelementptr double, double* %polly.access.cast.Packed_B450, i64 %polly.access.add.Packed_B454
  %_p_scalar_456 = load double, double* %polly.access.Packed_B455, align 8
  %p_mul21457 = fmul double %p_mul16449, %_p_scalar_456
  %scevgep458 = getelementptr [2300 x double], [2300 x double]* %C, i64 %246, i64 %252
  %_p_scalar_459 = load double, double* %scevgep458, align 8, !alias.scope !52, !noalias !53
  %p_add460 = fadd double %_p_scalar_459, %p_mul21457
  store double %p_add460, double* %scevgep458, align 8, !alias.scope !52, !noalias !53
  %253 = mul nsw i64 64, %polly.indvar144
  %254 = mul nsw i64 4, %polly.indvar176
  %255 = add nsw i64 %253, %254
  %256 = add nsw i64 %255, 3
  %257 = mul nsw i64 384, %polly.indvar122
  %258 = add nsw i64 %257, %polly.indvar182
  %259 = mul nsw i64 1024, %polly.indvar116
  %260 = mul nsw i64 4, %polly.indvar170
  %261 = add nsw i64 %259, %260
  %262 = add nsw i64 %261, 2
  br label %polly.stmt.for.body11461

polly.stmt.for.body11461:                         ; preds = %polly.stmt.for.body11441
  %polly.access.cast.Packed_A462 = bitcast [16 x [384 x [4 x double]]]* %Packed_A to double*
  %polly.access.mul.Packed_A463 = mul nsw i64 %polly.indvar176, 384
  %polly.access.add.Packed_A464 = add nsw i64 %polly.access.mul.Packed_A463, %polly.indvar182
  %polly.access.mul.Packed_A465 = mul nsw i64 %polly.access.add.Packed_A464, 4
  %polly.access.add.Packed_A466 = add nsw i64 %polly.access.mul.Packed_A465, 3
  %polly.access.Packed_A467 = getelementptr double, double* %polly.access.cast.Packed_A462, i64 %polly.access.add.Packed_A466
  %_p_scalar_468 = load double, double* %polly.access.Packed_A467, align 8
  %p_mul16469 = fmul double %_p_scalar_468, 1.500000e+00
  %polly.access.cast.Packed_B470 = bitcast [256 x [384 x [4 x double]]]* %Packed_B to double*
  %polly.access.mul.Packed_B471 = mul nsw i64 %polly.indvar170, 384
  %polly.access.add.Packed_B472 = add nsw i64 %polly.access.mul.Packed_B471, %polly.indvar182
  %polly.access.mul.Packed_B473 = mul nsw i64 %polly.access.add.Packed_B472, 4
  %polly.access.add.Packed_B474 = add nsw i64 %polly.access.mul.Packed_B473, 2
  %polly.access.Packed_B475 = getelementptr double, double* %polly.access.cast.Packed_B470, i64 %polly.access.add.Packed_B474
  %_p_scalar_476 = load double, double* %polly.access.Packed_B475, align 8
  %p_mul21477 = fmul double %p_mul16469, %_p_scalar_476
  %scevgep478 = getelementptr [2300 x double], [2300 x double]* %C, i64 %256, i64 %262
  %_p_scalar_479 = load double, double* %scevgep478, align 8, !alias.scope !54, !noalias !55
  %p_add480 = fadd double %_p_scalar_479, %p_mul21477
  store double %p_add480, double* %scevgep478, align 8, !alias.scope !54, !noalias !55
  %263 = mul nsw i64 64, %polly.indvar144
  %264 = mul nsw i64 4, %polly.indvar176
  %265 = add nsw i64 %263, %264
  %266 = add nsw i64 %265, 3
  %267 = mul nsw i64 384, %polly.indvar122
  %268 = add nsw i64 %267, %polly.indvar182
  %269 = mul nsw i64 1024, %polly.indvar116
  %270 = mul nsw i64 4, %polly.indvar170
  %271 = add nsw i64 %269, %270
  %272 = add nsw i64 %271, 3
  br label %polly.stmt.for.body11481

polly.stmt.for.body11481:                         ; preds = %polly.stmt.for.body11461
  %polly.access.cast.Packed_A482 = bitcast [16 x [384 x [4 x double]]]* %Packed_A to double*
  %polly.access.mul.Packed_A483 = mul nsw i64 %polly.indvar176, 384
  %polly.access.add.Packed_A484 = add nsw i64 %polly.access.mul.Packed_A483, %polly.indvar182
  %polly.access.mul.Packed_A485 = mul nsw i64 %polly.access.add.Packed_A484, 4
  %polly.access.add.Packed_A486 = add nsw i64 %polly.access.mul.Packed_A485, 3
  %polly.access.Packed_A487 = getelementptr double, double* %polly.access.cast.Packed_A482, i64 %polly.access.add.Packed_A486
  %_p_scalar_488 = load double, double* %polly.access.Packed_A487, align 8
  %p_mul16489 = fmul double %_p_scalar_488, 1.500000e+00
  %polly.access.cast.Packed_B490 = bitcast [256 x [384 x [4 x double]]]* %Packed_B to double*
  %polly.access.mul.Packed_B491 = mul nsw i64 %polly.indvar170, 384
  %polly.access.add.Packed_B492 = add nsw i64 %polly.access.mul.Packed_B491, %polly.indvar182
  %polly.access.mul.Packed_B493 = mul nsw i64 %polly.access.add.Packed_B492, 4
  %polly.access.add.Packed_B494 = add nsw i64 %polly.access.mul.Packed_B493, 3
  %polly.access.Packed_B495 = getelementptr double, double* %polly.access.cast.Packed_B490, i64 %polly.access.add.Packed_B494
  %_p_scalar_496 = load double, double* %polly.access.Packed_B495, align 8
  %p_mul21497 = fmul double %p_mul16489, %_p_scalar_496
  %scevgep498 = getelementptr [2300 x double], [2300 x double]* %C, i64 %266, i64 %272
  %_p_scalar_499 = load double, double* %scevgep498, align 8, !alias.scope !56, !noalias !57
  %p_add500 = fadd double %_p_scalar_499, %p_mul21497
  store double %p_add500, double* %scevgep498, align 8, !alias.scope !56, !noalias !57
  %polly.indvar_next183 = add nsw i64 %polly.indvar182, 1
  %polly.loop_cond184 = icmp sle i64 %polly.indvar_next183, %120
  br i1 %polly.loop_cond184, label %polly.loop_header179, label %polly.loop_exit181

polly.loop_preheader180:                          ; preds = %polly.loop_header173
  br label %polly.loop_header179
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
!8 = !{!9}
!9 = distinct !{!9, !10, !"init_array: %C"}
!10 = distinct !{!10, !"init_array"}
!11 = !{!12, !13}
!12 = distinct !{!12, !10, !"init_array: %A"}
!13 = distinct !{!13, !10, !"init_array: %B"}
!14 = !{!12}
!15 = !{!9, !13}
!16 = !{!13}
!17 = !{!9, !12}
!18 = distinct !{!18, !19, !"polly.alias.scope.MemRefA"}
!19 = distinct !{!19, !"polly.alias.scope.domain"}
!20 = !{!21, !22, !23, !24}
!21 = distinct !{!21, !19, !"polly.alias.scope.Packed_A"}
!22 = distinct !{!22, !19, !"polly.alias.scope.MemRefB"}
!23 = distinct !{!23, !19, !"polly.alias.scope.MemRefmul16"}
!24 = distinct !{!24, !19, !"polly.alias.scope.MemRefC"}
!25 = !{!21, !22, !23, !18}
!26 = !{!21, !23, !24, !18}
!27 = distinct !{!27, !24, !"second level alias metadata"}
!28 = distinct !{!28, !24, !"second level alias metadata"}
!29 = !{!21, !22, !23, !18, !27}
!30 = distinct !{!30, !24, !"second level alias metadata"}
!31 = !{!21, !22, !23, !18, !27, !28}
!32 = distinct !{!32, !24, !"second level alias metadata"}
!33 = !{!21, !22, !23, !18, !27, !28, !30}
!34 = distinct !{!34, !24, !"second level alias metadata"}
!35 = !{!21, !22, !23, !18, !27, !28, !30, !32}
!36 = distinct !{!36, !24, !"second level alias metadata"}
!37 = !{!21, !22, !23, !18, !27, !28, !30, !32, !34}
!38 = distinct !{!38, !24, !"second level alias metadata"}
!39 = !{!21, !22, !23, !18, !27, !28, !30, !32, !34, !36}
!40 = distinct !{!40, !24, !"second level alias metadata"}
!41 = !{!21, !22, !23, !18, !27, !28, !30, !32, !34, !36, !38}
!42 = distinct !{!42, !24, !"second level alias metadata"}
!43 = !{!21, !22, !23, !18, !27, !28, !30, !32, !34, !36, !38, !40}
!44 = distinct !{!44, !24, !"second level alias metadata"}
!45 = !{!21, !22, !23, !18, !27, !28, !30, !32, !34, !36, !38, !40, !42}
!46 = distinct !{!46, !24, !"second level alias metadata"}
!47 = !{!21, !22, !23, !18, !27, !28, !30, !32, !34, !36, !38, !40, !42, !44}
!48 = distinct !{!48, !24, !"second level alias metadata"}
!49 = !{!21, !22, !23, !18, !27, !28, !30, !32, !34, !36, !38, !40, !42, !44, !46}
!50 = distinct !{!50, !24, !"second level alias metadata"}
!51 = !{!21, !22, !23, !18, !27, !28, !30, !32, !34, !36, !38, !40, !42, !44, !46, !48}
!52 = distinct !{!52, !24, !"second level alias metadata"}
!53 = !{!21, !22, !23, !18, !27, !28, !30, !32, !34, !36, !38, !40, !42, !44, !46, !48, !50}
!54 = distinct !{!54, !24, !"second level alias metadata"}
!55 = !{!21, !22, !23, !18, !27, !28, !30, !32, !34, !36, !38, !40, !42, !44, !46, !48, !50, !52}
!56 = distinct !{!56, !24, !"second level alias metadata"}
!57 = !{!21, !22, !23, !18, !27, !28, !30, !32, !34, !36, !38, !40, !42, !44, !46, !48, !50, !52, !54}
