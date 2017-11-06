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
  %ret.i.i34 = alloca i8*, align 8
  %ret.i.i27 = alloca i8*, align 8
  %ret.i.i = alloca i8*, align 8
  %Packed_B = alloca [256 x [256 x [8 x double]]], align 64
  %Packed_A = alloca [24 x [256 x [4 x double]]], align 64
  %0 = bitcast i8** %ret.i.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %0) #5
  store i8* null, i8** %ret.i.i, align 8, !tbaa !2
  %call.i.i = call i32 @posix_memalign(i8** nonnull %ret.i.i, i64 4096, i64 36800000) #5
  %1 = load i8*, i8** %ret.i.i, align 8, !tbaa !2
  %tobool.i.i = icmp eq i8* %1, null
  %tobool2.i.i = icmp ne i32 %call.i.i, 0
  %or.cond.i.i = or i1 %tobool2.i.i, %tobool.i.i
  br i1 %or.cond.i.i, label %if.then.i.i, label %polybench_alloc_data.exit

if.then.i.i:                                      ; preds = %entry
  call void @exit(i32 1) #6
  unreachable

polybench_alloc_data.exit:                        ; preds = %entry
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %0) #5
  %2 = bitcast i8** %ret.i.i27 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %2) #5
  store i8* null, i8** %ret.i.i27, align 8, !tbaa !2
  %call.i.i28 = call i32 @posix_memalign(i8** nonnull %ret.i.i27, i64 4096, i64 41600000) #5
  %3 = load i8*, i8** %ret.i.i27, align 8, !tbaa !2
  %tobool.i.i29 = icmp eq i8* %3, null
  %tobool2.i.i30 = icmp ne i32 %call.i.i28, 0
  %or.cond.i.i31 = or i1 %tobool2.i.i30, %tobool.i.i29
  br i1 %or.cond.i.i31, label %if.then.i.i32, label %polybench_alloc_data.exit33

if.then.i.i32:                                    ; preds = %polybench_alloc_data.exit
  call void @exit(i32 1) #6
  unreachable

polybench_alloc_data.exit33:                      ; preds = %polybench_alloc_data.exit
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %2) #5
  %4 = bitcast i8** %ret.i.i34 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %4) #5
  store i8* null, i8** %ret.i.i34, align 8, !tbaa !2
  %call.i.i35 = call i32 @posix_memalign(i8** nonnull %ret.i.i34, i64 4096, i64 47840000) #5
  %5 = load i8*, i8** %ret.i.i34, align 8, !tbaa !2
  %tobool.i.i36 = icmp eq i8* %5, null
  %tobool2.i.i37 = icmp ne i32 %call.i.i35, 0
  %or.cond.i.i38 = or i1 %tobool2.i.i37, %tobool.i.i36
  br i1 %or.cond.i.i38, label %if.then.i.i39, label %polybench_alloc_data.exit40

if.then.i.i39:                                    ; preds = %polybench_alloc_data.exit33
  call void @exit(i32 1) #6
  unreachable

polybench_alloc_data.exit40:                      ; preds = %polybench_alloc_data.exit33
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %4) #5
  %arraydecay = bitcast i8* %1 to [2300 x double]*
  %arraydecay3 = bitcast i8* %3 to [2600 x double]*
  %polly.access.cast. = bitcast i8* %3 to double*
  %polly.access. = getelementptr i8, i8* %3, i64 41600000
  %polly.access.cast.49 = bitcast i8* %5 to double*
  %6 = icmp ule i8* %polly.access., %5
  %polly.access.68 = getelementptr i8, i8* %5, i64 47840000
  %7 = icmp ule i8* %polly.access.68, %3
  %8 = or i1 %6, %7
  %polly.access.88 = getelementptr i8, i8* %1, i64 36800000
  %9 = icmp ule i8* %polly.access.88, %5
  %10 = icmp ule i8* %polly.access.68, %1
  %11 = or i1 %9, %10
  %12 = and i1 %8, %11
  %13 = icmp ule i8* %polly.access.88, %3
  %14 = icmp ule i8* %polly.access., %1
  %15 = or i1 %13, %14
  %16 = and i1 %15, %12
  br i1 %16, label %polly.loop_header, label %for.cond1.preheader.i

for.cond1.preheader.i:                            ; preds = %polybench_alloc_data.exit40, %for.inc7.i
  %indvars.iv24.i = phi i64 [ %indvars.iv.next25.i, %for.inc7.i ], [ 0, %polybench_alloc_data.exit40 ]
  br label %for.body3.i

for.body3.i:                                      ; preds = %for.body3.i, %for.cond1.preheader.i
  %indvars.iv19.i = phi i64 [ 0, %for.cond1.preheader.i ], [ %indvars.iv.next20.i, %for.body3.i ]
  %17 = mul nuw nsw i64 %indvars.iv19.i, %indvars.iv24.i
  %18 = add nuw nsw i64 %17, 1
  %19 = trunc i64 %18 to i32
  %rem.i = srem i32 %19, 2000
  %conv.i = sitofp i32 %rem.i to double
  %div.i = fmul fast double %conv.i, 5.000000e-04
  %arrayidx6.i = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay, i64 %indvars.iv24.i, i64 %indvars.iv19.i
  store double %div.i, double* %arrayidx6.i, align 8, !tbaa !6, !alias.scope !8, !noalias !11
  %indvars.iv.next20.i = add nuw nsw i64 %indvars.iv19.i, 1
  %exitcond23.i = icmp eq i64 %indvars.iv.next20.i, 2300
  br i1 %exitcond23.i, label %for.inc7.i, label %for.body3.i

for.inc7.i:                                       ; preds = %for.body3.i
  %indvars.iv.next25.i = add nuw nsw i64 %indvars.iv24.i, 1
  %exitcond26.i = icmp eq i64 %indvars.iv.next25.i, 2000
  br i1 %exitcond26.i, label %for.cond14.preheader.i, label %for.cond1.preheader.i

for.cond14.preheader.i:                           ; preds = %for.inc7.i, %for.inc31.i
  %indvars.iv16.i = phi i64 [ %indvars.iv.next17.i, %for.inc31.i ], [ 0, %for.inc7.i ]
  br label %for.body17.i

for.body17.i:                                     ; preds = %for.body17.i, %for.cond14.preheader.i
  %indvars.iv12.i = phi i64 [ 0, %for.cond14.preheader.i ], [ %indvars.iv.next13.i, %for.body17.i ]
  %indvars.iv.next13.i = add nuw nsw i64 %indvars.iv12.i, 1
  %20 = mul nuw nsw i64 %indvars.iv.next13.i, %indvars.iv16.i
  %21 = trunc i64 %20 to i32
  %rem20.i = srem i32 %21, 2600
  %conv21.i = sitofp i32 %rem20.i to double
  %div23.i = fmul fast double %conv21.i, 0x3F3934C67F9B2CE6
  %arrayidx27.i = getelementptr inbounds [2600 x double], [2600 x double]* %arraydecay3, i64 %indvars.iv16.i, i64 %indvars.iv12.i
  store double %div23.i, double* %arrayidx27.i, align 8, !tbaa !6, !alias.scope !14, !noalias !15
  %exitcond15.i = icmp eq i64 %indvars.iv.next13.i, 2600
  br i1 %exitcond15.i, label %for.inc31.i, label %for.body17.i

for.inc31.i:                                      ; preds = %for.body17.i
  %indvars.iv.next17.i = add nuw nsw i64 %indvars.iv16.i, 1
  %exitcond18.i = icmp eq i64 %indvars.iv.next17.i, 2000
  br i1 %exitcond18.i, label %for.cond38.preheader.i.preheader, label %for.cond14.preheader.i

for.cond38.preheader.i.preheader:                 ; preds = %for.inc31.i
  %arraydecay4 = bitcast i8* %5 to [2300 x double]*
  br label %for.cond38.preheader.i

for.cond38.preheader.i:                           ; preds = %for.cond38.preheader.i.preheader, %for.inc55.i
  %indvars.iv9.i = phi i64 [ %indvars.iv.next10.i, %for.inc55.i ], [ 0, %for.cond38.preheader.i.preheader ]
  br label %for.body41.i

for.body41.i:                                     ; preds = %for.body41.i, %for.cond38.preheader.i
  %indvars.iv.i = phi i64 [ 0, %for.cond38.preheader.i ], [ %indvars.iv.next.i, %for.body41.i ]
  %22 = add nuw nsw i64 %indvars.iv.i, 2
  %23 = mul nuw nsw i64 %22, %indvars.iv9.i
  %24 = trunc i64 %23 to i32
  %rem44.i = srem i32 %24, 2300
  %conv45.i = sitofp i32 %rem44.i to double
  %div47.i = fmul fast double %conv45.i, 0x3F3C7E7115D0CE95
  %arrayidx51.i = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay4, i64 %indvars.iv9.i, i64 %indvars.iv.i
  store double %div47.i, double* %arrayidx51.i, align 8, !tbaa !6, !alias.scope !16, !noalias !17
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  %exitcond.i = icmp eq i64 %indvars.iv.next.i, 2300
  br i1 %exitcond.i, label %for.inc55.i, label %for.body41.i

for.inc55.i:                                      ; preds = %for.body41.i
  %indvars.iv.next10.i = add nuw nsw i64 %indvars.iv9.i, 1
  %exitcond11.i = icmp eq i64 %indvars.iv.next10.i, 2600
  br i1 %exitcond11.i, label %for.cond1.preheader.i41, label %for.cond38.preheader.i

for.cond1.preheader.i41:                          ; preds = %for.inc55.i, %for.inc32.i
  %indvars.iv11.i = phi i64 [ %indvars.iv.next12.i, %for.inc32.i ], [ 0, %for.inc55.i ]
  br label %for.body3.i45

for.body3.i45:                                    ; preds = %for.body3.i45, %for.cond1.preheader.i41
  %indvars.iv.i42 = phi i64 [ 0, %for.cond1.preheader.i41 ], [ %indvars.iv.next.i43, %for.body3.i45 ]
  %arrayidx5.i = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay, i64 %indvars.iv11.i, i64 %indvars.iv.i42
  %25 = load double, double* %arrayidx5.i, align 8, !tbaa !6, !alias.scope !18, !noalias !21
  %mul.i = fmul fast double %25, 1.200000e+00
  store double %mul.i, double* %arrayidx5.i, align 8, !tbaa !6, !alias.scope !18, !noalias !21
  %indvars.iv.next.i43 = add nuw nsw i64 %indvars.iv.i42, 1
  %exitcond.i44 = icmp eq i64 %indvars.iv.next.i43, 2300
  br i1 %exitcond.i44, label %for.cond9.preheader.i, label %for.body3.i45

for.cond9.preheader.i:                            ; preds = %for.body3.i45, %for.inc29.i
  %indvars.iv8.i = phi i64 [ %indvars.iv.next9.i, %for.inc29.i ], [ 0, %for.body3.i45 ]
  %arrayidx15.i = getelementptr inbounds [2600 x double], [2600 x double]* %arraydecay3, i64 %indvars.iv11.i, i64 %indvars.iv8.i
  %26 = load double, double* %arrayidx15.i, align 8, !tbaa !6, !alias.scope !24, !noalias !25
  %mul16.i = fmul fast double %26, 1.500000e+00
  br label %for.body11.i

