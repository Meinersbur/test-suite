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
  %Packed_B = alloca [256 x [256 x [8 x double]]], align 64
  %Packed_A = alloca [24 x [256 x [4 x double]]], align 64
  br label %polly.loop_header

polly.exiting:                                    ; preds = %polly.loop_exit117
  ret void

polly.loop_header:                                ; preds = %polly.loop_exit14, %entry
  %polly.indvar = phi i64 [ 0, %entry ], [ %polly.indvar_next, %polly.loop_exit14 ]
  %0 = mul nsw i64 %polly.indvar, -32
  %1 = add nsw i64 %0, 1999
  %2 = icmp slt i64 %1, 31
  %3 = select i1 %2, i64 %1, i64 31
  %4 = shl nsw i64 %polly.indvar, 5
  br label %polly.loop_header12

polly.loop_exit14:                                ; preds = %polly.loop_exit20
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond900 = icmp eq i64 %polly.indvar_next, 63
  br i1 %exitcond900, label %polly.loop_header31, label %polly.loop_header

polly.loop_header12:                              ; preds = %polly.loop_exit20, %polly.loop_header
  %polly.indvar15 = phi i64 [ 0, %polly.loop_header ], [ %polly.indvar_next16, %polly.loop_exit20 ]
  %5 = shl i64 %polly.indvar15, 5
  %6 = add i64 %5, -2600
  %7 = icmp sgt i64 %6, -32
  %smax = select i1 %7, i64 %6, i64 -32
  %8 = sub i64 0, %smax
  %9 = mul nsw i64 %polly.indvar15, -32
  %10 = add nsw i64 %9, 2599
  %11 = icmp slt i64 %10, 31
  %12 = select i1 %11, i64 %10, i64 31
  %13 = shl nsw i64 %polly.indvar15, 5
  %min.iters.check = icmp ult i64 %8, 4
  %broadcast.splatinsert = insertelement <4 x i64> undef, i64 %13, i32 0
  %broadcast.splat = shufflevector <4 x i64> %broadcast.splatinsert, <4 x i64> undef, <4 x i32> zeroinitializer
  %14 = add nuw nsw <4 x i64> %broadcast.splat, <i64 0, i64 1, i64 2, i64 3>
  %15 = trunc <4 x i64> %14 to <4 x i32>
  %16 = add <4 x i32> %15, <i32 1, i32 1, i32 1, i32 1>
  %17 = shl i64 %polly.indvar15, 8
  %18 = add nuw nsw <4 x i64> %broadcast.splat, <i64 4, i64 5, i64 6, i64 7>
  %19 = trunc <4 x i64> %18 to <4 x i32>
  %20 = add <4 x i32> %19, <i32 1, i32 1, i32 1, i32 1>
  %21 = extractelement <4 x i64> %18, i32 0
  %22 = shl i64 %21, 3
  %23 = icmp eq i64 %8, 8
  %24 = add nuw nsw <4 x i64> %broadcast.splat, <i64 8, i64 9, i64 10, i64 11>
  %25 = trunc <4 x i64> %24 to <4 x i32>
  %26 = add <4 x i32> %25, <i32 1, i32 1, i32 1, i32 1>
  %27 = extractelement <4 x i64> %24, i32 0
  %28 = shl i64 %27, 3
  %29 = add nuw nsw <4 x i64> %broadcast.splat, <i64 12, i64 13, i64 14, i64 15>
  %30 = trunc <4 x i64> %29 to <4 x i32>
  %31 = add <4 x i32> %30, <i32 1, i32 1, i32 1, i32 1>
  %32 = extractelement <4 x i64> %29, i32 0
  %33 = shl i64 %32, 3
  %34 = icmp eq i64 %8, 16
  %35 = add nuw nsw <4 x i64> %broadcast.splat, <i64 16, i64 17, i64 18, i64 19>
  %36 = trunc <4 x i64> %35 to <4 x i32>
  %37 = add <4 x i32> %36, <i32 1, i32 1, i32 1, i32 1>
  %38 = extractelement <4 x i64> %35, i32 0
  %39 = shl i64 %38, 3
  %40 = add nuw nsw <4 x i64> %broadcast.splat, <i64 20, i64 21, i64 22, i64 23>
  %41 = trunc <4 x i64> %40 to <4 x i32>
  %42 = add <4 x i32> %41, <i32 1, i32 1, i32 1, i32 1>
  %43 = extractelement <4 x i64> %40, i32 0
  %44 = shl i64 %43, 3
  %45 = icmp eq i64 %8, 24
  %46 = add nuw nsw <4 x i64> %broadcast.splat, <i64 24, i64 25, i64 26, i64 27>
  %47 = trunc <4 x i64> %46 to <4 x i32>
  %48 = add <4 x i32> %47, <i32 1, i32 1, i32 1, i32 1>
  %49 = extractelement <4 x i64> %46, i32 0
  %50 = shl i64 %49, 3
  %51 = add nuw nsw <4 x i64> %broadcast.splat, <i64 28, i64 29, i64 30, i64 31>
  %52 = trunc <4 x i64> %51 to <4 x i32>
  %53 = add <4 x i32> %52, <i32 1, i32 1, i32 1, i32 1>
  %54 = extractelement <4 x i64> %51, i32 0
  %55 = shl i64 %54, 3
  br label %polly.loop_header18

polly.loop_exit20:                                ; preds = %polly.loop_exit26
  %polly.indvar_next16 = add nuw nsw i64 %polly.indvar15, 1
  %exitcond899 = icmp eq i64 %polly.indvar_next16, 82
  br i1 %exitcond899, label %polly.loop_exit14, label %polly.loop_header12

polly.loop_header18:                              ; preds = %polly.loop_exit26, %polly.loop_header12
  %polly.indvar21 = phi i64 [ 0, %polly.loop_header12 ], [ %polly.indvar_next22, %polly.loop_exit26 ]
  %56 = add nuw nsw i64 %polly.indvar21, %4
  %57 = trunc i64 %56 to i32
  %58 = mul nuw nsw i64 %56, 20800
  br i1 %min.iters.check, label %polly.loop_header24, label %vector.ph

vector.ph:                                        ; preds = %polly.loop_header18
  %broadcast.splatinsert904 = insertelement <4 x i32> undef, i32 %57, i32 0
  %broadcast.splat905 = shufflevector <4 x i32> %broadcast.splatinsert904, <4 x i32> undef, <4 x i32> zeroinitializer
  %59 = mul <4 x i32> %16, %broadcast.splat905
  %60 = srem <4 x i32> %59, <i32 2600, i32 2600, i32 2600, i32 2600>
  %61 = sitofp <4 x i32> %60 to <4 x double>
  %62 = fmul fast <4 x double> %61, <double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6>
  %63 = add nuw nsw i64 %17, %58
  %64 = getelementptr i8, i8* %AA, i64 %63
  %65 = bitcast i8* %64 to <4 x double>*
  store <4 x double> %62, <4 x double>* %65, align 8, !alias.scope !6, !noalias !8
  %66 = mul <4 x i32> %20, %broadcast.splat905
  %67 = srem <4 x i32> %66, <i32 2600, i32 2600, i32 2600, i32 2600>
  %68 = sitofp <4 x i32> %67 to <4 x double>
  %69 = fmul fast <4 x double> %68, <double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6>
  %70 = add nuw nsw i64 %22, %58
  %71 = getelementptr i8, i8* %AA, i64 %70
  %72 = bitcast i8* %71 to <4 x double>*
  store <4 x double> %69, <4 x double>* %72, align 8, !alias.scope !6, !noalias !8
  br i1 %23, label %polly.loop_exit26, label %vector.body.2, !llvm.loop !13

polly.loop_exit26:                                ; preds = %vector.ph, %vector.body.2, %vector.body.4, %vector.body.6, %polly.loop_header24
  %polly.indvar_next22 = add nuw nsw i64 %polly.indvar21, 1
  %polly.loop_cond23 = icmp slt i64 %polly.indvar21, %3
  br i1 %polly.loop_cond23, label %polly.loop_header18, label %polly.loop_exit20

polly.loop_header24:                              ; preds = %polly.loop_header18, %polly.loop_header24
  %polly.indvar27 = phi i64 [ %polly.indvar_next28, %polly.loop_header24 ], [ 0, %polly.loop_header18 ]
  %73 = add nuw nsw i64 %polly.indvar27, %13
  %74 = trunc i64 %73 to i32
  %75 = add i32 %74, 1
  %76 = mul i32 %75, %57
  %p_rem20 = srem i32 %76, 2600
  %p_conv21 = sitofp i32 %p_rem20 to double
  %p_div23 = fmul fast double %p_conv21, 0x3F3934C67F9B2CE6
  %77 = shl i64 %73, 3
  %78 = add nuw nsw i64 %77, %58
  %scevgep = getelementptr i8, i8* %AA, i64 %78
  %scevgep30 = bitcast i8* %scevgep to double*
  store double %p_div23, double* %scevgep30, align 8, !alias.scope !6, !noalias !8
  %polly.indvar_next28 = add nuw nsw i64 %polly.indvar27, 1
  %polly.loop_cond29 = icmp slt i64 %polly.indvar27, %12
  br i1 %polly.loop_cond29, label %polly.loop_header24, label %polly.loop_exit26, !llvm.loop !16

polly.loop_header31:                              ; preds = %polly.loop_exit14, %polly.loop_exit39
  %polly.indvar34 = phi i64 [ %polly.indvar_next35, %polly.loop_exit39 ], [ 0, %polly.loop_exit14 ]
  %79 = mul nsw i64 %polly.indvar34, -32
  %80 = add nsw i64 %79, 1999
  %81 = icmp slt i64 %80, 31
  %82 = select i1 %81, i64 %80, i64 31
  %83 = shl nsw i64 %polly.indvar34, 5
  br label %polly.loop_header37

polly.loop_exit39:                                ; preds = %polly.loop_exit45
  %polly.indvar_next35 = add nuw nsw i64 %polly.indvar34, 1
  %exitcond898 = icmp eq i64 %polly.indvar_next35, 63
  br i1 %exitcond898, label %polly.loop_header57, label %polly.loop_header31

