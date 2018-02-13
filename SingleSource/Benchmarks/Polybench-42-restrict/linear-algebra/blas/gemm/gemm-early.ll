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
  %ret.i.i35 = alloca i8*, align 8
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
  %call.i.i29 = call i32 @posix_memalign(i8** nonnull %ret.i.i27, i64 4096, i64 41600000) #4
  %3 = load i8*, i8** %ret.i.i27, align 8, !tbaa !2
  %tobool.i.i30 = icmp eq i8* %3, null
  %tobool2.i.i31 = icmp ne i32 %call.i.i29, 0
  %or.cond.i.i32 = or i1 %tobool2.i.i31, %tobool.i.i30
  br i1 %or.cond.i.i32, label %if.then.i.i33, label %polybench_alloc_data.exit34

if.then.i.i33:                                    ; preds = %polybench_alloc_data.exit
  call void @exit(i32 1) #5
  unreachable

polybench_alloc_data.exit34:                      ; preds = %polybench_alloc_data.exit
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %2) #4
  %4 = bitcast i8** %ret.i.i35 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %4) #4
  store i8* null, i8** %ret.i.i35, align 8, !tbaa !2
  %call.i.i37 = call i32 @posix_memalign(i8** nonnull %ret.i.i35, i64 4096, i64 47840000) #4
  %5 = load i8*, i8** %ret.i.i35, align 8, !tbaa !2
  %tobool.i.i38 = icmp eq i8* %5, null
  %tobool2.i.i39 = icmp ne i32 %call.i.i37, 0
  %or.cond.i.i40 = or i1 %tobool2.i.i39, %tobool.i.i38
  br i1 %or.cond.i.i40, label %if.then.i.i41, label %polybench_alloc_data.exit42

if.then.i.i41:                                    ; preds = %polybench_alloc_data.exit34
  call void @exit(i32 1) #5
  unreachable

polybench_alloc_data.exit42:                      ; preds = %polybench_alloc_data.exit34
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %4) #4
  %arraydecay = bitcast i8* %1 to [2300 x double]*
  %arraydecay3 = bitcast i8* %3 to [2600 x double]*
  %polly.access. = getelementptr i8, i8* %3, i64 41600000
  %6 = icmp ule i8* %polly.access., %5
  %polly.access.109 = getelementptr i8, i8* %5, i64 47840000
  %7 = icmp ule i8* %polly.access.109, %3
  %8 = or i1 %6, %7
  %polly.access.129 = getelementptr i8, i8* %1, i64 36800000
  %9 = icmp ule i8* %polly.access.129, %5
  %10 = icmp ule i8* %polly.access.109, %1
  %11 = or i1 %9, %10
  %12 = and i1 %8, %11
  %13 = icmp ule i8* %polly.access.129, %3
  %14 = icmp ule i8* %polly.access., %1
  %15 = or i1 %13, %14
  %polly.rtc.result = and i1 %15, %12
  br i1 %polly.rtc.result, label %polly.loop_header, label %for.cond1.preheader.i

for.cond1.preheader.i:                            ; preds = %polybench_alloc_data.exit42, %for.inc7.i
  %indvars.iv86 = phi i64 [ %indvars.iv.next87, %for.inc7.i ], [ 0, %polybench_alloc_data.exit42 ]
  %broadcast.splatinsert = insertelement <4 x i64> undef, i64 %indvars.iv86, i32 0
  %broadcast.splat = shufflevector <4 x i64> %broadcast.splatinsert, <4 x i64> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body.1, %for.cond1.preheader.i
  %index = phi i64 [ 0, %for.cond1.preheader.i ], [ %index.next.1, %vector.body.1 ]
  %vec.ind = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %for.cond1.preheader.i ], [ %vec.ind.next.1, %vector.body.1 ]
  %16 = mul nuw nsw <4 x i64> %vec.ind, %broadcast.splat
  %17 = add nuw nsw <4 x i64> %16, <i64 1, i64 1, i64 1, i64 1>
  %18 = trunc <4 x i64> %17 to <4 x i32>
  %19 = srem <4 x i32> %18, <i32 2000, i32 2000, i32 2000, i32 2000>
  %20 = sitofp <4 x i32> %19 to <4 x double>
  %21 = fmul fast <4 x double> %20, <double 5.000000e-04, double 5.000000e-04, double 5.000000e-04, double 5.000000e-04>
  %22 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay, i64 %indvars.iv86, i64 %index
  %23 = bitcast double* %22 to <4 x double>*
  store <4 x double> %21, <4 x double>* %23, align 8, !tbaa !6, !alias.scope !8, !noalias !11
  %index.next = or i64 %index, 4
  %24 = icmp eq i64 %index.next, 2300
  br i1 %24, label %for.inc7.i, label %vector.body.1, !llvm.loop !14

for.inc7.i:                                       ; preds = %vector.body
  %indvars.iv.next87 = add nuw nsw i64 %indvars.iv86, 1
  %exitcond88 = icmp eq i64 %indvars.iv.next87, 2000
  br i1 %exitcond88, label %for.cond14.preheader.i, label %for.cond1.preheader.i

for.cond14.preheader.i:                           ; preds = %for.inc7.i, %for.inc31.i
  %indvars.iv78 = phi i64 [ %indvars.iv.next79, %for.inc31.i ], [ 0, %for.inc7.i ]
  %broadcast.splatinsert1117 = insertelement <4 x i64> undef, i64 %indvars.iv78, i32 0
  %broadcast.splat1118 = shufflevector <4 x i64> %broadcast.splatinsert1117, <4 x i64> undef, <4 x i32> zeroinitializer
  br label %vector.body1106

vector.body1106:                                  ; preds = %vector.body1106, %for.cond14.preheader.i
  %index1111 = phi i64 [ 0, %for.cond14.preheader.i ], [ %index.next1112.1, %vector.body1106 ]
  %vec.ind1115 = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %for.cond14.preheader.i ], [ %vec.ind.next1116.1, %vector.body1106 ]
  %25 = add nuw nsw <4 x i64> %vec.ind1115, <i64 1, i64 1, i64 1, i64 1>
  %26 = mul nuw nsw <4 x i64> %25, %broadcast.splat1118
  %27 = trunc <4 x i64> %26 to <4 x i32>
  %28 = srem <4 x i32> %27, <i32 2600, i32 2600, i32 2600, i32 2600>
  %29 = sitofp <4 x i32> %28 to <4 x double>
  %30 = fmul fast <4 x double> %29, <double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6>
  %31 = getelementptr inbounds [2600 x double], [2600 x double]* %arraydecay3, i64 %indvars.iv78, i64 %index1111
  %32 = bitcast double* %31 to <4 x double>*
  store <4 x double> %30, <4 x double>* %32, align 8, !tbaa !6, !alias.scope !17, !noalias !18
  %index.next1112 = or i64 %index1111, 4
  %33 = add <4 x i64> %vec.ind1115, <i64 5, i64 5, i64 5, i64 5>
  %34 = mul nuw nsw <4 x i64> %33, %broadcast.splat1118
  %35 = trunc <4 x i64> %34 to <4 x i32>
  %36 = srem <4 x i32> %35, <i32 2600, i32 2600, i32 2600, i32 2600>
  %37 = sitofp <4 x i32> %36 to <4 x double>
  %38 = fmul fast <4 x double> %37, <double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6>
  %39 = getelementptr inbounds [2600 x double], [2600 x double]* %arraydecay3, i64 %indvars.iv78, i64 %index.next1112
  %40 = bitcast double* %39 to <4 x double>*
  store <4 x double> %38, <4 x double>* %40, align 8, !tbaa !6, !alias.scope !17, !noalias !18
  %index.next1112.1 = add nsw i64 %index1111, 8
  %vec.ind.next1116.1 = add <4 x i64> %vec.ind1115, <i64 8, i64 8, i64 8, i64 8>
  %41 = icmp eq i64 %index.next1112.1, 2600
  br i1 %41, label %for.inc31.i, label %vector.body1106, !llvm.loop !19

for.inc31.i:                                      ; preds = %vector.body1106
  %indvars.iv.next79 = add nuw nsw i64 %indvars.iv78, 1
  %exitcond80 = icmp eq i64 %indvars.iv.next79, 2000
  br i1 %exitcond80, label %for.cond38.preheader.i.preheader, label %for.cond14.preheader.i

for.cond38.preheader.i.preheader:                 ; preds = %for.inc31.i
  %arraydecay4 = bitcast i8* %5 to [2300 x double]*
  br label %for.cond38.preheader.i

for.cond38.preheader.i:                           ; preds = %for.cond38.preheader.i.preheader, %for.inc55.i
  %indvars.iv71 = phi i64 [ %indvars.iv.next72, %for.inc55.i ], [ 0, %for.cond38.preheader.i.preheader ]
  %broadcast.splatinsert1130 = insertelement <4 x i64> undef, i64 %indvars.iv71, i32 0
  %broadcast.splat1131 = shufflevector <4 x i64> %broadcast.splatinsert1130, <4 x i64> undef, <4 x i32> zeroinitializer
  br label %vector.body1119

vector.body1119:                                  ; preds = %vector.body1119.1, %for.cond38.preheader.i
  %index1124 = phi i64 [ 0, %for.cond38.preheader.i ], [ %index.next1125.1, %vector.body1119.1 ]
  %vec.ind1128 = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %for.cond38.preheader.i ], [ %vec.ind.next1129.1, %vector.body1119.1 ]
  %42 = add nuw nsw <4 x i64> %vec.ind1128, <i64 2, i64 2, i64 2, i64 2>
  %43 = mul nuw nsw <4 x i64> %42, %broadcast.splat1131
  %44 = trunc <4 x i64> %43 to <4 x i32>
  %45 = srem <4 x i32> %44, <i32 2300, i32 2300, i32 2300, i32 2300>
  %46 = sitofp <4 x i32> %45 to <4 x double>
  %47 = fmul fast <4 x double> %46, <double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95>
  %48 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay4, i64 %indvars.iv71, i64 %index1124
  %49 = bitcast double* %48 to <4 x double>*
  store <4 x double> %47, <4 x double>* %49, align 8, !tbaa !6, !alias.scope !20, !noalias !21
  %index.next1125 = or i64 %index1124, 4
  %50 = icmp eq i64 %index.next1125, 2300
  br i1 %50, label %for.inc55.i, label %vector.body1119.1, !llvm.loop !22

for.inc55.i:                                      ; preds = %vector.body1119
  %indvars.iv.next72 = add nuw nsw i64 %indvars.iv71, 1
  %exitcond73 = icmp eq i64 %indvars.iv.next72, 2600
  br i1 %exitcond73, label %for.cond1.preheader.i43, label %for.cond38.preheader.i

for.cond1.preheader.i43:                          ; preds = %for.inc55.i, %for.inc32.i
  %indvars.iv63 = phi i64 [ %indvars.iv.next64, %for.inc32.i ], [ 0, %for.inc55.i ]
  br label %vector.body1155

vector.body1155:                                  ; preds = %vector.body1155.1, %for.cond1.preheader.i43
  %index1160 = phi i64 [ 0, %for.cond1.preheader.i43 ], [ %index.next1161.1, %vector.body1155.1 ]
  %51 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay, i64 %indvars.iv63, i64 %index1160
  %52 = bitcast double* %51 to <4 x double>*
  %wide.load1170 = load <4 x double>, <4 x double>* %52, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %53 = getelementptr double, double* %51, i64 4
  %54 = bitcast double* %53 to <4 x double>*
  %wide.load1171 = load <4 x double>, <4 x double>* %54, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %55 = getelementptr double, double* %51, i64 8
  %56 = bitcast double* %55 to <4 x double>*
  %wide.load1172 = load <4 x double>, <4 x double>* %56, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %57 = getelementptr double, double* %51, i64 12
  %58 = bitcast double* %57 to <4 x double>*
  %wide.load1173 = load <4 x double>, <4 x double>* %58, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %59 = fmul fast <4 x double> %wide.load1170, <double 1.200000e+00, double 1.200000e+00, double 1.200000e+00, double 1.200000e+00>
  %60 = fmul fast <4 x double> %wide.load1171, <double 1.200000e+00, double 1.200000e+00, double 1.200000e+00, double 1.200000e+00>
  %61 = fmul fast <4 x double> %wide.load1172, <double 1.200000e+00, double 1.200000e+00, double 1.200000e+00, double 1.200000e+00>
  %62 = fmul fast <4 x double> %wide.load1173, <double 1.200000e+00, double 1.200000e+00, double 1.200000e+00, double 1.200000e+00>
  %63 = bitcast double* %51 to <4 x double>*
  store <4 x double> %59, <4 x double>* %63, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %64 = bitcast double* %53 to <4 x double>*
  store <4 x double> %60, <4 x double>* %64, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %65 = bitcast double* %55 to <4 x double>*
  store <4 x double> %61, <4 x double>* %65, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %66 = bitcast double* %57 to <4 x double>*
  store <4 x double> %62, <4 x double>* %66, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %index.next1161 = or i64 %index1160, 16
  %67 = icmp eq i64 %index.next1161, 2288
  br i1 %67, label %for.body3.i48, label %vector.body1155.1, !llvm.loop !29

