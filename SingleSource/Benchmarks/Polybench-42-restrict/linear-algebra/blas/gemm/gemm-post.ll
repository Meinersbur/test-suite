; ModuleID = 'gemm-known-after.ll'
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
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %0) #4
  store i8* null, i8** %ret.i.i, align 8, !tbaa !2
  %call.i.i = call i32 @posix_memalign(i8** nonnull %ret.i.i, i64 4096, i64 36800000) #4
  %1 = load i8*, i8** %ret.i.i, align 8, !tbaa !2
  %tobool.i.i = icmp eq i8* %1, null
  %tobool2.i.i = icmp ne i32 %call.i.i, 0
  %or.cond.i.i = or i1 %tobool2.i.i, %tobool.i.i
  br i1 %or.cond.i.i, label %if.then.i.i, label %polybench_alloc_data.exit

if.then.i.i:                                      ; preds = %entry
  call void @exit(i32 1) #5
  unreachable

polybench_alloc_data.exit:                        ; preds = %entry
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %0) #4
  %2 = bitcast i8** %ret.i.i27 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %2) #4
  store i8* null, i8** %ret.i.i27, align 8, !tbaa !2
  %call.i.i28 = call i32 @posix_memalign(i8** nonnull %ret.i.i27, i64 4096, i64 41600000) #4
  %3 = load i8*, i8** %ret.i.i27, align 8, !tbaa !2
  %tobool.i.i29 = icmp eq i8* %3, null
  %tobool2.i.i30 = icmp ne i32 %call.i.i28, 0
  %or.cond.i.i31 = or i1 %tobool2.i.i30, %tobool.i.i29
  br i1 %or.cond.i.i31, label %if.then.i.i32, label %polybench_alloc_data.exit33

if.then.i.i32:                                    ; preds = %polybench_alloc_data.exit
  call void @exit(i32 1) #5
  unreachable

polybench_alloc_data.exit33:                      ; preds = %polybench_alloc_data.exit
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %2) #4
  %4 = bitcast i8** %ret.i.i34 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %4) #4
  store i8* null, i8** %ret.i.i34, align 8, !tbaa !2
  %call.i.i35 = call i32 @posix_memalign(i8** nonnull %ret.i.i34, i64 4096, i64 47840000) #4
  %5 = load i8*, i8** %ret.i.i34, align 8, !tbaa !2
  %tobool.i.i36 = icmp eq i8* %5, null
  %tobool2.i.i37 = icmp ne i32 %call.i.i35, 0
  %or.cond.i.i38 = or i1 %tobool2.i.i37, %tobool.i.i36
  br i1 %or.cond.i.i38, label %if.then.i.i39, label %polybench_alloc_data.exit40

if.then.i.i39:                                    ; preds = %polybench_alloc_data.exit33
  call void @exit(i32 1) #5
  unreachable

polybench_alloc_data.exit40:                      ; preds = %polybench_alloc_data.exit33
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %4) #4
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
  %broadcast.splatinsert = insertelement <4 x i64> undef, i64 %indvars.iv24.i, i32 0
  %broadcast.splat = shufflevector <4 x i64> %broadcast.splatinsert, <4 x i64> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body.1, %for.cond1.preheader.i
  %index = phi i64 [ 0, %for.cond1.preheader.i ], [ %index.next.1, %vector.body.1 ]
  %vec.ind = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %for.cond1.preheader.i ], [ %vec.ind.next.1, %vector.body.1 ]
  %17 = mul nuw nsw <4 x i64> %vec.ind, %broadcast.splat
  %18 = add nuw nsw <4 x i64> %17, <i64 1, i64 1, i64 1, i64 1>
  %19 = trunc <4 x i64> %18 to <4 x i32>
  %20 = srem <4 x i32> %19, <i32 2000, i32 2000, i32 2000, i32 2000>
  %21 = sitofp <4 x i32> %20 to <4 x double>
  %22 = fmul fast <4 x double> %21, <double 5.000000e-04, double 5.000000e-04, double 5.000000e-04, double 5.000000e-04>
  %23 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay, i64 %indvars.iv24.i, i64 %index
  %24 = bitcast double* %23 to <4 x double>*
  store <4 x double> %22, <4 x double>* %24, align 8, !tbaa !6, !alias.scope !8, !noalias !11
  %index.next = or i64 %index, 4
  %25 = icmp eq i64 %index.next, 2300
  br i1 %25, label %for.inc7.i, label %vector.body.1, !llvm.loop !14

for.inc7.i:                                       ; preds = %vector.body
  %indvars.iv.next25.i = add nuw nsw i64 %indvars.iv24.i, 1
  %exitcond26.i = icmp eq i64 %indvars.iv.next25.i, 2000
  br i1 %exitcond26.i, label %for.cond14.preheader.i, label %for.cond1.preheader.i

for.cond14.preheader.i:                           ; preds = %for.inc7.i, %for.inc31.i
  %indvars.iv16.i = phi i64 [ %indvars.iv.next17.i, %for.inc31.i ], [ 0, %for.inc7.i ]
  %broadcast.splatinsert54 = insertelement <4 x i64> undef, i64 %indvars.iv16.i, i32 0
  %broadcast.splat55 = shufflevector <4 x i64> %broadcast.splatinsert54, <4 x i64> undef, <4 x i32> zeroinitializer
  br label %vector.body43

vector.body43:                                    ; preds = %vector.body43, %for.cond14.preheader.i
  %index48 = phi i64 [ 0, %for.cond14.preheader.i ], [ %index.next49.1, %vector.body43 ]
  %vec.ind52 = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %for.cond14.preheader.i ], [ %vec.ind.next53.1, %vector.body43 ]
  %26 = add nuw nsw <4 x i64> %vec.ind52, <i64 1, i64 1, i64 1, i64 1>
  %27 = mul nuw nsw <4 x i64> %26, %broadcast.splat55
  %28 = trunc <4 x i64> %27 to <4 x i32>
  %29 = srem <4 x i32> %28, <i32 2600, i32 2600, i32 2600, i32 2600>
  %30 = sitofp <4 x i32> %29 to <4 x double>
  %31 = fmul fast <4 x double> %30, <double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6>
  %32 = getelementptr inbounds [2600 x double], [2600 x double]* %arraydecay3, i64 %indvars.iv16.i, i64 %index48
  %33 = bitcast double* %32 to <4 x double>*
  store <4 x double> %31, <4 x double>* %33, align 8, !tbaa !6, !alias.scope !17, !noalias !18
  %index.next49 = or i64 %index48, 4
  %34 = add <4 x i64> %vec.ind52, <i64 5, i64 5, i64 5, i64 5>
  %35 = mul nuw nsw <4 x i64> %34, %broadcast.splat55
  %36 = trunc <4 x i64> %35 to <4 x i32>
  %37 = srem <4 x i32> %36, <i32 2600, i32 2600, i32 2600, i32 2600>
  %38 = sitofp <4 x i32> %37 to <4 x double>
  %39 = fmul fast <4 x double> %38, <double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6>
  %40 = getelementptr inbounds [2600 x double], [2600 x double]* %arraydecay3, i64 %indvars.iv16.i, i64 %index.next49
  %41 = bitcast double* %40 to <4 x double>*
  store <4 x double> %39, <4 x double>* %41, align 8, !tbaa !6, !alias.scope !17, !noalias !18
  %index.next49.1 = add nsw i64 %index48, 8
  %vec.ind.next53.1 = add <4 x i64> %vec.ind52, <i64 8, i64 8, i64 8, i64 8>
  %42 = icmp eq i64 %index.next49.1, 2600
  br i1 %42, label %for.inc31.i, label %vector.body43, !llvm.loop !19

for.inc31.i:                                      ; preds = %vector.body43
  %indvars.iv.next17.i = add nuw nsw i64 %indvars.iv16.i, 1
  %exitcond18.i = icmp eq i64 %indvars.iv.next17.i, 2000
  br i1 %exitcond18.i, label %for.cond38.preheader.i.preheader, label %for.cond14.preheader.i

for.cond38.preheader.i.preheader:                 ; preds = %for.inc31.i
  %arraydecay4 = bitcast i8* %5 to [2300 x double]*
  br label %for.cond38.preheader.i

for.cond38.preheader.i:                           ; preds = %for.cond38.preheader.i.preheader, %for.inc55.i
  %indvars.iv9.i = phi i64 [ %indvars.iv.next10.i, %for.inc55.i ], [ 0, %for.cond38.preheader.i.preheader ]
  %broadcast.splatinsert67 = insertelement <4 x i64> undef, i64 %indvars.iv9.i, i32 0
  %broadcast.splat68 = shufflevector <4 x i64> %broadcast.splatinsert67, <4 x i64> undef, <4 x i32> zeroinitializer
  br label %vector.body56

vector.body56:                                    ; preds = %vector.body56.1, %for.cond38.preheader.i
  %index61 = phi i64 [ 0, %for.cond38.preheader.i ], [ %index.next62.1, %vector.body56.1 ]
  %vec.ind65 = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %for.cond38.preheader.i ], [ %vec.ind.next66.1, %vector.body56.1 ]
  %43 = add nuw nsw <4 x i64> %vec.ind65, <i64 2, i64 2, i64 2, i64 2>
  %44 = mul nuw nsw <4 x i64> %43, %broadcast.splat68
  %45 = trunc <4 x i64> %44 to <4 x i32>
  %46 = srem <4 x i32> %45, <i32 2300, i32 2300, i32 2300, i32 2300>
  %47 = sitofp <4 x i32> %46 to <4 x double>
  %48 = fmul fast <4 x double> %47, <double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95>
  %49 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay4, i64 %indvars.iv9.i, i64 %index61
  %50 = bitcast double* %49 to <4 x double>*
  store <4 x double> %48, <4 x double>* %50, align 8, !tbaa !6, !alias.scope !20, !noalias !21
  %index.next62 = or i64 %index61, 4
  %51 = icmp eq i64 %index.next62, 2300
  br i1 %51, label %for.inc55.i, label %vector.body56.1, !llvm.loop !22

for.inc55.i:                                      ; preds = %vector.body56
  %indvars.iv.next10.i = add nuw nsw i64 %indvars.iv9.i, 1
  %exitcond11.i = icmp eq i64 %indvars.iv.next10.i, 2600
  br i1 %exitcond11.i, label %for.cond1.preheader.i41, label %for.cond38.preheader.i

for.cond1.preheader.i41:                          ; preds = %for.inc55.i, %for.inc32.i
  %indvars.iv11.i = phi i64 [ %indvars.iv.next12.i, %for.inc32.i ], [ 0, %for.inc55.i ]
  br label %vector.body92

vector.body92:                                    ; preds = %vector.body92.1, %for.cond1.preheader.i41
  %index97 = phi i64 [ 0, %for.cond1.preheader.i41 ], [ %index.next98.1, %vector.body92.1 ]
  %52 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay, i64 %indvars.iv11.i, i64 %index97
  %53 = bitcast double* %52 to <4 x double>*
  %wide.load107 = load <4 x double>, <4 x double>* %53, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %54 = getelementptr double, double* %52, i64 4
  %55 = bitcast double* %54 to <4 x double>*
  %wide.load108 = load <4 x double>, <4 x double>* %55, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %56 = getelementptr double, double* %52, i64 8
  %57 = bitcast double* %56 to <4 x double>*
  %wide.load109 = load <4 x double>, <4 x double>* %57, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %58 = getelementptr double, double* %52, i64 12
  %59 = bitcast double* %58 to <4 x double>*
  %wide.load110 = load <4 x double>, <4 x double>* %59, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %60 = fmul fast <4 x double> %wide.load107, <double 1.200000e+00, double 1.200000e+00, double 1.200000e+00, double 1.200000e+00>
  %61 = fmul fast <4 x double> %wide.load108, <double 1.200000e+00, double 1.200000e+00, double 1.200000e+00, double 1.200000e+00>
  %62 = fmul fast <4 x double> %wide.load109, <double 1.200000e+00, double 1.200000e+00, double 1.200000e+00, double 1.200000e+00>
  %63 = fmul fast <4 x double> %wide.load110, <double 1.200000e+00, double 1.200000e+00, double 1.200000e+00, double 1.200000e+00>
  %64 = bitcast double* %52 to <4 x double>*
  store <4 x double> %60, <4 x double>* %64, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %65 = bitcast double* %54 to <4 x double>*
  store <4 x double> %61, <4 x double>* %65, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %66 = bitcast double* %56 to <4 x double>*
  store <4 x double> %62, <4 x double>* %66, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %67 = bitcast double* %58 to <4 x double>*
  store <4 x double> %63, <4 x double>* %67, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %index.next98 = or i64 %index97, 16
  %68 = icmp eq i64 %index.next98, 2288
  br i1 %68, label %for.body3.i45, label %vector.body92.1, !llvm.loop !29