polly.loop_header37:                              ; preds = %polly.loop_exit45, %polly.loop_header31
  %polly.indvar40 = phi i64 [ 0, %polly.loop_header31 ], [ %polly.indvar_next41, %polly.loop_exit45 ]
  %84 = shl i64 %polly.indvar40, 5
  %85 = add i64 %84, -2300
  %86 = icmp sgt i64 %85, -32
  %smax909 = select i1 %86, i64 %85, i64 -32
  %87 = sub i64 0, %smax909
  %88 = mul nsw i64 %polly.indvar40, -32
  %89 = add nsw i64 %88, 2299
  %90 = icmp slt i64 %89, 31
  %91 = select i1 %90, i64 %89, i64 31
  %92 = shl nsw i64 %polly.indvar40, 5
  %min.iters.check910 = icmp ult i64 %87, 4
  %broadcast.splatinsert922 = insertelement <4 x i64> undef, i64 %92, i32 0
  %broadcast.splat923 = shufflevector <4 x i64> %broadcast.splatinsert922, <4 x i64> undef, <4 x i32> zeroinitializer
  %93 = add nuw nsw <4 x i64> %broadcast.splat923, <i64 0, i64 1, i64 2, i64 3>
  %94 = trunc <4 x i64> %93 to <4 x i32>
  %95 = shl i64 %polly.indvar40, 8
  %96 = icmp eq i64 %87, 4
  %97 = add nuw nsw <4 x i64> %broadcast.splat923, <i64 4, i64 5, i64 6, i64 7>
  %98 = trunc <4 x i64> %97 to <4 x i32>
  %99 = extractelement <4 x i64> %97, i32 0
  %100 = shl i64 %99, 3
  %101 = icmp eq i64 %87, 8
  %102 = add nuw nsw <4 x i64> %broadcast.splat923, <i64 8, i64 9, i64 10, i64 11>
  %103 = trunc <4 x i64> %102 to <4 x i32>
  %104 = extractelement <4 x i64> %102, i32 0
  %105 = shl i64 %104, 3
  %106 = icmp eq i64 %87, 12
  %107 = add nuw nsw <4 x i64> %broadcast.splat923, <i64 12, i64 13, i64 14, i64 15>
  %108 = trunc <4 x i64> %107 to <4 x i32>
  %109 = extractelement <4 x i64> %107, i32 0
  %110 = shl i64 %109, 3
  %111 = icmp eq i64 %87, 16
  %112 = add nuw nsw <4 x i64> %broadcast.splat923, <i64 16, i64 17, i64 18, i64 19>
  %113 = trunc <4 x i64> %112 to <4 x i32>
  %114 = extractelement <4 x i64> %112, i32 0
  %115 = shl i64 %114, 3
  %116 = icmp eq i64 %87, 20
  %117 = add nuw nsw <4 x i64> %broadcast.splat923, <i64 20, i64 21, i64 22, i64 23>
  %118 = trunc <4 x i64> %117 to <4 x i32>
  %119 = extractelement <4 x i64> %117, i32 0
  %120 = shl i64 %119, 3
  %121 = icmp eq i64 %87, 24
  %122 = add nuw nsw <4 x i64> %broadcast.splat923, <i64 24, i64 25, i64 26, i64 27>
  %123 = trunc <4 x i64> %122 to <4 x i32>
  %124 = extractelement <4 x i64> %122, i32 0
  %125 = shl i64 %124, 3
  %126 = icmp eq i64 %87, 28
  %127 = add nuw nsw <4 x i64> %broadcast.splat923, <i64 28, i64 29, i64 30, i64 31>
  %128 = trunc <4 x i64> %127 to <4 x i32>
  %129 = extractelement <4 x i64> %127, i32 0
  %130 = shl i64 %129, 3
  br label %polly.loop_header43

polly.loop_exit45:                                ; preds = %polly.loop_exit51
  %polly.indvar_next41 = add nuw nsw i64 %polly.indvar40, 1
  %exitcond897 = icmp eq i64 %polly.indvar_next41, 72
  br i1 %exitcond897, label %polly.loop_exit39, label %polly.loop_header37

polly.loop_header43:                              ; preds = %polly.loop_exit51, %polly.loop_header37
  %polly.indvar46 = phi i64 [ 0, %polly.loop_header37 ], [ %polly.indvar_next47, %polly.loop_exit51 ]
  %131 = add nuw nsw i64 %polly.indvar46, %83
  %132 = trunc i64 %131 to i32
  %133 = mul nuw nsw i64 %131, 18400
  br i1 %min.iters.check910, label %polly.loop_header49, label %vector.ph915

vector.ph915:                                     ; preds = %polly.loop_header43
  %broadcast.splatinsert924 = insertelement <4 x i32> undef, i32 %132, i32 0
  %broadcast.splat925 = shufflevector <4 x i32> %broadcast.splatinsert924, <4 x i32> undef, <4 x i32> zeroinitializer
  %134 = mul <4 x i32> %broadcast.splat925, %94
  %135 = add <4 x i32> %134, <i32 1, i32 1, i32 1, i32 1>
  %136 = srem <4 x i32> %135, <i32 2000, i32 2000, i32 2000, i32 2000>
  %137 = sitofp <4 x i32> %136 to <4 x double>
  %138 = fmul fast <4 x double> %137, <double 5.000000e-04, double 5.000000e-04, double 5.000000e-04, double 5.000000e-04>
  %139 = add nuw nsw i64 %95, %133
  %140 = getelementptr i8, i8* %CC, i64 %139
  %141 = bitcast i8* %140 to <4 x double>*
  store <4 x double> %138, <4 x double>* %141, align 8, !alias.scope !11, !noalias !18
  br i1 %96, label %polly.loop_exit51, label %vector.body906.1, !llvm.loop !19

polly.loop_exit51:                                ; preds = %vector.ph915, %vector.body906.1, %vector.body906.2, %vector.body906.3, %vector.body906.4, %vector.body906.5, %vector.body906.6, %vector.body906.7, %polly.loop_header49
  %polly.indvar_next47 = add nuw nsw i64 %polly.indvar46, 1
  %polly.loop_cond48 = icmp slt i64 %polly.indvar46, %82
  br i1 %polly.loop_cond48, label %polly.loop_header43, label %polly.loop_exit45

polly.loop_header49:                              ; preds = %polly.loop_header43, %polly.loop_header49
  %polly.indvar52 = phi i64 [ %polly.indvar_next53, %polly.loop_header49 ], [ 0, %polly.loop_header43 ]
  %142 = add nuw nsw i64 %polly.indvar52, %92
  %143 = trunc i64 %142 to i32
  %144 = mul i32 %143, %132
  %145 = add i32 %144, 1
  %p_rem = srem i32 %145, 2000
  %p_conv = sitofp i32 %p_rem to double
  %p_div = fmul fast double %p_conv, 5.000000e-04
  %146 = shl i64 %142, 3
  %147 = add nuw nsw i64 %146, %133
  %scevgep55 = getelementptr i8, i8* %CC, i64 %147
  %scevgep5556 = bitcast i8* %scevgep55 to double*
  store double %p_div, double* %scevgep5556, align 8, !alias.scope !11, !noalias !18
  %polly.indvar_next53 = add nuw nsw i64 %polly.indvar52, 1
  %polly.loop_cond54 = icmp slt i64 %polly.indvar52, %91
  br i1 %polly.loop_cond54, label %polly.loop_header49, label %polly.loop_exit51, !llvm.loop !20

polly.loop_header57:                              ; preds = %polly.loop_exit39, %polly.loop_exit65
  %polly.indvar60 = phi i64 [ %polly.indvar_next61, %polly.loop_exit65 ], [ 0, %polly.loop_exit39 ]
  %148 = mul nsw i64 %polly.indvar60, -32
  %149 = add nsw i64 %148, 2599
  %150 = icmp slt i64 %149, 31
  %151 = select i1 %150, i64 %149, i64 31
  %152 = shl nsw i64 %polly.indvar60, 5
  br label %polly.loop_header63

polly.loop_exit65:                                ; preds = %polly.loop_exit71
  %polly.indvar_next61 = add nuw nsw i64 %polly.indvar60, 1
  %exitcond896 = icmp eq i64 %polly.indvar_next61, 82
  br i1 %exitcond896, label %polly.loop_header83, label %polly.loop_header57

polly.loop_header63:                              ; preds = %polly.loop_exit71, %polly.loop_header57
  %polly.indvar66 = phi i64 [ 0, %polly.loop_header57 ], [ %polly.indvar_next67, %polly.loop_exit71 ]
  %153 = shl i64 %polly.indvar66, 5
  %154 = add i64 %153, -2300
  %155 = icmp sgt i64 %154, -32
  %smax929 = select i1 %155, i64 %154, i64 -32
  %156 = sub i64 0, %smax929
  %157 = mul nsw i64 %polly.indvar66, -32
  %158 = add nsw i64 %157, 2299
  %159 = icmp slt i64 %158, 31
  %160 = select i1 %159, i64 %158, i64 31
  %161 = shl nsw i64 %polly.indvar66, 5
  %min.iters.check930 = icmp ult i64 %156, 4
  %broadcast.splatinsert942 = insertelement <4 x i64> undef, i64 %161, i32 0
  %broadcast.splat943 = shufflevector <4 x i64> %broadcast.splatinsert942, <4 x i64> undef, <4 x i32> zeroinitializer
  %162 = add nuw nsw <4 x i64> %broadcast.splat943, <i64 0, i64 1, i64 2, i64 3>
  %163 = trunc <4 x i64> %162 to <4 x i32>
  %164 = add <4 x i32> %163, <i32 2, i32 2, i32 2, i32 2>
  %165 = shl i64 %polly.indvar66, 8
  %166 = icmp eq i64 %156, 4
  %167 = add nuw nsw <4 x i64> %broadcast.splat943, <i64 4, i64 5, i64 6, i64 7>
  %168 = trunc <4 x i64> %167 to <4 x i32>
  %169 = add <4 x i32> %168, <i32 2, i32 2, i32 2, i32 2>
  %170 = extractelement <4 x i64> %167, i32 0
  %171 = shl i64 %170, 3
  %172 = icmp eq i64 %156, 8
  %173 = add nuw nsw <4 x i64> %broadcast.splat943, <i64 8, i64 9, i64 10, i64 11>
  %174 = trunc <4 x i64> %173 to <4 x i32>
  %175 = add <4 x i32> %174, <i32 2, i32 2, i32 2, i32 2>
  %176 = extractelement <4 x i64> %173, i32 0
  %177 = shl i64 %176, 3
  %178 = icmp eq i64 %156, 12
  %179 = add nuw nsw <4 x i64> %broadcast.splat943, <i64 12, i64 13, i64 14, i64 15>
  %180 = trunc <4 x i64> %179 to <4 x i32>
  %181 = add <4 x i32> %180, <i32 2, i32 2, i32 2, i32 2>
  %182 = extractelement <4 x i64> %179, i32 0
  %183 = shl i64 %182, 3
  %184 = icmp eq i64 %156, 16
  %185 = add nuw nsw <4 x i64> %broadcast.splat943, <i64 16, i64 17, i64 18, i64 19>
  %186 = trunc <4 x i64> %185 to <4 x i32>
  %187 = add <4 x i32> %186, <i32 2, i32 2, i32 2, i32 2>
  %188 = extractelement <4 x i64> %185, i32 0
  %189 = shl i64 %188, 3
  %190 = icmp eq i64 %156, 20
  %191 = add nuw nsw <4 x i64> %broadcast.splat943, <i64 20, i64 21, i64 22, i64 23>
  %192 = trunc <4 x i64> %191 to <4 x i32>
  %193 = add <4 x i32> %192, <i32 2, i32 2, i32 2, i32 2>
  %194 = extractelement <4 x i64> %191, i32 0
  %195 = shl i64 %194, 3
  %196 = icmp eq i64 %156, 24
  %197 = add nuw nsw <4 x i64> %broadcast.splat943, <i64 24, i64 25, i64 26, i64 27>
  %198 = trunc <4 x i64> %197 to <4 x i32>
  %199 = add <4 x i32> %198, <i32 2, i32 2, i32 2, i32 2>
  %200 = extractelement <4 x i64> %197, i32 0
  %201 = shl i64 %200, 3
  %202 = icmp eq i64 %156, 28
  %203 = add nuw nsw <4 x i64> %broadcast.splat943, <i64 28, i64 29, i64 30, i64 31>
  %204 = trunc <4 x i64> %203 to <4 x i32>
  %205 = add <4 x i32> %204, <i32 2, i32 2, i32 2, i32 2>
  %206 = extractelement <4 x i64> %203, i32 0
  %207 = shl i64 %206, 3
  br label %polly.loop_header69