for.body11.i:                                     ; preds = %for.body11.i, %for.cond9.preheader.i
  %indvars.iv5.i = phi i64 [ 0, %for.cond9.preheader.i ], [ %indvars.iv.next6.i, %for.body11.i ]
  %arrayidx20.i = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay4, i64 %indvars.iv8.i, i64 %indvars.iv5.i
  %27 = load double, double* %arrayidx20.i, align 8, !tbaa !6, !alias.scope !26, !noalias !27
  %mul21.i = fmul fast double %mul16.i, %27
  %arrayidx25.i = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay, i64 %indvars.iv11.i, i64 %indvars.iv5.i
  %28 = load double, double* %arrayidx25.i, align 8, !tbaa !6, !alias.scope !18, !noalias !21
  %add.i = fadd fast double %28, %mul21.i
  store double %add.i, double* %arrayidx25.i, align 8, !tbaa !6, !alias.scope !18, !noalias !21
  %indvars.iv.next6.i = add nuw nsw i64 %indvars.iv5.i, 1
  %exitcond7.i = icmp eq i64 %indvars.iv.next6.i, 2300
  br i1 %exitcond7.i, label %for.inc29.i, label %for.body11.i

for.inc29.i:                                      ; preds = %for.body11.i
  %indvars.iv.next9.i = add nuw nsw i64 %indvars.iv8.i, 1
  %exitcond10.i = icmp eq i64 %indvars.iv.next9.i, 2600
  br i1 %exitcond10.i, label %for.inc32.i, label %for.cond9.preheader.i

for.inc32.i:                                      ; preds = %for.inc29.i
  %indvars.iv.next12.i = add nuw nsw i64 %indvars.iv11.i, 1
  %exitcond13.i = icmp eq i64 %indvars.iv.next12.i, 2000
  br i1 %exitcond13.i, label %kernel_gemm.exit, label %for.cond1.preheader.i41

kernel_gemm.exit:                                 ; preds = %for.inc32.i, %polly.loop_exit264
  call void @free(i8* nonnull %1) #5
  call void @free(i8* %3) #5
  call void @free(i8* nonnull %5) #5
  ret i32 0

polly.loop_header:                                ; preds = %polybench_alloc_data.exit40, %polly.loop_exit161
  %polly.indvar = phi i64 [ %polly.indvar_next, %polly.loop_exit161 ], [ 0, %polybench_alloc_data.exit40 ]
  %29 = mul nsw i64 %polly.indvar, -32
  %30 = add nsw i64 %29, 2599
  %31 = icmp slt i64 %30, 31
  %32 = select i1 %31, i64 %30, i64 31
  %33 = shl nsw i64 %polly.indvar, 5
  br label %polly.loop_header159

polly.loop_exit161:                               ; preds = %polly.loop_exit167
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond1057 = icmp eq i64 %polly.indvar_next, 82
  br i1 %exitcond1057, label %polly.loop_header178, label %polly.loop_header

polly.loop_header159:                             ; preds = %polly.loop_exit167, %polly.loop_header
  %polly.indvar162 = phi i64 [ 0, %polly.loop_header ], [ %polly.indvar_next163, %polly.loop_exit167 ]
  %34 = mul nsw i64 %polly.indvar162, -32
  %35 = add nsw i64 %34, 2299
  %36 = icmp slt i64 %35, 31
  %37 = select i1 %36, i64 %35, i64 31
  %38 = shl nsw i64 %polly.indvar162, 5
  br label %polly.loop_header165

polly.loop_exit167:                               ; preds = %polly.loop_exit173
  %polly.indvar_next163 = add nuw nsw i64 %polly.indvar162, 1
  %exitcond1056 = icmp eq i64 %polly.indvar_next163, 72
  br i1 %exitcond1056, label %polly.loop_exit161, label %polly.loop_header159

polly.loop_header165:                             ; preds = %polly.loop_exit173, %polly.loop_header159
  %polly.indvar168 = phi i64 [ 0, %polly.loop_header159 ], [ %polly.indvar_next169, %polly.loop_exit173 ]
  %39 = add nuw nsw i64 %polly.indvar168, %33
  %40 = trunc i64 %39 to i32
  %41 = mul nuw nsw i64 %39, 18400
  br label %polly.loop_header171

polly.loop_exit173:                               ; preds = %polly.loop_header171
  %polly.indvar_next169 = add nuw nsw i64 %polly.indvar168, 1
  %polly.loop_cond170 = icmp slt i64 %polly.indvar168, %32
  br i1 %polly.loop_cond170, label %polly.loop_header165, label %polly.loop_exit167

polly.loop_header171:                             ; preds = %polly.loop_header171, %polly.loop_header165
  %polly.indvar174 = phi i64 [ 0, %polly.loop_header165 ], [ %polly.indvar_next175, %polly.loop_header171 ]
  %42 = add nuw nsw i64 %polly.indvar174, %38
  %43 = trunc i64 %42 to i32
  %44 = add i32 %43, 2
  %45 = mul i32 %44, %40
  %p_rem44.i = srem i32 %45, 2300
  %p_conv45.i = sitofp i32 %p_rem44.i to double
  %p_div47.i = fmul fast double %p_conv45.i, 0x3F3C7E7115D0CE95
  %46 = shl i64 %42, 3
  %47 = add nuw nsw i64 %46, %41
  %scevgep = getelementptr i8, i8* %5, i64 %47
  %scevgep177 = bitcast i8* %scevgep to double*
  store double %p_div47.i, double* %scevgep177, align 8, !alias.scope !28, !noalias !30
  %polly.indvar_next175 = add nuw nsw i64 %polly.indvar174, 1
  %polly.loop_cond176 = icmp slt i64 %polly.indvar174, %37
  br i1 %polly.loop_cond176, label %polly.loop_header171, label %polly.loop_exit173

polly.loop_header178:                             ; preds = %polly.loop_exit161, %polly.loop_exit186
  %polly.indvar181 = phi i64 [ %polly.indvar_next182, %polly.loop_exit186 ], [ 0, %polly.loop_exit161 ]
  %48 = mul nsw i64 %polly.indvar181, -32
  %49 = add nsw i64 %48, 1999
  %50 = icmp slt i64 %49, 31
  %51 = select i1 %50, i64 %49, i64 31
  %52 = shl nsw i64 %polly.indvar181, 5
  br label %polly.loop_header184

polly.loop_exit186:                               ; preds = %polly.loop_exit192
  %polly.indvar_next182 = add nuw nsw i64 %polly.indvar181, 1
  %exitcond1055 = icmp eq i64 %polly.indvar_next182, 63
  br i1 %exitcond1055, label %polly.loop_header204, label %polly.loop_header178

polly.loop_header184:                             ; preds = %polly.loop_exit192, %polly.loop_header178
  %polly.indvar187 = phi i64 [ 0, %polly.loop_header178 ], [ %polly.indvar_next188, %polly.loop_exit192 ]
  %53 = mul nsw i64 %polly.indvar187, -32
  %54 = add nsw i64 %53, 2299
  %55 = icmp slt i64 %54, 31
  %56 = select i1 %55, i64 %54, i64 31
  %57 = shl nsw i64 %polly.indvar187, 5
  br label %polly.loop_header190

polly.loop_exit192:                               ; preds = %polly.loop_exit198
  %polly.indvar_next188 = add nuw nsw i64 %polly.indvar187, 1
  %exitcond1054 = icmp eq i64 %polly.indvar_next188, 72
  br i1 %exitcond1054, label %polly.loop_exit186, label %polly.loop_header184

polly.loop_header190:                             ; preds = %polly.loop_exit198, %polly.loop_header184
  %polly.indvar193 = phi i64 [ 0, %polly.loop_header184 ], [ %polly.indvar_next194, %polly.loop_exit198 ]
  %58 = add nuw nsw i64 %polly.indvar193, %52
  %59 = trunc i64 %58 to i32
  %60 = mul nuw nsw i64 %58, 18400
  br label %polly.loop_header196

polly.loop_exit198:                               ; preds = %polly.loop_header196
  %polly.indvar_next194 = add nuw nsw i64 %polly.indvar193, 1
  %polly.loop_cond195 = icmp slt i64 %polly.indvar193, %51
  br i1 %polly.loop_cond195, label %polly.loop_header190, label %polly.loop_exit192

polly.loop_header196:                             ; preds = %polly.loop_header196, %polly.loop_header190
  %polly.indvar199 = phi i64 [ 0, %polly.loop_header190 ], [ %polly.indvar_next200, %polly.loop_header196 ]
  %61 = add nuw nsw i64 %polly.indvar199, %57
  %62 = trunc i64 %61 to i32
  %63 = mul i32 %62, %59
  %64 = add i32 %63, 1
  %p_rem.i = srem i32 %64, 2000
  %p_conv.i = sitofp i32 %p_rem.i to double
  %p_div.i = fmul fast double %p_conv.i, 5.000000e-04
  %65 = shl i64 %61, 3
  %66 = add nuw nsw i64 %65, %60
  %scevgep202 = getelementptr i8, i8* %1, i64 %66
  %scevgep202203 = bitcast i8* %scevgep202 to double*
  store double %p_div.i, double* %scevgep202203, align 8, !alias.scope !31, !noalias !36
  %polly.indvar_next200 = add nuw nsw i64 %polly.indvar199, 1
  %polly.loop_cond201 = icmp slt i64 %polly.indvar199, %56
  br i1 %polly.loop_cond201, label %polly.loop_header196, label %polly.loop_exit198

polly.loop_header204:                             ; preds = %polly.loop_exit186, %polly.loop_exit212
  %polly.indvar207 = phi i64 [ %polly.indvar_next208, %polly.loop_exit212 ], [ 0, %polly.loop_exit186 ]
  %67 = mul nsw i64 %polly.indvar207, -32
  %68 = add nsw i64 %67, 1999
  %69 = icmp slt i64 %68, 31
  %70 = select i1 %69, i64 %68, i64 31
  %71 = shl i64 %polly.indvar207, 5
  br label %polly.loop_header210

polly.loop_exit212:                               ; preds = %polly.loop_exit218
  %polly.indvar_next208 = add nuw nsw i64 %polly.indvar207, 1
  %exitcond1053 = icmp eq i64 %polly.indvar_next208, 63
  br i1 %exitcond1053, label %polly.loop_header230, label %polly.loop_header204

polly.loop_header210:                             ; preds = %polly.loop_exit218, %polly.loop_header204
  %polly.indvar213 = phi i64 [ 0, %polly.loop_header204 ], [ %polly.indvar_next214, %polly.loop_exit218 ]
  %72 = mul nsw i64 %polly.indvar213, -32
  %73 = add nsw i64 %72, 2299
  %74 = icmp slt i64 %73, 31
  %75 = select i1 %74, i64 %73, i64 31
  %76 = shl i64 %polly.indvar213, 5
  br label %polly.loop_header216

polly.loop_exit218:                               ; preds = %polly.loop_exit224
  %polly.indvar_next214 = add nuw nsw i64 %polly.indvar213, 1
  %exitcond1052 = icmp eq i64 %polly.indvar_next214, 72
  br i1 %exitcond1052, label %polly.loop_exit212, label %polly.loop_header210

polly.loop_header216:                             ; preds = %polly.loop_exit224, %polly.loop_header210
  %polly.indvar219 = phi i64 [ 0, %polly.loop_header210 ], [ %polly.indvar_next220, %polly.loop_exit224 ]
  %77 = add nuw nsw i64 %polly.indvar219, %71
  %78 = mul nuw nsw i64 %77, 18400
  br label %polly.loop_header222