for.body3.i45:                                    ; preds = %vector.body92
  %arrayidx5.i = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay, i64 %indvars.iv11.i, i64 2288
  %69 = load double, double* %arrayidx5.i, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %mul.i = fmul fast double %69, 1.200000e+00
  store double %mul.i, double* %arrayidx5.i, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %arrayidx5.i.1 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay, i64 %indvars.iv11.i, i64 2289
  %70 = load double, double* %arrayidx5.i.1, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %mul.i.1 = fmul fast double %70, 1.200000e+00
  store double %mul.i.1, double* %arrayidx5.i.1, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %arrayidx5.i.2 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay, i64 %indvars.iv11.i, i64 2290
  %71 = load double, double* %arrayidx5.i.2, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %mul.i.2 = fmul fast double %71, 1.200000e+00
  store double %mul.i.2, double* %arrayidx5.i.2, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %arrayidx5.i.3 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay, i64 %indvars.iv11.i, i64 2291
  %72 = load double, double* %arrayidx5.i.3, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %mul.i.3 = fmul fast double %72, 1.200000e+00
  store double %mul.i.3, double* %arrayidx5.i.3, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %arrayidx5.i.4 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay, i64 %indvars.iv11.i, i64 2292
  %73 = load double, double* %arrayidx5.i.4, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %mul.i.4 = fmul fast double %73, 1.200000e+00
  store double %mul.i.4, double* %arrayidx5.i.4, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %arrayidx5.i.5 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay, i64 %indvars.iv11.i, i64 2293
  %74 = load double, double* %arrayidx5.i.5, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %mul.i.5 = fmul fast double %74, 1.200000e+00
  store double %mul.i.5, double* %arrayidx5.i.5, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %arrayidx5.i.6 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay, i64 %indvars.iv11.i, i64 2294
  %75 = load double, double* %arrayidx5.i.6, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %mul.i.6 = fmul fast double %75, 1.200000e+00
  store double %mul.i.6, double* %arrayidx5.i.6, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %arrayidx5.i.7 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay, i64 %indvars.iv11.i, i64 2295
  %76 = load double, double* %arrayidx5.i.7, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %mul.i.7 = fmul fast double %76, 1.200000e+00
  store double %mul.i.7, double* %arrayidx5.i.7, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %arrayidx5.i.8 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay, i64 %indvars.iv11.i, i64 2296
  %77 = load double, double* %arrayidx5.i.8, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %mul.i.8 = fmul fast double %77, 1.200000e+00
  store double %mul.i.8, double* %arrayidx5.i.8, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %arrayidx5.i.9 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay, i64 %indvars.iv11.i, i64 2297
  %78 = load double, double* %arrayidx5.i.9, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %mul.i.9 = fmul fast double %78, 1.200000e+00
  store double %mul.i.9, double* %arrayidx5.i.9, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %arrayidx5.i.10 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay, i64 %indvars.iv11.i, i64 2298
  %79 = load double, double* %arrayidx5.i.10, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %mul.i.10 = fmul fast double %79, 1.200000e+00
  store double %mul.i.10, double* %arrayidx5.i.10, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %arrayidx5.i.11 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay, i64 %indvars.iv11.i, i64 2299
  %80 = load double, double* %arrayidx5.i.11, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %mul.i.11 = fmul fast double %80, 1.200000e+00
  store double %mul.i.11, double* %arrayidx5.i.11, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %arrayidx25.i = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay, i64 %indvars.iv11.i, i64 2288
  %arrayidx25.i.1 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay, i64 %indvars.iv11.i, i64 2289
  %arrayidx25.i.2 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay, i64 %indvars.iv11.i, i64 2290
  %arrayidx25.i.3 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay, i64 %indvars.iv11.i, i64 2291
  %arrayidx25.i.4 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay, i64 %indvars.iv11.i, i64 2292
  %arrayidx25.i.5 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay, i64 %indvars.iv11.i, i64 2293
  %arrayidx25.i.6 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay, i64 %indvars.iv11.i, i64 2294
  %arrayidx25.i.7 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay, i64 %indvars.iv11.i, i64 2295
  %arrayidx25.i.8 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay, i64 %indvars.iv11.i, i64 2296
  %arrayidx25.i.9 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay, i64 %indvars.iv11.i, i64 2297
  %arrayidx25.i.10 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay, i64 %indvars.iv11.i, i64 2298
  %arrayidx25.i.11 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay, i64 %indvars.iv11.i, i64 2299
  br label %for.cond9.preheader.i

for.cond9.preheader.i:                            ; preds = %for.body3.i45, %for.body11.i
  %indvars.iv8.i = phi i64 [ %indvars.iv.next9.i, %for.body11.i ], [ 0, %for.body3.i45 ]
  %arrayidx15.i = getelementptr inbounds [2600 x double], [2600 x double]* %arraydecay3, i64 %indvars.iv11.i, i64 %indvars.iv8.i
  %81 = load double, double* %arrayidx15.i, align 8, !tbaa !6, !alias.scope !30, !noalias !31
  %mul16.i = fmul fast double %81, 1.500000e+00
  %broadcast.splatinsert86 = insertelement <4 x double> undef, double %mul16.i, i32 0
  %broadcast.splat87 = shufflevector <4 x double> %broadcast.splatinsert86, <4 x double> undef, <4 x i32> zeroinitializer
  br label %vector.body69

vector.body69:                                    ; preds = %vector.body69.1, %for.cond9.preheader.i
  %index74 = phi i64 [ 0, %for.cond9.preheader.i ], [ %index.next75.1, %vector.body69.1 ]
  %82 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay4, i64 %indvars.iv8.i, i64 %index74
  %83 = bitcast double* %82 to <4 x double>*
  %wide.load = load <4 x double>, <4 x double>* %83, align 8, !tbaa !6, !alias.scope !32, !noalias !33
  %84 = getelementptr double, double* %82, i64 4
  %85 = bitcast double* %84 to <4 x double>*
  %wide.load83 = load <4 x double>, <4 x double>* %85, align 8, !tbaa !6, !alias.scope !32, !noalias !33
  %86 = getelementptr double, double* %82, i64 8
  %87 = bitcast double* %86 to <4 x double>*
  %wide.load84 = load <4 x double>, <4 x double>* %87, align 8, !tbaa !6, !alias.scope !32, !noalias !33
  %88 = getelementptr double, double* %82, i64 12
  %89 = bitcast double* %88 to <4 x double>*
  %wide.load85 = load <4 x double>, <4 x double>* %89, align 8, !tbaa !6, !alias.scope !32, !noalias !33
  %90 = fmul fast <4 x double> %broadcast.splat87, %wide.load
  %91 = fmul fast <4 x double> %broadcast.splat87, %wide.load83
  %92 = fmul fast <4 x double> %broadcast.splat87, %wide.load84
  %93 = fmul fast <4 x double> %broadcast.splat87, %wide.load85
  %94 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay, i64 %indvars.iv11.i, i64 %index74
  %95 = bitcast double* %94 to <4 x double>*
  %wide.load88 = load <4 x double>, <4 x double>* %95, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %96 = getelementptr double, double* %94, i64 4
  %97 = bitcast double* %96 to <4 x double>*
  %wide.load89 = load <4 x double>, <4 x double>* %97, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %98 = getelementptr double, double* %94, i64 8
  %99 = bitcast double* %98 to <4 x double>*
  %wide.load90 = load <4 x double>, <4 x double>* %99, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %100 = getelementptr double, double* %94, i64 12
  %101 = bitcast double* %100 to <4 x double>*
  %wide.load91 = load <4 x double>, <4 x double>* %101, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %102 = fadd fast <4 x double> %wide.load88, %90
  %103 = fadd fast <4 x double> %wide.load89, %91
  %104 = fadd fast <4 x double> %wide.load90, %92
  %105 = fadd fast <4 x double> %wide.load91, %93
  %106 = bitcast double* %94 to <4 x double>*
  store <4 x double> %102, <4 x double>* %106, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %107 = bitcast double* %96 to <4 x double>*
  store <4 x double> %103, <4 x double>* %107, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %108 = bitcast double* %98 to <4 x double>*
  store <4 x double> %104, <4 x double>* %108, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %109 = bitcast double* %100 to <4 x double>*
  store <4 x double> %105, <4 x double>* %109, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %index.next75 = or i64 %index74, 16
  %110 = icmp eq i64 %index.next75, 2288
  br i1 %110, label %for.body11.i, label %vector.body69.1, !llvm.loop !34

for.body11.i:                                     ; preds = %vector.body69
  %arrayidx20.i = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay4, i64 %indvars.iv8.i, i64 2288
  %111 = load double, double* %arrayidx20.i, align 8, !tbaa !6, !alias.scope !32, !noalias !33
  %mul21.i = fmul fast double %mul16.i, %111
  %112 = load double, double* %arrayidx25.i, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %add.i = fadd fast double %112, %mul21.i
  store double %add.i, double* %arrayidx25.i, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %arrayidx20.i.1 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay4, i64 %indvars.iv8.i, i64 2289
  %113 = load double, double* %arrayidx20.i.1, align 8, !tbaa !6, !alias.scope !32, !noalias !33
  %mul21.i.1 = fmul fast double %mul16.i, %113
  %114 = load double, double* %arrayidx25.i.1, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %add.i.1 = fadd fast double %114, %mul21.i.1
  store double %add.i.1, double* %arrayidx25.i.1, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %arrayidx20.i.2 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay4, i64 %indvars.iv8.i, i64 2290
  %115 = load double, double* %arrayidx20.i.2, align 8, !tbaa !6, !alias.scope !32, !noalias !33
  %mul21.i.2 = fmul fast double %mul16.i, %115
  %116 = load double, double* %arrayidx25.i.2, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %add.i.2 = fadd fast double %116, %mul21.i.2
  store double %add.i.2, double* %arrayidx25.i.2, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %arrayidx20.i.3 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay4, i64 %indvars.iv8.i, i64 2291
  %117 = load double, double* %arrayidx20.i.3, align 8, !tbaa !6, !alias.scope !32, !noalias !33
  %mul21.i.3 = fmul fast double %mul16.i, %117
  %118 = load double, double* %arrayidx25.i.3, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %add.i.3 = fadd fast double %118, %mul21.i.3
  store double %add.i.3, double* %arrayidx25.i.3, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %arrayidx20.i.4 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay4, i64 %indvars.iv8.i, i64 2292
  %119 = load double, double* %arrayidx20.i.4, align 8, !tbaa !6, !alias.scope !32, !noalias !33
  %mul21.i.4 = fmul fast double %mul16.i, %119
  %120 = load double, double* %arrayidx25.i.4, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %add.i.4 = fadd fast double %120, %mul21.i.4
  store double %add.i.4, double* %arrayidx25.i.4, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %arrayidx20.i.5 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay4, i64 %indvars.iv8.i, i64 2293
  %121 = load double, double* %arrayidx20.i.5, align 8, !tbaa !6, !alias.scope !32, !noalias !33
  %mul21.i.5 = fmul fast double %mul16.i, %121
  %122 = load double, double* %arrayidx25.i.5, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %add.i.5 = fadd fast double %122, %mul21.i.5
  store double %add.i.5, double* %arrayidx25.i.5, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %arrayidx20.i.6 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay4, i64 %indvars.iv8.i, i64 2294
  %123 = load double, double* %arrayidx20.i.6, align 8, !tbaa !6, !alias.scope !32, !noalias !33
  %mul21.i.6 = fmul fast double %mul16.i, %123
  %124 = load double, double* %arrayidx25.i.6, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %add.i.6 = fadd fast double %124, %mul21.i.6
  store double %add.i.6, double* %arrayidx25.i.6, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %arrayidx20.i.7 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay4, i64 %indvars.iv8.i, i64 2295
  %125 = load double, double* %arrayidx20.i.7, align 8, !tbaa !6, !alias.scope !32, !noalias !33
  %mul21.i.7 = fmul fast double %mul16.i, %125
  %126 = load double, double* %arrayidx25.i.7, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %add.i.7 = fadd fast double %126, %mul21.i.7
  store double %add.i.7, double* %arrayidx25.i.7, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %arrayidx20.i.8 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay4, i64 %indvars.iv8.i, i64 2296
  %127 = load double, double* %arrayidx20.i.8, align 8, !tbaa !6, !alias.scope !32, !noalias !33
  %mul21.i.8 = fmul fast double %mul16.i, %127
  %128 = load double, double* %arrayidx25.i.8, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %add.i.8 = fadd fast double %128, %mul21.i.8
  store double %add.i.8, double* %arrayidx25.i.8, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %arrayidx20.i.9 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay4, i64 %indvars.iv8.i, i64 2297
  %129 = load double, double* %arrayidx20.i.9, align 8, !tbaa !6, !alias.scope !32, !noalias !33
  %mul21.i.9 = fmul fast double %mul16.i, %129
  %130 = load double, double* %arrayidx25.i.9, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %add.i.9 = fadd fast double %130, %mul21.i.9
  store double %add.i.9, double* %arrayidx25.i.9, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %arrayidx20.i.10 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay4, i64 %indvars.iv8.i, i64 2298
  %131 = load double, double* %arrayidx20.i.10, align 8, !tbaa !6, !alias.scope !32, !noalias !33
  %mul21.i.10 = fmul fast double %mul16.i, %131
  %132 = load double, double* %arrayidx25.i.10, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %add.i.10 = fadd fast double %132, %mul21.i.10
  store double %add.i.10, double* %arrayidx25.i.10, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %arrayidx20.i.11 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay4, i64 %indvars.iv8.i, i64 2299
  %133 = load double, double* %arrayidx20.i.11, align 8, !tbaa !6, !alias.scope !32, !noalias !33
  %mul21.i.11 = fmul fast double %mul16.i, %133
  %134 = load double, double* %arrayidx25.i.11, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %add.i.11 = fadd fast double %134, %mul21.i.11
  store double %add.i.11, double* %arrayidx25.i.11, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %indvars.iv.next9.i = add nuw nsw i64 %indvars.iv8.i, 1
  %exitcond10.i = icmp eq i64 %indvars.iv.next9.i, 2600
  br i1 %exitcond10.i, label %for.inc32.i, label %for.cond9.preheader.i

for.inc32.i:                                      ; preds = %for.body11.i
  %indvars.iv.next12.i = add nuw nsw i64 %indvars.iv11.i, 1
  %exitcond13.i = icmp eq i64 %indvars.iv.next12.i, 2000
  br i1 %exitcond13.i, label %kernel_gemm.exit, label %for.cond1.preheader.i41

kernel_gemm.exit:                                 ; preds = %for.inc32.i, %polly.loop_exit264
  call void @free(i8* nonnull %1) #4
  call void @free(i8* %3) #4
  call void @free(i8* nonnull %5) #4
  ret i32 0

polly.loop_header:                                ; preds = %polybench_alloc_data.exit40, %polly.loop_exit161
  %polly.indvar = phi i64 [ %polly.indvar_next, %polly.loop_exit161 ], [ 0, %polybench_alloc_data.exit40 ]
  %135 = mul nsw i64 %polly.indvar, -32
  %136 = add nsw i64 %135, 2599
  %137 = icmp slt i64 %136, 31
  %138 = select i1 %137, i64 %136, i64 31
  %139 = shl nsw i64 %polly.indvar, 5
  br label %polly.loop_header159

polly.loop_exit161:                               ; preds = %polly.loop_exit167
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond38 = icmp eq i64 %polly.indvar_next, 82
  br i1 %exitcond38, label %polly.loop_header178, label %polly.loop_header