polly.loop_exit71:                                ; preds = %polly.loop_exit77
  %polly.indvar_next67 = add nuw nsw i64 %polly.indvar66, 1
  %exitcond895 = icmp eq i64 %polly.indvar_next67, 72
  br i1 %exitcond895, label %polly.loop_exit65, label %polly.loop_header63

polly.loop_header69:                              ; preds = %polly.loop_exit77, %polly.loop_header63
  %polly.indvar72 = phi i64 [ 0, %polly.loop_header63 ], [ %polly.indvar_next73, %polly.loop_exit77 ]
  %208 = add nuw nsw i64 %polly.indvar72, %152
  %209 = trunc i64 %208 to i32
  %210 = mul nuw nsw i64 %208, 18400
  br i1 %min.iters.check930, label %polly.loop_header75, label %vector.ph935

vector.ph935:                                     ; preds = %polly.loop_header69
  %broadcast.splatinsert944 = insertelement <4 x i32> undef, i32 %209, i32 0
  %broadcast.splat945 = shufflevector <4 x i32> %broadcast.splatinsert944, <4 x i32> undef, <4 x i32> zeroinitializer
  %211 = mul <4 x i32> %164, %broadcast.splat945
  %212 = srem <4 x i32> %211, <i32 2300, i32 2300, i32 2300, i32 2300>
  %213 = sitofp <4 x i32> %212 to <4 x double>
  %214 = fmul fast <4 x double> %213, <double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95>
  %215 = add nuw nsw i64 %165, %210
  %216 = getelementptr i8, i8* %BB, i64 %215
  %217 = bitcast i8* %216 to <4 x double>*
  store <4 x double> %214, <4 x double>* %217, align 8, !alias.scope !10, !noalias !21
  br i1 %166, label %polly.loop_exit77, label %vector.body926.1, !llvm.loop !22

polly.loop_exit77:                                ; preds = %vector.ph935, %vector.body926.1, %vector.body926.2, %vector.body926.3, %vector.body926.4, %vector.body926.5, %vector.body926.6, %vector.body926.7, %polly.loop_header75
  %polly.indvar_next73 = add nuw nsw i64 %polly.indvar72, 1
  %polly.loop_cond74 = icmp slt i64 %polly.indvar72, %151
  br i1 %polly.loop_cond74, label %polly.loop_header69, label %polly.loop_exit71

polly.loop_header75:                              ; preds = %polly.loop_header69, %polly.loop_header75
  %polly.indvar78 = phi i64 [ %polly.indvar_next79, %polly.loop_header75 ], [ 0, %polly.loop_header69 ]
  %218 = add nuw nsw i64 %polly.indvar78, %161
  %219 = trunc i64 %218 to i32
  %220 = add i32 %219, 2
  %221 = mul i32 %220, %209
  %p_rem44 = srem i32 %221, 2300
  %p_conv45 = sitofp i32 %p_rem44 to double
  %p_div47 = fmul fast double %p_conv45, 0x3F3C7E7115D0CE95
  %222 = shl i64 %218, 3
  %223 = add nuw nsw i64 %222, %210
  %scevgep81 = getelementptr i8, i8* %BB, i64 %223
  %scevgep8182 = bitcast i8* %scevgep81 to double*
  store double %p_div47, double* %scevgep8182, align 8, !alias.scope !10, !noalias !21
  %polly.indvar_next79 = add nuw nsw i64 %polly.indvar78, 1
  %polly.loop_cond80 = icmp slt i64 %polly.indvar78, %160
  br i1 %polly.loop_cond80, label %polly.loop_header75, label %polly.loop_exit77, !llvm.loop !23

polly.loop_header83:                              ; preds = %polly.loop_exit65, %polly.loop_exit91
  %polly.indvar86 = phi i64 [ %polly.indvar_next87, %polly.loop_exit91 ], [ 0, %polly.loop_exit65 ]
  %224 = mul nsw i64 %polly.indvar86, -32
  %225 = add nsw i64 %224, 1999
  %226 = icmp slt i64 %225, 31
  %227 = select i1 %226, i64 %225, i64 31
  %228 = shl i64 %polly.indvar86, 5
  br label %polly.loop_header89

polly.loop_exit91:                                ; preds = %polly.loop_exit97
  %polly.indvar_next87 = add nuw nsw i64 %polly.indvar86, 1
  %exitcond894 = icmp eq i64 %polly.indvar_next87, 63
  br i1 %exitcond894, label %polly.loop_header109.preheader, label %polly.loop_header83

polly.loop_header109.preheader:                   ; preds = %polly.loop_exit91
  %polly.access.cast.BB = bitcast i8* %BB to double*
  %polly.access.cast.AA = bitcast i8* %AA to double*
  br label %polly.loop_header109

polly.loop_header89:                              ; preds = %polly.loop_exit97, %polly.loop_header83
  %polly.indvar92 = phi i64 [ 0, %polly.loop_header83 ], [ %polly.indvar_next93, %polly.loop_exit97 ]
  %229 = shl i64 %polly.indvar92, 5
  %230 = add i64 %229, -2300
  %231 = icmp sgt i64 %230, -32
  %smax949 = select i1 %231, i64 %230, i64 -32
  %232 = sub i64 0, %smax949
  %233 = mul nsw i64 %polly.indvar92, -32
  %234 = add nsw i64 %233, 2299
  %235 = icmp slt i64 %234, 31
  %236 = select i1 %235, i64 %234, i64 31
  %237 = shl i64 %polly.indvar92, 5
  %min.iters.check950 = icmp ult i64 %232, 16
  %n.vec953 = and i64 %232, -16
  %cmp.zero954 = icmp eq i64 %n.vec953, 0
  %238 = shl i64 %polly.indvar92, 8
  %239 = icmp eq i64 %n.vec953, 16
  %cmp.n959 = icmp eq i64 %n.vec953, %232
  %240 = shl i64 %polly.indvar92, 8
  %241 = or i64 %240, 128
  br label %polly.loop_header95

polly.loop_exit97:                                ; preds = %polly.loop_exit103
  %polly.indvar_next93 = add nuw nsw i64 %polly.indvar92, 1
  %exitcond893 = icmp eq i64 %polly.indvar_next93, 72
  br i1 %exitcond893, label %polly.loop_exit91, label %polly.loop_header89

polly.loop_header95:                              ; preds = %polly.loop_exit103, %polly.loop_header89
  %polly.indvar98 = phi i64 [ 0, %polly.loop_header89 ], [ %polly.indvar_next99, %polly.loop_exit103 ]
  %242 = add nuw nsw i64 %polly.indvar98, %228
  %243 = mul nuw nsw i64 %242, 18400
  %brmerge = or i1 %min.iters.check950, %cmp.zero954
  br i1 %brmerge, label %polly.loop_header101, label %vector.body946

vector.body946:                                   ; preds = %polly.loop_header95
  %244 = add nuw nsw i64 %238, %243
  %245 = getelementptr i8, i8* %CC, i64 %244
  %246 = bitcast i8* %245 to <4 x double>*
  %wide.load = load <4 x double>, <4 x double>* %246, align 8, !alias.scope !11, !noalias !18
  %247 = getelementptr i8, i8* %245, i64 32
  %248 = bitcast i8* %247 to <4 x double>*
  %wide.load965 = load <4 x double>, <4 x double>* %248, align 8, !alias.scope !11, !noalias !18
  %249 = getelementptr i8, i8* %245, i64 64
  %250 = bitcast i8* %249 to <4 x double>*
  %wide.load966 = load <4 x double>, <4 x double>* %250, align 8, !alias.scope !11, !noalias !18
  %251 = getelementptr i8, i8* %245, i64 96
  %252 = bitcast i8* %251 to <4 x double>*
  %wide.load967 = load <4 x double>, <4 x double>* %252, align 8, !alias.scope !11, !noalias !18
  %253 = fmul fast <4 x double> %wide.load, <double 1.200000e+00, double 1.200000e+00, double 1.200000e+00, double 1.200000e+00>
  %254 = fmul fast <4 x double> %wide.load965, <double 1.200000e+00, double 1.200000e+00, double 1.200000e+00, double 1.200000e+00>
  %255 = fmul fast <4 x double> %wide.load966, <double 1.200000e+00, double 1.200000e+00, double 1.200000e+00, double 1.200000e+00>
  %256 = fmul fast <4 x double> %wide.load967, <double 1.200000e+00, double 1.200000e+00, double 1.200000e+00, double 1.200000e+00>
  %257 = bitcast i8* %245 to <4 x double>*
  store <4 x double> %253, <4 x double>* %257, align 8, !alias.scope !11, !noalias !18
  %258 = bitcast i8* %247 to <4 x double>*
  store <4 x double> %254, <4 x double>* %258, align 8, !alias.scope !11, !noalias !18
  %259 = bitcast i8* %249 to <4 x double>*
  store <4 x double> %255, <4 x double>* %259, align 8, !alias.scope !11, !noalias !18
  %260 = bitcast i8* %251 to <4 x double>*
  store <4 x double> %256, <4 x double>* %260, align 8, !alias.scope !11, !noalias !18
  br i1 %239, label %middle.block947, label %vector.body946.1, !llvm.loop !24

middle.block947:                                  ; preds = %vector.body946.1, %vector.body946
  br i1 %cmp.n959, label %polly.loop_exit103, label %polly.loop_header101