for.body3.i48:                                    ; preds = %vector.body1155
  %arrayidx5.i = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay, i64 %indvars.iv63, i64 2288
  %68 = load double, double* %arrayidx5.i, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %mul.i45 = fmul fast double %68, 1.200000e+00
  store double %mul.i45, double* %arrayidx5.i, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %arrayidx5.i.1 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay, i64 %indvars.iv63, i64 2289
  %69 = load double, double* %arrayidx5.i.1, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %mul.i45.1 = fmul fast double %69, 1.200000e+00
  store double %mul.i45.1, double* %arrayidx5.i.1, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %arrayidx5.i.2 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay, i64 %indvars.iv63, i64 2290
  %70 = load double, double* %arrayidx5.i.2, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %mul.i45.2 = fmul fast double %70, 1.200000e+00
  store double %mul.i45.2, double* %arrayidx5.i.2, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %arrayidx5.i.3 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay, i64 %indvars.iv63, i64 2291
  %71 = load double, double* %arrayidx5.i.3, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %mul.i45.3 = fmul fast double %71, 1.200000e+00
  store double %mul.i45.3, double* %arrayidx5.i.3, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %arrayidx5.i.4 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay, i64 %indvars.iv63, i64 2292
  %72 = load double, double* %arrayidx5.i.4, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %mul.i45.4 = fmul fast double %72, 1.200000e+00
  store double %mul.i45.4, double* %arrayidx5.i.4, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %arrayidx5.i.5 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay, i64 %indvars.iv63, i64 2293
  %73 = load double, double* %arrayidx5.i.5, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %mul.i45.5 = fmul fast double %73, 1.200000e+00
  store double %mul.i45.5, double* %arrayidx5.i.5, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %arrayidx5.i.6 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay, i64 %indvars.iv63, i64 2294
  %74 = load double, double* %arrayidx5.i.6, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %mul.i45.6 = fmul fast double %74, 1.200000e+00
  store double %mul.i45.6, double* %arrayidx5.i.6, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %arrayidx5.i.7 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay, i64 %indvars.iv63, i64 2295
  %75 = load double, double* %arrayidx5.i.7, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %mul.i45.7 = fmul fast double %75, 1.200000e+00
  store double %mul.i45.7, double* %arrayidx5.i.7, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %arrayidx5.i.8 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay, i64 %indvars.iv63, i64 2296
  %76 = load double, double* %arrayidx5.i.8, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %mul.i45.8 = fmul fast double %76, 1.200000e+00
  store double %mul.i45.8, double* %arrayidx5.i.8, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %arrayidx5.i.9 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay, i64 %indvars.iv63, i64 2297
  %77 = load double, double* %arrayidx5.i.9, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %mul.i45.9 = fmul fast double %77, 1.200000e+00
  store double %mul.i45.9, double* %arrayidx5.i.9, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %arrayidx5.i.10 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay, i64 %indvars.iv63, i64 2298
  %78 = load double, double* %arrayidx5.i.10, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %mul.i45.10 = fmul fast double %78, 1.200000e+00
  store double %mul.i45.10, double* %arrayidx5.i.10, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %arrayidx5.i.11 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay, i64 %indvars.iv63, i64 2299
  %79 = load double, double* %arrayidx5.i.11, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %mul.i45.11 = fmul fast double %79, 1.200000e+00
  store double %mul.i45.11, double* %arrayidx5.i.11, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %arrayidx25.i = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay, i64 %indvars.iv63, i64 2288
  %arrayidx25.i.1 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay, i64 %indvars.iv63, i64 2289
  %arrayidx25.i.2 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay, i64 %indvars.iv63, i64 2290
  %arrayidx25.i.3 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay, i64 %indvars.iv63, i64 2291
  %arrayidx25.i.4 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay, i64 %indvars.iv63, i64 2292
  %arrayidx25.i.5 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay, i64 %indvars.iv63, i64 2293
  %arrayidx25.i.6 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay, i64 %indvars.iv63, i64 2294
  %arrayidx25.i.7 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay, i64 %indvars.iv63, i64 2295
  %arrayidx25.i.8 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay, i64 %indvars.iv63, i64 2296
  %arrayidx25.i.9 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay, i64 %indvars.iv63, i64 2297
  %arrayidx25.i.10 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay, i64 %indvars.iv63, i64 2298
  %arrayidx25.i.11 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay, i64 %indvars.iv63, i64 2299
  br label %for.cond9.preheader.i

for.cond9.preheader.i:                            ; preds = %for.body3.i48, %for.body11.i
  %indvars.iv60 = phi i64 [ %indvars.iv.next61, %for.body11.i ], [ 0, %for.body3.i48 ]
  %arrayidx15.i = getelementptr inbounds [2600 x double], [2600 x double]* %arraydecay3, i64 %indvars.iv63, i64 %indvars.iv60
  %80 = load double, double* %arrayidx15.i, align 8, !tbaa !6, !alias.scope !30, !noalias !31
  %mul16.i = fmul fast double %80, 1.500000e+00
  %broadcast.splatinsert1149 = insertelement <4 x double> undef, double %mul16.i, i32 0
  %broadcast.splat1150 = shufflevector <4 x double> %broadcast.splatinsert1149, <4 x double> undef, <4 x i32> zeroinitializer
  br label %vector.body1132

vector.body1132:                                  ; preds = %vector.body1132.1, %for.cond9.preheader.i
  %index1137 = phi i64 [ 0, %for.cond9.preheader.i ], [ %index.next1138.1, %vector.body1132.1 ]
  %81 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay4, i64 %indvars.iv60, i64 %index1137
  %82 = bitcast double* %81 to <4 x double>*
  %wide.load = load <4 x double>, <4 x double>* %82, align 8, !tbaa !6, !alias.scope !32, !noalias !33
  %83 = getelementptr double, double* %81, i64 4
  %84 = bitcast double* %83 to <4 x double>*
  %wide.load1146 = load <4 x double>, <4 x double>* %84, align 8, !tbaa !6, !alias.scope !32, !noalias !33
  %85 = getelementptr double, double* %81, i64 8
  %86 = bitcast double* %85 to <4 x double>*
  %wide.load1147 = load <4 x double>, <4 x double>* %86, align 8, !tbaa !6, !alias.scope !32, !noalias !33
  %87 = getelementptr double, double* %81, i64 12
  %88 = bitcast double* %87 to <4 x double>*
  %wide.load1148 = load <4 x double>, <4 x double>* %88, align 8, !tbaa !6, !alias.scope !32, !noalias !33
  %89 = fmul fast <4 x double> %broadcast.splat1150, %wide.load
  %90 = fmul fast <4 x double> %broadcast.splat1150, %wide.load1146
  %91 = fmul fast <4 x double> %broadcast.splat1150, %wide.load1147
  %92 = fmul fast <4 x double> %broadcast.splat1150, %wide.load1148
  %93 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay, i64 %indvars.iv63, i64 %index1137
  %94 = bitcast double* %93 to <4 x double>*
  %wide.load1151 = load <4 x double>, <4 x double>* %94, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %95 = getelementptr double, double* %93, i64 4
  %96 = bitcast double* %95 to <4 x double>*
  %wide.load1152 = load <4 x double>, <4 x double>* %96, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %97 = getelementptr double, double* %93, i64 8
  %98 = bitcast double* %97 to <4 x double>*
  %wide.load1153 = load <4 x double>, <4 x double>* %98, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %99 = getelementptr double, double* %93, i64 12
  %100 = bitcast double* %99 to <4 x double>*
  %wide.load1154 = load <4 x double>, <4 x double>* %100, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %101 = fadd fast <4 x double> %wide.load1151, %89
  %102 = fadd fast <4 x double> %wide.load1152, %90
  %103 = fadd fast <4 x double> %wide.load1153, %91
  %104 = fadd fast <4 x double> %wide.load1154, %92
  %105 = bitcast double* %93 to <4 x double>*
  store <4 x double> %101, <4 x double>* %105, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %106 = bitcast double* %95 to <4 x double>*
  store <4 x double> %102, <4 x double>* %106, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %107 = bitcast double* %97 to <4 x double>*
  store <4 x double> %103, <4 x double>* %107, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %108 = bitcast double* %99 to <4 x double>*
  store <4 x double> %104, <4 x double>* %108, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %index.next1138 = or i64 %index1137, 16
  %109 = icmp eq i64 %index.next1138, 2288
  br i1 %109, label %for.body11.i, label %vector.body1132.1, !llvm.loop !34

for.body11.i:                                     ; preds = %vector.body1132
  %arrayidx20.i = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay4, i64 %indvars.iv60, i64 2288
  %110 = load double, double* %arrayidx20.i, align 8, !tbaa !6, !alias.scope !32, !noalias !33
  %mul21.i = fmul fast double %mul16.i, %110
  %111 = load double, double* %arrayidx25.i, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %add.i49 = fadd fast double %111, %mul21.i
  store double %add.i49, double* %arrayidx25.i, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %arrayidx20.i.1 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay4, i64 %indvars.iv60, i64 2289
  %112 = load double, double* %arrayidx20.i.1, align 8, !tbaa !6, !alias.scope !32, !noalias !33
  %mul21.i.1 = fmul fast double %mul16.i, %112
  %113 = load double, double* %arrayidx25.i.1, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %add.i49.1 = fadd fast double %113, %mul21.i.1
  store double %add.i49.1, double* %arrayidx25.i.1, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %arrayidx20.i.2 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay4, i64 %indvars.iv60, i64 2290
  %114 = load double, double* %arrayidx20.i.2, align 8, !tbaa !6, !alias.scope !32, !noalias !33
  %mul21.i.2 = fmul fast double %mul16.i, %114
  %115 = load double, double* %arrayidx25.i.2, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %add.i49.2 = fadd fast double %115, %mul21.i.2
  store double %add.i49.2, double* %arrayidx25.i.2, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %arrayidx20.i.3 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay4, i64 %indvars.iv60, i64 2291
  %116 = load double, double* %arrayidx20.i.3, align 8, !tbaa !6, !alias.scope !32, !noalias !33
  %mul21.i.3 = fmul fast double %mul16.i, %116
  %117 = load double, double* %arrayidx25.i.3, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %add.i49.3 = fadd fast double %117, %mul21.i.3
  store double %add.i49.3, double* %arrayidx25.i.3, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %arrayidx20.i.4 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay4, i64 %indvars.iv60, i64 2292
  %118 = load double, double* %arrayidx20.i.4, align 8, !tbaa !6, !alias.scope !32, !noalias !33
  %mul21.i.4 = fmul fast double %mul16.i, %118
  %119 = load double, double* %arrayidx25.i.4, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %add.i49.4 = fadd fast double %119, %mul21.i.4
  store double %add.i49.4, double* %arrayidx25.i.4, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %arrayidx20.i.5 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay4, i64 %indvars.iv60, i64 2293
  %120 = load double, double* %arrayidx20.i.5, align 8, !tbaa !6, !alias.scope !32, !noalias !33
  %mul21.i.5 = fmul fast double %mul16.i, %120
  %121 = load double, double* %arrayidx25.i.5, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %add.i49.5 = fadd fast double %121, %mul21.i.5
  store double %add.i49.5, double* %arrayidx25.i.5, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %arrayidx20.i.6 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay4, i64 %indvars.iv60, i64 2294
  %122 = load double, double* %arrayidx20.i.6, align 8, !tbaa !6, !alias.scope !32, !noalias !33
  %mul21.i.6 = fmul fast double %mul16.i, %122
  %123 = load double, double* %arrayidx25.i.6, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %add.i49.6 = fadd fast double %123, %mul21.i.6
  store double %add.i49.6, double* %arrayidx25.i.6, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %arrayidx20.i.7 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay4, i64 %indvars.iv60, i64 2295
  %124 = load double, double* %arrayidx20.i.7, align 8, !tbaa !6, !alias.scope !32, !noalias !33
  %mul21.i.7 = fmul fast double %mul16.i, %124
  %125 = load double, double* %arrayidx25.i.7, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %add.i49.7 = fadd fast double %125, %mul21.i.7
  store double %add.i49.7, double* %arrayidx25.i.7, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %arrayidx20.i.8 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay4, i64 %indvars.iv60, i64 2296
  %126 = load double, double* %arrayidx20.i.8, align 8, !tbaa !6, !alias.scope !32, !noalias !33
  %mul21.i.8 = fmul fast double %mul16.i, %126
  %127 = load double, double* %arrayidx25.i.8, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %add.i49.8 = fadd fast double %127, %mul21.i.8
  store double %add.i49.8, double* %arrayidx25.i.8, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %arrayidx20.i.9 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay4, i64 %indvars.iv60, i64 2297
  %128 = load double, double* %arrayidx20.i.9, align 8, !tbaa !6, !alias.scope !32, !noalias !33
  %mul21.i.9 = fmul fast double %mul16.i, %128
  %129 = load double, double* %arrayidx25.i.9, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %add.i49.9 = fadd fast double %129, %mul21.i.9
  store double %add.i49.9, double* %arrayidx25.i.9, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %arrayidx20.i.10 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay4, i64 %indvars.iv60, i64 2298
  %130 = load double, double* %arrayidx20.i.10, align 8, !tbaa !6, !alias.scope !32, !noalias !33
  %mul21.i.10 = fmul fast double %mul16.i, %130
  %131 = load double, double* %arrayidx25.i.10, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %add.i49.10 = fadd fast double %131, %mul21.i.10
  store double %add.i49.10, double* %arrayidx25.i.10, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %arrayidx20.i.11 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay4, i64 %indvars.iv60, i64 2299
  %132 = load double, double* %arrayidx20.i.11, align 8, !tbaa !6, !alias.scope !32, !noalias !33
  %mul21.i.11 = fmul fast double %mul16.i, %132
  %133 = load double, double* %arrayidx25.i.11, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %add.i49.11 = fadd fast double %133, %mul21.i.11
  store double %add.i49.11, double* %arrayidx25.i.11, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %exitcond62 = icmp eq i64 %indvars.iv.next61, 2600
  br i1 %exitcond62, label %for.inc32.i, label %for.cond9.preheader.i

for.inc32.i:                                      ; preds = %for.body11.i
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %exitcond65 = icmp eq i64 %indvars.iv.next64, 2000
  br i1 %exitcond65, label %print_array.exit, label %for.cond1.preheader.i43

print_array.exit:                                 ; preds = %for.inc32.i, %polly.loop_exit305
  call void @free(i8* nonnull %1) #4
  call void @free(i8* %3) #4
  call void @free(i8* %5) #4
  ret i32 0

polly.loop_header:                                ; preds = %polybench_alloc_data.exit42, %polly.loop_exit202
  %polly.indvar = phi i64 [ %polly.indvar_next, %polly.loop_exit202 ], [ 0, %polybench_alloc_data.exit42 ]
  %134 = mul nsw i64 %polly.indvar, -32
  %135 = add nsw i64 %134, 2599
  %136 = icmp slt i64 %135, 31
  %137 = select i1 %136, i64 %135, i64 31
  %138 = shl nsw i64 %polly.indvar, 5
  br label %polly.loop_header200

polly.loop_exit202:                               ; preds = %polly.loop_exit208
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond1099 = icmp eq i64 %polly.indvar_next, 82
  br i1 %exitcond1099, label %polly.loop_header219, label %polly.loop_header