polly.loop_header159:                             ; preds = %polly.loop_exit167, %polly.loop_header
  %polly.indvar162 = phi i64 [ 0, %polly.loop_header ], [ %polly.indvar_next163, %polly.loop_exit167 ]
  %140 = shl i64 %polly.indvar162, 5
  %141 = add i64 %140, -2300
  %142 = icmp sgt i64 %141, -32
  %smax = select i1 %142, i64 %141, i64 -32
  %143 = sub i64 0, %smax
  %144 = mul nsw i64 %polly.indvar162, -32
  %145 = add nsw i64 %144, 2299
  %146 = icmp slt i64 %145, 31
  %147 = select i1 %146, i64 %145, i64 31
  %148 = shl nsw i64 %polly.indvar162, 5
  %min.iters.check = icmp ult i64 %143, 4
  %broadcast.splatinsert122 = insertelement <4 x i64> undef, i64 %148, i32 0
  %broadcast.splat123 = shufflevector <4 x i64> %broadcast.splatinsert122, <4 x i64> undef, <4 x i32> zeroinitializer
  %149 = add nuw nsw <4 x i64> %broadcast.splat123, <i64 0, i64 1, i64 2, i64 3>
  %150 = trunc <4 x i64> %149 to <4 x i32>
  %151 = add <4 x i32> %150, <i32 2, i32 2, i32 2, i32 2>
  %152 = shl i64 %polly.indvar162, 8
  %153 = icmp eq i64 %143, 4
  %154 = add nuw nsw <4 x i64> %broadcast.splat123, <i64 4, i64 5, i64 6, i64 7>
  %155 = trunc <4 x i64> %154 to <4 x i32>
  %156 = add <4 x i32> %155, <i32 2, i32 2, i32 2, i32 2>
  %157 = extractelement <4 x i64> %154, i32 0
  %158 = shl i64 %157, 3
  %159 = icmp eq i64 %143, 8
  %160 = add nuw nsw <4 x i64> %broadcast.splat123, <i64 8, i64 9, i64 10, i64 11>
  %161 = trunc <4 x i64> %160 to <4 x i32>
  %162 = add <4 x i32> %161, <i32 2, i32 2, i32 2, i32 2>
  %163 = extractelement <4 x i64> %160, i32 0
  %164 = shl i64 %163, 3
  %165 = icmp eq i64 %143, 12
  %166 = add nuw nsw <4 x i64> %broadcast.splat123, <i64 12, i64 13, i64 14, i64 15>
  %167 = trunc <4 x i64> %166 to <4 x i32>
  %168 = add <4 x i32> %167, <i32 2, i32 2, i32 2, i32 2>
  %169 = extractelement <4 x i64> %166, i32 0
  %170 = shl i64 %169, 3
  %171 = icmp eq i64 %143, 16
  %172 = add nuw nsw <4 x i64> %broadcast.splat123, <i64 16, i64 17, i64 18, i64 19>
  %173 = trunc <4 x i64> %172 to <4 x i32>
  %174 = add <4 x i32> %173, <i32 2, i32 2, i32 2, i32 2>
  %175 = extractelement <4 x i64> %172, i32 0
  %176 = shl i64 %175, 3
  %177 = icmp eq i64 %143, 20
  %178 = add nuw nsw <4 x i64> %broadcast.splat123, <i64 20, i64 21, i64 22, i64 23>
  %179 = trunc <4 x i64> %178 to <4 x i32>
  %180 = add <4 x i32> %179, <i32 2, i32 2, i32 2, i32 2>
  %181 = extractelement <4 x i64> %178, i32 0
  %182 = shl i64 %181, 3
  %183 = icmp eq i64 %143, 24
  %184 = add nuw nsw <4 x i64> %broadcast.splat123, <i64 24, i64 25, i64 26, i64 27>
  %185 = trunc <4 x i64> %184 to <4 x i32>
  %186 = add <4 x i32> %185, <i32 2, i32 2, i32 2, i32 2>
  %187 = extractelement <4 x i64> %184, i32 0
  %188 = shl i64 %187, 3
  %189 = icmp eq i64 %143, 28
  %190 = add nuw nsw <4 x i64> %broadcast.splat123, <i64 28, i64 29, i64 30, i64 31>
  %191 = trunc <4 x i64> %190 to <4 x i32>
  %192 = add <4 x i32> %191, <i32 2, i32 2, i32 2, i32 2>
  %193 = extractelement <4 x i64> %190, i32 0
  %194 = shl i64 %193, 3
  br label %polly.loop_header165

polly.loop_exit167:                               ; preds = %polly.loop_exit173
  %polly.indvar_next163 = add nuw nsw i64 %polly.indvar162, 1
  %exitcond37 = icmp eq i64 %polly.indvar_next163, 72
  br i1 %exitcond37, label %polly.loop_exit161, label %polly.loop_header159

polly.loop_header165:                             ; preds = %polly.loop_header159, %polly.loop_exit173
  %polly.indvar168 = phi i64 [ 0, %polly.loop_header159 ], [ %polly.indvar_next169, %polly.loop_exit173 ]
  %195 = add nuw nsw i64 %polly.indvar168, %139
  %196 = trunc i64 %195 to i32
  %197 = mul nuw nsw i64 %195, 18400
  br i1 %min.iters.check, label %polly.loop_header171, label %vector.ph115

vector.ph115:                                     ; preds = %polly.loop_header165
  %broadcast.splatinsert124 = insertelement <4 x i32> undef, i32 %196, i32 0
  %broadcast.splat125 = shufflevector <4 x i32> %broadcast.splatinsert124, <4 x i32> undef, <4 x i32> zeroinitializer
  %198 = mul <4 x i32> %151, %broadcast.splat125
  %199 = srem <4 x i32> %198, <i32 2300, i32 2300, i32 2300, i32 2300>
  %200 = sitofp <4 x i32> %199 to <4 x double>
  %201 = fmul fast <4 x double> %200, <double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95>
  %202 = add nuw nsw i64 %152, %197
  %203 = getelementptr i8, i8* %5, i64 %202
  %204 = bitcast i8* %203 to <4 x double>*
  store <4 x double> %201, <4 x double>* %204, align 8, !alias.scope !35, !noalias !37
  br i1 %153, label %polly.loop_exit173, label %vector.body111.1, !llvm.loop !43

polly.loop_exit173:                               ; preds = %vector.ph115, %vector.body111.1, %vector.body111.2, %vector.body111.3, %vector.body111.4, %vector.body111.5, %vector.body111.6, %vector.body111.7, %polly.loop_header171
  %polly.indvar_next169 = add nuw nsw i64 %polly.indvar168, 1
  %polly.loop_cond170 = icmp slt i64 %polly.indvar168, %138
  br i1 %polly.loop_cond170, label %polly.loop_header165, label %polly.loop_exit167

polly.loop_header171:                             ; preds = %polly.loop_header165, %polly.loop_header171
  %polly.indvar174 = phi i64 [ %polly.indvar_next175, %polly.loop_header171 ], [ 0, %polly.loop_header165 ]
  %205 = add nuw nsw i64 %polly.indvar174, %148
  %206 = trunc i64 %205 to i32
  %207 = add i32 %206, 2
  %208 = mul i32 %207, %196
  %p_rem44.i = srem i32 %208, 2300
  %p_conv45.i = sitofp i32 %p_rem44.i to double
  %p_div47.i = fmul fast double %p_conv45.i, 0x3F3C7E7115D0CE95
  %209 = shl i64 %205, 3
  %210 = add nuw nsw i64 %209, %197
  %scevgep = getelementptr i8, i8* %5, i64 %210
  %scevgep177 = bitcast i8* %scevgep to double*
  store double %p_div47.i, double* %scevgep177, align 8, !alias.scope !35, !noalias !37
  %polly.indvar_next175 = add nuw nsw i64 %polly.indvar174, 1
  %polly.loop_cond176 = icmp slt i64 %polly.indvar174, %147
  br i1 %polly.loop_cond176, label %polly.loop_header171, label %polly.loop_exit173, !llvm.loop !44

polly.loop_header178:                             ; preds = %polly.loop_exit161, %polly.loop_exit186
  %polly.indvar181 = phi i64 [ %polly.indvar_next182, %polly.loop_exit186 ], [ 0, %polly.loop_exit161 ]
  %211 = mul nsw i64 %polly.indvar181, -32
  %212 = add nsw i64 %211, 1999
  %213 = icmp slt i64 %212, 31
  %214 = select i1 %213, i64 %212, i64 31
  %215 = shl nsw i64 %polly.indvar181, 5
  br label %polly.loop_header184

polly.loop_exit186:                               ; preds = %polly.loop_exit192
  %polly.indvar_next182 = add nuw nsw i64 %polly.indvar181, 1
  %exitcond36 = icmp eq i64 %polly.indvar_next182, 63
  br i1 %exitcond36, label %polly.loop_header204, label %polly.loop_header178

polly.loop_header184:                             ; preds = %polly.loop_exit192, %polly.loop_header178
  %polly.indvar187 = phi i64 [ 0, %polly.loop_header178 ], [ %polly.indvar_next188, %polly.loop_exit192 ]
  %216 = shl i64 %polly.indvar187, 5
  %217 = add i64 %216, -2300
  %218 = icmp sgt i64 %217, -32
  %smax129 = select i1 %218, i64 %217, i64 -32
  %219 = sub i64 0, %smax129
  %220 = mul nsw i64 %polly.indvar187, -32
  %221 = add nsw i64 %220, 2299
  %222 = icmp slt i64 %221, 31
  %223 = select i1 %222, i64 %221, i64 31
  %224 = shl nsw i64 %polly.indvar187, 5
  %min.iters.check130 = icmp ult i64 %219, 4
  %broadcast.splatinsert142 = insertelement <4 x i64> undef, i64 %224, i32 0
  %broadcast.splat143 = shufflevector <4 x i64> %broadcast.splatinsert142, <4 x i64> undef, <4 x i32> zeroinitializer
  %225 = add nuw nsw <4 x i64> %broadcast.splat143, <i64 0, i64 1, i64 2, i64 3>
  %226 = trunc <4 x i64> %225 to <4 x i32>
  %227 = shl i64 %polly.indvar187, 8
  %228 = icmp eq i64 %219, 4
  %229 = add nuw nsw <4 x i64> %broadcast.splat143, <i64 4, i64 5, i64 6, i64 7>
  %230 = trunc <4 x i64> %229 to <4 x i32>
  %231 = extractelement <4 x i64> %229, i32 0
  %232 = shl i64 %231, 3
  %233 = icmp eq i64 %219, 8
  %234 = add nuw nsw <4 x i64> %broadcast.splat143, <i64 8, i64 9, i64 10, i64 11>
  %235 = trunc <4 x i64> %234 to <4 x i32>
  %236 = extractelement <4 x i64> %234, i32 0
  %237 = shl i64 %236, 3
  %238 = icmp eq i64 %219, 12
  %239 = add nuw nsw <4 x i64> %broadcast.splat143, <i64 12, i64 13, i64 14, i64 15>
  %240 = trunc <4 x i64> %239 to <4 x i32>
  %241 = extractelement <4 x i64> %239, i32 0
  %242 = shl i64 %241, 3
  %243 = icmp eq i64 %219, 16
  %244 = add nuw nsw <4 x i64> %broadcast.splat143, <i64 16, i64 17, i64 18, i64 19>
  %245 = trunc <4 x i64> %244 to <4 x i32>
  %246 = extractelement <4 x i64> %244, i32 0
  %247 = shl i64 %246, 3
  %248 = icmp eq i64 %219, 20
  %249 = add nuw nsw <4 x i64> %broadcast.splat143, <i64 20, i64 21, i64 22, i64 23>
  %250 = trunc <4 x i64> %249 to <4 x i32>
  %251 = extractelement <4 x i64> %249, i32 0
  %252 = shl i64 %251, 3
  %253 = icmp eq i64 %219, 24
  %254 = add nuw nsw <4 x i64> %broadcast.splat143, <i64 24, i64 25, i64 26, i64 27>
  %255 = trunc <4 x i64> %254 to <4 x i32>
  %256 = extractelement <4 x i64> %254, i32 0
  %257 = shl i64 %256, 3
  %258 = icmp eq i64 %219, 28
  %259 = add nuw nsw <4 x i64> %broadcast.splat143, <i64 28, i64 29, i64 30, i64 31>
  %260 = trunc <4 x i64> %259 to <4 x i32>
  %261 = extractelement <4 x i64> %259, i32 0
  %262 = shl i64 %261, 3
  br label %polly.loop_header190

polly.loop_exit192:                               ; preds = %polly.loop_exit198
  %polly.indvar_next188 = add nuw nsw i64 %polly.indvar187, 1
  %exitcond35 = icmp eq i64 %polly.indvar_next188, 72
  br i1 %exitcond35, label %polly.loop_exit186, label %polly.loop_header184

polly.loop_header190:                             ; preds = %polly.loop_header184, %polly.loop_exit198
  %polly.indvar193 = phi i64 [ 0, %polly.loop_header184 ], [ %polly.indvar_next194, %polly.loop_exit198 ]
  %263 = add nuw nsw i64 %polly.indvar193, %215
  %264 = trunc i64 %263 to i32
  %265 = mul nuw nsw i64 %263, 18400
  br i1 %min.iters.check130, label %polly.loop_header196, label %vector.ph135

vector.ph135:                                     ; preds = %polly.loop_header190
  %broadcast.splatinsert144 = insertelement <4 x i32> undef, i32 %264, i32 0
  %broadcast.splat145 = shufflevector <4 x i32> %broadcast.splatinsert144, <4 x i32> undef, <4 x i32> zeroinitializer
  %266 = mul <4 x i32> %broadcast.splat145, %226
  %267 = add <4 x i32> %266, <i32 1, i32 1, i32 1, i32 1>
  %268 = srem <4 x i32> %267, <i32 2000, i32 2000, i32 2000, i32 2000>
  %269 = sitofp <4 x i32> %268 to <4 x double>
  %270 = fmul fast <4 x double> %269, <double 5.000000e-04, double 5.000000e-04, double 5.000000e-04, double 5.000000e-04>
  %271 = add nuw nsw i64 %227, %265
  %272 = getelementptr i8, i8* %1, i64 %271
  %273 = bitcast i8* %272 to <4 x double>*
  store <4 x double> %270, <4 x double>* %273, align 8, !alias.scope !38, !noalias !46
  br i1 %228, label %polly.loop_exit198, label %vector.body126.1, !llvm.loop !47

polly.loop_exit198:                               ; preds = %vector.ph135, %vector.body126.1, %vector.body126.2, %vector.body126.3, %vector.body126.4, %vector.body126.5, %vector.body126.6, %vector.body126.7, %polly.loop_header196
  %polly.indvar_next194 = add nuw nsw i64 %polly.indvar193, 1
  %polly.loop_cond195 = icmp slt i64 %polly.indvar193, %214
  br i1 %polly.loop_cond195, label %polly.loop_header190, label %polly.loop_exit192

polly.loop_header196:                             ; preds = %polly.loop_header190, %polly.loop_header196
  %polly.indvar199 = phi i64 [ %polly.indvar_next200, %polly.loop_header196 ], [ 0, %polly.loop_header190 ]
  %274 = add nuw nsw i64 %polly.indvar199, %224
  %275 = trunc i64 %274 to i32
  %276 = mul i32 %275, %264
  %277 = add i32 %276, 1
  %p_rem.i = srem i32 %277, 2000
  %p_conv.i = sitofp i32 %p_rem.i to double
  %p_div.i = fmul fast double %p_conv.i, 5.000000e-04
  %278 = shl i64 %274, 3
  %279 = add nuw nsw i64 %278, %265
  %scevgep202 = getelementptr i8, i8* %1, i64 %279
  %scevgep202203 = bitcast i8* %scevgep202 to double*
  store double %p_div.i, double* %scevgep202203, align 8, !alias.scope !38, !noalias !46
  %polly.indvar_next200 = add nuw nsw i64 %polly.indvar199, 1
  %polly.loop_cond201 = icmp slt i64 %polly.indvar199, %223
  br i1 %polly.loop_cond201, label %polly.loop_header196, label %polly.loop_exit198, !llvm.loop !48