polly.loop_exit103:                               ; preds = %polly.loop_header101, %middle.block947
  %polly.indvar_next99 = add nuw nsw i64 %polly.indvar98, 1
  %polly.loop_cond100 = icmp slt i64 %polly.indvar98, %227
  br i1 %polly.loop_cond100, label %polly.loop_header95, label %polly.loop_exit97

polly.loop_header101:                             ; preds = %polly.loop_header95, %middle.block947, %polly.loop_header101
  %polly.indvar104 = phi i64 [ %polly.indvar_next105, %polly.loop_header101 ], [ 0, %polly.loop_header95 ], [ %n.vec953, %middle.block947 ]
  %261 = add nuw nsw i64 %polly.indvar104, %237
  %262 = shl i64 %261, 3
  %263 = add nuw nsw i64 %262, %243
  %scevgep107 = getelementptr i8, i8* %CC, i64 %263
  %scevgep107108 = bitcast i8* %scevgep107 to double*
  %_p_scalar_ = load double, double* %scevgep107108, align 8, !alias.scope !11, !noalias !18
  %p_mul = fmul fast double %_p_scalar_, 1.200000e+00
  store double %p_mul, double* %scevgep107108, align 8, !alias.scope !11, !noalias !18
  %polly.indvar_next105 = add nuw nsw i64 %polly.indvar104, 1
  %polly.loop_cond106 = icmp slt i64 %polly.indvar104, %236
  br i1 %polly.loop_cond106, label %polly.loop_header101, label %polly.loop_exit103, !llvm.loop !25

polly.loop_header109:                             ; preds = %polly.loop_exit117, %polly.loop_header109.preheader
  %polly.indvar112 = phi i64 [ %polly.indvar_next113, %polly.loop_exit117 ], [ 0, %polly.loop_header109.preheader ]
  %264 = shl nsw i64 %polly.indvar112, 11
  %265 = or i64 %264, 2047
  %266 = icmp slt i64 %265, 2299
  %267 = select i1 %266, i64 %265, i64 2299
  %polly.loop_guard131 = icmp sgt i64 %264, %267
  %268 = mul nuw nsw i64 %polly.indvar112, -256
  %269 = icmp eq i64 %polly.indvar112, 0
  %270 = mul nuw nsw i64 %polly.indvar112, -256
  %271 = add nsw i64 %270, 287
  %272 = icmp slt i64 %271, 255
  %273 = select i1 %272, i64 %271, i64 255
  %274 = shl nsw i64 %polly.indvar112, 11
  %275 = shl i64 %polly.indvar112, 8
  br label %polly.loop_header115

polly.loop_exit117:                               ; preds = %polly.loop_exit139
  %polly.indvar_next113 = add nuw nsw i64 %polly.indvar112, 1
  %exitcond892 = icmp eq i64 %polly.indvar_next113, 2
  br i1 %exitcond892, label %polly.exiting, label %polly.loop_header109

polly.loop_header115:                             ; preds = %polly.loop_exit139, %polly.loop_header109
  %polly.indvar118 = phi i64 [ 0, %polly.loop_header109 ], [ %polly.indvar_next119, %polly.loop_exit139 ]
  %276 = shl nsw i64 %polly.indvar118, 8
  %277 = or i64 %276, 255
  %278 = icmp slt i64 %277, 2599
  %279 = select i1 %278, i64 %277, i64 2599
  %polly.loop_guard = icmp sle i64 %276, %279
  br i1 %polly.loop_guard, label %polly.loop_header121.preheader, label %polly.loop_header137.preheader

polly.loop_header121.preheader:                   ; preds = %polly.loop_header115
  %280 = sub nsw i64 %268, %polly.indvar118
  br i1 %polly.loop_guard131, label %polly.loop_header137.preheader, label %polly.loop_header121

polly.loop_exit139:                               ; preds = %polly.loop_exit165
  %polly.indvar_next119 = add nuw nsw i64 %polly.indvar118, 1
  %exitcond891 = icmp eq i64 %polly.indvar_next119, 11
  br i1 %exitcond891, label %polly.loop_exit117, label %polly.loop_header115

polly.loop_header121:                             ; preds = %polly.loop_header121.preheader, %polly.loop_exit130
  %polly.indvar124 = phi i64 [ %polly.indvar_next125, %polly.loop_exit130 ], [ %276, %polly.loop_header121.preheader ]
  %polly.access.mul.BB = mul nuw nsw i64 %polly.indvar124, 2300
  br label %polly.loop_header128

polly.loop_exit130:                               ; preds = %polly.loop_header128
  %polly.indvar_next125 = add nuw nsw i64 %polly.indvar124, 1
  %polly.loop_cond126 = icmp slt i64 %polly.indvar124, %279
  br i1 %polly.loop_cond126, label %polly.loop_header121, label %polly.loop_header137.preheader

polly.loop_header137.preheader:                   ; preds = %polly.loop_exit130, %polly.loop_header121.preheader, %polly.loop_header115
  %281 = mul nsw i64 %polly.indvar118, -256
  %282 = add nsw i64 %281, 2599
  %283 = icmp slt i64 %282, 255
  %284 = select i1 %283, i64 %282, i64 255
  br label %polly.loop_header137