polly.loop_header200:                             ; preds = %polly.loop_exit208, %polly.loop_header
  %polly.indvar203 = phi i64 [ 0, %polly.loop_header ], [ %polly.indvar_next204, %polly.loop_exit208 ]
  %139 = shl i64 %polly.indvar203, 5
  %140 = add i64 %139, -2300
  %141 = icmp sgt i64 %140, -32
  %smax = select i1 %141, i64 %140, i64 -32
  %142 = sub i64 0, %smax
  %143 = mul nsw i64 %polly.indvar203, -32
  %144 = add nsw i64 %143, 2299
  %145 = icmp slt i64 %144, 31
  %146 = select i1 %145, i64 %144, i64 31
  %147 = shl nsw i64 %polly.indvar203, 5
  %min.iters.check = icmp ult i64 %142, 4
  %broadcast.splatinsert1185 = insertelement <4 x i64> undef, i64 %147, i32 0
  %broadcast.splat1186 = shufflevector <4 x i64> %broadcast.splatinsert1185, <4 x i64> undef, <4 x i32> zeroinitializer
  %148 = add nuw nsw <4 x i64> %broadcast.splat1186, <i64 0, i64 1, i64 2, i64 3>
  %149 = trunc <4 x i64> %148 to <4 x i32>
  %150 = add <4 x i32> %149, <i32 2, i32 2, i32 2, i32 2>
  %151 = shl i64 %polly.indvar203, 8
  %152 = icmp eq i64 %142, 4
  %153 = add nuw nsw <4 x i64> %broadcast.splat1186, <i64 4, i64 5, i64 6, i64 7>
  %154 = trunc <4 x i64> %153 to <4 x i32>
  %155 = add <4 x i32> %154, <i32 2, i32 2, i32 2, i32 2>
  %156 = extractelement <4 x i64> %153, i32 0
  %157 = shl i64 %156, 3
  %158 = icmp eq i64 %142, 8
  %159 = add nuw nsw <4 x i64> %broadcast.splat1186, <i64 8, i64 9, i64 10, i64 11>
  %160 = trunc <4 x i64> %159 to <4 x i32>
  %161 = add <4 x i32> %160, <i32 2, i32 2, i32 2, i32 2>
  %162 = extractelement <4 x i64> %159, i32 0
  %163 = shl i64 %162, 3
  %164 = icmp eq i64 %142, 12
  %165 = add nuw nsw <4 x i64> %broadcast.splat1186, <i64 12, i64 13, i64 14, i64 15>
  %166 = trunc <4 x i64> %165 to <4 x i32>
  %167 = add <4 x i32> %166, <i32 2, i32 2, i32 2, i32 2>
  %168 = extractelement <4 x i64> %165, i32 0
  %169 = shl i64 %168, 3
  %170 = icmp eq i64 %142, 16
  %171 = add nuw nsw <4 x i64> %broadcast.splat1186, <i64 16, i64 17, i64 18, i64 19>
  %172 = trunc <4 x i64> %171 to <4 x i32>
  %173 = add <4 x i32> %172, <i32 2, i32 2, i32 2, i32 2>
  %174 = extractelement <4 x i64> %171, i32 0
  %175 = shl i64 %174, 3
  %176 = icmp eq i64 %142, 20
  %177 = add nuw nsw <4 x i64> %broadcast.splat1186, <i64 20, i64 21, i64 22, i64 23>
  %178 = trunc <4 x i64> %177 to <4 x i32>
  %179 = add <4 x i32> %178, <i32 2, i32 2, i32 2, i32 2>
  %180 = extractelement <4 x i64> %177, i32 0
  %181 = shl i64 %180, 3
  %182 = icmp eq i64 %142, 24
  %183 = add nuw nsw <4 x i64> %broadcast.splat1186, <i64 24, i64 25, i64 26, i64 27>
  %184 = trunc <4 x i64> %183 to <4 x i32>
  %185 = add <4 x i32> %184, <i32 2, i32 2, i32 2, i32 2>
  %186 = extractelement <4 x i64> %183, i32 0
  %187 = shl i64 %186, 3
  %188 = icmp eq i64 %142, 28
  %189 = add nuw nsw <4 x i64> %broadcast.splat1186, <i64 28, i64 29, i64 30, i64 31>
  %190 = trunc <4 x i64> %189 to <4 x i32>
  %191 = add <4 x i32> %190, <i32 2, i32 2, i32 2, i32 2>
  %192 = extractelement <4 x i64> %189, i32 0
  %193 = shl i64 %192, 3
  br label %polly.loop_header206

polly.loop_exit208:                               ; preds = %polly.loop_exit214
  %polly.indvar_next204 = add nuw nsw i64 %polly.indvar203, 1
  %exitcond1098 = icmp eq i64 %polly.indvar_next204, 72
  br i1 %exitcond1098, label %polly.loop_exit202, label %polly.loop_header200

polly.loop_header206:                             ; preds = %polly.loop_exit214, %polly.loop_header200
  %polly.indvar209 = phi i64 [ 0, %polly.loop_header200 ], [ %polly.indvar_next210, %polly.loop_exit214 ]
  %194 = add nuw nsw i64 %polly.indvar209, %138
  %195 = trunc i64 %194 to i32
  %196 = mul nuw nsw i64 %194, 18400
  br i1 %min.iters.check, label %polly.loop_header212, label %vector.ph1178

vector.ph1178:                                    ; preds = %polly.loop_header206
  %broadcast.splatinsert1187 = insertelement <4 x i32> undef, i32 %195, i32 0
  %broadcast.splat1188 = shufflevector <4 x i32> %broadcast.splatinsert1187, <4 x i32> undef, <4 x i32> zeroinitializer
  %197 = mul <4 x i32> %150, %broadcast.splat1188
  %198 = srem <4 x i32> %197, <i32 2300, i32 2300, i32 2300, i32 2300>
  %199 = sitofp <4 x i32> %198 to <4 x double>
  %200 = fmul fast <4 x double> %199, <double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95>
  %201 = add nuw nsw i64 %151, %196
  %202 = getelementptr i8, i8* %5, i64 %201
  %203 = bitcast i8* %202 to <4 x double>*
  store <4 x double> %200, <4 x double>* %203, align 8, !alias.scope !35, !noalias !37
  br i1 %152, label %polly.loop_exit214, label %vector.body1174.1, !llvm.loop !42

polly.loop_exit214:                               ; preds = %vector.ph1178, %vector.body1174.1, %vector.body1174.2, %vector.body1174.3, %vector.body1174.4, %vector.body1174.5, %vector.body1174.6, %vector.body1174.7, %polly.loop_header212
  %polly.indvar_next210 = add nuw nsw i64 %polly.indvar209, 1
  %polly.loop_cond211 = icmp slt i64 %polly.indvar209, %137
  br i1 %polly.loop_cond211, label %polly.loop_header206, label %polly.loop_exit208

polly.loop_header212:                             ; preds = %polly.loop_header206, %polly.loop_header212
  %polly.indvar215 = phi i64 [ %polly.indvar_next216, %polly.loop_header212 ], [ 0, %polly.loop_header206 ]
  %204 = add nuw nsw i64 %polly.indvar215, %147
  %205 = trunc i64 %204 to i32
  %206 = add i32 %205, 2
  %207 = mul i32 %206, %195
  %p_rem44.i = srem i32 %207, 2300
  %p_conv45.i = sitofp i32 %p_rem44.i to double
  %p_div47.i = fmul fast double %p_conv45.i, 0x3F3C7E7115D0CE95
  %208 = shl i64 %204, 3
  %209 = add nuw nsw i64 %208, %196
  %scevgep = getelementptr i8, i8* %5, i64 %209
  %scevgep218 = bitcast i8* %scevgep to double*
  store double %p_div47.i, double* %scevgep218, align 8, !alias.scope !35, !noalias !37
  %polly.indvar_next216 = add nuw nsw i64 %polly.indvar215, 1
  %polly.loop_cond217 = icmp slt i64 %polly.indvar215, %146
  br i1 %polly.loop_cond217, label %polly.loop_header212, label %polly.loop_exit214, !llvm.loop !43

polly.loop_header219:                             ; preds = %polly.loop_exit202, %polly.loop_exit227
  %polly.indvar222 = phi i64 [ %polly.indvar_next223, %polly.loop_exit227 ], [ 0, %polly.loop_exit202 ]
  %210 = mul nsw i64 %polly.indvar222, -32
  %211 = add nsw i64 %210, 1999
  %212 = icmp slt i64 %211, 31
  %213 = select i1 %212, i64 %211, i64 31
  %214 = shl nsw i64 %polly.indvar222, 5
  br label %polly.loop_header225

polly.loop_exit227:                               ; preds = %polly.loop_exit233
  %polly.indvar_next223 = add nuw nsw i64 %polly.indvar222, 1
  %exitcond1097 = icmp eq i64 %polly.indvar_next223, 63
  br i1 %exitcond1097, label %polly.loop_header245, label %polly.loop_header219

polly.loop_header225:                             ; preds = %polly.loop_exit233, %polly.loop_header219
  %polly.indvar228 = phi i64 [ 0, %polly.loop_header219 ], [ %polly.indvar_next229, %polly.loop_exit233 ]
  %215 = shl i64 %polly.indvar228, 5
  %216 = add i64 %215, -2300
  %217 = icmp sgt i64 %216, -32
  %smax1192 = select i1 %217, i64 %216, i64 -32
  %218 = sub i64 0, %smax1192
  %219 = mul nsw i64 %polly.indvar228, -32
  %220 = add nsw i64 %219, 2299
  %221 = icmp slt i64 %220, 31
  %222 = select i1 %221, i64 %220, i64 31
  %223 = shl nsw i64 %polly.indvar228, 5
  %min.iters.check1193 = icmp ult i64 %218, 4
  %broadcast.splatinsert1205 = insertelement <4 x i64> undef, i64 %223, i32 0
  %broadcast.splat1206 = shufflevector <4 x i64> %broadcast.splatinsert1205, <4 x i64> undef, <4 x i32> zeroinitializer
  %224 = add nuw nsw <4 x i64> %broadcast.splat1206, <i64 0, i64 1, i64 2, i64 3>
  %225 = trunc <4 x i64> %224 to <4 x i32>
  %226 = shl i64 %polly.indvar228, 8
  %227 = icmp eq i64 %218, 4
  %228 = add nuw nsw <4 x i64> %broadcast.splat1206, <i64 4, i64 5, i64 6, i64 7>
  %229 = trunc <4 x i64> %228 to <4 x i32>
  %230 = extractelement <4 x i64> %228, i32 0
  %231 = shl i64 %230, 3
  %232 = icmp eq i64 %218, 8
  %233 = add nuw nsw <4 x i64> %broadcast.splat1206, <i64 8, i64 9, i64 10, i64 11>
  %234 = trunc <4 x i64> %233 to <4 x i32>
  %235 = extractelement <4 x i64> %233, i32 0
  %236 = shl i64 %235, 3
  %237 = icmp eq i64 %218, 12
  %238 = add nuw nsw <4 x i64> %broadcast.splat1206, <i64 12, i64 13, i64 14, i64 15>
  %239 = trunc <4 x i64> %238 to <4 x i32>
  %240 = extractelement <4 x i64> %238, i32 0
  %241 = shl i64 %240, 3
  %242 = icmp eq i64 %218, 16
  %243 = add nuw nsw <4 x i64> %broadcast.splat1206, <i64 16, i64 17, i64 18, i64 19>
  %244 = trunc <4 x i64> %243 to <4 x i32>
  %245 = extractelement <4 x i64> %243, i32 0
  %246 = shl i64 %245, 3
  %247 = icmp eq i64 %218, 20
  %248 = add nuw nsw <4 x i64> %broadcast.splat1206, <i64 20, i64 21, i64 22, i64 23>
  %249 = trunc <4 x i64> %248 to <4 x i32>
  %250 = extractelement <4 x i64> %248, i32 0
  %251 = shl i64 %250, 3
  %252 = icmp eq i64 %218, 24
  %253 = add nuw nsw <4 x i64> %broadcast.splat1206, <i64 24, i64 25, i64 26, i64 27>
  %254 = trunc <4 x i64> %253 to <4 x i32>
  %255 = extractelement <4 x i64> %253, i32 0
  %256 = shl i64 %255, 3
  %257 = icmp eq i64 %218, 28
  %258 = add nuw nsw <4 x i64> %broadcast.splat1206, <i64 28, i64 29, i64 30, i64 31>
  %259 = trunc <4 x i64> %258 to <4 x i32>
  %260 = extractelement <4 x i64> %258, i32 0
  %261 = shl i64 %260, 3
  br label %polly.loop_header231

polly.loop_exit233:                               ; preds = %polly.loop_exit239
  %polly.indvar_next229 = add nuw nsw i64 %polly.indvar228, 1
  %exitcond1096 = icmp eq i64 %polly.indvar_next229, 72
  br i1 %exitcond1096, label %polly.loop_exit227, label %polly.loop_header225

polly.loop_header231:                             ; preds = %polly.loop_exit239, %polly.loop_header225
  %polly.indvar234 = phi i64 [ 0, %polly.loop_header225 ], [ %polly.indvar_next235, %polly.loop_exit239 ]
  %262 = add nuw nsw i64 %polly.indvar234, %214
  %263 = trunc i64 %262 to i32
  %264 = mul nuw nsw i64 %262, 18400
  br i1 %min.iters.check1193, label %polly.loop_header237, label %vector.ph1198

vector.ph1198:                                    ; preds = %polly.loop_header231
  %broadcast.splatinsert1207 = insertelement <4 x i32> undef, i32 %263, i32 0
  %broadcast.splat1208 = shufflevector <4 x i32> %broadcast.splatinsert1207, <4 x i32> undef, <4 x i32> zeroinitializer
  %265 = mul <4 x i32> %broadcast.splat1208, %225
  %266 = add <4 x i32> %265, <i32 1, i32 1, i32 1, i32 1>
  %267 = srem <4 x i32> %266, <i32 2000, i32 2000, i32 2000, i32 2000>
  %268 = sitofp <4 x i32> %267 to <4 x double>
  %269 = fmul fast <4 x double> %268, <double 5.000000e-04, double 5.000000e-04, double 5.000000e-04, double 5.000000e-04>
  %270 = add nuw nsw i64 %226, %264
  %271 = getelementptr i8, i8* %1, i64 %270
  %272 = bitcast i8* %271 to <4 x double>*
  store <4 x double> %269, <4 x double>* %272, align 8, !alias.scope !38, !noalias !45
  br i1 %227, label %polly.loop_exit239, label %vector.body1189.1, !llvm.loop !46