polly.loop_header204:                             ; preds = %polly.loop_exit186, %polly.loop_exit212
  %polly.indvar207 = phi i64 [ %polly.indvar_next208, %polly.loop_exit212 ], [ 0, %polly.loop_exit186 ]
  %280 = mul nsw i64 %polly.indvar207, -32
  %281 = add nsw i64 %280, 1999
  %282 = icmp slt i64 %281, 31
  %283 = select i1 %282, i64 %281, i64 31
  %284 = shl i64 %polly.indvar207, 5
  br label %polly.loop_header210

polly.loop_exit212:                               ; preds = %polly.loop_exit218
  %polly.indvar_next208 = add nuw nsw i64 %polly.indvar207, 1
  %exitcond34 = icmp eq i64 %polly.indvar_next208, 63
  br i1 %exitcond34, label %polly.loop_header230, label %polly.loop_header204

polly.loop_header210:                             ; preds = %polly.loop_exit218, %polly.loop_header204
  %polly.indvar213 = phi i64 [ 0, %polly.loop_header204 ], [ %polly.indvar_next214, %polly.loop_exit218 ]
  %285 = shl i64 %polly.indvar213, 5
  %286 = add i64 %285, -2300
  %287 = icmp sgt i64 %286, -32
  %smax149 = select i1 %287, i64 %286, i64 -32
  %288 = sub i64 0, %smax149
  %289 = mul nsw i64 %polly.indvar213, -32
  %290 = add nsw i64 %289, 2299
  %291 = icmp slt i64 %290, 31
  %292 = select i1 %291, i64 %290, i64 31
  %293 = shl i64 %polly.indvar213, 5
  %min.iters.check150 = icmp ult i64 %288, 16
  %n.vec153 = and i64 %288, -16
  %cmp.zero154 = icmp eq i64 %n.vec153, 0
  %294 = shl i64 %polly.indvar213, 8
  %295 = icmp eq i64 %n.vec153, 16
  %cmp.n159 = icmp eq i64 %n.vec153, %288
  %296 = shl i64 %polly.indvar213, 8
  %297 = or i64 %296, 128
  br label %polly.loop_header216

polly.loop_exit218:                               ; preds = %polly.loop_exit224
  %polly.indvar_next214 = add nuw nsw i64 %polly.indvar213, 1
  %exitcond33 = icmp eq i64 %polly.indvar_next214, 72
  br i1 %exitcond33, label %polly.loop_exit212, label %polly.loop_header210

polly.loop_header216:                             ; preds = %polly.loop_header210, %polly.loop_exit224
  %polly.indvar219 = phi i64 [ 0, %polly.loop_header210 ], [ %polly.indvar_next220, %polly.loop_exit224 ]
  %298 = add nuw nsw i64 %polly.indvar219, %284
  %299 = mul nuw nsw i64 %298, 18400
  %brmerge = or i1 %min.iters.check150, %cmp.zero154
  br i1 %brmerge, label %polly.loop_header222, label %vector.body146

vector.body146:                                   ; preds = %polly.loop_header216
  %300 = add nuw nsw i64 %294, %299
  %301 = getelementptr i8, i8* %1, i64 %300
  %302 = bitcast i8* %301 to <4 x double>*
  %wide.load166 = load <4 x double>, <4 x double>* %302, align 8, !alias.scope !38, !noalias !46
  %303 = getelementptr i8, i8* %301, i64 32
  %304 = bitcast i8* %303 to <4 x double>*
  %wide.load167 = load <4 x double>, <4 x double>* %304, align 8, !alias.scope !38, !noalias !46
  %305 = getelementptr i8, i8* %301, i64 64
  %306 = bitcast i8* %305 to <4 x double>*
  %wide.load168 = load <4 x double>, <4 x double>* %306, align 8, !alias.scope !38, !noalias !46
  %307 = getelementptr i8, i8* %301, i64 96
  %308 = bitcast i8* %307 to <4 x double>*
  %wide.load169 = load <4 x double>, <4 x double>* %308, align 8, !alias.scope !38, !noalias !46
  %309 = fmul fast <4 x double> %wide.load166, <double 1.200000e+00, double 1.200000e+00, double 1.200000e+00, double 1.200000e+00>
  %310 = fmul fast <4 x double> %wide.load167, <double 1.200000e+00, double 1.200000e+00, double 1.200000e+00, double 1.200000e+00>
  %311 = fmul fast <4 x double> %wide.load168, <double 1.200000e+00, double 1.200000e+00, double 1.200000e+00, double 1.200000e+00>
  %312 = fmul fast <4 x double> %wide.load169, <double 1.200000e+00, double 1.200000e+00, double 1.200000e+00, double 1.200000e+00>
  %313 = bitcast i8* %301 to <4 x double>*
  store <4 x double> %309, <4 x double>* %313, align 8, !alias.scope !38, !noalias !46
  %314 = bitcast i8* %303 to <4 x double>*
  store <4 x double> %310, <4 x double>* %314, align 8, !alias.scope !38, !noalias !46
  %315 = bitcast i8* %305 to <4 x double>*
  store <4 x double> %311, <4 x double>* %315, align 8, !alias.scope !38, !noalias !46
  %316 = bitcast i8* %307 to <4 x double>*
  store <4 x double> %312, <4 x double>* %316, align 8, !alias.scope !38, !noalias !46
  br i1 %295, label %middle.block147, label %vector.body146.1, !llvm.loop !49

middle.block147:                                  ; preds = %vector.body146.1, %vector.body146
  br i1 %cmp.n159, label %polly.loop_exit224, label %polly.loop_header222

polly.loop_exit224:                               ; preds = %polly.loop_header222, %middle.block147
  %polly.indvar_next220 = add nuw nsw i64 %polly.indvar219, 1
  %polly.loop_cond221 = icmp slt i64 %polly.indvar219, %283
  br i1 %polly.loop_cond221, label %polly.loop_header216, label %polly.loop_exit218

polly.loop_header222:                             ; preds = %polly.loop_header216, %middle.block147, %polly.loop_header222
  %polly.indvar225 = phi i64 [ %polly.indvar_next226, %polly.loop_header222 ], [ 0, %polly.loop_header216 ], [ %n.vec153, %middle.block147 ]
  %317 = add nuw nsw i64 %polly.indvar225, %293
  %318 = shl i64 %317, 3
  %319 = add nuw nsw i64 %318, %299
  %scevgep228 = getelementptr i8, i8* %1, i64 %319
  %scevgep228229 = bitcast i8* %scevgep228 to double*
  %_p_scalar_ = load double, double* %scevgep228229, align 8, !alias.scope !38, !noalias !46
  %p_mul.i = fmul fast double %_p_scalar_, 1.200000e+00
  store double %p_mul.i, double* %scevgep228229, align 8, !alias.scope !38, !noalias !46
  %polly.indvar_next226 = add nuw nsw i64 %polly.indvar225, 1
  %polly.loop_cond227 = icmp slt i64 %polly.indvar225, %292
  br i1 %polly.loop_cond227, label %polly.loop_header222, label %polly.loop_exit224, !llvm.loop !50

polly.loop_header230:                             ; preds = %polly.loop_exit212, %polly.loop_exit238
  %polly.indvar233 = phi i64 [ %polly.indvar_next234, %polly.loop_exit238 ], [ 0, %polly.loop_exit212 ]
  %320 = mul nsw i64 %polly.indvar233, -32
  %321 = add nsw i64 %320, 1999
  %322 = icmp slt i64 %321, 31
  %323 = select i1 %322, i64 %321, i64 31
  %324 = shl nsw i64 %polly.indvar233, 5
  br label %polly.loop_header236

polly.loop_exit238:                               ; preds = %polly.loop_exit244
  %polly.indvar_next234 = add nuw nsw i64 %polly.indvar233, 1
  %exitcond32 = icmp eq i64 %polly.indvar_next234, 63
  br i1 %exitcond32, label %polly.loop_header256, label %polly.loop_header230

polly.loop_header236:                             ; preds = %polly.loop_exit244, %polly.loop_header230
  %polly.indvar239 = phi i64 [ 0, %polly.loop_header230 ], [ %polly.indvar_next240, %polly.loop_exit244 ]
  %325 = shl i64 %polly.indvar239, 5
  %326 = add i64 %325, -2600
  %327 = icmp sgt i64 %326, -32
  %smax173 = select i1 %327, i64 %326, i64 -32
  %328 = sub i64 0, %smax173
  %329 = mul nsw i64 %polly.indvar239, -32
  %330 = add nsw i64 %329, 2599
  %331 = icmp slt i64 %330, 31
  %332 = select i1 %331, i64 %330, i64 31
  %333 = shl nsw i64 %polly.indvar239, 5
  %min.iters.check174 = icmp ult i64 %328, 4
  %broadcast.splatinsert186 = insertelement <4 x i64> undef, i64 %333, i32 0
  %broadcast.splat187 = shufflevector <4 x i64> %broadcast.splatinsert186, <4 x i64> undef, <4 x i32> zeroinitializer
  %334 = add nuw nsw <4 x i64> %broadcast.splat187, <i64 0, i64 1, i64 2, i64 3>
  %335 = trunc <4 x i64> %334 to <4 x i32>
  %336 = add <4 x i32> %335, <i32 1, i32 1, i32 1, i32 1>
  %337 = shl i64 %polly.indvar239, 8
  %338 = add nuw nsw <4 x i64> %broadcast.splat187, <i64 4, i64 5, i64 6, i64 7>
  %339 = trunc <4 x i64> %338 to <4 x i32>
  %340 = add <4 x i32> %339, <i32 1, i32 1, i32 1, i32 1>
  %341 = extractelement <4 x i64> %338, i32 0
  %342 = shl i64 %341, 3
  %343 = icmp eq i64 %328, 8
  %344 = add nuw nsw <4 x i64> %broadcast.splat187, <i64 8, i64 9, i64 10, i64 11>
  %345 = trunc <4 x i64> %344 to <4 x i32>
  %346 = add <4 x i32> %345, <i32 1, i32 1, i32 1, i32 1>
  %347 = extractelement <4 x i64> %344, i32 0
  %348 = shl i64 %347, 3
  %349 = add nuw nsw <4 x i64> %broadcast.splat187, <i64 12, i64 13, i64 14, i64 15>
  %350 = trunc <4 x i64> %349 to <4 x i32>
  %351 = add <4 x i32> %350, <i32 1, i32 1, i32 1, i32 1>
  %352 = extractelement <4 x i64> %349, i32 0
  %353 = shl i64 %352, 3
  %354 = icmp eq i64 %328, 16
  %355 = add nuw nsw <4 x i64> %broadcast.splat187, <i64 16, i64 17, i64 18, i64 19>
  %356 = trunc <4 x i64> %355 to <4 x i32>
  %357 = add <4 x i32> %356, <i32 1, i32 1, i32 1, i32 1>
  %358 = extractelement <4 x i64> %355, i32 0
  %359 = shl i64 %358, 3
  %360 = add nuw nsw <4 x i64> %broadcast.splat187, <i64 20, i64 21, i64 22, i64 23>
  %361 = trunc <4 x i64> %360 to <4 x i32>
  %362 = add <4 x i32> %361, <i32 1, i32 1, i32 1, i32 1>
  %363 = extractelement <4 x i64> %360, i32 0
  %364 = shl i64 %363, 3
  %365 = icmp eq i64 %328, 24
  %366 = add nuw nsw <4 x i64> %broadcast.splat187, <i64 24, i64 25, i64 26, i64 27>
  %367 = trunc <4 x i64> %366 to <4 x i32>
  %368 = add <4 x i32> %367, <i32 1, i32 1, i32 1, i32 1>
  %369 = extractelement <4 x i64> %366, i32 0
  %370 = shl i64 %369, 3
  %371 = add nuw nsw <4 x i64> %broadcast.splat187, <i64 28, i64 29, i64 30, i64 31>
  %372 = trunc <4 x i64> %371 to <4 x i32>
  %373 = add <4 x i32> %372, <i32 1, i32 1, i32 1, i32 1>
  %374 = extractelement <4 x i64> %371, i32 0
  %375 = shl i64 %374, 3
  br label %polly.loop_header242

polly.loop_exit244:                               ; preds = %polly.loop_exit250
  %polly.indvar_next240 = add nuw nsw i64 %polly.indvar239, 1
  %exitcond31 = icmp eq i64 %polly.indvar_next240, 82
  br i1 %exitcond31, label %polly.loop_exit238, label %polly.loop_header236

polly.loop_header242:                             ; preds = %polly.loop_header236, %polly.loop_exit250
  %polly.indvar245 = phi i64 [ 0, %polly.loop_header236 ], [ %polly.indvar_next246, %polly.loop_exit250 ]
  %376 = add nuw nsw i64 %polly.indvar245, %324
  %377 = trunc i64 %376 to i32
  %378 = mul nuw nsw i64 %376, 20800
  br i1 %min.iters.check174, label %polly.loop_header248, label %vector.ph179

vector.ph179:                                     ; preds = %polly.loop_header242
  %broadcast.splatinsert188 = insertelement <4 x i32> undef, i32 %377, i32 0
  %broadcast.splat189 = shufflevector <4 x i32> %broadcast.splatinsert188, <4 x i32> undef, <4 x i32> zeroinitializer
  %379 = mul <4 x i32> %336, %broadcast.splat189
  %380 = srem <4 x i32> %379, <i32 2600, i32 2600, i32 2600, i32 2600>
  %381 = sitofp <4 x i32> %380 to <4 x double>
  %382 = fmul fast <4 x double> %381, <double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6>
  %383 = add nuw nsw i64 %337, %378
  %384 = getelementptr i8, i8* %3, i64 %383
  %385 = bitcast i8* %384 to <4 x double>*
  store <4 x double> %382, <4 x double>* %385, align 8, !alias.scope !39, !noalias !51
  %386 = mul <4 x i32> %340, %broadcast.splat189
  %387 = srem <4 x i32> %386, <i32 2600, i32 2600, i32 2600, i32 2600>
  %388 = sitofp <4 x i32> %387 to <4 x double>
  %389 = fmul fast <4 x double> %388, <double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6>
  %390 = add nuw nsw i64 %342, %378
  %391 = getelementptr i8, i8* %3, i64 %390
  %392 = bitcast i8* %391 to <4 x double>*
  store <4 x double> %389, <4 x double>* %392, align 8, !alias.scope !39, !noalias !51
  br i1 %343, label %polly.loop_exit250, label %vector.body170.2, !llvm.loop !52