polly.loop_exit224:                               ; preds = %polly.loop_header222
  %polly.indvar_next220 = add nuw nsw i64 %polly.indvar219, 1
  %polly.loop_cond221 = icmp slt i64 %polly.indvar219, %70
  br i1 %polly.loop_cond221, label %polly.loop_header216, label %polly.loop_exit218

polly.loop_header222:                             ; preds = %polly.loop_header222, %polly.loop_header216
  %polly.indvar225 = phi i64 [ 0, %polly.loop_header216 ], [ %polly.indvar_next226, %polly.loop_header222 ]
  %79 = add nuw nsw i64 %polly.indvar225, %76
  %80 = shl i64 %79, 3
  %81 = add nuw nsw i64 %80, %78
  %scevgep228 = getelementptr i8, i8* %1, i64 %81
  %scevgep228229 = bitcast i8* %scevgep228 to double*
  %_p_scalar_ = load double, double* %scevgep228229, align 8, !alias.scope !31, !noalias !36
  %p_mul.i = fmul fast double %_p_scalar_, 1.200000e+00
  store double %p_mul.i, double* %scevgep228229, align 8, !alias.scope !31, !noalias !36
  %polly.indvar_next226 = add nuw nsw i64 %polly.indvar225, 1
  %polly.loop_cond227 = icmp slt i64 %polly.indvar225, %75
  br i1 %polly.loop_cond227, label %polly.loop_header222, label %polly.loop_exit224

polly.loop_header230:                             ; preds = %polly.loop_exit212, %polly.loop_exit238
  %polly.indvar233 = phi i64 [ %polly.indvar_next234, %polly.loop_exit238 ], [ 0, %polly.loop_exit212 ]
  %82 = mul nsw i64 %polly.indvar233, -32
  %83 = add nsw i64 %82, 1999
  %84 = icmp slt i64 %83, 31
  %85 = select i1 %84, i64 %83, i64 31
  %86 = shl nsw i64 %polly.indvar233, 5
  br label %polly.loop_header236

polly.loop_exit238:                               ; preds = %polly.loop_exit244
  %polly.indvar_next234 = add nuw nsw i64 %polly.indvar233, 1
  %exitcond1051 = icmp eq i64 %polly.indvar_next234, 63
  br i1 %exitcond1051, label %polly.loop_header256, label %polly.loop_header230

polly.loop_header236:                             ; preds = %polly.loop_exit244, %polly.loop_header230
  %polly.indvar239 = phi i64 [ 0, %polly.loop_header230 ], [ %polly.indvar_next240, %polly.loop_exit244 ]
  %87 = mul nsw i64 %polly.indvar239, -32
  %88 = add nsw i64 %87, 2599
  %89 = icmp slt i64 %88, 31
  %90 = select i1 %89, i64 %88, i64 31
  %91 = shl nsw i64 %polly.indvar239, 5
  br label %polly.loop_header242

polly.loop_exit244:                               ; preds = %polly.loop_exit250
  %polly.indvar_next240 = add nuw nsw i64 %polly.indvar239, 1
  %exitcond1050 = icmp eq i64 %polly.indvar_next240, 82
  br i1 %exitcond1050, label %polly.loop_exit238, label %polly.loop_header236

polly.loop_header242:                             ; preds = %polly.loop_exit250, %polly.loop_header236
  %polly.indvar245 = phi i64 [ 0, %polly.loop_header236 ], [ %polly.indvar_next246, %polly.loop_exit250 ]
  %92 = add nuw nsw i64 %polly.indvar245, %86
  %93 = trunc i64 %92 to i32
  %94 = mul nuw nsw i64 %92, 20800
  br label %polly.loop_header248

polly.loop_exit250:                               ; preds = %polly.loop_header248
  %polly.indvar_next246 = add nuw nsw i64 %polly.indvar245, 1
  %polly.loop_cond247 = icmp slt i64 %polly.indvar245, %85
  br i1 %polly.loop_cond247, label %polly.loop_header242, label %polly.loop_exit244

polly.loop_header248:                             ; preds = %polly.loop_header248, %polly.loop_header242
  %polly.indvar251 = phi i64 [ 0, %polly.loop_header242 ], [ %polly.indvar_next252, %polly.loop_header248 ]
  %95 = add nuw nsw i64 %polly.indvar251, %91
  %96 = trunc i64 %95 to i32
  %97 = add i32 %96, 1
  %98 = mul i32 %97, %93
  %p_rem20.i = srem i32 %98, 2600
  %p_conv21.i = sitofp i32 %p_rem20.i to double
  %p_div23.i = fmul fast double %p_conv21.i, 0x3F3934C67F9B2CE6
  %99 = shl i64 %95, 3
  %100 = add nuw nsw i64 %99, %94
  %scevgep254 = getelementptr i8, i8* %3, i64 %100
  %scevgep254255 = bitcast i8* %scevgep254 to double*
  store double %p_div23.i, double* %scevgep254255, align 8, !alias.scope !32, !noalias !37
  %polly.indvar_next252 = add nuw nsw i64 %polly.indvar251, 1
  %polly.loop_cond253 = icmp slt i64 %polly.indvar251, %90
  br i1 %polly.loop_cond253, label %polly.loop_header248, label %polly.loop_exit250

polly.loop_header256:                             ; preds = %polly.loop_exit238, %polly.loop_exit264
  %polly.indvar259 = phi i64 [ %polly.indvar_next260, %polly.loop_exit264 ], [ 0, %polly.loop_exit238 ]
  %101 = shl nsw i64 %polly.indvar259, 11
  %102 = or i64 %101, 2047
  %103 = icmp slt i64 %102, 2299
  %104 = select i1 %103, i64 %102, i64 2299
  %polly.loop_guard278 = icmp sgt i64 %101, %104
  %105 = mul nuw nsw i64 %polly.indvar259, -256
  %106 = icmp eq i64 %polly.indvar259, 0
  %107 = mul nuw nsw i64 %polly.indvar259, -256
  %108 = add nsw i64 %107, 287
  %109 = icmp slt i64 %108, 255
  %110 = select i1 %109, i64 %108, i64 255
  %111 = shl nsw i64 %polly.indvar259, 11
  %112 = shl i64 %polly.indvar259, 8
  br label %polly.loop_header262

polly.loop_exit264:                               ; preds = %polly.loop_exit290
  %polly.indvar_next260 = add nuw nsw i64 %polly.indvar259, 1
  %exitcond1049 = icmp eq i64 %polly.indvar_next260, 2
  br i1 %exitcond1049, label %kernel_gemm.exit, label %polly.loop_header256

polly.loop_header262:                             ; preds = %polly.loop_exit290, %polly.loop_header256
  %polly.indvar265 = phi i64 [ 0, %polly.loop_header256 ], [ %polly.indvar_next266, %polly.loop_exit290 ]
  %113 = shl nsw i64 %polly.indvar265, 8
  %114 = or i64 %113, 255
  %115 = icmp slt i64 %114, 2599
  %116 = select i1 %115, i64 %114, i64 2599
  %polly.loop_guard = icmp sle i64 %113, %116
  br i1 %polly.loop_guard, label %polly.loop_header268.preheader, label %polly.loop_header288.preheader

polly.loop_header268.preheader:                   ; preds = %polly.loop_header262
  %117 = sub nsw i64 %105, %polly.indvar265
  br i1 %polly.loop_guard278, label %polly.loop_header288.preheader, label %polly.loop_header268

polly.loop_exit290:                               ; preds = %polly.loop_exit320
  %polly.indvar_next266 = add nuw nsw i64 %polly.indvar265, 1
  %exitcond1048 = icmp eq i64 %polly.indvar_next266, 11
  br i1 %exitcond1048, label %polly.loop_exit264, label %polly.loop_header262

polly.loop_header268:                             ; preds = %polly.loop_header268.preheader, %polly.loop_exit277
  %polly.indvar271 = phi i64 [ %polly.indvar_next272, %polly.loop_exit277 ], [ %113, %polly.loop_header268.preheader ]
  %polly.access.mul.283 = mul nuw nsw i64 %polly.indvar271, 2300
  br label %polly.loop_header275

polly.loop_exit277:                               ; preds = %polly.loop_header275
  %polly.indvar_next272 = add nuw nsw i64 %polly.indvar271, 1
  %polly.loop_cond273 = icmp slt i64 %polly.indvar271, %116
  br i1 %polly.loop_cond273, label %polly.loop_header268, label %polly.loop_header288.preheader

polly.loop_header288.preheader:                   ; preds = %polly.loop_exit277, %polly.loop_header268.preheader, %polly.loop_header262
  %118 = mul nsw i64 %polly.indvar265, -256
  %119 = add nsw i64 %118, 2599
  %120 = icmp slt i64 %119, 255
  %121 = select i1 %120, i64 %119, i64 255
  br label %polly.loop_header288