polly.loop_exit239:                               ; preds = %vector.ph1198, %vector.body1189.1, %vector.body1189.2, %vector.body1189.3, %vector.body1189.4, %vector.body1189.5, %vector.body1189.6, %vector.body1189.7, %polly.loop_header237
  %polly.indvar_next235 = add nuw nsw i64 %polly.indvar234, 1
  %polly.loop_cond236 = icmp slt i64 %polly.indvar234, %213
  br i1 %polly.loop_cond236, label %polly.loop_header231, label %polly.loop_exit233

polly.loop_header237:                             ; preds = %polly.loop_header231, %polly.loop_header237
  %polly.indvar240 = phi i64 [ %polly.indvar_next241, %polly.loop_header237 ], [ 0, %polly.loop_header231 ]
  %273 = add nuw nsw i64 %polly.indvar240, %223
  %274 = trunc i64 %273 to i32
  %275 = mul i32 %274, %263
  %276 = add i32 %275, 1
  %p_rem.i = srem i32 %276, 2000
  %p_conv.i = sitofp i32 %p_rem.i to double
  %p_div.i = fmul fast double %p_conv.i, 5.000000e-04
  %277 = shl i64 %273, 3
  %278 = add nuw nsw i64 %277, %264
  %scevgep243 = getelementptr i8, i8* %1, i64 %278
  %scevgep243244 = bitcast i8* %scevgep243 to double*
  store double %p_div.i, double* %scevgep243244, align 8, !alias.scope !38, !noalias !45
  %polly.indvar_next241 = add nuw nsw i64 %polly.indvar240, 1
  %polly.loop_cond242 = icmp slt i64 %polly.indvar240, %222
  br i1 %polly.loop_cond242, label %polly.loop_header237, label %polly.loop_exit239, !llvm.loop !47

polly.loop_header245:                             ; preds = %polly.loop_exit227, %polly.loop_exit253
  %polly.indvar248 = phi i64 [ %polly.indvar_next249, %polly.loop_exit253 ], [ 0, %polly.loop_exit227 ]
  %279 = mul nsw i64 %polly.indvar248, -32
  %280 = add nsw i64 %279, 1999
  %281 = icmp slt i64 %280, 31
  %282 = select i1 %281, i64 %280, i64 31
  %283 = shl i64 %polly.indvar248, 5
  br label %polly.loop_header251

polly.loop_exit253:                               ; preds = %polly.loop_exit259
  %polly.indvar_next249 = add nuw nsw i64 %polly.indvar248, 1
  %exitcond1095 = icmp eq i64 %polly.indvar_next249, 63
  br i1 %exitcond1095, label %polly.loop_header271, label %polly.loop_header245

polly.loop_header251:                             ; preds = %polly.loop_exit259, %polly.loop_header245
  %polly.indvar254 = phi i64 [ 0, %polly.loop_header245 ], [ %polly.indvar_next255, %polly.loop_exit259 ]
  %284 = shl i64 %polly.indvar254, 5
  %285 = add i64 %284, -2300
  %286 = icmp sgt i64 %285, -32
  %smax1212 = select i1 %286, i64 %285, i64 -32
  %287 = sub i64 0, %smax1212
  %288 = mul nsw i64 %polly.indvar254, -32
  %289 = add nsw i64 %288, 2299
  %290 = icmp slt i64 %289, 31
  %291 = select i1 %290, i64 %289, i64 31
  %292 = shl i64 %polly.indvar254, 5
  %min.iters.check1213 = icmp ult i64 %287, 16
  %n.vec1216 = and i64 %287, -16
  %cmp.zero1217 = icmp eq i64 %n.vec1216, 0
  %293 = shl i64 %polly.indvar254, 8
  %294 = icmp eq i64 %n.vec1216, 16
  %cmp.n1222 = icmp eq i64 %n.vec1216, %287
  %295 = shl i64 %polly.indvar254, 8
  %296 = or i64 %295, 128
  br label %polly.loop_header257

polly.loop_exit259:                               ; preds = %polly.loop_exit265
  %polly.indvar_next255 = add nuw nsw i64 %polly.indvar254, 1
  %exitcond1094 = icmp eq i64 %polly.indvar_next255, 72
  br i1 %exitcond1094, label %polly.loop_exit253, label %polly.loop_header251

polly.loop_header257:                             ; preds = %polly.loop_exit265, %polly.loop_header251
  %polly.indvar260 = phi i64 [ 0, %polly.loop_header251 ], [ %polly.indvar_next261, %polly.loop_exit265 ]
  %297 = add nuw nsw i64 %polly.indvar260, %283
  %298 = mul nuw nsw i64 %297, 18400
  %brmerge = or i1 %min.iters.check1213, %cmp.zero1217
  br i1 %brmerge, label %polly.loop_header263, label %vector.body1209

vector.body1209:                                  ; preds = %polly.loop_header257
  %299 = add nuw nsw i64 %293, %298
  %300 = getelementptr i8, i8* %1, i64 %299
  %301 = bitcast i8* %300 to <4 x double>*
  %wide.load1229 = load <4 x double>, <4 x double>* %301, align 8, !alias.scope !38, !noalias !45
  %302 = getelementptr i8, i8* %300, i64 32
  %303 = bitcast i8* %302 to <4 x double>*
  %wide.load1230 = load <4 x double>, <4 x double>* %303, align 8, !alias.scope !38, !noalias !45
  %304 = getelementptr i8, i8* %300, i64 64
  %305 = bitcast i8* %304 to <4 x double>*
  %wide.load1231 = load <4 x double>, <4 x double>* %305, align 8, !alias.scope !38, !noalias !45
  %306 = getelementptr i8, i8* %300, i64 96
  %307 = bitcast i8* %306 to <4 x double>*
  %wide.load1232 = load <4 x double>, <4 x double>* %307, align 8, !alias.scope !38, !noalias !45
  %308 = fmul fast <4 x double> %wide.load1229, <double 1.200000e+00, double 1.200000e+00, double 1.200000e+00, double 1.200000e+00>
  %309 = fmul fast <4 x double> %wide.load1230, <double 1.200000e+00, double 1.200000e+00, double 1.200000e+00, double 1.200000e+00>
  %310 = fmul fast <4 x double> %wide.load1231, <double 1.200000e+00, double 1.200000e+00, double 1.200000e+00, double 1.200000e+00>
  %311 = fmul fast <4 x double> %wide.load1232, <double 1.200000e+00, double 1.200000e+00, double 1.200000e+00, double 1.200000e+00>
  %312 = bitcast i8* %300 to <4 x double>*
  store <4 x double> %308, <4 x double>* %312, align 8, !alias.scope !38, !noalias !45
  %313 = bitcast i8* %302 to <4 x double>*
  store <4 x double> %309, <4 x double>* %313, align 8, !alias.scope !38, !noalias !45
  %314 = bitcast i8* %304 to <4 x double>*
  store <4 x double> %310, <4 x double>* %314, align 8, !alias.scope !38, !noalias !45
  %315 = bitcast i8* %306 to <4 x double>*
  store <4 x double> %311, <4 x double>* %315, align 8, !alias.scope !38, !noalias !45
  br i1 %294, label %middle.block1210, label %vector.body1209.1, !llvm.loop !48

middle.block1210:                                 ; preds = %vector.body1209.1, %vector.body1209
  br i1 %cmp.n1222, label %polly.loop_exit265, label %polly.loop_header263

polly.loop_exit265:                               ; preds = %polly.loop_header263, %middle.block1210
  %polly.indvar_next261 = add nuw nsw i64 %polly.indvar260, 1
  %polly.loop_cond262 = icmp slt i64 %polly.indvar260, %282
  br i1 %polly.loop_cond262, label %polly.loop_header257, label %polly.loop_exit259

polly.loop_header263:                             ; preds = %polly.loop_header257, %middle.block1210, %polly.loop_header263
  %polly.indvar266 = phi i64 [ %polly.indvar_next267, %polly.loop_header263 ], [ 0, %polly.loop_header257 ], [ %n.vec1216, %middle.block1210 ]
  %316 = add nuw nsw i64 %polly.indvar266, %292
  %317 = shl i64 %316, 3
  %318 = add nuw nsw i64 %317, %298
  %scevgep269 = getelementptr i8, i8* %1, i64 %318
  %scevgep269270 = bitcast i8* %scevgep269 to double*
  %_p_scalar_ = load double, double* %scevgep269270, align 8, !alias.scope !38, !noalias !45
  %p_mul.i45 = fmul fast double %_p_scalar_, 1.200000e+00
  store double %p_mul.i45, double* %scevgep269270, align 8, !alias.scope !38, !noalias !45
  %polly.indvar_next267 = add nuw nsw i64 %polly.indvar266, 1
  %polly.loop_cond268 = icmp slt i64 %polly.indvar266, %291
  br i1 %polly.loop_cond268, label %polly.loop_header263, label %polly.loop_exit265, !llvm.loop !49

polly.loop_header271:                             ; preds = %polly.loop_exit253, %polly.loop_exit279
  %polly.indvar274 = phi i64 [ %polly.indvar_next275, %polly.loop_exit279 ], [ 0, %polly.loop_exit253 ]
  %319 = mul nsw i64 %polly.indvar274, -32
  %320 = add nsw i64 %319, 1999
  %321 = icmp slt i64 %320, 31
  %322 = select i1 %321, i64 %320, i64 31
  %323 = shl nsw i64 %polly.indvar274, 5
  br label %polly.loop_header277

polly.loop_exit279:                               ; preds = %polly.loop_exit285
  %polly.indvar_next275 = add nuw nsw i64 %polly.indvar274, 1
  %exitcond1093 = icmp eq i64 %polly.indvar_next275, 63
  br i1 %exitcond1093, label %polly.loop_header297.preheader, label %polly.loop_header271

polly.loop_header297.preheader:                   ; preds = %polly.loop_exit279
  %polly.access.cast.351 = bitcast i8* %3 to double*
  %polly.access.cast.323 = bitcast i8* %5 to double*
  br label %polly.loop_header297

polly.loop_header277:                             ; preds = %polly.loop_exit285, %polly.loop_header271
  %polly.indvar280 = phi i64 [ 0, %polly.loop_header271 ], [ %polly.indvar_next281, %polly.loop_exit285 ]
  %324 = shl i64 %polly.indvar280, 5
  %325 = add i64 %324, -2600
  %326 = icmp sgt i64 %325, -32
  %smax1236 = select i1 %326, i64 %325, i64 -32
  %327 = sub i64 0, %smax1236
  %328 = mul nsw i64 %polly.indvar280, -32
  %329 = add nsw i64 %328, 2599
  %330 = icmp slt i64 %329, 31
  %331 = select i1 %330, i64 %329, i64 31
  %332 = shl nsw i64 %polly.indvar280, 5
  %min.iters.check1237 = icmp ult i64 %327, 4
  %broadcast.splatinsert1249 = insertelement <4 x i64> undef, i64 %332, i32 0
  %broadcast.splat1250 = shufflevector <4 x i64> %broadcast.splatinsert1249, <4 x i64> undef, <4 x i32> zeroinitializer
  %333 = add nuw nsw <4 x i64> %broadcast.splat1250, <i64 0, i64 1, i64 2, i64 3>
  %334 = trunc <4 x i64> %333 to <4 x i32>
  %335 = add <4 x i32> %334, <i32 1, i32 1, i32 1, i32 1>
  %336 = shl i64 %polly.indvar280, 8
  %337 = add nuw nsw <4 x i64> %broadcast.splat1250, <i64 4, i64 5, i64 6, i64 7>
  %338 = trunc <4 x i64> %337 to <4 x i32>
  %339 = add <4 x i32> %338, <i32 1, i32 1, i32 1, i32 1>
  %340 = extractelement <4 x i64> %337, i32 0
  %341 = shl i64 %340, 3
  %342 = icmp eq i64 %327, 8
  %343 = add nuw nsw <4 x i64> %broadcast.splat1250, <i64 8, i64 9, i64 10, i64 11>
  %344 = trunc <4 x i64> %343 to <4 x i32>
  %345 = add <4 x i32> %344, <i32 1, i32 1, i32 1, i32 1>
  %346 = extractelement <4 x i64> %343, i32 0
  %347 = shl i64 %346, 3
  %348 = add nuw nsw <4 x i64> %broadcast.splat1250, <i64 12, i64 13, i64 14, i64 15>
  %349 = trunc <4 x i64> %348 to <4 x i32>
  %350 = add <4 x i32> %349, <i32 1, i32 1, i32 1, i32 1>
  %351 = extractelement <4 x i64> %348, i32 0
  %352 = shl i64 %351, 3
  %353 = icmp eq i64 %327, 16
  %354 = add nuw nsw <4 x i64> %broadcast.splat1250, <i64 16, i64 17, i64 18, i64 19>
  %355 = trunc <4 x i64> %354 to <4 x i32>
  %356 = add <4 x i32> %355, <i32 1, i32 1, i32 1, i32 1>
  %357 = extractelement <4 x i64> %354, i32 0
  %358 = shl i64 %357, 3
  %359 = add nuw nsw <4 x i64> %broadcast.splat1250, <i64 20, i64 21, i64 22, i64 23>
  %360 = trunc <4 x i64> %359 to <4 x i32>
  %361 = add <4 x i32> %360, <i32 1, i32 1, i32 1, i32 1>
  %362 = extractelement <4 x i64> %359, i32 0
  %363 = shl i64 %362, 3
  %364 = icmp eq i64 %327, 24
  %365 = add nuw nsw <4 x i64> %broadcast.splat1250, <i64 24, i64 25, i64 26, i64 27>
  %366 = trunc <4 x i64> %365 to <4 x i32>
  %367 = add <4 x i32> %366, <i32 1, i32 1, i32 1, i32 1>
  %368 = extractelement <4 x i64> %365, i32 0
  %369 = shl i64 %368, 3
  %370 = add nuw nsw <4 x i64> %broadcast.splat1250, <i64 28, i64 29, i64 30, i64 31>
  %371 = trunc <4 x i64> %370 to <4 x i32>
  %372 = add <4 x i32> %371, <i32 1, i32 1, i32 1, i32 1>
  %373 = extractelement <4 x i64> %370, i32 0
  %374 = shl i64 %373, 3
  br label %polly.loop_header283