polly.loop_exit250:                               ; preds = %vector.ph179, %vector.body170.2, %vector.body170.4, %vector.body170.6, %polly.loop_header248
  %polly.indvar_next246 = add nuw nsw i64 %polly.indvar245, 1
  %polly.loop_cond247 = icmp slt i64 %polly.indvar245, %323
  br i1 %polly.loop_cond247, label %polly.loop_header242, label %polly.loop_exit244

polly.loop_header248:                             ; preds = %polly.loop_header242, %polly.loop_header248
  %polly.indvar251 = phi i64 [ %polly.indvar_next252, %polly.loop_header248 ], [ 0, %polly.loop_header242 ]
  %393 = add nuw nsw i64 %polly.indvar251, %333
  %394 = trunc i64 %393 to i32
  %395 = add i32 %394, 1
  %396 = mul i32 %395, %377
  %p_rem20.i = srem i32 %396, 2600
  %p_conv21.i = sitofp i32 %p_rem20.i to double
  %p_div23.i = fmul fast double %p_conv21.i, 0x3F3934C67F9B2CE6
  %397 = shl i64 %393, 3
  %398 = add nuw nsw i64 %397, %378
  %scevgep254 = getelementptr i8, i8* %3, i64 %398
  %scevgep254255 = bitcast i8* %scevgep254 to double*
  store double %p_div23.i, double* %scevgep254255, align 8, !alias.scope !39, !noalias !51
  %polly.indvar_next252 = add nuw nsw i64 %polly.indvar251, 1
  %polly.loop_cond253 = icmp slt i64 %polly.indvar251, %332
  br i1 %polly.loop_cond253, label %polly.loop_header248, label %polly.loop_exit250, !llvm.loop !53

polly.loop_header256:                             ; preds = %polly.loop_exit238, %polly.loop_exit264
  %polly.indvar259 = phi i64 [ %polly.indvar_next260, %polly.loop_exit264 ], [ 0, %polly.loop_exit238 ]
  %399 = shl i64 %polly.indvar259, 11
  %400 = or i64 %399, 2047
  %401 = icmp slt i64 %400, 2299
  %402 = select i1 %401, i64 %400, i64 2299
  %polly.loop_guard278 = icmp sgt i64 %399, %402
  %403 = mul nuw nsw i64 %polly.indvar259, -256
  %404 = icmp eq i64 %polly.indvar259, 0
  %405 = add nsw i64 %403, 287
  %406 = icmp slt i64 %405, 255
  %407 = select i1 %406, i64 %405, i64 255
  %408 = shl i64 %polly.indvar259, 8
  br label %polly.loop_header262

polly.loop_exit264:                               ; preds = %polly.loop_exit290
  %polly.indvar_next260 = add nuw nsw i64 %polly.indvar259, 1
  %exitcond30 = icmp eq i64 %polly.indvar_next260, 2
  br i1 %exitcond30, label %kernel_gemm.exit, label %polly.loop_header256

polly.loop_header262:                             ; preds = %polly.loop_exit290, %polly.loop_header256
  %polly.indvar265 = phi i64 [ 0, %polly.loop_header256 ], [ %polly.indvar_next266, %polly.loop_exit290 ]
  %409 = shl nsw i64 %polly.indvar265, 8
  %410 = or i64 %409, 255
  %411 = icmp slt i64 %410, 2599
  %412 = select i1 %411, i64 %410, i64 2599
  %polly.loop_guard = icmp sle i64 %409, %412
  br i1 %polly.loop_guard, label %polly.loop_header268.preheader, label %polly.loop_header288.preheader

polly.loop_header268.preheader:                   ; preds = %polly.loop_header262
  %413 = sub nsw i64 %403, %polly.indvar265
  br i1 %polly.loop_guard278, label %polly.loop_header288.preheader, label %polly.loop_header268

polly.loop_exit290:                               ; preds = %polly.loop_exit320
  %polly.indvar_next266 = add nuw nsw i64 %polly.indvar265, 1
  %exitcond29 = icmp eq i64 %polly.indvar_next266, 11
  br i1 %exitcond29, label %polly.loop_exit264, label %polly.loop_header262

polly.loop_header268:                             ; preds = %polly.loop_header268.preheader, %polly.loop_exit277
  %polly.indvar271 = phi i64 [ %polly.indvar_next272, %polly.loop_exit277 ], [ %409, %polly.loop_header268.preheader ]
  %polly.access.mul.283 = mul nuw nsw i64 %polly.indvar271, 2300
  br label %polly.loop_header275

polly.loop_exit277:                               ; preds = %polly.loop_header275
  %polly.indvar_next272 = add nuw nsw i64 %polly.indvar271, 1
  %polly.loop_cond273 = icmp slt i64 %polly.indvar271, %412
  br i1 %polly.loop_cond273, label %polly.loop_header268, label %polly.loop_header288.preheader

polly.loop_header288.preheader:                   ; preds = %polly.loop_exit277, %polly.loop_header268.preheader, %polly.loop_header262
  %414 = mul nsw i64 %polly.indvar265, -256
  %415 = add nsw i64 %414, 2599
  %416 = icmp slt i64 %415, 255
  %417 = select i1 %416, i64 %415, i64 255
  br label %polly.loop_header288