polly.loop_header128:                             ; preds = %polly.loop_header121, %polly.loop_header128
  %polly.indvar132 = phi i64 [ %polly.indvar_next133, %polly.loop_header128 ], [ %264, %polly.loop_header121 ]
  %polly.access.add.BB = add nuw nsw i64 %polly.indvar132, %polly.access.mul.BB
  %polly.access.BB = getelementptr double, double* %polly.access.cast.BB, i64 %polly.access.add.BB
  %285 = bitcast double* %polly.access.BB to i64*
  %polly.access.BB.load866 = load i64, i64* %285, align 8, !alias.scope !10, !noalias !21
  %pexp.p_div_q = lshr i64 %polly.indvar132, 3
  %tmp = add i64 %280, %pexp.p_div_q
  %tmp867 = shl i64 %tmp, 8
  %polly.access.add.Packed_B = add i64 %tmp867, %polly.indvar124
  %286 = shl nsw i64 %polly.access.add.Packed_B, 3
  %287 = sub nsw i64 7, %polly.indvar132
  %pexp.pdiv_r = and i64 %287, 7
  %polly.access.mul.Packed_B135 = or i64 %286, %pexp.pdiv_r
  %polly.access.add.Packed_B136 = xor i64 %polly.access.mul.Packed_B135, 7
  %polly.access.Packed_B = getelementptr [256 x [256 x [8 x double]]], [256 x [256 x [8 x double]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B136
  %288 = bitcast double* %polly.access.Packed_B to i64*
  store i64 %polly.access.BB.load866, i64* %288, align 8
  %polly.indvar_next133 = add nuw nsw i64 %polly.indvar132, 1
  %polly.loop_cond134 = icmp slt i64 %polly.indvar132, %267
  br i1 %polly.loop_cond134, label %polly.loop_header128, label %polly.loop_exit130

polly.loop_header137:                             ; preds = %polly.loop_exit165, %polly.loop_header137.preheader
  %polly.indvar140 = phi i64 [ %polly.indvar_next141, %polly.loop_exit165 ], [ 0, %polly.loop_header137.preheader ]
  br i1 %269, label %polly.then, label %polly.merge

polly.merge:                                      ; preds = %polly.loop_exit154.loopexit.us, %polly.loop_header144.preheader, %polly.then, %polly.loop_header137
  %289 = mul nsw i64 %polly.indvar140, -24
  %290 = add nsw i64 %289, 499
  %291 = icmp slt i64 %290, 23
  %292 = select i1 %291, i64 %290, i64 23
  %293 = mul nuw nsw i64 %polly.indvar140, 96
  br label %polly.loop_header163

polly.loop_exit165:                               ; preds = %polly.loop_exit171
  %polly.indvar_next141 = add nuw nsw i64 %polly.indvar140, 1
  %exitcond = icmp eq i64 %polly.indvar_next141, 21
  br i1 %exitcond, label %polly.loop_exit139, label %polly.loop_header137

polly.then:                                       ; preds = %polly.loop_header137
  %294 = mul nuw nsw i64 %polly.indvar140, 96
  %295 = add nuw nsw i64 %294, 95
  %296 = icmp slt i64 %295, 1999
  %297 = select i1 %296, i64 %295, i64 1999
  %polly.loop_guard147 = icmp sgt i64 %294, %297
  br i1 %polly.loop_guard147, label %polly.merge, label %polly.loop_header144.preheader

polly.loop_header144.preheader:                   ; preds = %polly.then
  %298 = mul nsw i64 %polly.indvar140, -24
  %299 = sub nsw i64 %298, %polly.indvar118
  br i1 %polly.loop_guard, label %polly.loop_header144.us, label %polly.merge

polly.loop_header144.us:                          ; preds = %polly.loop_header144.preheader, %polly.loop_exit154.loopexit.us
  %polly.indvar148.us = phi i64 [ %polly.indvar_next149.us, %polly.loop_exit154.loopexit.us ], [ %294, %polly.loop_header144.preheader ]
  %polly.access.mul.AA.us = mul nuw nsw i64 %polly.indvar148.us, 2600
  %pexp.p_div_q159.us = lshr i64 %polly.indvar148.us, 2
  %tmp869.us = add i64 %299, %pexp.p_div_q159.us
  %tmp870.us = shl i64 %tmp869.us, 8
  %300 = sub nsw i64 3, %polly.indvar148.us
  %pexp.pdiv_r161.us = and i64 %300, 3
  br label %polly.loop_header152.us

polly.loop_header152.us:                          ; preds = %polly.loop_header144.us, %polly.loop_header152.us
  %polly.indvar156.us = phi i64 [ %polly.indvar_next157.us, %polly.loop_header152.us ], [ %276, %polly.loop_header144.us ]
  %polly.access.add.AA.us = add nuw nsw i64 %polly.indvar156.us, %polly.access.mul.AA.us
  %polly.access.AA.us = getelementptr double, double* %polly.access.cast.AA, i64 %polly.access.add.AA.us
  %301 = bitcast double* %polly.access.AA.us to i64*
  %polly.access.AA.load865.us = load i64, i64* %301, align 8, !alias.scope !6, !noalias !8
  %polly.access.add.Packed_A.us = add i64 %polly.indvar156.us, %tmp870.us
  %302 = shl nsw i64 %polly.access.add.Packed_A.us, 2
  %polly.access.mul.Packed_A160.us = or i64 %302, %pexp.pdiv_r161.us
  %polly.access.add.Packed_A162.us = xor i64 %polly.access.mul.Packed_A160.us, 3
  %polly.access.Packed_A.us = getelementptr [24 x [256 x [4 x double]]], [24 x [256 x [4 x double]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A162.us
  %303 = bitcast double* %polly.access.Packed_A.us to i64*
  store i64 %polly.access.AA.load865.us, i64* %303, align 8
  %polly.indvar_next157.us = add nuw nsw i64 %polly.indvar156.us, 1
  %polly.loop_cond158.us = icmp slt i64 %polly.indvar156.us, %279
  br i1 %polly.loop_cond158.us, label %polly.loop_header152.us, label %polly.loop_exit154.loopexit.us

polly.loop_exit154.loopexit.us:                   ; preds = %polly.loop_header152.us
  %polly.indvar_next149.us = add nuw nsw i64 %polly.indvar148.us, 1
  %polly.loop_cond150.us = icmp slt i64 %polly.indvar148.us, %297
  br i1 %polly.loop_cond150.us, label %polly.loop_header144.us, label %polly.merge

polly.loop_header163:                             ; preds = %polly.loop_exit171, %polly.merge
  %polly.indvar166 = phi i64 [ 0, %polly.merge ], [ %polly.indvar_next167, %polly.loop_exit171 ]
  %304 = shl nsw i64 %polly.indvar166, 3
  %305 = add nuw nsw i64 %304, %274
  %polly.access.mul.Packed_B189 = shl i64 %polly.indvar166, 8
  %306 = shl i64 %305, 3
  %307 = add nuw nsw i64 %polly.indvar166, %275
  %308 = icmp slt i64 %307, 287
  %309 = shl i64 %305, 3
  %310 = or i64 %309, 32
  %311 = shl i64 %305, 3
  %312 = or i64 %311, 32
  %313 = shl i64 %305, 3
  %314 = or i64 %313, 32
  %315 = shl i64 %305, 3
  %316 = or i64 %315, 32
  br label %polly.loop_header169

polly.loop_exit171:                               ; preds = %polly.loop_exit177
  %polly.indvar_next167 = add nuw nsw i64 %polly.indvar166, 1
  %polly.loop_cond168 = icmp slt i64 %polly.indvar166, %273
  br i1 %polly.loop_cond168, label %polly.loop_header163, label %polly.loop_exit165

polly.loop_header169:                             ; preds = %polly.loop_exit177, %polly.loop_header163
  %polly.indvar172 = phi i64 [ 0, %polly.loop_header163 ], [ %polly.indvar_next173, %polly.loop_exit177 ]
  %317 = shl nsw i64 %polly.indvar172, 2
  %318 = add nuw nsw i64 %317, %293
  %polly.access.mul.Packed_A182 = shl i64 %polly.indvar172, 8
  %319 = mul nuw nsw i64 %318, 18400
  %320 = add nuw nsw i64 %319, %306
  %scevgep195 = getelementptr i8, i8* %CC, i64 %320
  %321 = add nuw nsw i64 %319, %310
  %scevgep282 = getelementptr i8, i8* %CC, i64 %321
  %322 = or i64 %318, 1
  %323 = mul nuw nsw i64 %322, 18400
  %324 = add nuw nsw i64 %323, %306
  %scevgep366 = getelementptr i8, i8* %CC, i64 %324
  %325 = add nuw nsw i64 %323, %312
  %scevgep454 = getelementptr i8, i8* %CC, i64 %325
  %326 = or i64 %318, 2
  %327 = mul nuw nsw i64 %326, 18400
  %328 = add nuw nsw i64 %327, %306
  %scevgep538 = getelementptr i8, i8* %CC, i64 %328
  %329 = add nuw nsw i64 %327, %314
  %scevgep626 = getelementptr i8, i8* %CC, i64 %329
  %330 = or i64 %318, 3
  %331 = mul nuw nsw i64 %330, 18400
  %332 = add nuw nsw i64 %331, %306
  %scevgep710 = getelementptr i8, i8* %CC, i64 %332
  %333 = add nuw nsw i64 %331, %316
  %scevgep798 = getelementptr i8, i8* %CC, i64 %333
  %334 = bitcast i8* %scevgep195 to <4 x double>*
  %335 = load <4 x double>, <4 x double>* %334, align 8, !alias.scope !26, !noalias !18
  %336 = bitcast i8* %scevgep366 to <4 x double>*
  %337 = load <4 x double>, <4 x double>* %336, align 8, !alias.scope !31, !noalias !36
  %338 = bitcast i8* %scevgep538 to <4 x double>*
  %339 = load <4 x double>, <4 x double>* %338, align 8, !alias.scope !41, !noalias !46
  %340 = bitcast i8* %scevgep710 to <4 x double>*
  %341 = load <4 x double>, <4 x double>* %340, align 8, !alias.scope !51, !noalias !56
  %342 = bitcast i8* %scevgep282 to <4 x double>*
  %343 = bitcast i8* %scevgep282 to <4 x double>*
  %344 = bitcast i8* %scevgep454 to <4 x double>*
  %345 = bitcast i8* %scevgep454 to <4 x double>*
  %346 = bitcast i8* %scevgep626 to <4 x double>*
  %347 = bitcast i8* %scevgep626 to <4 x double>*
  %348 = bitcast i8* %scevgep798 to <4 x double>*
  %349 = bitcast i8* %scevgep798 to <4 x double>*
  br label %polly.loop_header175

polly.loop_exit177:                               ; preds = %polly.merge778
  %350 = bitcast i8* %scevgep195 to <4 x double>*
  store <4 x double> %364, <4 x double>* %350, align 8, !alias.scope !26, !noalias !18
  %351 = bitcast i8* %scevgep366 to <4 x double>*
  store <4 x double> %371, <4 x double>* %351, align 8, !alias.scope !31, !noalias !36
  %352 = bitcast i8* %scevgep538 to <4 x double>*
  store <4 x double> %378, <4 x double>* %352, align 8, !alias.scope !41, !noalias !46
  %353 = bitcast i8* %scevgep710 to <4 x double>*
  store <4 x double> %385, <4 x double>* %353, align 8, !alias.scope !51, !noalias !56
  %polly.indvar_next173 = add nuw nsw i64 %polly.indvar172, 1
  %polly.loop_cond174 = icmp slt i64 %polly.indvar172, %292
  br i1 %polly.loop_cond174, label %polly.loop_header169, label %polly.loop_exit171

polly.loop_header175:                             ; preds = %polly.merge778, %polly.loop_header169
  %polly.indvar178 = phi i64 [ 0, %polly.loop_header169 ], [ %polly.indvar_next179, %polly.merge778 ]
  %354 = phi <4 x double> [ %335, %polly.loop_header169 ], [ %364, %polly.merge778 ]
  %355 = phi <4 x double> [ %337, %polly.loop_header169 ], [ %371, %polly.merge778 ]
  %356 = phi <4 x double> [ %339, %polly.loop_header169 ], [ %378, %polly.merge778 ]
  %357 = phi <4 x double> [ %341, %polly.loop_header169 ], [ %385, %polly.merge778 ]
  %polly.access.add.Packed_A183 = add nuw nsw i64 %polly.indvar178, %polly.access.mul.Packed_A182
  %polly.access.mul.Packed_A184 = shl nsw i64 %polly.access.add.Packed_A183, 2
  %polly.access.Packed_A186 = getelementptr [24 x [256 x [4 x double]]], [24 x [256 x [4 x double]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.mul.Packed_A184
  %_p_scalar_187 = load double, double* %polly.access.Packed_A186, align 32
  %polly.access.add.Packed_B190 = add nuw nsw i64 %polly.indvar178, %polly.access.mul.Packed_B189
  %polly.access.mul.Packed_B191 = shl nsw i64 %polly.access.add.Packed_B190, 3
  %polly.access.Packed_B193 = getelementptr [256 x [256 x [8 x double]]], [256 x [256 x [8 x double]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.mul.Packed_B191
  %358 = insertelement <4 x double> undef, double %_p_scalar_187, i32 0
  %359 = shufflevector <4 x double> %358, <4 x double> undef, <4 x i32> zeroinitializer
  %360 = fmul fast <4 x double> %359, <double 1.500000e+00, double 1.500000e+00, double 1.500000e+00, double 1.500000e+00>
  %361 = bitcast double* %polly.access.Packed_B193 to <4 x double>*
  %362 = load <4 x double>, <4 x double>* %361, align 64
  %363 = fmul fast <4 x double> %360, %362
  %364 = fadd fast <4 x double> %354, %363
  br i1 %308, label %polly.then263, label %polly.merge262

polly.merge262:                                   ; preds = %polly.loop_header175, %polly.then263
  %polly.access.add.Packed_A354 = or i64 %polly.access.mul.Packed_A184, 1
  %polly.access.Packed_A355 = getelementptr [24 x [256 x [4 x double]]], [24 x [256 x [4 x double]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A354
  %_p_scalar_356 = load double, double* %polly.access.Packed_A355, align 8
  %365 = insertelement <4 x double> undef, double %_p_scalar_356, i32 0
  %366 = shufflevector <4 x double> %365, <4 x double> undef, <4 x i32> zeroinitializer
  %367 = fmul fast <4 x double> %366, <double 1.500000e+00, double 1.500000e+00, double 1.500000e+00, double 1.500000e+00>
  %368 = bitcast double* %polly.access.Packed_B193 to <4 x double>*
  %369 = load <4 x double>, <4 x double>* %368, align 64
  %370 = fmul fast <4 x double> %367, %369
  %371 = fadd fast <4 x double> %355, %370
  br i1 %308, label %polly.then435, label %polly.merge434

polly.merge434:                                   ; preds = %polly.merge262, %polly.then435
  %polly.access.add.Packed_A526 = or i64 %polly.access.mul.Packed_A184, 2
  %polly.access.Packed_A527 = getelementptr [24 x [256 x [4 x double]]], [24 x [256 x [4 x double]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A526
  %_p_scalar_528 = load double, double* %polly.access.Packed_A527, align 16
  %372 = insertelement <4 x double> undef, double %_p_scalar_528, i32 0
  %373 = shufflevector <4 x double> %372, <4 x double> undef, <4 x i32> zeroinitializer
  %374 = fmul fast <4 x double> %373, <double 1.500000e+00, double 1.500000e+00, double 1.500000e+00, double 1.500000e+00>
  %375 = bitcast double* %polly.access.Packed_B193 to <4 x double>*
  %376 = load <4 x double>, <4 x double>* %375, align 64
  %377 = fmul fast <4 x double> %374, %376
  %378 = fadd fast <4 x double> %356, %377
  br i1 %308, label %polly.then607, label %polly.merge606

polly.merge606:                                   ; preds = %polly.merge434, %polly.then607
  %polly.access.add.Packed_A698 = or i64 %polly.access.mul.Packed_A184, 3
  %polly.access.Packed_A699 = getelementptr [24 x [256 x [4 x double]]], [24 x [256 x [4 x double]]]* %Packed_A, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A698
  %_p_scalar_700 = load double, double* %polly.access.Packed_A699, align 8
  %379 = insertelement <4 x double> undef, double %_p_scalar_700, i32 0
  %380 = shufflevector <4 x double> %379, <4 x double> undef, <4 x i32> zeroinitializer
  %381 = fmul fast <4 x double> %380, <double 1.500000e+00, double 1.500000e+00, double 1.500000e+00, double 1.500000e+00>
  %382 = bitcast double* %polly.access.Packed_B193 to <4 x double>*
  %383 = load <4 x double>, <4 x double>* %382, align 64
  %384 = fmul fast <4 x double> %381, %383
  %385 = fadd fast <4 x double> %357, %384
  br i1 %308, label %polly.then779, label %polly.merge778

polly.merge778:                                   ; preds = %polly.merge606, %polly.then779
  %polly.indvar_next179 = add nuw nsw i64 %polly.indvar178, 1
  %polly.loop_cond180 = icmp slt i64 %polly.indvar178, %284
  br i1 %polly.loop_cond180, label %polly.loop_header175, label %polly.loop_exit177

polly.then263:                                    ; preds = %polly.loop_header175
  %_p_scalar_272 = load double, double* %polly.access.Packed_A186, align 32
  %polly.access.add.Packed_B278 = or i64 %polly.access.mul.Packed_B191, 4
  %polly.access.Packed_B279 = getelementptr [256 x [256 x [8 x double]]], [256 x [256 x [8 x double]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B278
  %386 = insertelement <4 x double> undef, double %_p_scalar_272, i32 0
  %387 = shufflevector <4 x double> %386, <4 x double> undef, <4 x i32> zeroinitializer
  %388 = fmul fast <4 x double> %387, <double 1.500000e+00, double 1.500000e+00, double 1.500000e+00, double 1.500000e+00>
  %389 = bitcast double* %polly.access.Packed_B279 to <4 x double>*
  %390 = load <4 x double>, <4 x double>* %389, align 32
  %391 = fmul fast <4 x double> %388, %390
  %392 = load <4 x double>, <4 x double>* %342, align 8, !alias.scope !61, !noalias !62
  %393 = fadd fast <4 x double> %392, %391
  store <4 x double> %393, <4 x double>* %343, align 8, !alias.scope !61, !noalias !62
  br label %polly.merge262

polly.then435:                                    ; preds = %polly.merge262
  %_p_scalar_444 = load double, double* %polly.access.Packed_A355, align 8
  %polly.access.add.Packed_B450 = or i64 %polly.access.mul.Packed_B191, 4
  %polly.access.Packed_B451 = getelementptr [256 x [256 x [8 x double]]], [256 x [256 x [8 x double]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B450
  %394 = insertelement <4 x double> undef, double %_p_scalar_444, i32 0
  %395 = shufflevector <4 x double> %394, <4 x double> undef, <4 x i32> zeroinitializer
  %396 = fmul fast <4 x double> %395, <double 1.500000e+00, double 1.500000e+00, double 1.500000e+00, double 1.500000e+00>
  %397 = bitcast double* %polly.access.Packed_B451 to <4 x double>*
  %398 = load <4 x double>, <4 x double>* %397, align 32
  %399 = fmul fast <4 x double> %396, %398
  %400 = load <4 x double>, <4 x double>* %344, align 8, !alias.scope !63, !noalias !64
  %401 = fadd fast <4 x double> %400, %399
  store <4 x double> %401, <4 x double>* %345, align 8, !alias.scope !63, !noalias !64
  br label %polly.merge434

polly.then607:                                    ; preds = %polly.merge434
  %_p_scalar_616 = load double, double* %polly.access.Packed_A527, align 16
  %polly.access.add.Packed_B622 = or i64 %polly.access.mul.Packed_B191, 4
  %polly.access.Packed_B623 = getelementptr [256 x [256 x [8 x double]]], [256 x [256 x [8 x double]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B622
  %402 = insertelement <4 x double> undef, double %_p_scalar_616, i32 0
  %403 = shufflevector <4 x double> %402, <4 x double> undef, <4 x i32> zeroinitializer
  %404 = fmul fast <4 x double> %403, <double 1.500000e+00, double 1.500000e+00, double 1.500000e+00, double 1.500000e+00>
  %405 = bitcast double* %polly.access.Packed_B623 to <4 x double>*
  %406 = load <4 x double>, <4 x double>* %405, align 32
  %407 = fmul fast <4 x double> %404, %406
  %408 = load <4 x double>, <4 x double>* %346, align 8, !alias.scope !65, !noalias !66
  %409 = fadd fast <4 x double> %408, %407
  store <4 x double> %409, <4 x double>* %347, align 8, !alias.scope !65, !noalias !66
  br label %polly.merge606

polly.then779:                                    ; preds = %polly.merge606
  %_p_scalar_788 = load double, double* %polly.access.Packed_A699, align 8
  %polly.access.add.Packed_B794 = or i64 %polly.access.mul.Packed_B191, 4
  %polly.access.Packed_B795 = getelementptr [256 x [256 x [8 x double]]], [256 x [256 x [8 x double]]]* %Packed_B, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B794
  %410 = insertelement <4 x double> undef, double %_p_scalar_788, i32 0
  %411 = shufflevector <4 x double> %410, <4 x double> undef, <4 x i32> zeroinitializer
  %412 = fmul fast <4 x double> %411, <double 1.500000e+00, double 1.500000e+00, double 1.500000e+00, double 1.500000e+00>
  %413 = bitcast double* %polly.access.Packed_B795 to <4 x double>*
  %414 = load <4 x double>, <4 x double>* %413, align 32
  %415 = fmul fast <4 x double> %412, %414
  %416 = load <4 x double>, <4 x double>* %348, align 8, !alias.scope !67, !noalias !72
  %417 = fadd fast <4 x double> %416, %415
  store <4 x double> %417, <4 x double>* %349, align 8, !alias.scope !67, !noalias !72
  br label %polly.merge778

vector.body946.1:                                 ; preds = %vector.body946
  %418 = add nuw nsw i64 %241, %243
  %419 = getelementptr i8, i8* %CC, i64 %418
  %420 = bitcast i8* %419 to <4 x double>*
  %wide.load.1 = load <4 x double>, <4 x double>* %420, align 8, !alias.scope !11, !noalias !18
  %421 = getelementptr i8, i8* %419, i64 32
  %422 = bitcast i8* %421 to <4 x double>*
  %wide.load965.1 = load <4 x double>, <4 x double>* %422, align 8, !alias.scope !11, !noalias !18
  %423 = getelementptr i8, i8* %419, i64 64
  %424 = bitcast i8* %423 to <4 x double>*
  %wide.load966.1 = load <4 x double>, <4 x double>* %424, align 8, !alias.scope !11, !noalias !18
  %425 = getelementptr i8, i8* %419, i64 96
  %426 = bitcast i8* %425 to <4 x double>*
  %wide.load967.1 = load <4 x double>, <4 x double>* %426, align 8, !alias.scope !11, !noalias !18
  %427 = fmul fast <4 x double> %wide.load.1, <double 1.200000e+00, double 1.200000e+00, double 1.200000e+00, double 1.200000e+00>
  %428 = fmul fast <4 x double> %wide.load965.1, <double 1.200000e+00, double 1.200000e+00, double 1.200000e+00, double 1.200000e+00>
  %429 = fmul fast <4 x double> %wide.load966.1, <double 1.200000e+00, double 1.200000e+00, double 1.200000e+00, double 1.200000e+00>
  %430 = fmul fast <4 x double> %wide.load967.1, <double 1.200000e+00, double 1.200000e+00, double 1.200000e+00, double 1.200000e+00>
  %431 = bitcast i8* %419 to <4 x double>*
  store <4 x double> %427, <4 x double>* %431, align 8, !alias.scope !11, !noalias !18
  %432 = bitcast i8* %421 to <4 x double>*
  store <4 x double> %428, <4 x double>* %432, align 8, !alias.scope !11, !noalias !18
  %433 = bitcast i8* %423 to <4 x double>*
  store <4 x double> %429, <4 x double>* %433, align 8, !alias.scope !11, !noalias !18
  %434 = bitcast i8* %425 to <4 x double>*
  store <4 x double> %430, <4 x double>* %434, align 8, !alias.scope !11, !noalias !18
  br label %middle.block947

vector.body926.1:                                 ; preds = %vector.ph935
  %435 = mul <4 x i32> %169, %broadcast.splat945
  %436 = srem <4 x i32> %435, <i32 2300, i32 2300, i32 2300, i32 2300>
  %437 = sitofp <4 x i32> %436 to <4 x double>
  %438 = fmul fast <4 x double> %437, <double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95>
  %439 = add nuw nsw i64 %171, %210
  %440 = getelementptr i8, i8* %BB, i64 %439
  %441 = bitcast i8* %440 to <4 x double>*
  store <4 x double> %438, <4 x double>* %441, align 8, !alias.scope !10, !noalias !21
  br i1 %172, label %polly.loop_exit77, label %vector.body926.2, !llvm.loop !22

vector.body926.2:                                 ; preds = %vector.body926.1
  %442 = mul <4 x i32> %175, %broadcast.splat945
  %443 = srem <4 x i32> %442, <i32 2300, i32 2300, i32 2300, i32 2300>
  %444 = sitofp <4 x i32> %443 to <4 x double>
  %445 = fmul fast <4 x double> %444, <double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95>
  %446 = add nuw nsw i64 %177, %210
  %447 = getelementptr i8, i8* %BB, i64 %446
  %448 = bitcast i8* %447 to <4 x double>*
  store <4 x double> %445, <4 x double>* %448, align 8, !alias.scope !10, !noalias !21
  br i1 %178, label %polly.loop_exit77, label %vector.body926.3, !llvm.loop !22

vector.body926.3:                                 ; preds = %vector.body926.2
  %449 = mul <4 x i32> %181, %broadcast.splat945
  %450 = srem <4 x i32> %449, <i32 2300, i32 2300, i32 2300, i32 2300>
  %451 = sitofp <4 x i32> %450 to <4 x double>
  %452 = fmul fast <4 x double> %451, <double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95>
  %453 = add nuw nsw i64 %183, %210
  %454 = getelementptr i8, i8* %BB, i64 %453
  %455 = bitcast i8* %454 to <4 x double>*
  store <4 x double> %452, <4 x double>* %455, align 8, !alias.scope !10, !noalias !21
  br i1 %184, label %polly.loop_exit77, label %vector.body926.4, !llvm.loop !22

vector.body926.4:                                 ; preds = %vector.body926.3
  %456 = mul <4 x i32> %187, %broadcast.splat945
  %457 = srem <4 x i32> %456, <i32 2300, i32 2300, i32 2300, i32 2300>
  %458 = sitofp <4 x i32> %457 to <4 x double>
  %459 = fmul fast <4 x double> %458, <double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95>
  %460 = add nuw nsw i64 %189, %210
  %461 = getelementptr i8, i8* %BB, i64 %460
  %462 = bitcast i8* %461 to <4 x double>*
  store <4 x double> %459, <4 x double>* %462, align 8, !alias.scope !10, !noalias !21
  br i1 %190, label %polly.loop_exit77, label %vector.body926.5, !llvm.loop !22

vector.body926.5:                                 ; preds = %vector.body926.4
  %463 = mul <4 x i32> %193, %broadcast.splat945
  %464 = srem <4 x i32> %463, <i32 2300, i32 2300, i32 2300, i32 2300>
  %465 = sitofp <4 x i32> %464 to <4 x double>
  %466 = fmul fast <4 x double> %465, <double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95>
  %467 = add nuw nsw i64 %195, %210
  %468 = getelementptr i8, i8* %BB, i64 %467
  %469 = bitcast i8* %468 to <4 x double>*
  store <4 x double> %466, <4 x double>* %469, align 8, !alias.scope !10, !noalias !21
  br i1 %196, label %polly.loop_exit77, label %vector.body926.6, !llvm.loop !22

vector.body926.6:                                 ; preds = %vector.body926.5
  %470 = mul <4 x i32> %199, %broadcast.splat945
  %471 = srem <4 x i32> %470, <i32 2300, i32 2300, i32 2300, i32 2300>
  %472 = sitofp <4 x i32> %471 to <4 x double>
  %473 = fmul fast <4 x double> %472, <double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95>
  %474 = add nuw nsw i64 %201, %210
  %475 = getelementptr i8, i8* %BB, i64 %474
  %476 = bitcast i8* %475 to <4 x double>*
  store <4 x double> %473, <4 x double>* %476, align 8, !alias.scope !10, !noalias !21
  br i1 %202, label %polly.loop_exit77, label %vector.body926.7, !llvm.loop !22

vector.body926.7:                                 ; preds = %vector.body926.6
  %477 = mul <4 x i32> %205, %broadcast.splat945
  %478 = srem <4 x i32> %477, <i32 2300, i32 2300, i32 2300, i32 2300>
  %479 = sitofp <4 x i32> %478 to <4 x double>
  %480 = fmul fast <4 x double> %479, <double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95, double 0x3F3C7E7115D0CE95>
  %481 = add nuw nsw i64 %207, %210
  %482 = getelementptr i8, i8* %BB, i64 %481
  %483 = bitcast i8* %482 to <4 x double>*
  store <4 x double> %480, <4 x double>* %483, align 8, !alias.scope !10, !noalias !21
  br label %polly.loop_exit77

vector.body906.1:                                 ; preds = %vector.ph915
  %484 = mul <4 x i32> %broadcast.splat925, %98
  %485 = add <4 x i32> %484, <i32 1, i32 1, i32 1, i32 1>
  %486 = srem <4 x i32> %485, <i32 2000, i32 2000, i32 2000, i32 2000>
  %487 = sitofp <4 x i32> %486 to <4 x double>
  %488 = fmul fast <4 x double> %487, <double 5.000000e-04, double 5.000000e-04, double 5.000000e-04, double 5.000000e-04>
  %489 = add nuw nsw i64 %100, %133
  %490 = getelementptr i8, i8* %CC, i64 %489
  %491 = bitcast i8* %490 to <4 x double>*
  store <4 x double> %488, <4 x double>* %491, align 8, !alias.scope !11, !noalias !18
  br i1 %101, label %polly.loop_exit51, label %vector.body906.2, !llvm.loop !19

vector.body906.2:                                 ; preds = %vector.body906.1
  %492 = mul <4 x i32> %broadcast.splat925, %103
  %493 = add <4 x i32> %492, <i32 1, i32 1, i32 1, i32 1>
  %494 = srem <4 x i32> %493, <i32 2000, i32 2000, i32 2000, i32 2000>
  %495 = sitofp <4 x i32> %494 to <4 x double>
  %496 = fmul fast <4 x double> %495, <double 5.000000e-04, double 5.000000e-04, double 5.000000e-04, double 5.000000e-04>
  %497 = add nuw nsw i64 %105, %133
  %498 = getelementptr i8, i8* %CC, i64 %497
  %499 = bitcast i8* %498 to <4 x double>*
  store <4 x double> %496, <4 x double>* %499, align 8, !alias.scope !11, !noalias !18
  br i1 %106, label %polly.loop_exit51, label %vector.body906.3, !llvm.loop !19

vector.body906.3:                                 ; preds = %vector.body906.2
  %500 = mul <4 x i32> %broadcast.splat925, %108
  %501 = add <4 x i32> %500, <i32 1, i32 1, i32 1, i32 1>
  %502 = srem <4 x i32> %501, <i32 2000, i32 2000, i32 2000, i32 2000>
  %503 = sitofp <4 x i32> %502 to <4 x double>
  %504 = fmul fast <4 x double> %503, <double 5.000000e-04, double 5.000000e-04, double 5.000000e-04, double 5.000000e-04>
  %505 = add nuw nsw i64 %110, %133
  %506 = getelementptr i8, i8* %CC, i64 %505
  %507 = bitcast i8* %506 to <4 x double>*
  store <4 x double> %504, <4 x double>* %507, align 8, !alias.scope !11, !noalias !18
  br i1 %111, label %polly.loop_exit51, label %vector.body906.4, !llvm.loop !19

vector.body906.4:                                 ; preds = %vector.body906.3
  %508 = mul <4 x i32> %broadcast.splat925, %113
  %509 = add <4 x i32> %508, <i32 1, i32 1, i32 1, i32 1>
  %510 = srem <4 x i32> %509, <i32 2000, i32 2000, i32 2000, i32 2000>
  %511 = sitofp <4 x i32> %510 to <4 x double>
  %512 = fmul fast <4 x double> %511, <double 5.000000e-04, double 5.000000e-04, double 5.000000e-04, double 5.000000e-04>
  %513 = add nuw nsw i64 %115, %133
  %514 = getelementptr i8, i8* %CC, i64 %513
  %515 = bitcast i8* %514 to <4 x double>*
  store <4 x double> %512, <4 x double>* %515, align 8, !alias.scope !11, !noalias !18
  br i1 %116, label %polly.loop_exit51, label %vector.body906.5, !llvm.loop !19

vector.body906.5:                                 ; preds = %vector.body906.4
  %516 = mul <4 x i32> %broadcast.splat925, %118
  %517 = add <4 x i32> %516, <i32 1, i32 1, i32 1, i32 1>
  %518 = srem <4 x i32> %517, <i32 2000, i32 2000, i32 2000, i32 2000>
  %519 = sitofp <4 x i32> %518 to <4 x double>
  %520 = fmul fast <4 x double> %519, <double 5.000000e-04, double 5.000000e-04, double 5.000000e-04, double 5.000000e-04>
  %521 = add nuw nsw i64 %120, %133
  %522 = getelementptr i8, i8* %CC, i64 %521
  %523 = bitcast i8* %522 to <4 x double>*
  store <4 x double> %520, <4 x double>* %523, align 8, !alias.scope !11, !noalias !18
  br i1 %121, label %polly.loop_exit51, label %vector.body906.6, !llvm.loop !19

vector.body906.6:                                 ; preds = %vector.body906.5
  %524 = mul <4 x i32> %broadcast.splat925, %123
  %525 = add <4 x i32> %524, <i32 1, i32 1, i32 1, i32 1>
  %526 = srem <4 x i32> %525, <i32 2000, i32 2000, i32 2000, i32 2000>
  %527 = sitofp <4 x i32> %526 to <4 x double>
  %528 = fmul fast <4 x double> %527, <double 5.000000e-04, double 5.000000e-04, double 5.000000e-04, double 5.000000e-04>
  %529 = add nuw nsw i64 %125, %133
  %530 = getelementptr i8, i8* %CC, i64 %529
  %531 = bitcast i8* %530 to <4 x double>*
  store <4 x double> %528, <4 x double>* %531, align 8, !alias.scope !11, !noalias !18
  br i1 %126, label %polly.loop_exit51, label %vector.body906.7, !llvm.loop !19

vector.body906.7:                                 ; preds = %vector.body906.6
  %532 = mul <4 x i32> %broadcast.splat925, %128
  %533 = add <4 x i32> %532, <i32 1, i32 1, i32 1, i32 1>
  %534 = srem <4 x i32> %533, <i32 2000, i32 2000, i32 2000, i32 2000>
  %535 = sitofp <4 x i32> %534 to <4 x double>
  %536 = fmul fast <4 x double> %535, <double 5.000000e-04, double 5.000000e-04, double 5.000000e-04, double 5.000000e-04>
  %537 = add nuw nsw i64 %130, %133
  %538 = getelementptr i8, i8* %CC, i64 %537
  %539 = bitcast i8* %538 to <4 x double>*
  store <4 x double> %536, <4 x double>* %539, align 8, !alias.scope !11, !noalias !18
  br label %polly.loop_exit51

vector.body.2:                                    ; preds = %vector.ph
  %540 = mul <4 x i32> %26, %broadcast.splat905
  %541 = srem <4 x i32> %540, <i32 2600, i32 2600, i32 2600, i32 2600>
  %542 = sitofp <4 x i32> %541 to <4 x double>
  %543 = fmul fast <4 x double> %542, <double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6>
  %544 = add nuw nsw i64 %28, %58
  %545 = getelementptr i8, i8* %AA, i64 %544
  %546 = bitcast i8* %545 to <4 x double>*
  store <4 x double> %543, <4 x double>* %546, align 8, !alias.scope !6, !noalias !8
  %547 = mul <4 x i32> %31, %broadcast.splat905
  %548 = srem <4 x i32> %547, <i32 2600, i32 2600, i32 2600, i32 2600>
  %549 = sitofp <4 x i32> %548 to <4 x double>
  %550 = fmul fast <4 x double> %549, <double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6>
  %551 = add nuw nsw i64 %33, %58
  %552 = getelementptr i8, i8* %AA, i64 %551
  %553 = bitcast i8* %552 to <4 x double>*
  store <4 x double> %550, <4 x double>* %553, align 8, !alias.scope !6, !noalias !8
  br i1 %34, label %polly.loop_exit26, label %vector.body.4, !llvm.loop !13

vector.body.4:                                    ; preds = %vector.body.2
  %554 = mul <4 x i32> %37, %broadcast.splat905
  %555 = srem <4 x i32> %554, <i32 2600, i32 2600, i32 2600, i32 2600>
  %556 = sitofp <4 x i32> %555 to <4 x double>
  %557 = fmul fast <4 x double> %556, <double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6>
  %558 = add nuw nsw i64 %39, %58
  %559 = getelementptr i8, i8* %AA, i64 %558
  %560 = bitcast i8* %559 to <4 x double>*
  store <4 x double> %557, <4 x double>* %560, align 8, !alias.scope !6, !noalias !8
  %561 = mul <4 x i32> %42, %broadcast.splat905
  %562 = srem <4 x i32> %561, <i32 2600, i32 2600, i32 2600, i32 2600>
  %563 = sitofp <4 x i32> %562 to <4 x double>
  %564 = fmul fast <4 x double> %563, <double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6>
  %565 = add nuw nsw i64 %44, %58
  %566 = getelementptr i8, i8* %AA, i64 %565
  %567 = bitcast i8* %566 to <4 x double>*
  store <4 x double> %564, <4 x double>* %567, align 8, !alias.scope !6, !noalias !8
  br i1 %45, label %polly.loop_exit26, label %vector.body.6, !llvm.loop !13

vector.body.6:                                    ; preds = %vector.body.4
  %568 = mul <4 x i32> %48, %broadcast.splat905
  %569 = srem <4 x i32> %568, <i32 2600, i32 2600, i32 2600, i32 2600>
  %570 = sitofp <4 x i32> %569 to <4 x double>
  %571 = fmul fast <4 x double> %570, <double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6>
  %572 = add nuw nsw i64 %50, %58
  %573 = getelementptr i8, i8* %AA, i64 %572
  %574 = bitcast i8* %573 to <4 x double>*
  store <4 x double> %571, <4 x double>* %574, align 8, !alias.scope !6, !noalias !8
  %575 = mul <4 x i32> %53, %broadcast.splat905
  %576 = srem <4 x i32> %575, <i32 2600, i32 2600, i32 2600, i32 2600>
  %577 = sitofp <4 x i32> %576 to <4 x double>
  %578 = fmul fast <4 x double> %577, <double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6, double 0x3F3934C67F9B2CE6>
  %579 = add nuw nsw i64 %55, %58
  %580 = getelementptr i8, i8* %AA, i64 %579
  %581 = bitcast i8* %580 to <4 x double>*
  store <4 x double> %578, <4 x double>* %581, align 8, !alias.scope !6, !noalias !8
  br label %polly.loop_exit26
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="true" "no-jump-tables"="false" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="haswell" "target-features"="+aes,+avx,+avx2,+bmi,+bmi2,+cmov,+cx16,+f16c,+fma,+fsgsbase,+fxsr,+lzcnt,+mmx,+movbe,+pclmul,+popcnt,+rdrnd,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87,+xsave,+xsaveopt,-adx,-avx512bw,-avx512cd,-avx512dq,-avx512er,-avx512f,-avx512ifma,-avx512pf,-avx512vbmi,-avx512vl,-avx512vpopcntdq,-clflushopt,-clwb,-clzero,-fma4,-lwp,-mwaitx,-pku,-prefetchwt1,-prfchw,-rdseed,-rtm,-sgx,-sha,-sse4a,-tbm,-xop,-xsavec,-xsaves" "unsafe-fp-math"="true" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="haswell" "target-features"="+aes,+avx,+avx2,+bmi,+bmi2,+cmov,+cx16,+f16c,+fma,+fsgsbase,+fxsr,+lzcnt,+mmx,+movbe,+pclmul,+popcnt,+rdrnd,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87,+xsave,+xsaveopt,-adx,-avx512bw,-avx512cd,-avx512dq,-avx512er,-avx512f,-avx512ifma,-avx512pf,-avx512vbmi,-avx512vl,-avx512vpopcntdq,-clflushopt,-clwb,-clzero,-fma4,-lwp,-mwaitx,-pku,-prefetchwt1,-prfchw,-rdseed,-rtm,-sgx,-sha,-sse4a,-tbm,-xop,-xsavec,-xsaves" "unsafe-fp-math"="true" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="haswell" "target-features"="+aes,+avx,+avx2,+bmi,+bmi2,+cmov,+cx16,+f16c,+fma,+fsgsbase,+fxsr,+lzcnt,+mmx,+movbe,+pclmul,+popcnt,+rdrnd,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87,+xsave,+xsaveopt,-adx,-avx512bw,-avx512cd,-avx512dq,-avx512er,-avx512f,-avx512ifma,-avx512pf,-avx512vbmi,-avx512vl,-avx512vpopcntdq,-clflushopt,-clwb,-clzero,-fma4,-lwp,-mwaitx,-pku,-prefetchwt1,-prfchw,-rdseed,-rtm,-sgx,-sha,-sse4a,-tbm,-xop,-xsavec,-xsaves" "unsafe-fp-math"="true" "use-soft-float"="false" }
attributes #4 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="true" "no-jump-tables"="false" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="haswell" "target-features"="+aes,+avx,+avx2,+bmi,+bmi2,+cmov,+cx16,+f16c,+fma,+fsgsbase,+fxsr,+lzcnt,+mmx,+movbe,+pclmul,+popcnt,+rdrnd,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87,+xsave,+xsaveopt,-adx,-avx512bw,-avx512cd,-avx512dq,-avx512er,-avx512f,-avx512ifma,-avx512pf,-avx512vbmi,-avx512vl,-avx512vpopcntdq,-clflushopt,-clwb,-clzero,-fma4,-lwp,-mwaitx,-pku,-prefetchwt1,-prfchw,-rdseed,-rtm,-sgx,-sha,-sse4a,-tbm,-xop,-xsavec,-xsaves" "unsafe-fp-math"="true" "use-soft-float"="false" }
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
!6 = distinct !{!6, !7, !"polly.alias.scope.MemRefAA"}
!7 = distinct !{!7, !"polly.alias.scope.domain"}
!8 = !{!9, !10, !11, !12}
!9 = distinct !{!9, !7, !"polly.alias.scope.Packed_A"}
!10 = distinct !{!10, !7, !"polly.alias.scope.MemRefBB"}
!11 = distinct !{!11, !7, !"polly.alias.scope.MemRefCC"}
!12 = distinct !{!12, !7, !"polly.alias.scope.MemRefmul16"}
!13 = distinct !{!13, !14, !15}
!14 = !{!"llvm.loop.vectorize.width", i32 1}
!15 = !{!"llvm.loop.interleave.count", i32 1}
!16 = distinct !{!16, !17, !14, !15}
!17 = !{!"llvm.loop.unroll.runtime.disable"}
!18 = !{!9, !6, !10, !12}
!19 = distinct !{!19, !14, !15}
!20 = distinct !{!20, !17, !14, !15}
!21 = !{!9, !6, !11, !12}
!22 = distinct !{!22, !14, !15}
!23 = distinct !{!23, !17, !14, !15}
!24 = distinct !{!24, !14, !15}
!25 = distinct !{!25, !17, !14, !15}
!26 = !{!27, !11, !"second level alias metadata", !28, !29, !30}
!27 = distinct !{!27, !11, !"second level alias metadata"}
!28 = distinct !{!28, !11, !"second level alias metadata"}
!29 = distinct !{!29, !11, !"second level alias metadata"}
!30 = distinct !{!30, !11, !"second level alias metadata"}
!31 = !{!32, !11, !"second level alias metadata", !33, !34, !35}
!32 = distinct !{!32, !11, !"second level alias metadata"}
!33 = distinct !{!33, !11, !"second level alias metadata"}
!34 = distinct !{!34, !11, !"second level alias metadata"}
!35 = distinct !{!35, !11, !"second level alias metadata"}
!36 = !{!9, !6, !10, !12, !27, !28, !29, !30, !37, !38, !39, !40}
!37 = distinct !{!37, !11, !"second level alias metadata"}
!38 = distinct !{!38, !11, !"second level alias metadata"}
!39 = distinct !{!39, !11, !"second level alias metadata"}
!40 = distinct !{!40, !11, !"second level alias metadata"}
!41 = !{!42, !11, !"second level alias metadata", !43, !44, !45}
!42 = distinct !{!42, !11, !"second level alias metadata"}
!43 = distinct !{!43, !11, !"second level alias metadata"}
!44 = distinct !{!44, !11, !"second level alias metadata"}
!45 = distinct !{!45, !11, !"second level alias metadata"}
!46 = !{!9, !6, !10, !12, !27, !28, !29, !30, !37, !38, !39, !40, !32, !33, !34, !35, !47, !48, !49, !50}
!47 = distinct !{!47, !11, !"second level alias metadata"}
!48 = distinct !{!48, !11, !"second level alias metadata"}
!49 = distinct !{!49, !11, !"second level alias metadata"}
!50 = distinct !{!50, !11, !"second level alias metadata"}
!51 = !{!52, !11, !"second level alias metadata", !53, !54, !55}
!52 = distinct !{!52, !11, !"second level alias metadata"}
!53 = distinct !{!53, !11, !"second level alias metadata"}
!54 = distinct !{!54, !11, !"second level alias metadata"}
!55 = distinct !{!55, !11, !"second level alias metadata"}
!56 = !{!9, !6, !10, !12, !27, !28, !29, !30, !37, !38, !39, !40, !32, !33, !34, !35, !47, !48, !49, !50, !42, !43, !44, !45, !57, !58, !59, !60}
!57 = distinct !{!57, !11, !"second level alias metadata"}
!58 = distinct !{!58, !11, !"second level alias metadata"}
!59 = distinct !{!59, !11, !"second level alias metadata"}
!60 = distinct !{!60, !11, !"second level alias metadata"}
!61 = !{!37, !11, !"second level alias metadata", !38, !39, !40}
!62 = !{!9, !6, !10, !12, !27, !28, !29, !30}
!63 = !{!47, !11, !"second level alias metadata", !48, !49, !50}
!64 = !{!9, !6, !10, !12, !27, !28, !29, !30, !37, !38, !39, !40, !32, !33, !34, !35}
!65 = !{!57, !11, !"second level alias metadata", !58, !59, !60}
!66 = !{!9, !6, !10, !12, !27, !28, !29, !30, !37, !38, !39, !40, !32, !33, !34, !35, !47, !48, !49, !50, !42, !43, !44, !45}
!67 = !{!68, !11, !"second level alias metadata", !69, !70, !71}
!68 = distinct !{!68, !11, !"second level alias metadata"}
!69 = distinct !{!69, !11, !"second level alias metadata"}
!70 = distinct !{!70, !11, !"second level alias metadata"}
!71 = distinct !{!71, !11, !"second level alias metadata"}
!72 = !{!9, !6, !10, !12, !27, !28, !29, !30, !37, !38, !39, !40, !32, !33, !34, !35, !47, !48, !49, !50, !42, !43, !44, !45, !57, !58, !59, !60, !52, !53, !54, !55}