polly.loop_exit285:                               ; preds = %polly.loop_exit291
  %polly.indvar_next281 = add nuw nsw i64 %polly.indvar280, 1
  %exitcond1092 = icmp eq i64 %polly.indvar_next281, 82
  br i1 %exitcond1092, label %polly.loop_exit279, label %polly.loop_header277

polly.loop_header283:                             ; preds = %polly.loop_exit291, %polly.loop_header277
  %polly.indvar286 = phi i64 [ 0, %polly.loop_header277 ], [ %polly.indvar_next287, %polly.loop_exit291 ]
  %375 = add nuw nsw i64 %polly.indvar286, %323
  %376 = trunc i64 %375 to i32
  %377 = mul nuw nsw i64 %375, 20800
  br i1 %min.iters.check1237, label %polly.loop_header289, label %vector.ph1242

vector.ph1242:                                    ; preds = %polly.loop_header283
  %broadcast.splatinsert1251 = insertelement <4 x i32> undef, i32 %376, i32 0
  %broadcast.splat1252 = shufflevector <4 x i32> %broadcast.splatinsert1251, <4 x i32> undef, <4 x i32> zeroinitializer
  %378 = mul <4 x i32> %335, %broadcast.splat1252
  %379 = srem <4 x i32> %378, <i32 2600, i32 2600, i32 2600, i32 2600>
  %380 = sitofp <4 x i32> %379 to <4 x double>
  %381 = fmul fast <4 x double> %380, <double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6>
  %382 = add nuw nsw i64 %336, %377
  %383 = getelementptr i8, i8* %3, i64 %382
  %384 = bitcast i8* %383 to <4 x double>*
  store <4 x double> %381, <4 x double>* %384, align 8, !alias.scope !39, !noalias !50
  %385 = mul <4 x i32> %339, %broadcast.splat1252
  %386 = srem <4 x i32> %385, <i32 2600, i32 2600, i32 2600, i32 2600>
  %387 = sitofp <4 x i32> %386 to <4 x double>
  %388 = fmul fast <4 x double> %387, <double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6>
  %389 = add nuw nsw i64 %341, %377
  %390 = getelementptr i8, i8* %3, i64 %389
  %391 = bitcast i8* %390 to <4 x double>*
  store <4 x double> %388, <4 x double>* %391, align 8, !alias.scope !39, !noalias !50
  br i1 %342, label %polly.loop_exit291, label %vector.body1233.2, !llvm.loop !51

polly.loop_exit291:                               ; preds = %vector.ph1242, %vector.body1233.2, %vector.body1233.4, %vector.body1233.6, %polly.loop_header289
  %polly.indvar_next287 = add nuw nsw i64 %polly.indvar286, 1
  %polly.loop_cond288 = icmp slt i64 %polly.indvar286, %322
  br i1 %polly.loop_cond288, label %polly.loop_header283, label %polly.loop_exit285

polly.loop_header289:                             ; preds = %polly.loop_header283, %polly.loop_header289
  %polly.indvar292 = phi i64 [ %polly.indvar_next293, %polly.loop_header289 ], [ 0, %polly.loop_header283 ]
  %392 = add nuw nsw i64 %polly.indvar292, %332
  %393 = trunc i64 %392 to i32
  %394 = add i32 %393, 1
  %395 = mul i32 %394, %376
  %p_rem20.i = srem i32 %395, 2600
  %p_conv21.i = sitofp i32 %p_rem20.i to double
  %p_div23.i = fmul fast double %p_conv21.i, 0x3F3934C67F9B2CE6
  %396 = shl i64 %392, 3
  %397 = add nuw nsw i64 %396, %377
  %scevgep295 = getelementptr i8, i8* %3, i64 %397
  %scevgep295296 = bitcast i8* %scevgep295 to double*
  store double %p_div23.i, double* %scevgep295296, align 8, !alias.scope !39, !noalias !50
  %polly.indvar_next293 = add nuw nsw i64 %polly.indvar292, 1
  %polly.loop_cond294 = icmp slt i64 %polly.indvar292, %331
  br i1 %polly.loop_cond294, label %polly.loop_header289, label %polly.loop_exit291, !llvm.loop !52

polly.loop_header297:                             ; preds = %polly.loop_exit305, %polly.loop_header297.preheader
  %polly.indvar300 = phi i64 [ %polly.indvar_next301, %polly.loop_exit305 ], [ 0, %polly.loop_header297.preheader ]
  %398 = icmp eq i64 %polly.indvar300, 0
  %399 = mul nuw nsw i64 %polly.indvar300, -256
  %400 = add nsw i64 %399, 287
  %401 = icmp slt i64 %400, 255
  %402 = select i1 %401, i64 %400, i64 255
  %403 = shl i64 %polly.indvar300, 11
  %404 = shl i64 %polly.indvar300, 8
  %405 = or i64 %403, 2047
  %406 = icmp slt i64 %405, 2299
  %407 = select i1 %406, i64 %405, i64 2299
  %polly.loop_guard319 = icmp sgt i64 %403, %407
  br label %polly.loop_header303

polly.loop_exit305:                               ; preds = %polly.loop_exit331
  %polly.indvar_next301 = add nuw nsw i64 %polly.indvar300, 1
  %exitcond1091 = icmp eq i64 %polly.indvar_next301, 2
  br i1 %exitcond1091, label %print_array.exit, label %polly.loop_header297

polly.loop_header303:                             ; preds = %polly.loop_exit331, %polly.loop_header297
  %polly.indvar306 = phi i64 [ 0, %polly.loop_header297 ], [ %polly.indvar_next307, %polly.loop_exit331 ]
  %408 = shl nsw i64 %polly.indvar306, 8
  %409 = or i64 %408, 255
  %410 = icmp slt i64 %409, 2599
  %411 = select i1 %410, i64 %409, i64 2599
  %polly.loop_guard = icmp sgt i64 %408, %411
  br i1 %polly.loop_guard, label %polly.loop_header329.preheader, label %polly.loop_header309.preheader

polly.loop_header309.preheader:                   ; preds = %polly.loop_header303
  %412 = sub nsw i64 %399, %polly.indvar306
  br i1 %polly.loop_guard319, label %polly.loop_header329.preheader, label %polly.loop_header309

polly.loop_header329.preheader:                   ; preds = %polly.loop_exit318, %polly.loop_header309.preheader, %polly.loop_header303
  %413 = mul nsw i64 %polly.indvar306, -256
  %414 = add nsw i64 %413, 2599
  %415 = icmp slt i64 %414, 255
  %416 = select i1 %415, i64 %414, i64 255
  br label %polly.loop_header329

polly.loop_exit331:                               ; preds = %polly.loop_exit361
  %polly.indvar_next307 = add nuw nsw i64 %polly.indvar306, 1
  %exitcond1090 = icmp eq i64 %polly.indvar_next307, 11
  br i1 %exitcond1090, label %polly.loop_exit305, label %polly.loop_header303

polly.loop_header309:                             ; preds = %polly.loop_header309.preheader, %polly.loop_exit318
  %polly.indvar312 = phi i64 [ %polly.indvar_next313, %polly.loop_exit318 ], [ %408, %polly.loop_header309.preheader ]
  %polly.access.mul.324 = mul nuw nsw i64 %polly.indvar312, 2300
  br label %polly.loop_header316

polly.loop_exit318:                               ; preds = %polly.loop_header316
  %polly.indvar_next313 = add nuw nsw i64 %polly.indvar312, 1
  %polly.loop_cond314 = icmp slt i64 %polly.indvar312, %411
  br i1 %polly.loop_cond314, label %polly.loop_header309, label %polly.loop_header329.preheader