polly.loop_header275:                             ; preds = %polly.loop_header268, %polly.loop_header275
  %polly.indvar279 = phi i64 [ %polly.indvar_next280, %polly.loop_header275 ], [ %399, %polly.loop_header268 ]
  %polly.access.add.284 = add nuw nsw i64 %polly.indvar279, %polly.access.mul.283
  %polly.access.285 = getelementptr double, double* %polly.access.cast.49, i64 %polly.access.add.284
  %418 = bitcast double* %polly.access.285 to i64*
  %polly.access.285.load2 = load i64, i64* %418, align 8, !alias.scope !35, !noalias !37
  %pexp.p_div_q = lshr i64 %polly.indvar279, 3
  %tmp = add i64 %413, %pexp.p_div_q
  %tmp3 = shl i64 %tmp, 8
  %polly.access.add.Packed_B = add i64 %tmp3, %polly.indvar271
  %419 = shl nsw i64 %polly.access.add.Packed_B, 3
  %420 = sub nsw i64 7, %polly.indvar279
  %pexp.pdiv_r = and i64 %420, 7
  %polly.access.mul.Packed_B286 = or i64 %419, %pexp.pdiv_r
  %polly.access.add.Packed_B287 = xor i64 %polly.access.mul.Packed_B286, 7
  %polly.access.Packed_B = getelementptr [256 x [256 x [8 x double]]], [256 x [256 x [8 x double]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B287
  %421 = bitcast double* %polly.access.Packed_B to i64*
  store i64 %polly.access.285.load2, i64* %421, align 8, !alias.scope !41, !noalias !54
  %polly.indvar_next280 = add nuw nsw i64 %polly.indvar279, 1
  %polly.loop_cond281 = icmp slt i64 %polly.indvar279, %402
  br i1 %polly.loop_cond281, label %polly.loop_header275, label %polly.loop_exit277

polly.loop_header288:                             ; preds = %polly.loop_exit320, %polly.loop_header288.preheader
  %polly.indvar291 = phi i64 [ %polly.indvar_next292, %polly.loop_exit320 ], [ 0, %polly.loop_header288.preheader ]
  %422 = mul nuw nsw i64 %polly.indvar291, 96
  br i1 %404, label %polly.then, label %polly.merge

polly.merge:                                      ; preds = %polly.loop_exit305.loopexit.us, %polly.loop_header288, %polly.loop_header295.preheader, %polly.then
  %423 = mul nsw i64 %polly.indvar291, -24
  %424 = add nsw i64 %423, 499
  %425 = icmp slt i64 %424, 23
  %426 = select i1 %425, i64 %424, i64 23
  br label %polly.loop_header318

polly.loop_exit320:                               ; preds = %polly.loop_exit326
  %polly.indvar_next292 = add nuw nsw i64 %polly.indvar291, 1
  %exitcond = icmp eq i64 %polly.indvar_next292, 21
  br i1 %exitcond, label %polly.loop_exit290, label %polly.loop_header288

polly.then:                                       ; preds = %polly.loop_header288
  %427 = add nuw nsw i64 %422, 95
  %428 = icmp slt i64 %427, 1999
  %429 = select i1 %428, i64 %427, i64 1999
  %polly.loop_guard298 = icmp sgt i64 %422, %429
  br i1 %polly.loop_guard298, label %polly.merge, label %polly.loop_header295.preheader

polly.loop_header295.preheader:                   ; preds = %polly.then
  %430 = mul nsw i64 %polly.indvar291, -24
  %431 = sub nsw i64 %430, %polly.indvar265
  br i1 %polly.loop_guard, label %polly.loop_header295.us, label %polly.merge

polly.loop_header295.us:                          ; preds = %polly.loop_header295.preheader, %polly.loop_exit305.loopexit.us
  %polly.indvar299.us = phi i64 [ %polly.indvar_next300.us, %polly.loop_exit305.loopexit.us ], [ %422, %polly.loop_header295.preheader ]
  %polly.access.mul.311.us = mul nuw nsw i64 %polly.indvar299.us, 2600
  %pexp.p_div_q314.us = lshr i64 %polly.indvar299.us, 2
  %tmp5.us = add i64 %431, %pexp.p_div_q314.us
  %tmp6.us = shl i64 %tmp5.us, 8
  %432 = sub nsw i64 3, %polly.indvar299.us
  %pexp.pdiv_r316.us = and i64 %432, 3
  br label %polly.loop_header303.us

polly.loop_header303.us:                          ; preds = %polly.loop_header295.us, %polly.loop_header303.us
  %polly.indvar307.us = phi i64 [ %polly.indvar_next308.us, %polly.loop_header303.us ], [ %409, %polly.loop_header295.us ]
  %polly.access.add.312.us = add nuw nsw i64 %polly.indvar307.us, %polly.access.mul.311.us
  %polly.access.313.us = getelementptr double, double* %polly.access.cast., i64 %polly.access.add.312.us
  %433 = bitcast double* %polly.access.313.us to i64*
  %polly.access.313.load1.us = load i64, i64* %433, align 8, !alias.scope !39, !noalias !51
  %polly.access.add.Packed_A.us = add i64 %polly.indvar307.us, %tmp6.us
  %434 = shl nsw i64 %polly.access.add.Packed_A.us, 2
  %polly.access.mul.Packed_A315.us = or i64 %434, %pexp.pdiv_r316.us
  %polly.access.add.Packed_A317.us = xor i64 %polly.access.mul.Packed_A315.us, 3
  %polly.access.Packed_A.us = getelementptr [24 x [256 x [4 x double]]], [24 x [256 x [4 x double]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A317.us
  %435 = bitcast double* %polly.access.Packed_A.us to i64*
  store i64 %polly.access.313.load1.us, i64* %435, align 8, !alias.scope !42, !noalias !55
  %polly.indvar_next308.us = add nuw nsw i64 %polly.indvar307.us, 1
  %polly.loop_cond309.us = icmp slt i64 %polly.indvar307.us, %412
  br i1 %polly.loop_cond309.us, label %polly.loop_header303.us, label %polly.loop_exit305.loopexit.us

polly.loop_exit305.loopexit.us:                   ; preds = %polly.loop_header303.us
  %polly.indvar_next300.us = add nuw nsw i64 %polly.indvar299.us, 1
  %polly.loop_cond301.us = icmp slt i64 %polly.indvar299.us, %429
  br i1 %polly.loop_cond301.us, label %polly.loop_header295.us, label %polly.merge

polly.loop_header318:                             ; preds = %polly.merge, %polly.loop_exit326
  %polly.indvar321 = phi i64 [ 0, %polly.merge ], [ %polly.indvar_next322, %polly.loop_exit326 ]
  %436 = shl i64 %polly.indvar321, 3
  %437 = add nuw nsw i64 %436, %399
  %polly.access.mul.Packed_B344 = shl i64 %polly.indvar321, 8
  %438 = shl i64 %437, 3
  %439 = add nuw nsw i64 %polly.indvar321, %408
  %440 = icmp slt i64 %439, 287
  %441 = or i64 %438, 32
  br label %polly.loop_header324

polly.loop_exit326:                               ; preds = %polly.loop_exit332
  %polly.indvar_next322 = add nuw nsw i64 %polly.indvar321, 1
  %polly.loop_cond323 = icmp slt i64 %polly.indvar321, %407
  br i1 %polly.loop_cond323, label %polly.loop_header318, label %polly.loop_exit320

polly.loop_header324:                             ; preds = %polly.loop_header318, %polly.loop_exit332
  %polly.indvar327 = phi i64 [ 0, %polly.loop_header318 ], [ %polly.indvar_next328, %polly.loop_exit332 ]
  %442 = shl nsw i64 %polly.indvar327, 2
  %443 = add nuw nsw i64 %442, %422
  %polly.access.mul.Packed_A337 = shl i64 %polly.indvar327, 8
  %444 = mul nuw nsw i64 %443, 18400
  %445 = add nuw nsw i64 %444, %438
  %scevgep350 = getelementptr i8, i8* %1, i64 %445
  %446 = add nuw nsw i64 %444, %441
  %scevgep437 = getelementptr i8, i8* %1, i64 %446
  %447 = or i64 %443, 1
  %448 = mul nuw nsw i64 %447, 18400
  %449 = add nuw nsw i64 %448, %438
  %scevgep521 = getelementptr i8, i8* %1, i64 %449
  %450 = add nuw nsw i64 %448, %441
  %scevgep609 = getelementptr i8, i8* %1, i64 %450
  %451 = or i64 %443, 2
  %452 = mul nuw nsw i64 %451, 18400
  %453 = add nuw nsw i64 %452, %438
  %scevgep693 = getelementptr i8, i8* %1, i64 %453
  %454 = add nuw nsw i64 %452, %441
  %scevgep781 = getelementptr i8, i8* %1, i64 %454
  %455 = or i64 %443, 3
  %456 = mul nuw nsw i64 %455, 18400
  %457 = add nuw nsw i64 %456, %438
  %scevgep865 = getelementptr i8, i8* %1, i64 %457
  %458 = add nuw nsw i64 %456, %441
  %scevgep953 = getelementptr i8, i8* %1, i64 %458
  %459 = bitcast i8* %scevgep350 to <4 x double>*
  %460 = load <4 x double>, <4 x double>* %459, align 8, !alias.scope !56, !noalias !46
  %461 = bitcast i8* %scevgep521 to <4 x double>*
  %462 = load <4 x double>, <4 x double>* %461, align 8, !alias.scope !61, !noalias !66
  %463 = bitcast i8* %scevgep693 to <4 x double>*
  %464 = load <4 x double>, <4 x double>* %463, align 8, !alias.scope !71, !noalias !76
  %465 = bitcast i8* %scevgep865 to <4 x double>*
  %466 = load <4 x double>, <4 x double>* %465, align 8, !alias.scope !81, !noalias !86
  %467 = bitcast i8* %scevgep437 to <4 x double>*
  %468 = bitcast i8* %scevgep437 to <4 x double>*
  %469 = bitcast i8* %scevgep609 to <4 x double>*
  %470 = bitcast i8* %scevgep609 to <4 x double>*
  %471 = bitcast i8* %scevgep781 to <4 x double>*
  %472 = bitcast i8* %scevgep781 to <4 x double>*
  %473 = bitcast i8* %scevgep953 to <4 x double>*
  %474 = bitcast i8* %scevgep953 to <4 x double>*
  br label %polly.loop_header330

polly.loop_exit332:                               ; preds = %polly.merge933
  %475 = bitcast i8* %scevgep350 to <4 x double>*
  store <4 x double> %488, <4 x double>* %475, align 8, !alias.scope !56, !noalias !46
  %476 = bitcast i8* %scevgep521 to <4 x double>*
  store <4 x double> %492, <4 x double>* %476, align 8, !alias.scope !61, !noalias !66
  %477 = bitcast i8* %scevgep693 to <4 x double>*
  store <4 x double> %496, <4 x double>* %477, align 8, !alias.scope !71, !noalias !76
  %478 = bitcast i8* %scevgep865 to <4 x double>*
  store <4 x double> %500, <4 x double>* %478, align 8, !alias.scope !81, !noalias !86
  %polly.indvar_next328 = add nuw nsw i64 %polly.indvar327, 1
  %polly.loop_cond329 = icmp slt i64 %polly.indvar327, %426
  br i1 %polly.loop_cond329, label %polly.loop_header324, label %polly.loop_exit326

polly.loop_header330:                             ; preds = %polly.loop_header324, %polly.merge933
  %polly.indvar333 = phi i64 [ 0, %polly.loop_header324 ], [ %polly.indvar_next334, %polly.merge933 ]
  %479 = phi <4 x double> [ %460, %polly.loop_header324 ], [ %488, %polly.merge933 ]
  %480 = phi <4 x double> [ %462, %polly.loop_header324 ], [ %492, %polly.merge933 ]
  %481 = phi <4 x double> [ %464, %polly.loop_header324 ], [ %496, %polly.merge933 ]
  %482 = phi <4 x double> [ %466, %polly.loop_header324 ], [ %500, %polly.merge933 ]
  %polly.access.add.Packed_A338 = add nuw nsw i64 %polly.indvar333, %polly.access.mul.Packed_A337
  %polly.access.mul.Packed_A339 = shl nsw i64 %polly.access.add.Packed_A338, 2
  %polly.access.Packed_A341 = getelementptr [24 x [256 x [4 x double]]], [24 x [256 x [4 x double]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.mul.Packed_A339
  %_p_scalar_342 = load double, double* %polly.access.Packed_A341, align 32, !alias.scope !42, !noalias !55
  %p_mul16.i = fmul fast double %_p_scalar_342, 1.500000e+00
  %polly.access.add.Packed_B345 = add nuw nsw i64 %polly.indvar333, %polly.access.mul.Packed_B344
  %polly.access.mul.Packed_B346 = shl nsw i64 %polly.access.add.Packed_B345, 3
  %polly.access.Packed_B348 = getelementptr [256 x [256 x [8 x double]]], [256 x [256 x [8 x double]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.mul.Packed_B346
  %483 = bitcast double* %polly.access.Packed_B348 to <4 x double>*
  %484 = load <4 x double>, <4 x double>* %483, align 64, !alias.scope !41, !noalias !54
  %485 = insertelement <4 x double> undef, double %p_mul16.i, i32 0
  %486 = shufflevector <4 x double> %485, <4 x double> undef, <4 x i32> zeroinitializer
  %487 = fmul fast <4 x double> %486, %484
  %488 = fadd fast <4 x double> %479, %487
  br i1 %440, label %polly.then418, label %polly.merge417

polly.merge417:                                   ; preds = %polly.loop_header330, %polly.then418
  %polly.access.add.Packed_A509 = or i64 %polly.access.mul.Packed_A339, 1
  %polly.access.Packed_A510 = getelementptr [24 x [256 x [4 x double]]], [24 x [256 x [4 x double]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A509
  %_p_scalar_511 = load double, double* %polly.access.Packed_A510, align 8, !alias.scope !42, !noalias !55
  %p_mul16.i512 = fmul fast double %_p_scalar_511, 1.500000e+00
  %489 = insertelement <4 x double> undef, double %p_mul16.i512, i32 0
  %490 = shufflevector <4 x double> %489, <4 x double> undef, <4 x i32> zeroinitializer
  %491 = fmul fast <4 x double> %490, %484
  %492 = fadd fast <4 x double> %480, %491
  br i1 %440, label %polly.then590, label %polly.merge589

polly.merge589:                                   ; preds = %polly.merge417, %polly.then590
  %polly.access.add.Packed_A681 = or i64 %polly.access.mul.Packed_A339, 2
  %polly.access.Packed_A682 = getelementptr [24 x [256 x [4 x double]]], [24 x [256 x [4 x double]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A681
  %_p_scalar_683 = load double, double* %polly.access.Packed_A682, align 16, !alias.scope !42, !noalias !55
  %p_mul16.i684 = fmul fast double %_p_scalar_683, 1.500000e+00
  %493 = insertelement <4 x double> undef, double %p_mul16.i684, i32 0
  %494 = shufflevector <4 x double> %493, <4 x double> undef, <4 x i32> zeroinitializer
  %495 = fmul fast <4 x double> %494, %484
  %496 = fadd fast <4 x double> %481, %495
  br i1 %440, label %polly.then762, label %polly.merge761

polly.merge761:                                   ; preds = %polly.merge589, %polly.then762
  %polly.access.add.Packed_A853 = or i64 %polly.access.mul.Packed_A339, 3
  %polly.access.Packed_A854 = getelementptr [24 x [256 x [4 x double]]], [24 x [256 x [4 x double]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A853
  %_p_scalar_855 = load double, double* %polly.access.Packed_A854, align 8, !alias.scope !42, !noalias !55
  %p_mul16.i856 = fmul fast double %_p_scalar_855, 1.500000e+00
  %497 = insertelement <4 x double> undef, double %p_mul16.i856, i32 0
  %498 = shufflevector <4 x double> %497, <4 x double> undef, <4 x i32> zeroinitializer
  %499 = fmul fast <4 x double> %498, %484
  %500 = fadd fast <4 x double> %482, %499
  br i1 %440, label %polly.then934, label %polly.merge933

polly.merge933:                                   ; preds = %polly.merge761, %polly.then934
  %polly.indvar_next334 = add nuw nsw i64 %polly.indvar333, 1
  %polly.loop_cond335 = icmp slt i64 %polly.indvar333, %417
  br i1 %polly.loop_cond335, label %polly.loop_header330, label %polly.loop_exit332

polly.then418:                                    ; preds = %polly.loop_header330
  %polly.access.add.Packed_B433 = or i64 %polly.access.mul.Packed_B346, 4
  %polly.access.Packed_B434 = getelementptr [256 x [256 x [8 x double]]], [256 x [256 x [8 x double]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B433
  %501 = bitcast double* %polly.access.Packed_B434 to <4 x double>*
  %502 = load <4 x double>, <4 x double>* %501, align 32, !alias.scope !41, !noalias !54
  %503 = fmul fast <4 x double> %486, %502
  %504 = load <4 x double>, <4 x double>* %467, align 8, !alias.scope !91, !noalias !92
  %505 = fadd fast <4 x double> %504, %503
  store <4 x double> %505, <4 x double>* %468, align 8, !alias.scope !91, !noalias !92
  br label %polly.merge417

polly.then590:                                    ; preds = %polly.merge417
  %polly.access.add.Packed_B605 = or i64 %polly.access.mul.Packed_B346, 4
  %polly.access.Packed_B606 = getelementptr [256 x [256 x [8 x double]]], [256 x [256 x [8 x double]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B605
  %506 = bitcast double* %polly.access.Packed_B606 to <4 x double>*
  %507 = load <4 x double>, <4 x double>* %506, align 32, !alias.scope !41, !noalias !54
  %508 = fmul fast <4 x double> %490, %507
  %509 = load <4 x double>, <4 x double>* %469, align 8, !alias.scope !93, !noalias !94
  %510 = fadd fast <4 x double> %509, %508
  store <4 x double> %510, <4 x double>* %470, align 8, !alias.scope !93, !noalias !94
  br label %polly.merge589

polly.then762:                                    ; preds = %polly.merge589
  %polly.access.add.Packed_B777 = or i64 %polly.access.mul.Packed_B346, 4
  %polly.access.Packed_B778 = getelementptr [256 x [256 x [8 x double]]], [256 x [256 x [8 x double]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B777
  %511 = bitcast double* %polly.access.Packed_B778 to <4 x double>*
  %512 = load <4 x double>, <4 x double>* %511, align 32, !alias.scope !41, !noalias !54
  %513 = fmul fast <4 x double> %494, %512
  %514 = load <4 x double>, <4 x double>* %471, align 8, !alias.scope !95, !noalias !96
  %515 = fadd fast <4 x double> %514, %513
  store <4 x double> %515, <4 x double>* %472, align 8, !alias.scope !95, !noalias !96
  br label %polly.merge761

polly.then934:                                    ; preds = %polly.merge761
  %polly.access.add.Packed_B949 = or i64 %polly.access.mul.Packed_B346, 4
  %polly.access.Packed_B950 = getelementptr [256 x [256 x [8 x double]]], [256 x [256 x [8 x double]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B949
  %516 = bitcast double* %polly.access.Packed_B950 to <4 x double>*
  %517 = load <4 x double>, <4 x double>* %516, align 32, !alias.scope !41, !noalias !54
  %518 = fmul fast <4 x double> %498, %517
  %519 = load <4 x double>, <4 x double>* %473, align 8, !alias.scope !97, !noalias !102
  %520 = fadd fast <4 x double> %519, %518
  store <4 x double> %520, <4 x double>* %474, align 8, !alias.scope !97, !noalias !102
  br label %polly.merge933

vector.body170.2:                                 ; preds = %vector.ph179
  %521 = mul <4 x i32> %346, %broadcast.splat189
  %522 = srem <4 x i32> %521, <i32 2600, i32 2600, i32 2600, i32 2600>
  %523 = sitofp <4 x i32> %522 to <4 x double>
  %524 = fmul fast <4 x double> %523, <double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6>
  %525 = add nuw nsw i64 %348, %378
  %526 = getelementptr i8, i8* %3, i64 %525
  %527 = bitcast i8* %526 to <4 x double>*
  store <4 x double> %524, <4 x double>* %527, align 8, !alias.scope !39, !noalias !51
  %528 = mul <4 x i32> %351, %broadcast.splat189
  %529 = srem <4 x i32> %528, <i32 2600, i32 2600, i32 2600, i32 2600>
  %530 = sitofp <4 x i32> %529 to <4 x double>
  %531 = fmul fast <4 x double> %530, <double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6>
  %532 = add nuw nsw i64 %353, %378
  %533 = getelementptr i8, i8* %3, i64 %532
  %534 = bitcast i8* %533 to <4 x double>*
  store <4 x double> %531, <4 x double>* %534, align 8, !alias.scope !39, !noalias !51
  br i1 %354, label %polly.loop_exit250, label %vector.body170.4, !llvm.loop !52

vector.body170.4:                                 ; preds = %vector.body170.2
  %535 = mul <4 x i32> %357, %broadcast.splat189
  %536 = srem <4 x i32> %535, <i32 2600, i32 2600, i32 2600, i32 2600>
  %537 = sitofp <4 x i32> %536 to <4 x double>
  %538 = fmul fast <4 x double> %537, <double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6>
  %539 = add nuw nsw i64 %359, %378
  %540 = getelementptr i8, i8* %3, i64 %539
  %541 = bitcast i8* %540 to <4 x double>*
  store <4 x double> %538, <4 x double>* %541, align 8, !alias.scope !39, !noalias !51
  %542 = mul <4 x i32> %362, %broadcast.splat189
  %543 = srem <4 x i32> %542, <i32 2600, i32 2600, i32 2600, i32 2600>
  %544 = sitofp <4 x i32> %543 to <4 x double>
  %545 = fmul fast <4 x double> %544, <double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6>
  %546 = add nuw nsw i64 %364, %378
  %547 = getelementptr i8, i8* %3, i64 %546
  %548 = bitcast i8* %547 to <4 x double>*
  store <4 x double> %545, <4 x double>* %548, align 8, !alias.scope !39, !noalias !51
  br i1 %365, label %polly.loop_exit250, label %vector.body170.6, !llvm.loop !52

vector.body170.6:                                 ; preds = %vector.body170.4
  %549 = mul <4 x i32> %368, %broadcast.splat189
  %550 = srem <4 x i32> %549, <i32 2600, i32 2600, i32 2600, i32 2600>
  %551 = sitofp <4 x i32> %550 to <4 x double>
  %552 = fmul fast <4 x double> %551, <double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6>
  %553 = add nuw nsw i64 %370, %378
  %554 = getelementptr i8, i8* %3, i64 %553
  %555 = bitcast i8* %554 to <4 x double>*
  store <4 x double> %552, <4 x double>* %555, align 8, !alias.scope !39, !noalias !51
  %556 = mul <4 x i32> %373, %broadcast.splat189
  %557 = srem <4 x i32> %556, <i32 2600, i32 2600, i32 2600, i32 2600>
  %558 = sitofp <4 x i32> %557 to <4 x double>
  %559 = fmul fast <4 x double> %558, <double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6>
  %560 = add nuw nsw i64 %375, %378
  %561 = getelementptr i8, i8* %3, i64 %560
  %562 = bitcast i8* %561 to <4 x double>*
  store <4 x double> %559, <4 x double>* %562, align 8, !alias.scope !39, !noalias !51
  br label %polly.loop_exit250

vector.body146.1:                                 ; preds = %vector.body146
  %563 = add nuw nsw i64 %297, %299
  %564 = getelementptr i8, i8* %1, i64 %563
  %565 = bitcast i8* %564 to <4 x double>*
  %wide.load166.1 = load <4 x double>, <4 x double>* %565, align 8, !alias.scope !38, !noalias !46
  %566 = getelementptr i8, i8* %564, i64 32
  %567 = bitcast i8* %566 to <4 x double>*
  %wide.load167.1 = load <4 x double>, <4 x double>* %567, align 8, !alias.scope !38, !noalias !46
  %568 = getelementptr i8, i8* %564, i64 64
  %569 = bitcast i8* %568 to <4 x double>*
  %wide.load168.1 = load <4 x double>, <4 x double>* %569, align 8, !alias.scope !38, !noalias !46
  %570 = getelementptr i8, i8* %564, i64 96
  %571 = bitcast i8* %570 to <4 x double>*
  %wide.load169.1 = load <4 x double>, <4 x double>* %571, align 8, !alias.scope !38, !noalias !46
  %572 = fmul fast <4 x double> %wide.load166.1, <double 1.200000e+00, double 1.200000e+00, double 1.200000e+00, double 1.200000e+00>
  %573 = fmul fast <4 x double> %wide.load167.1, <double 1.200000e+00, double 1.200000e+00, double 1.200000e+00, double 1.200000e+00>
  %574 = fmul fast <4 x double> %wide.load168.1, <double 1.200000e+00, double 1.200000e+00, double 1.200000e+00, double 1.200000e+00>
  %575 = fmul fast <4 x double> %wide.load169.1, <double 1.200000e+00, double 1.200000e+00, double 1.200000e+00, double 1.200000e+00>
  %576 = bitcast i8* %564 to <4 x double>*
  store <4 x double> %572, <4 x double>* %576, align 8, !alias.scope !38, !noalias !46
  %577 = bitcast i8* %566 to <4 x double>*
  store <4 x double> %573, <4 x double>* %577, align 8, !alias.scope !38, !noalias !46
  %578 = bitcast i8* %568 to <4 x double>*
  store <4 x double> %574, <4 x double>* %578, align 8, !alias.scope !38, !noalias !46
  %579 = bitcast i8* %570 to <4 x double>*
  store <4 x double> %575, <4 x double>* %579, align 8, !alias.scope !38, !noalias !46
  br label %middle.block147

vector.body126.1:                                 ; preds = %vector.ph135
  %580 = mul <4 x i32> %broadcast.splat145, %230
  %581 = add <4 x i32> %580, <i32 1, i32 1, i32 1, i32 1>
  %582 = srem <4 x i32> %581, <i32 2000, i32 2000, i32 2000, i32 2000>
  %583 = sitofp <4 x i32> %582 to <4 x double>
  %584 = fmul fast <4 x double> %583, <double 5.000000e-04, double 5.000000e-04, double 5.000000e-04, double 5.000000e-04>
  %585 = add nuw nsw i64 %232, %265
  %586 = getelementptr i8, i8* %1, i64 %585
  %587 = bitcast i8* %586 to <4 x double>*
  store <4 x double> %584, <4 x double>* %587, align 8, !alias.scope !38, !noalias !46
  br i1 %233, label %polly.loop_exit198, label %vector.body126.2, !llvm.loop !47

vector.body126.2:                                 ; preds = %vector.body126.1
  %588 = mul <4 x i32> %broadcast.splat145, %235
  %589 = add <4 x i32> %588, <i32 1, i32 1, i32 1, i32 1>
  %590 = srem <4 x i32> %589, <i32 2000, i32 2000, i32 2000, i32 2000>
  %591 = sitofp <4 x i32> %590 to <4 x double>
  %592 = fmul fast <4 x double> %591, <double 5.000000e-04, double 5.000000e-04, double 5.000000e-04, double 5.000000e-04>
  %593 = add nuw nsw i64 %237, %265
  %594 = getelementptr i8, i8* %1, i64 %593
  %595 = bitcast i8* %594 to <4 x double>*
  store <4 x double> %592, <4 x double>* %595, align 8, !alias.scope !38, !noalias !46
  br i1 %238, label %polly.loop_exit198, label %vector.body126.3, !llvm.loop !47

vector.body126.3:                                 ; preds = %vector.body126.2
  %596 = mul <4 x i32> %broadcast.splat145, %240
  %597 = add <4 x i32> %596, <i32 1, i32 1, i32 1, i32 1>
  %598 = srem <4 x i32> %597, <i32 2000, i32 2000, i32 2000, i32 2000>
  %599 = sitofp <4 x i32> %598 to <4 x double>
  %600 = fmul fast <4 x double> %599, <double 5.000000e-04, double 5.000000e-04, double 5.000000e-04, double 5.000000e-04>
  %601 = add nuw nsw i64 %242, %265
  %602 = getelementptr i8, i8* %1, i64 %601
  %603 = bitcast i8* %602 to <4 x double>*
  store <4 x double> %600, <4 x double>* %603, align 8, !alias.scope !38, !noalias !46
  br i1 %243, label %polly.loop_exit198, label %vector.body126.4, !llvm.loop !47

vector.body126.4:                                 ; preds = %vector.body126.3
  %604 = mul <4 x i32> %broadcast.splat145, %245
  %605 = add <4 x i32> %604, <i32 1, i32 1, i32 1, i32 1>
  %606 = srem <4 x i32> %605, <i32 2000, i32 2000, i32 2000, i32 2000>
  %607 = sitofp <4 x i32> %606 to <4 x double>
  %608 = fmul fast <4 x double> %607, <double 5.000000e-04, double 5.000000e-04, double 5.000000e-04, double 5.000000e-04>
  %609 = add nuw nsw i64 %247, %265
  %610 = getelementptr i8, i8* %1, i64 %609
  %611 = bitcast i8* %610 to <4 x double>*
  store <4 x double> %608, <4 x double>* %611, align 8, !alias.scope !38, !noalias !46
  br i1 %248, label %polly.loop_exit198, label %vector.body126.5, !llvm.loop !47

vector.body126.5:                                 ; preds = %vector.body126.4
  %612 = mul <4 x i32> %broadcast.splat145, %250
  %613 = add <4 x i32> %612, <i32 1, i32 1, i32 1, i32 1>
  %614 = srem <4 x i32> %613, <i32 2000, i32 2000, i32 2000, i32 2000>
  %615 = sitofp <4 x i32> %614 to <4 x double>
  %616 = fmul fast <4 x double> %615, <double 5.000000e-04, double 5.000000e-04, double 5.000000e-04, double 5.000000e-04>
  %617 = add nuw nsw i64 %252, %265
  %618 = getelementptr i8, i8* %1, i64 %617
  %619 = bitcast i8* %618 to <4 x double>*
  store <4 x double> %616, <4 x double>* %619, align 8, !alias.scope !38, !noalias !46
  br i1 %253, label %polly.loop_exit198, label %vector.body126.6, !llvm.loop !47

vector.body126.6:                                 ; preds = %vector.body126.5
  %620 = mul <4 x i32> %broadcast.splat145, %255
  %621 = add <4 x i32> %620, <i32 1, i32 1, i32 1, i32 1>
  %622 = srem <4 x i32> %621, <i32 2000, i32 2000, i32 2000, i32 2000>
  %623 = sitofp <4 x i32> %622 to <4 x double>
  %624 = fmul fast <4 x double> %623, <double 5.000000e-04, double 5.000000e-04, double 5.000000e-04, double 5.000000e-04>
  %625 = add nuw nsw i64 %257, %265
  %626 = getelementptr i8, i8* %1, i64 %625
  %627 = bitcast i8* %626 to <4 x double>*
  store <4 x double> %624, <4 x double>* %627, align 8, !alias.scope !38, !noalias !46
  br i1 %258, label %polly.loop_exit198, label %vector.body126.7, !llvm.loop !47

vector.body126.7:                                 ; preds = %vector.body126.6
  %628 = mul <4 x i32> %broadcast.splat145, %260
  %629 = add <4 x i32> %628, <i32 1, i32 1, i32 1, i32 1>
  %630 = srem <4 x i32> %629, <i32 2000, i32 2000, i32 2000, i32 2000>
  %631 = sitofp <4 x i32> %630 to <4 x double>
  %632 = fmul fast <4 x double> %631, <double 5.000000e-04, double 5.000000e-04, double 5.000000e-04, double 5.000000e-04>
  %633 = add nuw nsw i64 %262, %265
  %634 = getelementptr i8, i8* %1, i64 %633
  %635 = bitcast i8* %634 to <4 x double>*
  store <4 x double> %632, <4 x double>* %635, align 8, !alias.scope !38, !noalias !46
  br label %polly.loop_exit198

vector.body111.1:                                 ; preds = %vector.ph115
  %636 = mul <4 x i32> %156, %broadcast.splat125
  %637 = srem <4 x i32> %636, <i32 2300, i32 2300, i32 2300, i32 2300>
  %638 = sitofp <4 x i32> %637 to <4 x double>
  %639 = fmul fast <4 x double> %638, <double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95>
  %640 = add nuw nsw i64 %158, %197
  %641 = getelementptr i8, i8* %5, i64 %640
  %642 = bitcast i8* %641 to <4 x double>*
  store <4 x double> %639, <4 x double>* %642, align 8, !alias.scope !35, !noalias !37
  br i1 %159, label %polly.loop_exit173, label %vector.body111.2, !llvm.loop !43

vector.body111.2:                                 ; preds = %vector.body111.1
  %643 = mul <4 x i32> %162, %broadcast.splat125
  %644 = srem <4 x i32> %643, <i32 2300, i32 2300, i32 2300, i32 2300>
  %645 = sitofp <4 x i32> %644 to <4 x double>
  %646 = fmul fast <4 x double> %645, <double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95>
  %647 = add nuw nsw i64 %164, %197
  %648 = getelementptr i8, i8* %5, i64 %647
  %649 = bitcast i8* %648 to <4 x double>*
  store <4 x double> %646, <4 x double>* %649, align 8, !alias.scope !35, !noalias !37
  br i1 %165, label %polly.loop_exit173, label %vector.body111.3, !llvm.loop !43

vector.body111.3:                                 ; preds = %vector.body111.2
  %650 = mul <4 x i32> %168, %broadcast.splat125
  %651 = srem <4 x i32> %650, <i32 2300, i32 2300, i32 2300, i32 2300>
  %652 = sitofp <4 x i32> %651 to <4 x double>
  %653 = fmul fast <4 x double> %652, <double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95>
  %654 = add nuw nsw i64 %170, %197
  %655 = getelementptr i8, i8* %5, i64 %654
  %656 = bitcast i8* %655 to <4 x double>*
  store <4 x double> %653, <4 x double>* %656, align 8, !alias.scope !35, !noalias !37
  br i1 %171, label %polly.loop_exit173, label %vector.body111.4, !llvm.loop !43

vector.body111.4:                                 ; preds = %vector.body111.3
  %657 = mul <4 x i32> %174, %broadcast.splat125
  %658 = srem <4 x i32> %657, <i32 2300, i32 2300, i32 2300, i32 2300>
  %659 = sitofp <4 x i32> %658 to <4 x double>
  %660 = fmul fast <4 x double> %659, <double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95>
  %661 = add nuw nsw i64 %176, %197
  %662 = getelementptr i8, i8* %5, i64 %661
  %663 = bitcast i8* %662 to <4 x double>*
  store <4 x double> %660, <4 x double>* %663, align 8, !alias.scope !35, !noalias !37
  br i1 %177, label %polly.loop_exit173, label %vector.body111.5, !llvm.loop !43

vector.body111.5:                                 ; preds = %vector.body111.4
  %664 = mul <4 x i32> %180, %broadcast.splat125
  %665 = srem <4 x i32> %664, <i32 2300, i32 2300, i32 2300, i32 2300>
  %666 = sitofp <4 x i32> %665 to <4 x double>
  %667 = fmul fast <4 x double> %666, <double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95>
  %668 = add nuw nsw i64 %182, %197
  %669 = getelementptr i8, i8* %5, i64 %668
  %670 = bitcast i8* %669 to <4 x double>*
  store <4 x double> %667, <4 x double>* %670, align 8, !alias.scope !35, !noalias !37
  br i1 %183, label %polly.loop_exit173, label %vector.body111.6, !llvm.loop !43

vector.body111.6:                                 ; preds = %vector.body111.5
  %671 = mul <4 x i32> %186, %broadcast.splat125
  %672 = srem <4 x i32> %671, <i32 2300, i32 2300, i32 2300, i32 2300>
  %673 = sitofp <4 x i32> %672 to <4 x double>
  %674 = fmul fast <4 x double> %673, <double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95>
  %675 = add nuw nsw i64 %188, %197
  %676 = getelementptr i8, i8* %5, i64 %675
  %677 = bitcast i8* %676 to <4 x double>*
  store <4 x double> %674, <4 x double>* %677, align 8, !alias.scope !35, !noalias !37
  br i1 %189, label %polly.loop_exit173, label %vector.body111.7, !llvm.loop !43

vector.body111.7:                                 ; preds = %vector.body111.6
  %678 = mul <4 x i32> %192, %broadcast.splat125
  %679 = srem <4 x i32> %678, <i32 2300, i32 2300, i32 2300, i32 2300>
  %680 = sitofp <4 x i32> %679 to <4 x double>
  %681 = fmul fast <4 x double> %680, <double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95>
  %682 = add nuw nsw i64 %194, %197
  %683 = getelementptr i8, i8* %5, i64 %682
  %684 = bitcast i8* %683 to <4 x double>*
  store <4 x double> %681, <4 x double>* %684, align 8, !alias.scope !35, !noalias !37
  br label %polly.loop_exit173

vector.body92.1:                                  ; preds = %vector.body92
  %685 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay, i64 %indvars.iv11.i, i64 %index.next98
  %686 = bitcast double* %685 to <4 x double>*
  %wide.load107.1 = load <4 x double>, <4 x double>* %686, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %687 = getelementptr double, double* %685, i64 4
  %688 = bitcast double* %687 to <4 x double>*
  %wide.load108.1 = load <4 x double>, <4 x double>* %688, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %689 = getelementptr double, double* %685, i64 8
  %690 = bitcast double* %689 to <4 x double>*
  %wide.load109.1 = load <4 x double>, <4 x double>* %690, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %691 = getelementptr double, double* %685, i64 12
  %692 = bitcast double* %691 to <4 x double>*
  %wide.load110.1 = load <4 x double>, <4 x double>* %692, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %693 = fmul fast <4 x double> %wide.load107.1, <double 1.200000e+00, double 1.200000e+00, double 1.200000e+00, double 1.200000e+00>
  %694 = fmul fast <4 x double> %wide.load108.1, <double 1.200000e+00, double 1.200000e+00, double 1.200000e+00, double 1.200000e+00>
  %695 = fmul fast <4 x double> %wide.load109.1, <double 1.200000e+00, double 1.200000e+00, double 1.200000e+00, double 1.200000e+00>
  %696 = fmul fast <4 x double> %wide.load110.1, <double 1.200000e+00, double 1.200000e+00, double 1.200000e+00, double 1.200000e+00>
  %697 = bitcast double* %685 to <4 x double>*
  store <4 x double> %693, <4 x double>* %697, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %698 = bitcast double* %687 to <4 x double>*
  store <4 x double> %694, <4 x double>* %698, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %699 = bitcast double* %689 to <4 x double>*
  store <4 x double> %695, <4 x double>* %699, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %700 = bitcast double* %691 to <4 x double>*
  store <4 x double> %696, <4 x double>* %700, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %index.next98.1 = add nsw i64 %index97, 32
  br label %vector.body92

vector.body69.1:                                  ; preds = %vector.body69
  %701 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay4, i64 %indvars.iv8.i, i64 %index.next75
  %702 = bitcast double* %701 to <4 x double>*
  %wide.load.1 = load <4 x double>, <4 x double>* %702, align 8, !tbaa !6, !alias.scope !32, !noalias !33
  %703 = getelementptr double, double* %701, i64 4
  %704 = bitcast double* %703 to <4 x double>*
  %wide.load83.1 = load <4 x double>, <4 x double>* %704, align 8, !tbaa !6, !alias.scope !32, !noalias !33
  %705 = getelementptr double, double* %701, i64 8
  %706 = bitcast double* %705 to <4 x double>*
  %wide.load84.1 = load <4 x double>, <4 x double>* %706, align 8, !tbaa !6, !alias.scope !32, !noalias !33
  %707 = getelementptr double, double* %701, i64 12
  %708 = bitcast double* %707 to <4 x double>*
  %wide.load85.1 = load <4 x double>, <4 x double>* %708, align 8, !tbaa !6, !alias.scope !32, !noalias !33
  %709 = fmul fast <4 x double> %broadcast.splat87, %wide.load.1
  %710 = fmul fast <4 x double> %broadcast.splat87, %wide.load83.1
  %711 = fmul fast <4 x double> %broadcast.splat87, %wide.load84.1
  %712 = fmul fast <4 x double> %broadcast.splat87, %wide.load85.1
  %713 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay, i64 %indvars.iv11.i, i64 %index.next75
  %714 = bitcast double* %713 to <4 x double>*
  %wide.load88.1 = load <4 x double>, <4 x double>* %714, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %715 = getelementptr double, double* %713, i64 4
  %716 = bitcast double* %715 to <4 x double>*
  %wide.load89.1 = load <4 x double>, <4 x double>* %716, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %717 = getelementptr double, double* %713, i64 8
  %718 = bitcast double* %717 to <4 x double>*
  %wide.load90.1 = load <4 x double>, <4 x double>* %718, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %719 = getelementptr double, double* %713, i64 12
  %720 = bitcast double* %719 to <4 x double>*
  %wide.load91.1 = load <4 x double>, <4 x double>* %720, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %721 = fadd fast <4 x double> %wide.load88.1, %709
  %722 = fadd fast <4 x double> %wide.load89.1, %710
  %723 = fadd fast <4 x double> %wide.load90.1, %711
  %724 = fadd fast <4 x double> %wide.load91.1, %712
  %725 = bitcast double* %713 to <4 x double>*
  store <4 x double> %721, <4 x double>* %725, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %726 = bitcast double* %715 to <4 x double>*
  store <4 x double> %722, <4 x double>* %726, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %727 = bitcast double* %717 to <4 x double>*
  store <4 x double> %723, <4 x double>* %727, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %728 = bitcast double* %719 to <4 x double>*
  store <4 x double> %724, <4 x double>* %728, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %index.next75.1 = add nsw i64 %index74, 32
  br label %vector.body69

vector.body56.1:                                  ; preds = %vector.body56
  %729 = add <4 x i64> %vec.ind65, <i64 6, i64 6, i64 6, i64 6>
  %730 = mul nuw nsw <4 x i64> %729, %broadcast.splat68
  %731 = trunc <4 x i64> %730 to <4 x i32>
  %732 = srem <4 x i32> %731, <i32 2300, i32 2300, i32 2300, i32 2300>
  %733 = sitofp <4 x i32> %732 to <4 x double>
  %734 = fmul fast <4 x double> %733, <double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95>
  %735 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay4, i64 %indvars.iv9.i, i64 %index.next62
  %736 = bitcast double* %735 to <4 x double>*
  store <4 x double> %734, <4 x double>* %736, align 8, !tbaa !6, !alias.scope !20, !noalias !21
  %index.next62.1 = add nsw i64 %index61, 8
  %vec.ind.next66.1 = add <4 x i64> %vec.ind65, <i64 8, i64 8, i64 8, i64 8>
  br label %vector.body56

vector.body.1:                                    ; preds = %vector.body
  %vec.ind.next = add <4 x i64> %vec.ind, <i64 4, i64 4, i64 4, i64 4>
  %737 = mul nuw nsw <4 x i64> %vec.ind.next, %broadcast.splat
  %738 = add nuw nsw <4 x i64> %737, <i64 1, i64 1, i64 1, i64 1>
  %739 = trunc <4 x i64> %738 to <4 x i32>
  %740 = srem <4 x i32> %739, <i32 2000, i32 2000, i32 2000, i32 2000>
  %741 = sitofp <4 x i32> %740 to <4 x double>
  %742 = fmul fast <4 x double> %741, <double 5.000000e-04, double 5.000000e-04, double 5.000000e-04, double 5.000000e-04>
  %743 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay, i64 %indvars.iv24.i, i64 %index.next
  %744 = bitcast double* %743 to <4 x double>*
  store <4 x double> %742, <4 x double>* %744, align 8, !tbaa !6, !alias.scope !8, !noalias !11
  %index.next.1 = add nsw i64 %index, 8
  %vec.ind.next.1 = add <4 x i64> %vec.ind, <i64 8, i64 8, i64 8, i64 8>
  br label %vector.body
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

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="true" "no-jump-tables"="false" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="haswell" "target-features"="+aes,+avx,+avx2,+bmi,+bmi2,+cmov,+cx16,+f16c,+fma,+fsgsbase,+fxsr,+lzcnt,+mmx,+movbe,+pclmul,+popcnt,+rdrnd,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87,+xsave,+xsaveopt,-adx,-avx512bw,-avx512cd,-avx512dq,-avx512er,-avx512f,-avx512ifma,-avx512pf,-avx512vbmi,-avx512vl,-avx512vpopcntdq,-clflushopt,-clwb,-clzero,-fma4,-lwp,-mwaitx,-pku,-prefetchwt1,-prfchw,-rdseed,-rtm,-sgx,-sha,-sse4a,-tbm,-xop,-xsavec,-xsaves" "unsafe-fp-math"="true" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="haswell" "target-features"="+aes,+avx,+avx2,+bmi,+bmi2,+cmov,+cx16,+f16c,+fma,+fsgsbase,+fxsr,+lzcnt,+mmx,+movbe,+pclmul,+popcnt,+rdrnd,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87,+xsave,+xsaveopt,-adx,-avx512bw,-avx512cd,-avx512dq,-avx512er,-avx512f,-avx512ifma,-avx512pf,-avx512vbmi,-avx512vl,-avx512vpopcntdq,-clflushopt,-clwb,-clzero,-fma4,-lwp,-mwaitx,-pku,-prefetchwt1,-prfchw,-rdseed,-rtm,-sgx,-sha,-sse4a,-tbm,-xop,-xsavec,-xsaves" "unsafe-fp-math"="true" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="haswell" "target-features"="+aes,+avx,+avx2,+bmi,+bmi2,+cmov,+cx16,+f16c,+fma,+fsgsbase,+fxsr,+lzcnt,+mmx,+movbe,+pclmul,+popcnt,+rdrnd,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87,+xsave,+xsaveopt,-adx,-avx512bw,-avx512cd,-avx512dq,-avx512er,-avx512f,-avx512ifma,-avx512pf,-avx512vbmi,-avx512vl,-avx512vpopcntdq,-clflushopt,-clwb,-clzero,-fma4,-lwp,-mwaitx,-pku,-prefetchwt1,-prfchw,-rdseed,-rtm,-sgx,-sha,-sse4a,-tbm,-xop,-xsavec,-xsaves" "unsafe-fp-math"="true" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { noreturn nounwind }

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
!14 = distinct !{!14, !15, !16}
!15 = !{!"llvm.loop.vectorize.width", i32 1}
!16 = !{!"llvm.loop.interleave.count", i32 1}
!17 = !{!12}
!18 = !{!9, !13}
!19 = distinct !{!19, !15, !16}
!20 = !{!13}
!21 = !{!9, !12}
!22 = distinct !{!22, !15, !16}
!23 = !{!24}
!24 = distinct !{!24, !25, !"kernel_gemm: %C"}
!25 = distinct !{!25, !"kernel_gemm"}
!26 = !{!27, !28}
!27 = distinct !{!27, !25, !"kernel_gemm: %A"}
!28 = distinct !{!28, !25, !"kernel_gemm: %B"}
!29 = distinct !{!29, !15, !16}
!30 = !{!27}
!31 = !{!24, !28}
!32 = !{!28}
!33 = !{!24, !27}
!34 = distinct !{!34, !15, !16}
!35 = distinct !{!35, !36, !"polly.alias.scope.MemRef2"}
!36 = distinct !{!36, !"polly.alias.scope.domain"}
!37 = !{!38, !39, !40, !41, !42}
!38 = distinct !{!38, !36, !"polly.alias.scope.MemRef0"}
!39 = distinct !{!39, !36, !"polly.alias.scope.MemRef1"}
!40 = distinct !{!40, !36, !"polly.alias.scope.MemRef_mul16_i"}
!41 = distinct !{!41, !36, !"polly.alias.scope.Packed_B"}
!42 = distinct !{!42, !36, !"polly.alias.scope.Packed_A"}
!43 = distinct !{!43, !15, !16}
!44 = distinct !{!44, !45, !15, !16}
!45 = !{!"llvm.loop.unroll.runtime.disable"}
!46 = !{!39, !35, !40, !41, !42}
!47 = distinct !{!47, !15, !16}
!48 = distinct !{!48, !45, !15, !16}
!49 = distinct !{!49, !15, !16}
!50 = distinct !{!50, !45, !15, !16}
!51 = !{!38, !35, !40, !41, !42}
!52 = distinct !{!52, !15, !16}
!53 = distinct !{!53, !45, !15, !16}
!54 = !{!38, !39, !35, !40, !42}
!55 = !{!38, !39, !35, !40, !41}
!56 = !{!57, !38, !"second level alias metadata", !58, !59, !60}
!57 = distinct !{!57, !38, !"second level alias metadata"}
!58 = distinct !{!58, !38, !"second level alias metadata"}
!59 = distinct !{!59, !38, !"second level alias metadata"}
!60 = distinct !{!60, !38, !"second level alias metadata"}
!61 = !{!62, !38, !"second level alias metadata", !63, !64, !65}
!62 = distinct !{!62, !38, !"second level alias metadata"}
!63 = distinct !{!63, !38, !"second level alias metadata"}
!64 = distinct !{!64, !38, !"second level alias metadata"}
!65 = distinct !{!65, !38, !"second level alias metadata"}
!66 = !{!39, !35, !40, !41, !42, !57, !58, !59, !60, !67, !68, !69, !70}
!67 = distinct !{!67, !38, !"second level alias metadata"}
!68 = distinct !{!68, !38, !"second level alias metadata"}
!69 = distinct !{!69, !38, !"second level alias metadata"}
!70 = distinct !{!70, !38, !"second level alias metadata"}
!71 = !{!72, !38, !"second level alias metadata", !73, !74, !75}
!72 = distinct !{!72, !38, !"second level alias metadata"}
!73 = distinct !{!73, !38, !"second level alias metadata"}
!74 = distinct !{!74, !38, !"second level alias metadata"}
!75 = distinct !{!75, !38, !"second level alias metadata"}
!76 = !{!39, !35, !40, !41, !42, !57, !58, !59, !60, !67, !68, !69, !70, !62, !63, !64, !65, !77, !78, !79, !80}
!77 = distinct !{!77, !38, !"second level alias metadata"}
!78 = distinct !{!78, !38, !"second level alias metadata"}
!79 = distinct !{!79, !38, !"second level alias metadata"}
!80 = distinct !{!80, !38, !"second level alias metadata"}
!81 = !{!82, !38, !"second level alias metadata", !83, !84, !85}
!82 = distinct !{!82, !38, !"second level alias metadata"}
!83 = distinct !{!83, !38, !"second level alias metadata"}
!84 = distinct !{!84, !38, !"second level alias metadata"}
!85 = distinct !{!85, !38, !"second level alias metadata"}
!86 = !{!39, !35, !40, !41, !42, !57, !58, !59, !60, !67, !68, !69, !70, !62, !63, !64, !65, !77, !78, !79, !80, !72, !73, !74, !75, !87, !88, !89, !90}
!87 = distinct !{!87, !38, !"second level alias metadata"}
!88 = distinct !{!88, !38, !"second level alias metadata"}
!89 = distinct !{!89, !38, !"second level alias metadata"}
!90 = distinct !{!90, !38, !"second level alias metadata"}
!91 = !{!67, !38, !"second level alias metadata", !68, !69, !70}
!92 = !{!39, !35, !40, !41, !42, !57, !58, !59, !60}
!93 = !{!77, !38, !"second level alias metadata", !78, !79, !80}
!94 = !{!39, !35, !40, !41, !42, !57, !58, !59, !60, !67, !68, !69, !70, !62, !63, !64, !65}
!95 = !{!87, !38, !"second level alias metadata", !88, !89, !90}
!96 = !{!39, !35, !40, !41, !42, !57, !58, !59, !60, !67, !68, !69, !70, !62, !63, !64, !65, !77, !78, !79, !80, !72, !73, !74, !75}
!97 = !{!98, !38, !"second level alias metadata", !99, !100, !101}
!98 = distinct !{!98, !38, !"second level alias metadata"}
!99 = distinct !{!99, !38, !"second level alias metadata"}
!100 = distinct !{!100, !38, !"second level alias metadata"}
!101 = distinct !{!101, !38, !"second level alias metadata"}
!102 = !{!39, !35, !40, !41, !42, !57, !58, !59, !60, !67, !68, !69, !70, !62, !63, !64, !65, !77, !78, !79, !80, !72, !73, !74, !75, !87, !88, !89, !90, !82, !83, !84, !85}