polly.loop_header275:                             ; preds = %polly.loop_header268, %polly.loop_header275
  %polly.indvar279 = phi i64 [ %polly.indvar_next280, %polly.loop_header275 ], [ %101, %polly.loop_header268 ]
  %polly.access.add.284 = add nuw nsw i64 %polly.indvar279, %polly.access.mul.283
  %polly.access.285 = getelementptr double, double* %polly.access.cast.49, i64 %polly.access.add.284
  %122 = bitcast double* %polly.access.285 to i64*
  %polly.access.285.load1021 = load i64, i64* %122, align 8, !alias.scope !28, !noalias !30
  %pexp.p_div_q = lshr i64 %polly.indvar279, 3
  %tmp = add i64 %117, %pexp.p_div_q
  %tmp1022 = shl i64 %tmp, 8
  %polly.access.add.Packed_B = add i64 %tmp1022, %polly.indvar271
  %123 = shl nsw i64 %polly.access.add.Packed_B, 3
  %124 = sub nsw i64 7, %polly.indvar279
  %pexp.pdiv_r = and i64 %124, 7
  %polly.access.mul.Packed_B286 = or i64 %123, %pexp.pdiv_r
  %polly.access.add.Packed_B287 = xor i64 %polly.access.mul.Packed_B286, 7
  %polly.access.Packed_B = getelementptr [256 x [256 x [8 x double]]], [256 x [256 x [8 x double]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B287
  %125 = bitcast double* %polly.access.Packed_B to i64*
  store i64 %polly.access.285.load1021, i64* %125, align 8, !alias.scope !34, !noalias !38
  %polly.indvar_next280 = add nuw nsw i64 %polly.indvar279, 1
  %polly.loop_cond281 = icmp slt i64 %polly.indvar279, %104
  br i1 %polly.loop_cond281, label %polly.loop_header275, label %polly.loop_exit277

polly.loop_header288:                             ; preds = %polly.loop_exit320, %polly.loop_header288.preheader
  %polly.indvar291 = phi i64 [ %polly.indvar_next292, %polly.loop_exit320 ], [ 0, %polly.loop_header288.preheader ]
  br i1 %106, label %polly.then, label %polly.merge

polly.merge:                                      ; preds = %polly.loop_exit305.loopexit.us, %polly.loop_header295.preheader, %polly.then, %polly.loop_header288
  %126 = mul nsw i64 %polly.indvar291, -24
  %127 = add nsw i64 %126, 499
  %128 = icmp slt i64 %127, 23
  %129 = select i1 %128, i64 %127, i64 23
  %130 = mul nuw nsw i64 %polly.indvar291, 96
  br label %polly.loop_header318

polly.loop_exit320:                               ; preds = %polly.loop_exit326
  %polly.indvar_next292 = add nuw nsw i64 %polly.indvar291, 1
  %exitcond = icmp eq i64 %polly.indvar_next292, 21
  br i1 %exitcond, label %polly.loop_exit290, label %polly.loop_header288

polly.then:                                       ; preds = %polly.loop_header288
  %131 = mul nuw nsw i64 %polly.indvar291, 96
  %132 = add nuw nsw i64 %131, 95
  %133 = icmp slt i64 %132, 1999
  %134 = select i1 %133, i64 %132, i64 1999
  %polly.loop_guard298 = icmp sgt i64 %131, %134
  br i1 %polly.loop_guard298, label %polly.merge, label %polly.loop_header295.preheader

polly.loop_header295.preheader:                   ; preds = %polly.then
  %135 = mul nsw i64 %polly.indvar291, -24
  %136 = sub nsw i64 %135, %polly.indvar265
  br i1 %polly.loop_guard, label %polly.loop_header295.us, label %polly.merge

polly.loop_header295.us:                          ; preds = %polly.loop_header295.preheader, %polly.loop_exit305.loopexit.us
  %polly.indvar299.us = phi i64 [ %polly.indvar_next300.us, %polly.loop_exit305.loopexit.us ], [ %131, %polly.loop_header295.preheader ]
  %polly.access.mul.311.us = mul nuw nsw i64 %polly.indvar299.us, 2600
  %pexp.p_div_q314.us = lshr i64 %polly.indvar299.us, 2
  %tmp1024.us = add i64 %136, %pexp.p_div_q314.us
  %tmp1025.us = shl i64 %tmp1024.us, 8
  %137 = sub nsw i64 3, %polly.indvar299.us
  %pexp.pdiv_r316.us = and i64 %137, 3
  br label %polly.loop_header303.us

polly.loop_header303.us:                          ; preds = %polly.loop_header295.us, %polly.loop_header303.us
  %polly.indvar307.us = phi i64 [ %polly.indvar_next308.us, %polly.loop_header303.us ], [ %113, %polly.loop_header295.us ]
  %polly.access.add.312.us = add nuw nsw i64 %polly.indvar307.us, %polly.access.mul.311.us
  %polly.access.313.us = getelementptr double, double* %polly.access.cast., i64 %polly.access.add.312.us
  %138 = bitcast double* %polly.access.313.us to i64*
  %polly.access.313.load1020.us = load i64, i64* %138, align 8, !alias.scope !32, !noalias !37
  %polly.access.add.Packed_A.us = add i64 %polly.indvar307.us, %tmp1025.us
  %139 = shl nsw i64 %polly.access.add.Packed_A.us, 2
  %polly.access.mul.Packed_A315.us = or i64 %139, %pexp.pdiv_r316.us
  %polly.access.add.Packed_A317.us = xor i64 %polly.access.mul.Packed_A315.us, 3
  %polly.access.Packed_A.us = getelementptr [24 x [256 x [4 x double]]], [24 x [256 x [4 x double]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A317.us
  %140 = bitcast double* %polly.access.Packed_A.us to i64*
  store i64 %polly.access.313.load1020.us, i64* %140, align 8, !alias.scope !35, !noalias !39
  %polly.indvar_next308.us = add nuw nsw i64 %polly.indvar307.us, 1
  %polly.loop_cond309.us = icmp slt i64 %polly.indvar307.us, %116
  br i1 %polly.loop_cond309.us, label %polly.loop_header303.us, label %polly.loop_exit305.loopexit.us

polly.loop_exit305.loopexit.us:                   ; preds = %polly.loop_header303.us
  %polly.indvar_next300.us = add nuw nsw i64 %polly.indvar299.us, 1
  %polly.loop_cond301.us = icmp slt i64 %polly.indvar299.us, %134
  br i1 %polly.loop_cond301.us, label %polly.loop_header295.us, label %polly.merge

polly.loop_header318:                             ; preds = %polly.loop_exit326, %polly.merge
  %polly.indvar321 = phi i64 [ 0, %polly.merge ], [ %polly.indvar_next322, %polly.loop_exit326 ]
  %141 = shl nsw i64 %polly.indvar321, 3
  %142 = add nuw nsw i64 %141, %111
  %polly.access.mul.Packed_B344 = shl i64 %polly.indvar321, 8
  %143 = shl i64 %142, 3
  %144 = shl i64 %142, 3
  %145 = or i64 %144, 8
  %146 = shl i64 %142, 3
  %147 = or i64 %146, 16
  %148 = shl i64 %142, 3
  %149 = or i64 %148, 24
  %150 = add nuw nsw i64 %polly.indvar321, %112
  %151 = icmp slt i64 %150, 287
  %152 = shl i64 %142, 3
  %153 = or i64 %152, 32
  %154 = shl i64 %142, 3
  %155 = or i64 %154, 40
  %156 = shl i64 %142, 3
  %157 = or i64 %156, 48
  %158 = shl i64 %142, 3
  %159 = or i64 %158, 56
  %160 = shl i64 %142, 3
  %161 = or i64 %160, 32
  %162 = shl i64 %142, 3
  %163 = or i64 %162, 40
  %164 = shl i64 %142, 3
  %165 = or i64 %164, 48
  %166 = shl i64 %142, 3
  %167 = or i64 %166, 56
  %168 = shl i64 %142, 3
  %169 = or i64 %168, 32
  %170 = shl i64 %142, 3
  %171 = or i64 %170, 40
  %172 = shl i64 %142, 3
  %173 = or i64 %172, 48
  %174 = shl i64 %142, 3
  %175 = or i64 %174, 56
  %176 = shl i64 %142, 3
  %177 = or i64 %176, 32
  %178 = shl i64 %142, 3
  %179 = or i64 %178, 40
  %180 = shl i64 %142, 3
  %181 = or i64 %180, 48
  %182 = shl i64 %142, 3
  %183 = or i64 %182, 56
  br label %polly.loop_header324

polly.loop_exit326:                               ; preds = %polly.loop_exit332
  %polly.indvar_next322 = add nuw nsw i64 %polly.indvar321, 1
  %polly.loop_cond323 = icmp slt i64 %polly.indvar321, %110
  br i1 %polly.loop_cond323, label %polly.loop_header318, label %polly.loop_exit320

polly.loop_header324:                             ; preds = %polly.loop_exit332, %polly.loop_header318
  %polly.indvar327 = phi i64 [ 0, %polly.loop_header318 ], [ %polly.indvar_next328, %polly.loop_exit332 ]
  %184 = shl nsw i64 %polly.indvar327, 2
  %185 = add nuw nsw i64 %184, %130
  %polly.access.mul.Packed_A337 = shl i64 %polly.indvar327, 8
  %186 = mul nuw nsw i64 %185, 18400
  %187 = add nuw nsw i64 %186, %143
  %scevgep350 = getelementptr i8, i8* %1, i64 %187
  %scevgep350351 = bitcast i8* %scevgep350 to double*
  %188 = add nuw nsw i64 %186, %145
  %scevgep370 = getelementptr i8, i8* %1, i64 %188
  %scevgep370371 = bitcast i8* %scevgep370 to double*
  %189 = add nuw nsw i64 %186, %147
  %scevgep391 = getelementptr i8, i8* %1, i64 %189
  %scevgep391392 = bitcast i8* %scevgep391 to double*
  %190 = add nuw nsw i64 %186, %149
  %scevgep412 = getelementptr i8, i8* %1, i64 %190
  %scevgep412413 = bitcast i8* %scevgep412 to double*
  %191 = add nuw nsw i64 %186, %153
  %scevgep437 = getelementptr i8, i8* %1, i64 %191
  %scevgep437438 = bitcast i8* %scevgep437 to double*
  %192 = add nuw nsw i64 %186, %155
  %scevgep458 = getelementptr i8, i8* %1, i64 %192
  %scevgep458459 = bitcast i8* %scevgep458 to double*
  %193 = add nuw nsw i64 %186, %157
  %scevgep479 = getelementptr i8, i8* %1, i64 %193
  %scevgep479480 = bitcast i8* %scevgep479 to double*
  %194 = add nuw nsw i64 %186, %159
  %scevgep500 = getelementptr i8, i8* %1, i64 %194
  %scevgep500501 = bitcast i8* %scevgep500 to double*
  %195 = or i64 %185, 1
  %196 = mul nuw nsw i64 %195, 18400
  %197 = add nuw nsw i64 %196, %143
  %scevgep521 = getelementptr i8, i8* %1, i64 %197
  %scevgep521522 = bitcast i8* %scevgep521 to double*
  %198 = add nuw nsw i64 %196, %145
  %scevgep542 = getelementptr i8, i8* %1, i64 %198
  %scevgep542543 = bitcast i8* %scevgep542 to double*
  %199 = add nuw nsw i64 %196, %147
  %scevgep563 = getelementptr i8, i8* %1, i64 %199
  %scevgep563564 = bitcast i8* %scevgep563 to double*
  %200 = add nuw nsw i64 %196, %149
  %scevgep584 = getelementptr i8, i8* %1, i64 %200
  %scevgep584585 = bitcast i8* %scevgep584 to double*
  %201 = add nuw nsw i64 %196, %161
  %scevgep609 = getelementptr i8, i8* %1, i64 %201
  %scevgep609610 = bitcast i8* %scevgep609 to double*
  %202 = add nuw nsw i64 %196, %163
  %scevgep630 = getelementptr i8, i8* %1, i64 %202
  %scevgep630631 = bitcast i8* %scevgep630 to double*
  %203 = add nuw nsw i64 %196, %165
  %scevgep651 = getelementptr i8, i8* %1, i64 %203
  %scevgep651652 = bitcast i8* %scevgep651 to double*
  %204 = add nuw nsw i64 %196, %167
  %scevgep672 = getelementptr i8, i8* %1, i64 %204
  %scevgep672673 = bitcast i8* %scevgep672 to double*
  %205 = or i64 %185, 2
  %206 = mul nuw nsw i64 %205, 18400
  %207 = add nuw nsw i64 %206, %143
  %scevgep693 = getelementptr i8, i8* %1, i64 %207
  %scevgep693694 = bitcast i8* %scevgep693 to double*
  %208 = add nuw nsw i64 %206, %145
  %scevgep714 = getelementptr i8, i8* %1, i64 %208
  %scevgep714715 = bitcast i8* %scevgep714 to double*
  %209 = add nuw nsw i64 %206, %147
  %scevgep735 = getelementptr i8, i8* %1, i64 %209
  %scevgep735736 = bitcast i8* %scevgep735 to double*
  %210 = add nuw nsw i64 %206, %149
  %scevgep756 = getelementptr i8, i8* %1, i64 %210
  %scevgep756757 = bitcast i8* %scevgep756 to double*
  %211 = add nuw nsw i64 %206, %169
  %scevgep781 = getelementptr i8, i8* %1, i64 %211
  %scevgep781782 = bitcast i8* %scevgep781 to double*
  %212 = add nuw nsw i64 %206, %171
  %scevgep802 = getelementptr i8, i8* %1, i64 %212
  %scevgep802803 = bitcast i8* %scevgep802 to double*
  %213 = add nuw nsw i64 %206, %173
  %scevgep823 = getelementptr i8, i8* %1, i64 %213
  %scevgep823824 = bitcast i8* %scevgep823 to double*
  %214 = add nuw nsw i64 %206, %175
  %scevgep844 = getelementptr i8, i8* %1, i64 %214
  %scevgep844845 = bitcast i8* %scevgep844 to double*
  %215 = or i64 %185, 3
  %216 = mul nuw nsw i64 %215, 18400
  %217 = add nuw nsw i64 %216, %143
  %scevgep865 = getelementptr i8, i8* %1, i64 %217
  %scevgep865866 = bitcast i8* %scevgep865 to double*
  %218 = add nuw nsw i64 %216, %145
  %scevgep886 = getelementptr i8, i8* %1, i64 %218
  %scevgep886887 = bitcast i8* %scevgep886 to double*
  %219 = add nuw nsw i64 %216, %147
  %scevgep907 = getelementptr i8, i8* %1, i64 %219
  %scevgep907908 = bitcast i8* %scevgep907 to double*
  %220 = add nuw nsw i64 %216, %149
  %scevgep928 = getelementptr i8, i8* %1, i64 %220
  %scevgep928929 = bitcast i8* %scevgep928 to double*
  %221 = add nuw nsw i64 %216, %177
  %scevgep953 = getelementptr i8, i8* %1, i64 %221
  %scevgep953954 = bitcast i8* %scevgep953 to double*
  %222 = add nuw nsw i64 %216, %179
  %scevgep974 = getelementptr i8, i8* %1, i64 %222
  %scevgep974975 = bitcast i8* %scevgep974 to double*
  %223 = add nuw nsw i64 %216, %181
  %scevgep995 = getelementptr i8, i8* %1, i64 %223
  %scevgep995996 = bitcast i8* %scevgep995 to double*
  %224 = add nuw nsw i64 %216, %183
  %scevgep1016 = getelementptr i8, i8* %1, i64 %224
  %scevgep10161017 = bitcast i8* %scevgep1016 to double*
  %scevgep350351.promoted = load double, double* %scevgep350351, align 8, !alias.scope !40, !noalias !36
  %scevgep370371.promoted = load double, double* %scevgep370371, align 8, !alias.scope !41, !noalias !42
  %scevgep391392.promoted = load double, double* %scevgep391392, align 8, !alias.scope !43, !noalias !44
  %scevgep412413.promoted = load double, double* %scevgep412413, align 8, !alias.scope !45, !noalias !46
  %scevgep521522.promoted = load double, double* %scevgep521522, align 8, !alias.scope !47, !noalias !48
  %scevgep542543.promoted = load double, double* %scevgep542543, align 8, !alias.scope !53, !noalias !54
  %scevgep563564.promoted = load double, double* %scevgep563564, align 8, !alias.scope !55, !noalias !56
  %scevgep584585.promoted = load double, double* %scevgep584585, align 8, !alias.scope !57, !noalias !58
  %scevgep693694.promoted = load double, double* %scevgep693694, align 8, !alias.scope !59, !noalias !60
  %scevgep714715.promoted = load double, double* %scevgep714715, align 8, !alias.scope !65, !noalias !66
  %scevgep735736.promoted = load double, double* %scevgep735736, align 8, !alias.scope !67, !noalias !68
  %scevgep756757.promoted = load double, double* %scevgep756757, align 8, !alias.scope !69, !noalias !70
  %scevgep865866.promoted = load double, double* %scevgep865866, align 8, !alias.scope !71, !noalias !72
  %scevgep886887.promoted = load double, double* %scevgep886887, align 8, !alias.scope !77, !noalias !78
  %scevgep907908.promoted = load double, double* %scevgep907908, align 8, !alias.scope !79, !noalias !80
  %scevgep928929.promoted = load double, double* %scevgep928929, align 8, !alias.scope !81, !noalias !82
  br label %polly.loop_header330

polly.loop_exit332:                               ; preds = %polly.merge933
  store double %p_add.i, double* %scevgep350351, align 8, !alias.scope !40, !noalias !36
  store double %p_add.i373, double* %scevgep370371, align 8, !alias.scope !41, !noalias !42
  store double %p_add.i394, double* %scevgep391392, align 8, !alias.scope !43, !noalias !44
  store double %p_add.i415, double* %scevgep412413, align 8, !alias.scope !45, !noalias !46
  store double %p_add.i524, double* %scevgep521522, align 8, !alias.scope !47, !noalias !48
  store double %p_add.i545, double* %scevgep542543, align 8, !alias.scope !53, !noalias !54
  store double %p_add.i566, double* %scevgep563564, align 8, !alias.scope !55, !noalias !56
  store double %p_add.i587, double* %scevgep584585, align 8, !alias.scope !57, !noalias !58
  store double %p_add.i696, double* %scevgep693694, align 8, !alias.scope !59, !noalias !60
  store double %p_add.i717, double* %scevgep714715, align 8, !alias.scope !65, !noalias !66
  store double %p_add.i738, double* %scevgep735736, align 8, !alias.scope !67, !noalias !68
  store double %p_add.i759, double* %scevgep756757, align 8, !alias.scope !69, !noalias !70
  store double %p_add.i868, double* %scevgep865866, align 8, !alias.scope !71, !noalias !72
  store double %p_add.i889, double* %scevgep886887, align 8, !alias.scope !77, !noalias !78
  store double %p_add.i910, double* %scevgep907908, align 8, !alias.scope !79, !noalias !80
  store double %p_add.i931, double* %scevgep928929, align 8, !alias.scope !81, !noalias !82
  %polly.indvar_next328 = add nuw nsw i64 %polly.indvar327, 1
  %polly.loop_cond329 = icmp slt i64 %polly.indvar327, %129
  br i1 %polly.loop_cond329, label %polly.loop_header324, label %polly.loop_exit326

polly.loop_header330:                             ; preds = %polly.merge933, %polly.loop_header324
  %p_add.i9311042 = phi double [ %scevgep928929.promoted, %polly.loop_header324 ], [ %p_add.i931, %polly.merge933 ]
  %p_add.i9101041 = phi double [ %scevgep907908.promoted, %polly.loop_header324 ], [ %p_add.i910, %polly.merge933 ]
  %p_add.i8891040 = phi double [ %scevgep886887.promoted, %polly.loop_header324 ], [ %p_add.i889, %polly.merge933 ]
  %p_add.i8681039 = phi double [ %scevgep865866.promoted, %polly.loop_header324 ], [ %p_add.i868, %polly.merge933 ]
  %p_add.i7591038 = phi double [ %scevgep756757.promoted, %polly.loop_header324 ], [ %p_add.i759, %polly.merge933 ]
  %p_add.i7381037 = phi double [ %scevgep735736.promoted, %polly.loop_header324 ], [ %p_add.i738, %polly.merge933 ]
  %p_add.i7171036 = phi double [ %scevgep714715.promoted, %polly.loop_header324 ], [ %p_add.i717, %polly.merge933 ]
  %p_add.i6961035 = phi double [ %scevgep693694.promoted, %polly.loop_header324 ], [ %p_add.i696, %polly.merge933 ]
  %p_add.i5871034 = phi double [ %scevgep584585.promoted, %polly.loop_header324 ], [ %p_add.i587, %polly.merge933 ]
  %p_add.i5661033 = phi double [ %scevgep563564.promoted, %polly.loop_header324 ], [ %p_add.i566, %polly.merge933 ]
  %p_add.i5451032 = phi double [ %scevgep542543.promoted, %polly.loop_header324 ], [ %p_add.i545, %polly.merge933 ]
  %p_add.i5241031 = phi double [ %scevgep521522.promoted, %polly.loop_header324 ], [ %p_add.i524, %polly.merge933 ]
  %p_add.i4151030 = phi double [ %scevgep412413.promoted, %polly.loop_header324 ], [ %p_add.i415, %polly.merge933 ]
  %p_add.i3941029 = phi double [ %scevgep391392.promoted, %polly.loop_header324 ], [ %p_add.i394, %polly.merge933 ]
  %p_add.i3731028 = phi double [ %scevgep370371.promoted, %polly.loop_header324 ], [ %p_add.i373, %polly.merge933 ]
  %p_add.i1027 = phi double [ %scevgep350351.promoted, %polly.loop_header324 ], [ %p_add.i, %polly.merge933 ]
  %polly.indvar333 = phi i64 [ 0, %polly.loop_header324 ], [ %polly.indvar_next334, %polly.merge933 ]
  %polly.access.add.Packed_A338 = add nuw nsw i64 %polly.indvar333, %polly.access.mul.Packed_A337
  %polly.access.mul.Packed_A339 = shl nsw i64 %polly.access.add.Packed_A338, 2
  %polly.access.Packed_A341 = getelementptr [24 x [256 x [4 x double]]], [24 x [256 x [4 x double]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.mul.Packed_A339
  %_p_scalar_342 = load double, double* %polly.access.Packed_A341, align 32, !alias.scope !35, !noalias !39
  %p_mul16.i = fmul fast double %_p_scalar_342, 1.500000e+00
  %polly.access.add.Packed_B345 = add nuw nsw i64 %polly.indvar333, %polly.access.mul.Packed_B344
  %polly.access.mul.Packed_B346 = shl nsw i64 %polly.access.add.Packed_B345, 3
  %polly.access.Packed_B348 = getelementptr [256 x [256 x [8 x double]]], [256 x [256 x [8 x double]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.mul.Packed_B346
  %_p_scalar_349 = load double, double* %polly.access.Packed_B348, align 64, !alias.scope !34, !noalias !38
  %p_mul21.i = fmul fast double %p_mul16.i, %_p_scalar_349
  %p_add.i = fadd fast double %p_add.i1027, %p_mul21.i
  %_p_scalar_360 = load double, double* %polly.access.Packed_A341, align 32, !alias.scope !35, !noalias !39
  %p_mul16.i361 = fmul fast double %_p_scalar_360, 1.500000e+00
  %polly.access.add.Packed_B366 = or i64 %polly.access.mul.Packed_B346, 1
  %polly.access.Packed_B367 = getelementptr [256 x [256 x [8 x double]]], [256 x [256 x [8 x double]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B366
  %_p_scalar_368 = load double, double* %polly.access.Packed_B367, align 8, !alias.scope !34, !noalias !38
  %p_mul21.i369 = fmul fast double %p_mul16.i361, %_p_scalar_368
  %p_add.i373 = fadd fast double %p_add.i3731028, %p_mul21.i369
  %_p_scalar_381 = load double, double* %polly.access.Packed_A341, align 32, !alias.scope !35, !noalias !39
  %p_mul16.i382 = fmul fast double %_p_scalar_381, 1.500000e+00
  %polly.access.add.Packed_B387 = or i64 %polly.access.mul.Packed_B346, 2
  %polly.access.Packed_B388 = getelementptr [256 x [256 x [8 x double]]], [256 x [256 x [8 x double]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B387
  %_p_scalar_389 = load double, double* %polly.access.Packed_B388, align 16, !alias.scope !34, !noalias !38
  %p_mul21.i390 = fmul fast double %p_mul16.i382, %_p_scalar_389
  %p_add.i394 = fadd fast double %p_add.i3941029, %p_mul21.i390
  %_p_scalar_402 = load double, double* %polly.access.Packed_A341, align 32, !alias.scope !35, !noalias !39
  %p_mul16.i403 = fmul fast double %_p_scalar_402, 1.500000e+00
  %polly.access.add.Packed_B408 = or i64 %polly.access.mul.Packed_B346, 3
  %polly.access.Packed_B409 = getelementptr [256 x [256 x [8 x double]]], [256 x [256 x [8 x double]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B408
  %_p_scalar_410 = load double, double* %polly.access.Packed_B409, align 8, !alias.scope !34, !noalias !38
  %p_mul21.i411 = fmul fast double %p_mul16.i403, %_p_scalar_410
  %p_add.i415 = fadd fast double %p_add.i4151030, %p_mul21.i411
  br i1 %151, label %polly.then418, label %polly.merge417

polly.merge417:                                   ; preds = %polly.loop_header330, %polly.then418
  %polly.access.add.Packed_A509 = or i64 %polly.access.mul.Packed_A339, 1
  %polly.access.Packed_A510 = getelementptr [24 x [256 x [4 x double]]], [24 x [256 x [4 x double]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A509
  %_p_scalar_511 = load double, double* %polly.access.Packed_A510, align 8, !alias.scope !35, !noalias !39
  %p_mul16.i512 = fmul fast double %_p_scalar_511, 1.500000e+00
  %_p_scalar_519 = load double, double* %polly.access.Packed_B348, align 64, !alias.scope !34, !noalias !38
  %p_mul21.i520 = fmul fast double %p_mul16.i512, %_p_scalar_519
  %p_add.i524 = fadd fast double %p_add.i5241031, %p_mul21.i520
  %p_mul16.i533 = fmul fast double %_p_scalar_511, 1.500000e+00
  %_p_scalar_540 = load double, double* %polly.access.Packed_B367, align 8, !alias.scope !34, !noalias !38
  %p_mul21.i541 = fmul fast double %p_mul16.i533, %_p_scalar_540
  %p_add.i545 = fadd fast double %p_add.i5451032, %p_mul21.i541
  %_p_scalar_553 = load double, double* %polly.access.Packed_A510, align 8, !alias.scope !35, !noalias !39
  %p_mul16.i554 = fmul fast double %_p_scalar_553, 1.500000e+00
  %_p_scalar_561 = load double, double* %polly.access.Packed_B388, align 16, !alias.scope !34, !noalias !38
  %p_mul21.i562 = fmul fast double %p_mul16.i554, %_p_scalar_561
  %p_add.i566 = fadd fast double %p_add.i5661033, %p_mul21.i562
  %p_mul16.i575 = fmul fast double %_p_scalar_553, 1.500000e+00
  %_p_scalar_582 = load double, double* %polly.access.Packed_B409, align 8, !alias.scope !34, !noalias !38
  %p_mul21.i583 = fmul fast double %p_mul16.i575, %_p_scalar_582
  %p_add.i587 = fadd fast double %p_add.i5871034, %p_mul21.i583
  br i1 %151, label %polly.then590, label %polly.merge589

polly.merge589:                                   ; preds = %polly.merge417, %polly.then590
  %polly.access.add.Packed_A681 = or i64 %polly.access.mul.Packed_A339, 2
  %polly.access.Packed_A682 = getelementptr [24 x [256 x [4 x double]]], [24 x [256 x [4 x double]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A681
  %_p_scalar_683 = load double, double* %polly.access.Packed_A682, align 16, !alias.scope !35, !noalias !39
  %p_mul16.i684 = fmul fast double %_p_scalar_683, 1.500000e+00
  %_p_scalar_691 = load double, double* %polly.access.Packed_B348, align 64, !alias.scope !34, !noalias !38
  %p_mul21.i692 = fmul fast double %p_mul16.i684, %_p_scalar_691
  %p_add.i696 = fadd fast double %p_add.i6961035, %p_mul21.i692
  %p_mul16.i705 = fmul fast double %_p_scalar_683, 1.500000e+00
  %_p_scalar_712 = load double, double* %polly.access.Packed_B367, align 8, !alias.scope !34, !noalias !38
  %p_mul21.i713 = fmul fast double %p_mul16.i705, %_p_scalar_712
  %p_add.i717 = fadd fast double %p_add.i7171036, %p_mul21.i713
  %_p_scalar_725 = load double, double* %polly.access.Packed_A682, align 16, !alias.scope !35, !noalias !39
  %p_mul16.i726 = fmul fast double %_p_scalar_725, 1.500000e+00
  %_p_scalar_733 = load double, double* %polly.access.Packed_B388, align 16, !alias.scope !34, !noalias !38
  %p_mul21.i734 = fmul fast double %p_mul16.i726, %_p_scalar_733
  %p_add.i738 = fadd fast double %p_add.i7381037, %p_mul21.i734
  %p_mul16.i747 = fmul fast double %_p_scalar_725, 1.500000e+00
  %_p_scalar_754 = load double, double* %polly.access.Packed_B409, align 8, !alias.scope !34, !noalias !38
  %p_mul21.i755 = fmul fast double %p_mul16.i747, %_p_scalar_754
  %p_add.i759 = fadd fast double %p_add.i7591038, %p_mul21.i755
  br i1 %151, label %polly.then762, label %polly.merge761

polly.merge761:                                   ; preds = %polly.merge589, %polly.then762
  %polly.access.add.Packed_A853 = or i64 %polly.access.mul.Packed_A339, 3
  %polly.access.Packed_A854 = getelementptr [24 x [256 x [4 x double]]], [24 x [256 x [4 x double]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A853
  %_p_scalar_855 = load double, double* %polly.access.Packed_A854, align 8, !alias.scope !35, !noalias !39
  %p_mul16.i856 = fmul fast double %_p_scalar_855, 1.500000e+00
  %_p_scalar_863 = load double, double* %polly.access.Packed_B348, align 64, !alias.scope !34, !noalias !38
  %p_mul21.i864 = fmul fast double %p_mul16.i856, %_p_scalar_863
  %p_add.i868 = fadd fast double %p_add.i8681039, %p_mul21.i864
  %p_mul16.i877 = fmul fast double %_p_scalar_855, 1.500000e+00
  %_p_scalar_884 = load double, double* %polly.access.Packed_B367, align 8, !alias.scope !34, !noalias !38
  %p_mul21.i885 = fmul fast double %p_mul16.i877, %_p_scalar_884
  %p_add.i889 = fadd fast double %p_add.i8891040, %p_mul21.i885
  %_p_scalar_897 = load double, double* %polly.access.Packed_A854, align 8, !alias.scope !35, !noalias !39
  %p_mul16.i898 = fmul fast double %_p_scalar_897, 1.500000e+00
  %_p_scalar_905 = load double, double* %polly.access.Packed_B388, align 16, !alias.scope !34, !noalias !38
  %p_mul21.i906 = fmul fast double %p_mul16.i898, %_p_scalar_905
  %p_add.i910 = fadd fast double %p_add.i9101041, %p_mul21.i906
  %p_mul16.i919 = fmul fast double %_p_scalar_897, 1.500000e+00
  %_p_scalar_926 = load double, double* %polly.access.Packed_B409, align 8, !alias.scope !34, !noalias !38
  %p_mul21.i927 = fmul fast double %p_mul16.i919, %_p_scalar_926
  %p_add.i931 = fadd fast double %p_add.i9311042, %p_mul21.i927
  br i1 %151, label %polly.then934, label %polly.merge933

polly.merge933:                                   ; preds = %polly.merge761, %polly.then934
  %polly.indvar_next334 = add nuw nsw i64 %polly.indvar333, 1
  %polly.loop_cond335 = icmp slt i64 %polly.indvar333, %121
  br i1 %polly.loop_cond335, label %polly.loop_header330, label %polly.loop_exit332

polly.then418:                                    ; preds = %polly.loop_header330
  %_p_scalar_427 = load double, double* %polly.access.Packed_A341, align 32, !alias.scope !35, !noalias !39
  %p_mul16.i428 = fmul fast double %_p_scalar_427, 1.500000e+00
  %polly.access.add.Packed_B433 = or i64 %polly.access.mul.Packed_B346, 4
  %polly.access.Packed_B434 = getelementptr [256 x [256 x [8 x double]]], [256 x [256 x [8 x double]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B433
  %_p_scalar_435 = load double, double* %polly.access.Packed_B434, align 32, !alias.scope !34, !noalias !38
  %p_mul21.i436 = fmul fast double %p_mul16.i428, %_p_scalar_435
  %_p_scalar_439 = load double, double* %scevgep437438, align 8, !alias.scope !49, !noalias !83
  %p_add.i440 = fadd fast double %_p_scalar_439, %p_mul21.i436
  store double %p_add.i440, double* %scevgep437438, align 8, !alias.scope !49, !noalias !83
  %_p_scalar_448 = load double, double* %polly.access.Packed_A341, align 32, !alias.scope !35, !noalias !39
  %p_mul16.i449 = fmul fast double %_p_scalar_448, 1.500000e+00
  %polly.access.add.Packed_B454 = or i64 %polly.access.mul.Packed_B346, 5
  %polly.access.Packed_B455 = getelementptr [256 x [256 x [8 x double]]], [256 x [256 x [8 x double]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B454
  %_p_scalar_456 = load double, double* %polly.access.Packed_B455, align 8, !alias.scope !34, !noalias !38
  %p_mul21.i457 = fmul fast double %p_mul16.i449, %_p_scalar_456
  %_p_scalar_460 = load double, double* %scevgep458459, align 8, !alias.scope !50, !noalias !84
  %p_add.i461 = fadd fast double %_p_scalar_460, %p_mul21.i457
  store double %p_add.i461, double* %scevgep458459, align 8, !alias.scope !50, !noalias !84
  %_p_scalar_469 = load double, double* %polly.access.Packed_A341, align 32, !alias.scope !35, !noalias !39
  %p_mul16.i470 = fmul fast double %_p_scalar_469, 1.500000e+00
  %polly.access.add.Packed_B475 = or i64 %polly.access.mul.Packed_B346, 6
  %polly.access.Packed_B476 = getelementptr [256 x [256 x [8 x double]]], [256 x [256 x [8 x double]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B475
  %_p_scalar_477 = load double, double* %polly.access.Packed_B476, align 16, !alias.scope !34, !noalias !38
  %p_mul21.i478 = fmul fast double %p_mul16.i470, %_p_scalar_477
  %_p_scalar_481 = load double, double* %scevgep479480, align 8, !alias.scope !51, !noalias !85
  %p_add.i482 = fadd fast double %_p_scalar_481, %p_mul21.i478
  store double %p_add.i482, double* %scevgep479480, align 8, !alias.scope !51, !noalias !85
  %_p_scalar_490 = load double, double* %polly.access.Packed_A341, align 32, !alias.scope !35, !noalias !39
  %p_mul16.i491 = fmul fast double %_p_scalar_490, 1.500000e+00
  %polly.access.add.Packed_B496 = or i64 %polly.access.mul.Packed_B346, 7
  %polly.access.Packed_B497 = getelementptr [256 x [256 x [8 x double]]], [256 x [256 x [8 x double]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B496
  %_p_scalar_498 = load double, double* %polly.access.Packed_B497, align 8, !alias.scope !34, !noalias !38
  %p_mul21.i499 = fmul fast double %p_mul16.i491, %_p_scalar_498
  %_p_scalar_502 = load double, double* %scevgep500501, align 8, !alias.scope !52, !noalias !86
  %p_add.i503 = fadd fast double %_p_scalar_502, %p_mul21.i499
  store double %p_add.i503, double* %scevgep500501, align 8, !alias.scope !52, !noalias !86
  br label %polly.merge417

polly.then590:                                    ; preds = %polly.merge417
  %_p_scalar_599 = load double, double* %polly.access.Packed_A510, align 8, !alias.scope !35, !noalias !39
  %p_mul16.i600 = fmul fast double %_p_scalar_599, 1.500000e+00
  %polly.access.add.Packed_B605 = or i64 %polly.access.mul.Packed_B346, 4
  %polly.access.Packed_B606 = getelementptr [256 x [256 x [8 x double]]], [256 x [256 x [8 x double]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B605
  %_p_scalar_607 = load double, double* %polly.access.Packed_B606, align 32, !alias.scope !34, !noalias !38
  %p_mul21.i608 = fmul fast double %p_mul16.i600, %_p_scalar_607
  %_p_scalar_611 = load double, double* %scevgep609610, align 8, !alias.scope !61, !noalias !87
  %p_add.i612 = fadd fast double %_p_scalar_611, %p_mul21.i608
  store double %p_add.i612, double* %scevgep609610, align 8, !alias.scope !61, !noalias !87
  %_p_scalar_620 = load double, double* %polly.access.Packed_A510, align 8, !alias.scope !35, !noalias !39
  %p_mul16.i621 = fmul fast double %_p_scalar_620, 1.500000e+00
  %polly.access.add.Packed_B626 = or i64 %polly.access.mul.Packed_B346, 5
  %polly.access.Packed_B627 = getelementptr [256 x [256 x [8 x double]]], [256 x [256 x [8 x double]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B626
  %_p_scalar_628 = load double, double* %polly.access.Packed_B627, align 8, !alias.scope !34, !noalias !38
  %p_mul21.i629 = fmul fast double %p_mul16.i621, %_p_scalar_628
  %_p_scalar_632 = load double, double* %scevgep630631, align 8, !alias.scope !62, !noalias !88
  %p_add.i633 = fadd fast double %_p_scalar_632, %p_mul21.i629
  store double %p_add.i633, double* %scevgep630631, align 8, !alias.scope !62, !noalias !88
  %_p_scalar_641 = load double, double* %polly.access.Packed_A510, align 8, !alias.scope !35, !noalias !39
  %p_mul16.i642 = fmul fast double %_p_scalar_641, 1.500000e+00
  %polly.access.add.Packed_B647 = or i64 %polly.access.mul.Packed_B346, 6
  %polly.access.Packed_B648 = getelementptr [256 x [256 x [8 x double]]], [256 x [256 x [8 x double]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B647
  %_p_scalar_649 = load double, double* %polly.access.Packed_B648, align 16, !alias.scope !34, !noalias !38
  %p_mul21.i650 = fmul fast double %p_mul16.i642, %_p_scalar_649
  %_p_scalar_653 = load double, double* %scevgep651652, align 8, !alias.scope !63, !noalias !89
  %p_add.i654 = fadd fast double %_p_scalar_653, %p_mul21.i650
  store double %p_add.i654, double* %scevgep651652, align 8, !alias.scope !63, !noalias !89
  %_p_scalar_662 = load double, double* %polly.access.Packed_A510, align 8, !alias.scope !35, !noalias !39
  %p_mul16.i663 = fmul fast double %_p_scalar_662, 1.500000e+00
  %polly.access.add.Packed_B668 = or i64 %polly.access.mul.Packed_B346, 7
  %polly.access.Packed_B669 = getelementptr [256 x [256 x [8 x double]]], [256 x [256 x [8 x double]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B668
  %_p_scalar_670 = load double, double* %polly.access.Packed_B669, align 8, !alias.scope !34, !noalias !38
  %p_mul21.i671 = fmul fast double %p_mul16.i663, %_p_scalar_670
  %_p_scalar_674 = load double, double* %scevgep672673, align 8, !alias.scope !64, !noalias !90
  %p_add.i675 = fadd fast double %_p_scalar_674, %p_mul21.i671
  store double %p_add.i675, double* %scevgep672673, align 8, !alias.scope !64, !noalias !90
  br label %polly.merge589

polly.then762:                                    ; preds = %polly.merge589
  %_p_scalar_771 = load double, double* %polly.access.Packed_A682, align 16, !alias.scope !35, !noalias !39
  %p_mul16.i772 = fmul fast double %_p_scalar_771, 1.500000e+00
  %polly.access.add.Packed_B777 = or i64 %polly.access.mul.Packed_B346, 4
  %polly.access.Packed_B778 = getelementptr [256 x [256 x [8 x double]]], [256 x [256 x [8 x double]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B777
  %_p_scalar_779 = load double, double* %polly.access.Packed_B778, align 32, !alias.scope !34, !noalias !38
  %p_mul21.i780 = fmul fast double %p_mul16.i772, %_p_scalar_779
  %_p_scalar_783 = load double, double* %scevgep781782, align 8, !alias.scope !73, !noalias !91
  %p_add.i784 = fadd fast double %_p_scalar_783, %p_mul21.i780
  store double %p_add.i784, double* %scevgep781782, align 8, !alias.scope !73, !noalias !91
  %_p_scalar_792 = load double, double* %polly.access.Packed_A682, align 16, !alias.scope !35, !noalias !39
  %p_mul16.i793 = fmul fast double %_p_scalar_792, 1.500000e+00
  %polly.access.add.Packed_B798 = or i64 %polly.access.mul.Packed_B346, 5
  %polly.access.Packed_B799 = getelementptr [256 x [256 x [8 x double]]], [256 x [256 x [8 x double]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B798
  %_p_scalar_800 = load double, double* %polly.access.Packed_B799, align 8, !alias.scope !34, !noalias !38
  %p_mul21.i801 = fmul fast double %p_mul16.i793, %_p_scalar_800
  %_p_scalar_804 = load double, double* %scevgep802803, align 8, !alias.scope !74, !noalias !92
  %p_add.i805 = fadd fast double %_p_scalar_804, %p_mul21.i801
  store double %p_add.i805, double* %scevgep802803, align 8, !alias.scope !74, !noalias !92
  %_p_scalar_813 = load double, double* %polly.access.Packed_A682, align 16, !alias.scope !35, !noalias !39
  %p_mul16.i814 = fmul fast double %_p_scalar_813, 1.500000e+00
  %polly.access.add.Packed_B819 = or i64 %polly.access.mul.Packed_B346, 6
  %polly.access.Packed_B820 = getelementptr [256 x [256 x [8 x double]]], [256 x [256 x [8 x double]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B819
  %_p_scalar_821 = load double, double* %polly.access.Packed_B820, align 16, !alias.scope !34, !noalias !38
  %p_mul21.i822 = fmul fast double %p_mul16.i814, %_p_scalar_821
  %_p_scalar_825 = load double, double* %scevgep823824, align 8, !alias.scope !75, !noalias !93
  %p_add.i826 = fadd fast double %_p_scalar_825, %p_mul21.i822
  store double %p_add.i826, double* %scevgep823824, align 8, !alias.scope !75, !noalias !93
  %_p_scalar_834 = load double, double* %polly.access.Packed_A682, align 16, !alias.scope !35, !noalias !39
  %p_mul16.i835 = fmul fast double %_p_scalar_834, 1.500000e+00
  %polly.access.add.Packed_B840 = or i64 %polly.access.mul.Packed_B346, 7
  %polly.access.Packed_B841 = getelementptr [256 x [256 x [8 x double]]], [256 x [256 x [8 x double]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B840
  %_p_scalar_842 = load double, double* %polly.access.Packed_B841, align 8, !alias.scope !34, !noalias !38
  %p_mul21.i843 = fmul fast double %p_mul16.i835, %_p_scalar_842
  %_p_scalar_846 = load double, double* %scevgep844845, align 8, !alias.scope !76, !noalias !94
  %p_add.i847 = fadd fast double %_p_scalar_846, %p_mul21.i843
  store double %p_add.i847, double* %scevgep844845, align 8, !alias.scope !76, !noalias !94
  br label %polly.merge761

polly.then934:                                    ; preds = %polly.merge761
  %_p_scalar_943 = load double, double* %polly.access.Packed_A854, align 8, !alias.scope !35, !noalias !39
  %p_mul16.i944 = fmul fast double %_p_scalar_943, 1.500000e+00
  %polly.access.add.Packed_B949 = or i64 %polly.access.mul.Packed_B346, 4
  %polly.access.Packed_B950 = getelementptr [256 x [256 x [8 x double]]], [256 x [256 x [8 x double]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B949
  %_p_scalar_951 = load double, double* %polly.access.Packed_B950, align 32, !alias.scope !34, !noalias !38
  %p_mul21.i952 = fmul fast double %p_mul16.i944, %_p_scalar_951
  %_p_scalar_955 = load double, double* %scevgep953954, align 8, !alias.scope !95, !noalias !96
  %p_add.i956 = fadd fast double %_p_scalar_955, %p_mul21.i952
  store double %p_add.i956, double* %scevgep953954, align 8, !alias.scope !95, !noalias !96
  %_p_scalar_964 = load double, double* %polly.access.Packed_A854, align 8, !alias.scope !35, !noalias !39
  %p_mul16.i965 = fmul fast double %_p_scalar_964, 1.500000e+00
  %polly.access.add.Packed_B970 = or i64 %polly.access.mul.Packed_B346, 5
  %polly.access.Packed_B971 = getelementptr [256 x [256 x [8 x double]]], [256 x [256 x [8 x double]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B970
  %_p_scalar_972 = load double, double* %polly.access.Packed_B971, align 8, !alias.scope !34, !noalias !38
  %p_mul21.i973 = fmul fast double %p_mul16.i965, %_p_scalar_972
  %_p_scalar_976 = load double, double* %scevgep974975, align 8, !alias.scope !97, !noalias !98
  %p_add.i977 = fadd fast double %_p_scalar_976, %p_mul21.i973
  store double %p_add.i977, double* %scevgep974975, align 8, !alias.scope !97, !noalias !98
  %_p_scalar_985 = load double, double* %polly.access.Packed_A854, align 8, !alias.scope !35, !noalias !39
  %p_mul16.i986 = fmul fast double %_p_scalar_985, 1.500000e+00
  %polly.access.add.Packed_B991 = or i64 %polly.access.mul.Packed_B346, 6
  %polly.access.Packed_B992 = getelementptr [256 x [256 x [8 x double]]], [256 x [256 x [8 x double]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B991
  %_p_scalar_993 = load double, double* %polly.access.Packed_B992, align 16, !alias.scope !34, !noalias !38
  %p_mul21.i994 = fmul fast double %p_mul16.i986, %_p_scalar_993
  %_p_scalar_997 = load double, double* %scevgep995996, align 8, !alias.scope !99, !noalias !100
  %p_add.i998 = fadd fast double %_p_scalar_997, %p_mul21.i994
  store double %p_add.i998, double* %scevgep995996, align 8, !alias.scope !99, !noalias !100
  %_p_scalar_1006 = load double, double* %polly.access.Packed_A854, align 8, !alias.scope !35, !noalias !39
  %p_mul16.i1007 = fmul fast double %_p_scalar_1006, 1.500000e+00
  %polly.access.add.Packed_B1012 = or i64 %polly.access.mul.Packed_B346, 7
  %polly.access.Packed_B1013 = getelementptr [256 x [256 x [8 x double]]], [256 x [256 x [8 x double]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B1012
  %_p_scalar_1014 = load double, double* %polly.access.Packed_B1013, align 8, !alias.scope !34, !noalias !38
  %p_mul21.i1015 = fmul fast double %p_mul16.i1007, %_p_scalar_1014
  %_p_scalar_1018 = load double, double* %scevgep10161017, align 8, !alias.scope !101, !noalias !102
  %p_add.i1019 = fadd fast double %_p_scalar_1018, %p_mul21.i1015
  store double %p_add.i1019, double* %scevgep10161017, align 8, !alias.scope !101, !noalias !102
  br label %polly.merge933
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #1

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #2

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #1

; Function Attrs: nounwind
declare i32 @posix_memalign(i8**, i64, i64) local_unnamed_addr #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) local_unnamed_addr #3

; Function Attrs: nounwind readnone speculatable
declare { i64, i1 } @llvm.smul.with.overflow.i64(i64, i64) #4

; Function Attrs: nounwind readnone speculatable
declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64) #4

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="true" "no-jump-tables"="false" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="haswell" "target-features"="+aes,+avx,+avx2,+bmi,+bmi2,+cmov,+cx16,+f16c,+fma,+fsgsbase,+fxsr,+lzcnt,+mmx,+movbe,+pclmul,+popcnt,+rdrnd,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87,+xsave,+xsaveopt,-adx,-avx512bw,-avx512cd,-avx512dq,-avx512er,-avx512f,-avx512ifma,-avx512pf,-avx512vbmi,-avx512vl,-avx512vpopcntdq,-clflushopt,-clwb,-clzero,-fma4,-lwp,-mwaitx,-pku,-prefetchwt1,-prfchw,-rdseed,-rtm,-sgx,-sha,-sse4a,-tbm,-xop,-xsavec,-xsaves" "unsafe-fp-math"="true" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="haswell" "target-features"="+aes,+avx,+avx2,+bmi,+bmi2,+cmov,+cx16,+f16c,+fma,+fsgsbase,+fxsr,+lzcnt,+mmx,+movbe,+pclmul,+popcnt,+rdrnd,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87,+xsave,+xsaveopt,-adx,-avx512bw,-avx512cd,-avx512dq,-avx512er,-avx512f,-avx512ifma,-avx512pf,-avx512vbmi,-avx512vl,-avx512vpopcntdq,-clflushopt,-clwb,-clzero,-fma4,-lwp,-mwaitx,-pku,-prefetchwt1,-prfchw,-rdseed,-rtm,-sgx,-sha,-sse4a,-tbm,-xop,-xsavec,-xsaves" "unsafe-fp-math"="true" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="haswell" "target-features"="+aes,+avx,+avx2,+bmi,+bmi2,+cmov,+cx16,+f16c,+fma,+fsgsbase,+fxsr,+lzcnt,+mmx,+movbe,+pclmul,+popcnt,+rdrnd,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87,+xsave,+xsaveopt,-adx,-avx512bw,-avx512cd,-avx512dq,-avx512er,-avx512f,-avx512ifma,-avx512pf,-avx512vbmi,-avx512vl,-avx512vpopcntdq,-clflushopt,-clwb,-clzero,-fma4,-lwp,-mwaitx,-pku,-prefetchwt1,-prfchw,-rdseed,-rtm,-sgx,-sha,-sse4a,-tbm,-xop,-xsavec,-xsaves" "unsafe-fp-math"="true" "use-soft-float"="false" }
attributes #4 = { nounwind readnone speculatable }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 5.0.0 (trunk 305638)"}
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
!18 = !{!19}
!19 = distinct !{!19, !20, !"kernel_gemm: %C"}
!20 = distinct !{!20, !"kernel_gemm"}
!21 = !{!22, !23}
!22 = distinct !{!22, !20, !"kernel_gemm: %A"}
!23 = distinct !{!23, !20, !"kernel_gemm: %B"}
!24 = !{!22}
!25 = !{!19, !23}
!26 = !{!23}
!27 = !{!19, !22}
!28 = distinct !{!28, !29, !"polly.alias.scope.MemRef2"}
!29 = distinct !{!29, !"polly.alias.scope.domain"}
!30 = !{!31, !32, !33, !34, !35}
!31 = distinct !{!31, !29, !"polly.alias.scope.MemRef0"}
!32 = distinct !{!32, !29, !"polly.alias.scope.MemRef1"}
!33 = distinct !{!33, !29, !"polly.alias.scope.MemRef_mul16_i"}
!34 = distinct !{!34, !29, !"polly.alias.scope.Packed_B"}
!35 = distinct !{!35, !29, !"polly.alias.scope.Packed_A"}
!36 = !{!32, !28, !33, !34, !35}
!37 = !{!31, !28, !33, !34, !35}
!38 = !{!31, !32, !28, !33, !35}
!39 = !{!31, !32, !28, !33, !34}
!40 = distinct !{!40, !31, !"second level alias metadata"}
!41 = distinct !{!41, !31, !"second level alias metadata"}
!42 = !{!32, !28, !33, !34, !35, !40}
!43 = distinct !{!43, !31, !"second level alias metadata"}
!44 = !{!32, !28, !33, !34, !35, !40, !41}
!45 = distinct !{!45, !31, !"second level alias metadata"}
!46 = !{!32, !28, !33, !34, !35, !40, !41, !43}
!47 = distinct !{!47, !31, !"second level alias metadata"}
!48 = !{!32, !28, !33, !34, !35, !40, !41, !43, !45, !49, !50, !51, !52}
!49 = distinct !{!49, !31, !"second level alias metadata"}
!50 = distinct !{!50, !31, !"second level alias metadata"}
!51 = distinct !{!51, !31, !"second level alias metadata"}
!52 = distinct !{!52, !31, !"second level alias metadata"}
!53 = distinct !{!53, !31, !"second level alias metadata"}
!54 = !{!32, !28, !33, !34, !35, !40, !41, !43, !45, !49, !50, !51, !52, !47}
!55 = distinct !{!55, !31, !"second level alias metadata"}
!56 = !{!32, !28, !33, !34, !35, !40, !41, !43, !45, !49, !50, !51, !52, !47, !53}
!57 = distinct !{!57, !31, !"second level alias metadata"}
!58 = !{!32, !28, !33, !34, !35, !40, !41, !43, !45, !49, !50, !51, !52, !47, !53, !55}
!59 = distinct !{!59, !31, !"second level alias metadata"}
!60 = !{!32, !28, !33, !34, !35, !40, !41, !43, !45, !49, !50, !51, !52, !47, !53, !55, !57, !61, !62, !63, !64}
!61 = distinct !{!61, !31, !"second level alias metadata"}
!62 = distinct !{!62, !31, !"second level alias metadata"}
!63 = distinct !{!63, !31, !"second level alias metadata"}
!64 = distinct !{!64, !31, !"second level alias metadata"}
!65 = distinct !{!65, !31, !"second level alias metadata"}
!66 = !{!32, !28, !33, !34, !35, !40, !41, !43, !45, !49, !50, !51, !52, !47, !53, !55, !57, !61, !62, !63, !64, !59}
!67 = distinct !{!67, !31, !"second level alias metadata"}
!68 = !{!32, !28, !33, !34, !35, !40, !41, !43, !45, !49, !50, !51, !52, !47, !53, !55, !57, !61, !62, !63, !64, !59, !65}
!69 = distinct !{!69, !31, !"second level alias metadata"}
!70 = !{!32, !28, !33, !34, !35, !40, !41, !43, !45, !49, !50, !51, !52, !47, !53, !55, !57, !61, !62, !63, !64, !59, !65, !67}
!71 = distinct !{!71, !31, !"second level alias metadata"}
!72 = !{!32, !28, !33, !34, !35, !40, !41, !43, !45, !49, !50, !51, !52, !47, !53, !55, !57, !61, !62, !63, !64, !59, !65, !67, !69, !73, !74, !75, !76}
!73 = distinct !{!73, !31, !"second level alias metadata"}
!74 = distinct !{!74, !31, !"second level alias metadata"}
!75 = distinct !{!75, !31, !"second level alias metadata"}
!76 = distinct !{!76, !31, !"second level alias metadata"}
!77 = distinct !{!77, !31, !"second level alias metadata"}
!78 = !{!32, !28, !33, !34, !35, !40, !41, !43, !45, !49, !50, !51, !52, !47, !53, !55, !57, !61, !62, !63, !64, !59, !65, !67, !69, !73, !74, !75, !76, !71}
!79 = distinct !{!79, !31, !"second level alias metadata"}
!80 = !{!32, !28, !33, !34, !35, !40, !41, !43, !45, !49, !50, !51, !52, !47, !53, !55, !57, !61, !62, !63, !64, !59, !65, !67, !69, !73, !74, !75, !76, !71, !77}
!81 = distinct !{!81, !31, !"second level alias metadata"}
!82 = !{!32, !28, !33, !34, !35, !40, !41, !43, !45, !49, !50, !51, !52, !47, !53, !55, !57, !61, !62, !63, !64, !59, !65, !67, !69, !73, !74, !75, !76, !71, !77, !79}
!83 = !{!32, !28, !33, !34, !35, !40, !41, !43, !45}
!84 = !{!32, !28, !33, !34, !35, !40, !41, !43, !45, !49}
!85 = !{!32, !28, !33, !34, !35, !40, !41, !43, !45, !49, !50}
!86 = !{!32, !28, !33, !34, !35, !40, !41, !43, !45, !49, !50, !51}
!87 = !{!32, !28, !33, !34, !35, !40, !41, !43, !45, !49, !50, !51, !52, !47, !53, !55, !57}
!88 = !{!32, !28, !33, !34, !35, !40, !41, !43, !45, !49, !50, !51, !52, !47, !53, !55, !57, !61}
!89 = !{!32, !28, !33, !34, !35, !40, !41, !43, !45, !49, !50, !51, !52, !47, !53, !55, !57, !61, !62}
!90 = !{!32, !28, !33, !34, !35, !40, !41, !43, !45, !49, !50, !51, !52, !47, !53, !55, !57, !61, !62, !63}
!91 = !{!32, !28, !33, !34, !35, !40, !41, !43, !45, !49, !50, !51, !52, !47, !53, !55, !57, !61, !62, !63, !64, !59, !65, !67, !69}
!92 = !{!32, !28, !33, !34, !35, !40, !41, !43, !45, !49, !50, !51, !52, !47, !53, !55, !57, !61, !62, !63, !64, !59, !65, !67, !69, !73}
!93 = !{!32, !28, !33, !34, !35, !40, !41, !43, !45, !49, !50, !51, !52, !47, !53, !55, !57, !61, !62, !63, !64, !59, !65, !67, !69, !73, !74}
!94 = !{!32, !28, !33, !34, !35, !40, !41, !43, !45, !49, !50, !51, !52, !47, !53, !55, !57, !61, !62, !63, !64, !59, !65, !67, !69, !73, !74, !75}
!95 = distinct !{!95, !31, !"second level alias metadata"}
!96 = !{!32, !28, !33, !34, !35, !40, !41, !43, !45, !49, !50, !51, !52, !47, !53, !55, !57, !61, !62, !63, !64, !59, !65, !67, !69, !73, !74, !75, !76, !71, !77, !79, !81}
!97 = distinct !{!97, !31, !"second level alias metadata"}
!98 = !{!32, !28, !33, !34, !35, !40, !41, !43, !45, !49, !50, !51, !52, !47, !53, !55, !57, !61, !62, !63, !64, !59, !65, !67, !69, !73, !74, !75, !76, !71, !77, !79, !81, !95}
!99 = distinct !{!99, !31, !"second level alias metadata"}
!100 = !{!32, !28, !33, !34, !35, !40, !41, !43, !45, !49, !50, !51, !52, !47, !53, !55, !57, !61, !62, !63, !64, !59, !65, !67, !69, !73, !74, !75, !76, !71, !77, !79, !81, !95, !97}
!101 = distinct !{!101, !31, !"second level alias metadata"}
!102 = !{!32, !28, !33, !34, !35, !40, !41, !43, !45, !49, !50, !51, !52, !47, !53, !55, !57, !61, !62, !63, !64, !59, !65, !67, !69, !73, !74, !75, !76, !71, !77, !79, !81, !95, !97, !99}