polly.loop_header316:                             ; preds = %polly.loop_header309, %polly.loop_header316
  %polly.indvar320 = phi i64 [ %polly.indvar_next321, %polly.loop_header316 ], [ %403, %polly.loop_header309 ]
  %polly.access.add.325 = add nuw nsw i64 %polly.indvar320, %polly.access.mul.324
  %polly.access.326 = getelementptr double, double* %polly.access.cast.323, i64 %polly.access.add.325
  %417 = bitcast double* %polly.access.326 to i64*
  %polly.access.326.load1062 = load i64, i64* %417, align 8, !alias.scope !35, !noalias !37
  %pexp.p_div_q = lshr i64 %polly.indvar320, 3
  %tmp = add i64 %412, %pexp.p_div_q
  %tmp1063 = shl i64 %tmp, 8
  %polly.access.add.Packed_B = add i64 %tmp1063, %polly.indvar312
  %418 = shl nsw i64 %polly.access.add.Packed_B, 3
  %419 = sub nsw i64 7, %polly.indvar320
  %pexp.pdiv_r = and i64 %419, 7
  %polly.access.mul.Packed_B327 = or i64 %418, %pexp.pdiv_r
  %polly.access.add.Packed_B328 = xor i64 %polly.access.mul.Packed_B327, 7
  %polly.access.Packed_B = getelementptr [256 x [256 x [8 x double]]], [256 x [256 x [8 x double]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B328
  %420 = bitcast double* %polly.access.Packed_B to i64*
  store i64 %polly.access.326.load1062, i64* %420, align 8, !alias.scope !40, !noalias !53
  %polly.indvar_next321 = add nuw nsw i64 %polly.indvar320, 1
  %polly.loop_cond322 = icmp slt i64 %polly.indvar320, %407
  br i1 %polly.loop_cond322, label %polly.loop_header316, label %polly.loop_exit318

polly.loop_header329:                             ; preds = %polly.loop_exit361, %polly.loop_header329.preheader
  %polly.indvar332 = phi i64 [ %polly.indvar_next333, %polly.loop_exit361 ], [ 0, %polly.loop_header329.preheader ]
  %421 = mul nuw nsw i64 %polly.indvar332, 96
  br i1 %398, label %polly.then, label %polly.merge

polly.merge:                                      ; preds = %polly.loop_exit346, %polly.loop_header329, %polly.loop_header336.preheader, %polly.then
  %422 = mul nsw i64 %polly.indvar332, -24
  %423 = add nsw i64 %422, 499
  %424 = icmp slt i64 %423, 23
  %425 = select i1 %424, i64 %423, i64 23
  br label %polly.loop_header359

polly.loop_exit361:                               ; preds = %polly.loop_exit367
  %polly.indvar_next333 = add nuw nsw i64 %polly.indvar332, 1
  %exitcond1089 = icmp eq i64 %polly.indvar_next333, 21
  br i1 %exitcond1089, label %polly.loop_exit331, label %polly.loop_header329

polly.then:                                       ; preds = %polly.loop_header329
  %426 = add nuw nsw i64 %421, 95
  %427 = icmp slt i64 %426, 1999
  %428 = select i1 %427, i64 %426, i64 1999
  %polly.loop_guard339 = icmp sgt i64 %421, %428
  br i1 %polly.loop_guard339, label %polly.merge, label %polly.loop_header336.preheader

polly.loop_header336.preheader:                   ; preds = %polly.then
  %429 = mul nsw i64 %polly.indvar332, -24
  %430 = sub nsw i64 %429, %polly.indvar306
  br i1 %polly.loop_guard, label %polly.merge, label %polly.loop_header336

polly.loop_header336:                             ; preds = %polly.loop_header336.preheader, %polly.loop_exit346
  %polly.indvar340 = phi i64 [ %polly.indvar_next341, %polly.loop_exit346 ], [ %421, %polly.loop_header336.preheader ]
  %polly.access.mul.352 = mul nuw nsw i64 %polly.indvar340, 2600
  %pexp.p_div_q355 = lshr i64 %polly.indvar340, 2
  %tmp1065 = add i64 %430, %pexp.p_div_q355
  %tmp1066 = shl i64 %tmp1065, 8
  %431 = sub nsw i64 3, %polly.indvar340
  %pexp.pdiv_r357 = and i64 %431, 3
  br label %polly.loop_header344

polly.loop_exit346:                               ; preds = %polly.loop_header344
  %polly.indvar_next341 = add nuw nsw i64 %polly.indvar340, 1
  %polly.loop_cond342 = icmp slt i64 %polly.indvar340, %428
  br i1 %polly.loop_cond342, label %polly.loop_header336, label %polly.merge

polly.loop_header344:                             ; preds = %polly.loop_header336, %polly.loop_header344
  %polly.indvar348 = phi i64 [ %polly.indvar_next349, %polly.loop_header344 ], [ %408, %polly.loop_header336 ]
  %polly.access.add.353 = add nuw nsw i64 %polly.indvar348, %polly.access.mul.352
  %polly.access.354 = getelementptr double, double* %polly.access.cast.351, i64 %polly.access.add.353
  %432 = bitcast double* %polly.access.354 to i64*
  %polly.access.354.load1061 = load i64, i64* %432, align 8, !alias.scope !39, !noalias !50
  %polly.access.add.Packed_A = add i64 %polly.indvar348, %tmp1066
  %433 = shl nsw i64 %polly.access.add.Packed_A, 2
  %polly.access.mul.Packed_A356 = or i64 %433, %pexp.pdiv_r357
  %polly.access.add.Packed_A358 = xor i64 %polly.access.mul.Packed_A356, 3
  %polly.access.Packed_A = getelementptr [24 x [256 x [4 x double]]], [24 x [256 x [4 x double]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A358
  %434 = bitcast double* %polly.access.Packed_A to i64*
  store i64 %polly.access.354.load1061, i64* %434, align 8, !alias.scope !41, !noalias !54
  %polly.indvar_next349 = add nuw nsw i64 %polly.indvar348, 1
  %polly.loop_cond350 = icmp slt i64 %polly.indvar348, %411
  br i1 %polly.loop_cond350, label %polly.loop_header344, label %polly.loop_exit346

polly.loop_header359:                             ; preds = %polly.loop_exit367, %polly.merge
  %polly.indvar362 = phi i64 [ 0, %polly.merge ], [ %polly.indvar_next363, %polly.loop_exit367 ]
  %435 = shl i64 %polly.indvar362, 3
  %436 = add nuw nsw i64 %435, %403
  %polly.access.mul.Packed_B385 = shl i64 %polly.indvar362, 8
  %437 = shl i64 %436, 3
  %438 = add nuw nsw i64 %polly.indvar362, %404
  %439 = icmp slt i64 %438, 287
  %440 = or i64 %437, 32
  br label %polly.loop_header365

polly.loop_exit367:                               ; preds = %polly.loop_exit373
  %polly.indvar_next363 = add nuw nsw i64 %polly.indvar362, 1
  %polly.loop_cond364 = icmp slt i64 %polly.indvar362, %402
  br i1 %polly.loop_cond364, label %polly.loop_header359, label %polly.loop_exit361

polly.loop_header365:                             ; preds = %polly.loop_exit373, %polly.loop_header359
  %polly.indvar368 = phi i64 [ 0, %polly.loop_header359 ], [ %polly.indvar_next369, %polly.loop_exit373 ]
  %441 = shl nsw i64 %polly.indvar368, 2
  %442 = add nuw nsw i64 %441, %421
  %polly.access.mul.Packed_A378 = shl i64 %polly.indvar368, 8
  %443 = mul nuw nsw i64 %442, 18400
  %444 = add nuw nsw i64 %443, %437
  %scevgep391 = getelementptr i8, i8* %1, i64 %444
  %445 = add nuw nsw i64 %443, %440
  %scevgep478 = getelementptr i8, i8* %1, i64 %445
  %446 = or i64 %442, 1
  %447 = mul nuw nsw i64 %446, 18400
  %448 = add nuw nsw i64 %447, %437
  %scevgep562 = getelementptr i8, i8* %1, i64 %448
  %449 = add nuw nsw i64 %447, %440
  %scevgep650 = getelementptr i8, i8* %1, i64 %449
  %450 = or i64 %442, 2
  %451 = mul nuw nsw i64 %450, 18400
  %452 = add nuw nsw i64 %451, %437
  %scevgep734 = getelementptr i8, i8* %1, i64 %452
  %453 = add nuw nsw i64 %451, %440
  %scevgep822 = getelementptr i8, i8* %1, i64 %453
  %454 = or i64 %442, 3
  %455 = mul nuw nsw i64 %454, 18400
  %456 = add nuw nsw i64 %455, %437
  %scevgep906 = getelementptr i8, i8* %1, i64 %456
  %457 = add nuw nsw i64 %455, %440
  %scevgep994 = getelementptr i8, i8* %1, i64 %457
  %458 = bitcast i8* %scevgep391 to <4 x double>*
  %459 = load <4 x double>, <4 x double>* %458, align 8, !alias.scope !55, !noalias !45
  %460 = bitcast i8* %scevgep562 to <4 x double>*
  %461 = load <4 x double>, <4 x double>* %460, align 8, !alias.scope !60, !noalias !65
  %462 = bitcast i8* %scevgep734 to <4 x double>*
  %463 = load <4 x double>, <4 x double>* %462, align 8, !alias.scope !70, !noalias !75
  %464 = bitcast i8* %scevgep906 to <4 x double>*
  %465 = load <4 x double>, <4 x double>* %464, align 8, !alias.scope !80, !noalias !85
  %466 = bitcast i8* %scevgep478 to <4 x double>*
  %467 = bitcast i8* %scevgep478 to <4 x double>*
  %468 = bitcast i8* %scevgep650 to <4 x double>*
  %469 = bitcast i8* %scevgep650 to <4 x double>*
  %470 = bitcast i8* %scevgep822 to <4 x double>*
  %471 = bitcast i8* %scevgep822 to <4 x double>*
  %472 = bitcast i8* %scevgep994 to <4 x double>*
  %473 = bitcast i8* %scevgep994 to <4 x double>*
  br label %polly.loop_header371

polly.loop_exit373:                               ; preds = %polly.merge974
  %474 = bitcast i8* %scevgep391 to <4 x double>*
  store <4 x double> %487, <4 x double>* %474, align 8, !alias.scope !55, !noalias !45
  %475 = bitcast i8* %scevgep562 to <4 x double>*
  store <4 x double> %491, <4 x double>* %475, align 8, !alias.scope !60, !noalias !65
  %476 = bitcast i8* %scevgep734 to <4 x double>*
  store <4 x double> %495, <4 x double>* %476, align 8, !alias.scope !70, !noalias !75
  %477 = bitcast i8* %scevgep906 to <4 x double>*
  store <4 x double> %499, <4 x double>* %477, align 8, !alias.scope !80, !noalias !85
  %polly.indvar_next369 = add nuw nsw i64 %polly.indvar368, 1
  %polly.loop_cond370 = icmp slt i64 %polly.indvar368, %425
  br i1 %polly.loop_cond370, label %polly.loop_header365, label %polly.loop_exit367

polly.loop_header371:                             ; preds = %polly.merge974, %polly.loop_header365
  %polly.indvar374 = phi i64 [ 0, %polly.loop_header365 ], [ %polly.indvar_next375, %polly.merge974 ]
  %478 = phi <4 x double> [ %459, %polly.loop_header365 ], [ %487, %polly.merge974 ]
  %479 = phi <4 x double> [ %461, %polly.loop_header365 ], [ %491, %polly.merge974 ]
  %480 = phi <4 x double> [ %463, %polly.loop_header365 ], [ %495, %polly.merge974 ]
  %481 = phi <4 x double> [ %465, %polly.loop_header365 ], [ %499, %polly.merge974 ]
  %polly.access.add.Packed_A379 = add nuw nsw i64 %polly.indvar374, %polly.access.mul.Packed_A378
  %polly.access.mul.Packed_A380 = shl nsw i64 %polly.access.add.Packed_A379, 2
  %polly.access.Packed_A382 = getelementptr [24 x [256 x [4 x double]]], [24 x [256 x [4 x double]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.mul.Packed_A380
  %_p_scalar_383 = load double, double* %polly.access.Packed_A382, align 32, !alias.scope !41, !noalias !54
  %p_mul16.i = fmul fast double %_p_scalar_383, 1.500000e+00
  %polly.access.add.Packed_B386 = add nuw nsw i64 %polly.indvar374, %polly.access.mul.Packed_B385
  %polly.access.mul.Packed_B387 = shl nsw i64 %polly.access.add.Packed_B386, 3
  %polly.access.Packed_B389 = getelementptr [256 x [256 x [8 x double]]], [256 x [256 x [8 x double]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.mul.Packed_B387
  %482 = bitcast double* %polly.access.Packed_B389 to <4 x double>*
  %483 = load <4 x double>, <4 x double>* %482, align 64, !alias.scope !40, !noalias !53
  %484 = insertelement <4 x double> undef, double %p_mul16.i, i32 0
  %485 = shufflevector <4 x double> %484, <4 x double> undef, <4 x i32> zeroinitializer
  %486 = fmul fast <4 x double> %485, %483
  %487 = fadd fast <4 x double> %478, %486
  br i1 %439, label %polly.stmt.for.body11.i461, label %polly.stmt.for.body11.i545

polly.stmt.for.body11.i545:                       ; preds = %polly.loop_header371, %polly.stmt.for.body11.i461
  %polly.access.add.Packed_A550 = or i64 %polly.access.mul.Packed_A380, 1
  %polly.access.Packed_A551 = getelementptr [24 x [256 x [4 x double]]], [24 x [256 x [4 x double]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A550
  %_p_scalar_552 = load double, double* %polly.access.Packed_A551, align 8, !alias.scope !41, !noalias !54
  %p_mul16.i553 = fmul fast double %_p_scalar_552, 1.500000e+00
  %488 = insertelement <4 x double> undef, double %p_mul16.i553, i32 0
  %489 = shufflevector <4 x double> %488, <4 x double> undef, <4 x i32> zeroinitializer
  %490 = fmul fast <4 x double> %489, %483
  %491 = fadd fast <4 x double> %479, %490
  br i1 %439, label %polly.stmt.for.body11.i633, label %polly.stmt.for.body11.i717

polly.stmt.for.body11.i717:                       ; preds = %polly.stmt.for.body11.i545, %polly.stmt.for.body11.i633
  %polly.access.add.Packed_A722 = or i64 %polly.access.mul.Packed_A380, 2
  %polly.access.Packed_A723 = getelementptr [24 x [256 x [4 x double]]], [24 x [256 x [4 x double]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A722
  %_p_scalar_724 = load double, double* %polly.access.Packed_A723, align 16, !alias.scope !41, !noalias !54
  %p_mul16.i725 = fmul fast double %_p_scalar_724, 1.500000e+00
  %492 = insertelement <4 x double> undef, double %p_mul16.i725, i32 0
  %493 = shufflevector <4 x double> %492, <4 x double> undef, <4 x i32> zeroinitializer
  %494 = fmul fast <4 x double> %493, %483
  %495 = fadd fast <4 x double> %480, %494
  br i1 %439, label %polly.stmt.for.body11.i805, label %polly.stmt.for.body11.i889

polly.stmt.for.body11.i889:                       ; preds = %polly.stmt.for.body11.i717, %polly.stmt.for.body11.i805
  %polly.access.add.Packed_A894 = or i64 %polly.access.mul.Packed_A380, 3
  %polly.access.Packed_A895 = getelementptr [24 x [256 x [4 x double]]], [24 x [256 x [4 x double]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A894
  %_p_scalar_896 = load double, double* %polly.access.Packed_A895, align 8, !alias.scope !41, !noalias !54
  %p_mul16.i897 = fmul fast double %_p_scalar_896, 1.500000e+00
  %496 = insertelement <4 x double> undef, double %p_mul16.i897, i32 0
  %497 = shufflevector <4 x double> %496, <4 x double> undef, <4 x i32> zeroinitializer
  %498 = fmul fast <4 x double> %497, %483
  %499 = fadd fast <4 x double> %481, %498
  br i1 %439, label %polly.stmt.for.body11.i977, label %polly.merge974

polly.merge974:                                   ; preds = %polly.stmt.for.body11.i889, %polly.stmt.for.body11.i977
  %polly.indvar_next375 = add nuw nsw i64 %polly.indvar374, 1
  %polly.loop_cond376 = icmp slt i64 %polly.indvar374, %416
  br i1 %polly.loop_cond376, label %polly.loop_header371, label %polly.loop_exit373

polly.stmt.for.body11.i461:                       ; preds = %polly.loop_header371
  %polly.access.add.Packed_B474 = or i64 %polly.access.mul.Packed_B387, 4
  %polly.access.Packed_B475 = getelementptr [256 x [256 x [8 x double]]], [256 x [256 x [8 x double]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B474
  %500 = bitcast double* %polly.access.Packed_B475 to <4 x double>*
  %501 = load <4 x double>, <4 x double>* %500, align 32, !alias.scope !40, !noalias !53
  %502 = fmul fast <4 x double> %485, %501
  %503 = load <4 x double>, <4 x double>* %466, align 8, !alias.scope !90, !noalias !91
  %504 = fadd fast <4 x double> %503, %502
  store <4 x double> %504, <4 x double>* %467, align 8, !alias.scope !90, !noalias !91
  br label %polly.stmt.for.body11.i545

polly.stmt.for.body11.i633:                       ; preds = %polly.stmt.for.body11.i545
  %polly.access.add.Packed_B646 = or i64 %polly.access.mul.Packed_B387, 4
  %polly.access.Packed_B647 = getelementptr [256 x [256 x [8 x double]]], [256 x [256 x [8 x double]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B646
  %505 = bitcast double* %polly.access.Packed_B647 to <4 x double>*
  %506 = load <4 x double>, <4 x double>* %505, align 32, !alias.scope !40, !noalias !53
  %507 = fmul fast <4 x double> %489, %506
  %508 = load <4 x double>, <4 x double>* %468, align 8, !alias.scope !92, !noalias !93
  %509 = fadd fast <4 x double> %508, %507
  store <4 x double> %509, <4 x double>* %469, align 8, !alias.scope !92, !noalias !93
  br label %polly.stmt.for.body11.i717

polly.stmt.for.body11.i805:                       ; preds = %polly.stmt.for.body11.i717
  %polly.access.add.Packed_B818 = or i64 %polly.access.mul.Packed_B387, 4
  %polly.access.Packed_B819 = getelementptr [256 x [256 x [8 x double]]], [256 x [256 x [8 x double]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B818
  %510 = bitcast double* %polly.access.Packed_B819 to <4 x double>*
  %511 = load <4 x double>, <4 x double>* %510, align 32, !alias.scope !40, !noalias !53
  %512 = fmul fast <4 x double> %493, %511
  %513 = load <4 x double>, <4 x double>* %470, align 8, !alias.scope !94, !noalias !95
  %514 = fadd fast <4 x double> %513, %512
  store <4 x double> %514, <4 x double>* %471, align 8, !alias.scope !94, !noalias !95
  br label %polly.stmt.for.body11.i889

polly.stmt.for.body11.i977:                       ; preds = %polly.stmt.for.body11.i889
  %polly.access.add.Packed_B990 = or i64 %polly.access.mul.Packed_B387, 4
  %polly.access.Packed_B991 = getelementptr [256 x [256 x [8 x double]]], [256 x [256 x [8 x double]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B990
  %515 = bitcast double* %polly.access.Packed_B991 to <4 x double>*
  %516 = load <4 x double>, <4 x double>* %515, align 32, !alias.scope !40, !noalias !53
  %517 = fmul fast <4 x double> %497, %516
  %518 = load <4 x double>, <4 x double>* %472, align 8, !alias.scope !96, !noalias !101
  %519 = fadd fast <4 x double> %518, %517
  store <4 x double> %519, <4 x double>* %473, align 8, !alias.scope !96, !noalias !101
  br label %polly.merge974

vector.body1233.2:                                ; preds = %vector.ph1242
  %520 = mul <4 x i32> %345, %broadcast.splat1252
  %521 = srem <4 x i32> %520, <i32 2600, i32 2600, i32 2600, i32 2600>
  %522 = sitofp <4 x i32> %521 to <4 x double>
  %523 = fmul fast <4 x double> %522, <double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6>
  %524 = add nuw nsw i64 %347, %377
  %525 = getelementptr i8, i8* %3, i64 %524
  %526 = bitcast i8* %525 to <4 x double>*
  store <4 x double> %523, <4 x double>* %526, align 8, !alias.scope !39, !noalias !50
  %527 = mul <4 x i32> %350, %broadcast.splat1252
  %528 = srem <4 x i32> %527, <i32 2600, i32 2600, i32 2600, i32 2600>
  %529 = sitofp <4 x i32> %528 to <4 x double>
  %530 = fmul fast <4 x double> %529, <double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6>
  %531 = add nuw nsw i64 %352, %377
  %532 = getelementptr i8, i8* %3, i64 %531
  %533 = bitcast i8* %532 to <4 x double>*
  store <4 x double> %530, <4 x double>* %533, align 8, !alias.scope !39, !noalias !50
  br i1 %353, label %polly.loop_exit291, label %vector.body1233.4, !llvm.loop !51

vector.body1233.4:                                ; preds = %vector.body1233.2
  %534 = mul <4 x i32> %356, %broadcast.splat1252
  %535 = srem <4 x i32> %534, <i32 2600, i32 2600, i32 2600, i32 2600>
  %536 = sitofp <4 x i32> %535 to <4 x double>
  %537 = fmul fast <4 x double> %536, <double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6>
  %538 = add nuw nsw i64 %358, %377
  %539 = getelementptr i8, i8* %3, i64 %538
  %540 = bitcast i8* %539 to <4 x double>*
  store <4 x double> %537, <4 x double>* %540, align 8, !alias.scope !39, !noalias !50
  %541 = mul <4 x i32> %361, %broadcast.splat1252
  %542 = srem <4 x i32> %541, <i32 2600, i32 2600, i32 2600, i32 2600>
  %543 = sitofp <4 x i32> %542 to <4 x double>
  %544 = fmul fast <4 x double> %543, <double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6>
  %545 = add nuw nsw i64 %363, %377
  %546 = getelementptr i8, i8* %3, i64 %545
  %547 = bitcast i8* %546 to <4 x double>*
  store <4 x double> %544, <4 x double>* %547, align 8, !alias.scope !39, !noalias !50
  br i1 %364, label %polly.loop_exit291, label %vector.body1233.6, !llvm.loop !51

vector.body1233.6:                                ; preds = %vector.body1233.4
  %548 = mul <4 x i32> %367, %broadcast.splat1252
  %549 = srem <4 x i32> %548, <i32 2600, i32 2600, i32 2600, i32 2600>
  %550 = sitofp <4 x i32> %549 to <4 x double>
  %551 = fmul fast <4 x double> %550, <double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6>
  %552 = add nuw nsw i64 %369, %377
  %553 = getelementptr i8, i8* %3, i64 %552
  %554 = bitcast i8* %553 to <4 x double>*
  store <4 x double> %551, <4 x double>* %554, align 8, !alias.scope !39, !noalias !50
  %555 = mul <4 x i32> %372, %broadcast.splat1252
  %556 = srem <4 x i32> %555, <i32 2600, i32 2600, i32 2600, i32 2600>
  %557 = sitofp <4 x i32> %556 to <4 x double>
  %558 = fmul fast <4 x double> %557, <double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6>
  %559 = add nuw nsw i64 %374, %377
  %560 = getelementptr i8, i8* %3, i64 %559
  %561 = bitcast i8* %560 to <4 x double>*
  store <4 x double> %558, <4 x double>* %561, align 8, !alias.scope !39, !noalias !50
  br label %polly.loop_exit291

vector.body1209.1:                                ; preds = %vector.body1209
  %562 = add nuw nsw i64 %296, %298
  %563 = getelementptr i8, i8* %1, i64 %562
  %564 = bitcast i8* %563 to <4 x double>*
  %wide.load1229.1 = load <4 x double>, <4 x double>* %564, align 8, !alias.scope !38, !noalias !45
  %565 = getelementptr i8, i8* %563, i64 32
  %566 = bitcast i8* %565 to <4 x double>*
  %wide.load1230.1 = load <4 x double>, <4 x double>* %566, align 8, !alias.scope !38, !noalias !45
  %567 = getelementptr i8, i8* %563, i64 64
  %568 = bitcast i8* %567 to <4 x double>*
  %wide.load1231.1 = load <4 x double>, <4 x double>* %568, align 8, !alias.scope !38, !noalias !45
  %569 = getelementptr i8, i8* %563, i64 96
  %570 = bitcast i8* %569 to <4 x double>*
  %wide.load1232.1 = load <4 x double>, <4 x double>* %570, align 8, !alias.scope !38, !noalias !45
  %571 = fmul fast <4 x double> %wide.load1229.1, <double 1.200000e+00, double 1.200000e+00, double 1.200000e+00, double 1.200000e+00>
  %572 = fmul fast <4 x double> %wide.load1230.1, <double 1.200000e+00, double 1.200000e+00, double 1.200000e+00, double 1.200000e+00>
  %573 = fmul fast <4 x double> %wide.load1231.1, <double 1.200000e+00, double 1.200000e+00, double 1.200000e+00, double 1.200000e+00>
  %574 = fmul fast <4 x double> %wide.load1232.1, <double 1.200000e+00, double 1.200000e+00, double 1.200000e+00, double 1.200000e+00>
  %575 = bitcast i8* %563 to <4 x double>*
  store <4 x double> %571, <4 x double>* %575, align 8, !alias.scope !38, !noalias !45
  %576 = bitcast i8* %565 to <4 x double>*
  store <4 x double> %572, <4 x double>* %576, align 8, !alias.scope !38, !noalias !45
  %577 = bitcast i8* %567 to <4 x double>*
  store <4 x double> %573, <4 x double>* %577, align 8, !alias.scope !38, !noalias !45
  %578 = bitcast i8* %569 to <4 x double>*
  store <4 x double> %574, <4 x double>* %578, align 8, !alias.scope !38, !noalias !45
  br label %middle.block1210

vector.body1189.1:                                ; preds = %vector.ph1198
  %579 = mul <4 x i32> %broadcast.splat1208, %229
  %580 = add <4 x i32> %579, <i32 1, i32 1, i32 1, i32 1>
  %581 = srem <4 x i32> %580, <i32 2000, i32 2000, i32 2000, i32 2000>
  %582 = sitofp <4 x i32> %581 to <4 x double>
  %583 = fmul fast <4 x double> %582, <double 5.000000e-04, double 5.000000e-04, double 5.000000e-04, double 5.000000e-04>
  %584 = add nuw nsw i64 %231, %264
  %585 = getelementptr i8, i8* %1, i64 %584
  %586 = bitcast i8* %585 to <4 x double>*
  store <4 x double> %583, <4 x double>* %586, align 8, !alias.scope !38, !noalias !45
  br i1 %232, label %polly.loop_exit239, label %vector.body1189.2, !llvm.loop !46

vector.body1189.2:                                ; preds = %vector.body1189.1
  %587 = mul <4 x i32> %broadcast.splat1208, %234
  %588 = add <4 x i32> %587, <i32 1, i32 1, i32 1, i32 1>
  %589 = srem <4 x i32> %588, <i32 2000, i32 2000, i32 2000, i32 2000>
  %590 = sitofp <4 x i32> %589 to <4 x double>
  %591 = fmul fast <4 x double> %590, <double 5.000000e-04, double 5.000000e-04, double 5.000000e-04, double 5.000000e-04>
  %592 = add nuw nsw i64 %236, %264
  %593 = getelementptr i8, i8* %1, i64 %592
  %594 = bitcast i8* %593 to <4 x double>*
  store <4 x double> %591, <4 x double>* %594, align 8, !alias.scope !38, !noalias !45
  br i1 %237, label %polly.loop_exit239, label %vector.body1189.3, !llvm.loop !46

vector.body1189.3:                                ; preds = %vector.body1189.2
  %595 = mul <4 x i32> %broadcast.splat1208, %239
  %596 = add <4 x i32> %595, <i32 1, i32 1, i32 1, i32 1>
  %597 = srem <4 x i32> %596, <i32 2000, i32 2000, i32 2000, i32 2000>
  %598 = sitofp <4 x i32> %597 to <4 x double>
  %599 = fmul fast <4 x double> %598, <double 5.000000e-04, double 5.000000e-04, double 5.000000e-04, double 5.000000e-04>
  %600 = add nuw nsw i64 %241, %264
  %601 = getelementptr i8, i8* %1, i64 %600
  %602 = bitcast i8* %601 to <4 x double>*
  store <4 x double> %599, <4 x double>* %602, align 8, !alias.scope !38, !noalias !45
  br i1 %242, label %polly.loop_exit239, label %vector.body1189.4, !llvm.loop !46

vector.body1189.4:                                ; preds = %vector.body1189.3
  %603 = mul <4 x i32> %broadcast.splat1208, %244
  %604 = add <4 x i32> %603, <i32 1, i32 1, i32 1, i32 1>
  %605 = srem <4 x i32> %604, <i32 2000, i32 2000, i32 2000, i32 2000>
  %606 = sitofp <4 x i32> %605 to <4 x double>
  %607 = fmul fast <4 x double> %606, <double 5.000000e-04, double 5.000000e-04, double 5.000000e-04, double 5.000000e-04>
  %608 = add nuw nsw i64 %246, %264
  %609 = getelementptr i8, i8* %1, i64 %608
  %610 = bitcast i8* %609 to <4 x double>*
  store <4 x double> %607, <4 x double>* %610, align 8, !alias.scope !38, !noalias !45
  br i1 %247, label %polly.loop_exit239, label %vector.body1189.5, !llvm.loop !46

vector.body1189.5:                                ; preds = %vector.body1189.4
  %611 = mul <4 x i32> %broadcast.splat1208, %249
  %612 = add <4 x i32> %611, <i32 1, i32 1, i32 1, i32 1>
  %613 = srem <4 x i32> %612, <i32 2000, i32 2000, i32 2000, i32 2000>
  %614 = sitofp <4 x i32> %613 to <4 x double>
  %615 = fmul fast <4 x double> %614, <double 5.000000e-04, double 5.000000e-04, double 5.000000e-04, double 5.000000e-04>
  %616 = add nuw nsw i64 %251, %264
  %617 = getelementptr i8, i8* %1, i64 %616
  %618 = bitcast i8* %617 to <4 x double>*
  store <4 x double> %615, <4 x double>* %618, align 8, !alias.scope !38, !noalias !45
  br i1 %252, label %polly.loop_exit239, label %vector.body1189.6, !llvm.loop !46

vector.body1189.6:                                ; preds = %vector.body1189.5
  %619 = mul <4 x i32> %broadcast.splat1208, %254
  %620 = add <4 x i32> %619, <i32 1, i32 1, i32 1, i32 1>
  %621 = srem <4 x i32> %620, <i32 2000, i32 2000, i32 2000, i32 2000>
  %622 = sitofp <4 x i32> %621 to <4 x double>
  %623 = fmul fast <4 x double> %622, <double 5.000000e-04, double 5.000000e-04, double 5.000000e-04, double 5.000000e-04>
  %624 = add nuw nsw i64 %256, %264
  %625 = getelementptr i8, i8* %1, i64 %624
  %626 = bitcast i8* %625 to <4 x double>*
  store <4 x double> %623, <4 x double>* %626, align 8, !alias.scope !38, !noalias !45
  br i1 %257, label %polly.loop_exit239, label %vector.body1189.7, !llvm.loop !46

vector.body1189.7:                                ; preds = %vector.body1189.6
  %627 = mul <4 x i32> %broadcast.splat1208, %259
  %628 = add <4 x i32> %627, <i32 1, i32 1, i32 1, i32 1>
  %629 = srem <4 x i32> %628, <i32 2000, i32 2000, i32 2000, i32 2000>
  %630 = sitofp <4 x i32> %629 to <4 x double>
  %631 = fmul fast <4 x double> %630, <double 5.000000e-04, double 5.000000e-04, double 5.000000e-04, double 5.000000e-04>
  %632 = add nuw nsw i64 %261, %264
  %633 = getelementptr i8, i8* %1, i64 %632
  %634 = bitcast i8* %633 to <4 x double>*
  store <4 x double> %631, <4 x double>* %634, align 8, !alias.scope !38, !noalias !45
  br label %polly.loop_exit239

vector.body1174.1:                                ; preds = %vector.ph1178
  %635 = mul <4 x i32> %155, %broadcast.splat1188
  %636 = srem <4 x i32> %635, <i32 2300, i32 2300, i32 2300, i32 2300>
  %637 = sitofp <4 x i32> %636 to <4 x double>
  %638 = fmul fast <4 x double> %637, <double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95>
  %639 = add nuw nsw i64 %157, %196
  %640 = getelementptr i8, i8* %5, i64 %639
  %641 = bitcast i8* %640 to <4 x double>*
  store <4 x double> %638, <4 x double>* %641, align 8, !alias.scope !35, !noalias !37
  br i1 %158, label %polly.loop_exit214, label %vector.body1174.2, !llvm.loop !42

vector.body1174.2:                                ; preds = %vector.body1174.1
  %642 = mul <4 x i32> %161, %broadcast.splat1188
  %643 = srem <4 x i32> %642, <i32 2300, i32 2300, i32 2300, i32 2300>
  %644 = sitofp <4 x i32> %643 to <4 x double>
  %645 = fmul fast <4 x double> %644, <double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95>
  %646 = add nuw nsw i64 %163, %196
  %647 = getelementptr i8, i8* %5, i64 %646
  %648 = bitcast i8* %647 to <4 x double>*
  store <4 x double> %645, <4 x double>* %648, align 8, !alias.scope !35, !noalias !37
  br i1 %164, label %polly.loop_exit214, label %vector.body1174.3, !llvm.loop !42

vector.body1174.3:                                ; preds = %vector.body1174.2
  %649 = mul <4 x i32> %167, %broadcast.splat1188
  %650 = srem <4 x i32> %649, <i32 2300, i32 2300, i32 2300, i32 2300>
  %651 = sitofp <4 x i32> %650 to <4 x double>
  %652 = fmul fast <4 x double> %651, <double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95>
  %653 = add nuw nsw i64 %169, %196
  %654 = getelementptr i8, i8* %5, i64 %653
  %655 = bitcast i8* %654 to <4 x double>*
  store <4 x double> %652, <4 x double>* %655, align 8, !alias.scope !35, !noalias !37
  br i1 %170, label %polly.loop_exit214, label %vector.body1174.4, !llvm.loop !42

vector.body1174.4:                                ; preds = %vector.body1174.3
  %656 = mul <4 x i32> %173, %broadcast.splat1188
  %657 = srem <4 x i32> %656, <i32 2300, i32 2300, i32 2300, i32 2300>
  %658 = sitofp <4 x i32> %657 to <4 x double>
  %659 = fmul fast <4 x double> %658, <double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95>
  %660 = add nuw nsw i64 %175, %196
  %661 = getelementptr i8, i8* %5, i64 %660
  %662 = bitcast i8* %661 to <4 x double>*
  store <4 x double> %659, <4 x double>* %662, align 8, !alias.scope !35, !noalias !37
  br i1 %176, label %polly.loop_exit214, label %vector.body1174.5, !llvm.loop !42

vector.body1174.5:                                ; preds = %vector.body1174.4
  %663 = mul <4 x i32> %179, %broadcast.splat1188
  %664 = srem <4 x i32> %663, <i32 2300, i32 2300, i32 2300, i32 2300>
  %665 = sitofp <4 x i32> %664 to <4 x double>
  %666 = fmul fast <4 x double> %665, <double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95>
  %667 = add nuw nsw i64 %181, %196
  %668 = getelementptr i8, i8* %5, i64 %667
  %669 = bitcast i8* %668 to <4 x double>*
  store <4 x double> %666, <4 x double>* %669, align 8, !alias.scope !35, !noalias !37
  br i1 %182, label %polly.loop_exit214, label %vector.body1174.6, !llvm.loop !42

vector.body1174.6:                                ; preds = %vector.body1174.5
  %670 = mul <4 x i32> %185, %broadcast.splat1188
  %671 = srem <4 x i32> %670, <i32 2300, i32 2300, i32 2300, i32 2300>
  %672 = sitofp <4 x i32> %671 to <4 x double>
  %673 = fmul fast <4 x double> %672, <double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95>
  %674 = add nuw nsw i64 %187, %196
  %675 = getelementptr i8, i8* %5, i64 %674
  %676 = bitcast i8* %675 to <4 x double>*
  store <4 x double> %673, <4 x double>* %676, align 8, !alias.scope !35, !noalias !37
  br i1 %188, label %polly.loop_exit214, label %vector.body1174.7, !llvm.loop !42

vector.body1174.7:                                ; preds = %vector.body1174.6
  %677 = mul <4 x i32> %191, %broadcast.splat1188
  %678 = srem <4 x i32> %677, <i32 2300, i32 2300, i32 2300, i32 2300>
  %679 = sitofp <4 x i32> %678 to <4 x double>
  %680 = fmul fast <4 x double> %679, <double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95>
  %681 = add nuw nsw i64 %193, %196
  %682 = getelementptr i8, i8* %5, i64 %681
  %683 = bitcast i8* %682 to <4 x double>*
  store <4 x double> %680, <4 x double>* %683, align 8, !alias.scope !35, !noalias !37
  br label %polly.loop_exit214

vector.body1155.1:                                ; preds = %vector.body1155
  %684 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay, i64 %indvars.iv63, i64 %index.next1161
  %685 = bitcast double* %684 to <4 x double>*
  %wide.load1170.1 = load <4 x double>, <4 x double>* %685, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %686 = getelementptr double, double* %684, i64 4
  %687 = bitcast double* %686 to <4 x double>*
  %wide.load1171.1 = load <4 x double>, <4 x double>* %687, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %688 = getelementptr double, double* %684, i64 8
  %689 = bitcast double* %688 to <4 x double>*
  %wide.load1172.1 = load <4 x double>, <4 x double>* %689, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %690 = getelementptr double, double* %684, i64 12
  %691 = bitcast double* %690 to <4 x double>*
  %wide.load1173.1 = load <4 x double>, <4 x double>* %691, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %692 = fmul fast <4 x double> %wide.load1170.1, <double 1.200000e+00, double 1.200000e+00, double 1.200000e+00, double 1.200000e+00>
  %693 = fmul fast <4 x double> %wide.load1171.1, <double 1.200000e+00, double 1.200000e+00, double 1.200000e+00, double 1.200000e+00>
  %694 = fmul fast <4 x double> %wide.load1172.1, <double 1.200000e+00, double 1.200000e+00, double 1.200000e+00, double 1.200000e+00>
  %695 = fmul fast <4 x double> %wide.load1173.1, <double 1.200000e+00, double 1.200000e+00, double 1.200000e+00, double 1.200000e+00>
  %696 = bitcast double* %684 to <4 x double>*
  store <4 x double> %692, <4 x double>* %696, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %697 = bitcast double* %686 to <4 x double>*
  store <4 x double> %693, <4 x double>* %697, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %698 = bitcast double* %688 to <4 x double>*
  store <4 x double> %694, <4 x double>* %698, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %699 = bitcast double* %690 to <4 x double>*
  store <4 x double> %695, <4 x double>* %699, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %index.next1161.1 = add nsw i64 %index1160, 32
  br label %vector.body1155

vector.body1132.1:                                ; preds = %vector.body1132
  %700 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay4, i64 %indvars.iv60, i64 %index.next1138
  %701 = bitcast double* %700 to <4 x double>*
  %wide.load.1 = load <4 x double>, <4 x double>* %701, align 8, !tbaa !6, !alias.scope !32, !noalias !33
  %702 = getelementptr double, double* %700, i64 4
  %703 = bitcast double* %702 to <4 x double>*
  %wide.load1146.1 = load <4 x double>, <4 x double>* %703, align 8, !tbaa !6, !alias.scope !32, !noalias !33
  %704 = getelementptr double, double* %700, i64 8
  %705 = bitcast double* %704 to <4 x double>*
  %wide.load1147.1 = load <4 x double>, <4 x double>* %705, align 8, !tbaa !6, !alias.scope !32, !noalias !33
  %706 = getelementptr double, double* %700, i64 12
  %707 = bitcast double* %706 to <4 x double>*
  %wide.load1148.1 = load <4 x double>, <4 x double>* %707, align 8, !tbaa !6, !alias.scope !32, !noalias !33
  %708 = fmul fast <4 x double> %broadcast.splat1150, %wide.load.1
  %709 = fmul fast <4 x double> %broadcast.splat1150, %wide.load1146.1
  %710 = fmul fast <4 x double> %broadcast.splat1150, %wide.load1147.1
  %711 = fmul fast <4 x double> %broadcast.splat1150, %wide.load1148.1
  %712 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay, i64 %indvars.iv63, i64 %index.next1138
  %713 = bitcast double* %712 to <4 x double>*
  %wide.load1151.1 = load <4 x double>, <4 x double>* %713, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %714 = getelementptr double, double* %712, i64 4
  %715 = bitcast double* %714 to <4 x double>*
  %wide.load1152.1 = load <4 x double>, <4 x double>* %715, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %716 = getelementptr double, double* %712, i64 8
  %717 = bitcast double* %716 to <4 x double>*
  %wide.load1153.1 = load <4 x double>, <4 x double>* %717, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %718 = getelementptr double, double* %712, i64 12
  %719 = bitcast double* %718 to <4 x double>*
  %wide.load1154.1 = load <4 x double>, <4 x double>* %719, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %720 = fadd fast <4 x double> %wide.load1151.1, %708
  %721 = fadd fast <4 x double> %wide.load1152.1, %709
  %722 = fadd fast <4 x double> %wide.load1153.1, %710
  %723 = fadd fast <4 x double> %wide.load1154.1, %711
  %724 = bitcast double* %712 to <4 x double>*
  store <4 x double> %720, <4 x double>* %724, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %725 = bitcast double* %714 to <4 x double>*
  store <4 x double> %721, <4 x double>* %725, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %726 = bitcast double* %716 to <4 x double>*
  store <4 x double> %722, <4 x double>* %726, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %727 = bitcast double* %718 to <4 x double>*
  store <4 x double> %723, <4 x double>* %727, align 8, !tbaa !6, !alias.scope !23, !noalias !26
  %index.next1138.1 = add nsw i64 %index1137, 32
  br label %vector.body1132

vector.body1119.1:                                ; preds = %vector.body1119
  %728 = add <4 x i64> %vec.ind1128, <i64 6, i64 6, i64 6, i64 6>
  %729 = mul nuw nsw <4 x i64> %728, %broadcast.splat1131
  %730 = trunc <4 x i64> %729 to <4 x i32>
  %731 = srem <4 x i32> %730, <i32 2300, i32 2300, i32 2300, i32 2300>
  %732 = sitofp <4 x i32> %731 to <4 x double>
  %733 = fmul fast <4 x double> %732, <double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95>
  %734 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay4, i64 %indvars.iv71, i64 %index.next1125
  %735 = bitcast double* %734 to <4 x double>*
  store <4 x double> %733, <4 x double>* %735, align 8, !tbaa !6, !alias.scope !20, !noalias !21
  %index.next1125.1 = add nsw i64 %index1124, 8
  %vec.ind.next1129.1 = add <4 x i64> %vec.ind1128, <i64 8, i64 8, i64 8, i64 8>
  br label %vector.body1119

vector.body.1:                                    ; preds = %vector.body
  %vec.ind.next = add <4 x i64> %vec.ind, <i64 4, i64 4, i64 4, i64 4>
  %736 = mul nuw nsw <4 x i64> %vec.ind.next, %broadcast.splat
  %737 = add nuw nsw <4 x i64> %736, <i64 1, i64 1, i64 1, i64 1>
  %738 = trunc <4 x i64> %737 to <4 x i32>
  %739 = srem <4 x i32> %738, <i32 2000, i32 2000, i32 2000, i32 2000>
  %740 = sitofp <4 x i32> %739 to <4 x double>
  %741 = fmul fast <4 x double> %740, <double 5.000000e-04, double 5.000000e-04, double 5.000000e-04, double 5.000000e-04>
  %742 = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay, i64 %indvars.iv86, i64 %index.next
  %743 = bitcast double* %742 to <4 x double>*
  store <4 x double> %741, <4 x double>* %743, align 8, !tbaa !6, !alias.scope !8, !noalias !11
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
!37 = !{!38, !39, !40, !41}
!38 = distinct !{!38, !36, !"polly.alias.scope.MemRef0"}
!39 = distinct !{!39, !36, !"polly.alias.scope.MemRef1"}
!40 = distinct !{!40, !36, !"polly.alias.scope.Packed_B"}
!41 = distinct !{!41, !36, !"polly.alias.scope.Packed_A"}
!42 = distinct !{!42, !15, !16}
!43 = distinct !{!43, !44, !15, !16}
!44 = !{!"llvm.loop.unroll.runtime.disable"}
!45 = !{!39, !35, !40, !41}
!46 = distinct !{!46, !15, !16}
!47 = distinct !{!47, !44, !15, !16}
!48 = distinct !{!48, !15, !16}
!49 = distinct !{!49, !44, !15, !16}
!50 = !{!38, !35, !40, !41}
!51 = distinct !{!51, !15, !16}
!52 = distinct !{!52, !44, !15, !16}
!53 = !{!38, !39, !35, !41}
!54 = !{!38, !39, !35, !40}
!55 = !{!56, !38, !"second level alias metadata", !57, !58, !59}
!56 = distinct !{!56, !38, !"second level alias metadata"}
!57 = distinct !{!57, !38, !"second level alias metadata"}
!58 = distinct !{!58, !38, !"second level alias metadata"}
!59 = distinct !{!59, !38, !"second level alias metadata"}
!60 = !{!61, !38, !"second level alias metadata", !62, !63, !64}
!61 = distinct !{!61, !38, !"second level alias metadata"}
!62 = distinct !{!62, !38, !"second level alias metadata"}
!63 = distinct !{!63, !38, !"second level alias metadata"}
!64 = distinct !{!64, !38, !"second level alias metadata"}
!65 = !{!39, !35, !40, !41, !56, !57, !58, !59, !66, !67, !68, !69}
!66 = distinct !{!66, !38, !"second level alias metadata"}
!67 = distinct !{!67, !38, !"second level alias metadata"}
!68 = distinct !{!68, !38, !"second level alias metadata"}
!69 = distinct !{!69, !38, !"second level alias metadata"}
!70 = !{!71, !38, !"second level alias metadata", !72, !73, !74}
!71 = distinct !{!71, !38, !"second level alias metadata"}
!72 = distinct !{!72, !38, !"second level alias metadata"}
!73 = distinct !{!73, !38, !"second level alias metadata"}
!74 = distinct !{!74, !38, !"second level alias metadata"}
!75 = !{!39, !35, !40, !41, !56, !57, !58, !59, !66, !67, !68, !69, !61, !62, !63, !64, !76, !77, !78, !79}
!76 = distinct !{!76, !38, !"second level alias metadata"}
!77 = distinct !{!77, !38, !"second level alias metadata"}
!78 = distinct !{!78, !38, !"second level alias metadata"}
!79 = distinct !{!79, !38, !"second level alias metadata"}
!80 = !{!81, !38, !"second level alias metadata", !82, !83, !84}
!81 = distinct !{!81, !38, !"second level alias metadata"}
!82 = distinct !{!82, !38, !"second level alias metadata"}
!83 = distinct !{!83, !38, !"second level alias metadata"}
!84 = distinct !{!84, !38, !"second level alias metadata"}
!85 = !{!39, !35, !40, !41, !56, !57, !58, !59, !66, !67, !68, !69, !61, !62, !63, !64, !76, !77, !78, !79, !71, !72, !73, !74, !86, !87, !88, !89}
!86 = distinct !{!86, !38, !"second level alias metadata"}
!87 = distinct !{!87, !38, !"second level alias metadata"}
!88 = distinct !{!88, !38, !"second level alias metadata"}
!89 = distinct !{!89, !38, !"second level alias metadata"}
!90 = !{!66, !38, !"second level alias metadata", !67, !68, !69}
!91 = !{!39, !35, !40, !41, !56, !57, !58, !59}
!92 = !{!76, !38, !"second level alias metadata", !77, !78, !79}
!93 = !{!39, !35, !40, !41, !56, !57, !58, !59, !66, !67, !68, !69, !61, !62, !63, !64}
!94 = !{!86, !38, !"second level alias metadata", !87, !88, !89}
!95 = !{!39, !35, !40, !41, !56, !57, !58, !59, !66, !67, !68, !69, !61, !62, !63, !64, !76, !77, !78, !79, !71, !72, !73, !74}
!96 = !{!97, !38, !"second level alias metadata", !98, !99, !100}
!97 = distinct !{!97, !38, !"second level alias metadata"}
!98 = distinct !{!98, !38, !"second level alias metadata"}
!99 = distinct !{!99, !38, !"second level alias metadata"}
!100 = distinct !{!100, !38, !"second level alias metadata"}
!101 = !{!39, !35, !40, !41, !56, !57, !58, !59, !66, !67, !68, !69, !61, !62, !63, !64, !76, !77, !78, !79, !71, !72, !73, !74, !86, !87, !88, !89, !81, !82, !83, !84}
