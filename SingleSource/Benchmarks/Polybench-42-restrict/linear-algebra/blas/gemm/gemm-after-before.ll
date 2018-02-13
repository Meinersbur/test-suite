; ModuleID = 'gemm-after.ll'
source_filename = "gemm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@polybench_papi_counters_threadid = local_unnamed_addr global i32 0, align 4
@polybench_program_total_flops = local_unnamed_addr global double 0.000000e+00, align 8
@.str = private unnamed_addr constant [12 x i8] c"tmp <= 10.0\00", align 1
@.str.1 = private unnamed_addr constant [31 x i8] c"../../../utilities/polybench.c\00", align 1
@__PRETTY_FUNCTION__.polybench_flush_cache = private unnamed_addr constant [29 x i8] c"void polybench_flush_cache()\00", align 1
@polybench_t_start = common local_unnamed_addr global double 0.000000e+00, align 8
@polybench_t_end = common local_unnamed_addr global double 0.000000e+00, align 8
@polybench_c_start = common local_unnamed_addr global i64 0, align 8
@polybench_c_end = common local_unnamed_addr global i64 0, align 8

; Function Attrs: nounwind uwtable
define void @polybench_flush_cache() local_unnamed_addr #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %call = tail call noalias i8* @calloc(i64 4194560, i64 8) #6
  %0 = bitcast i8* %call to double*
  br label %for.body

for.body:                                         ; preds = %for.body.for.body_crit_edge, %entry.split
  %1 = phi double [ 0.000000e+00, %entry.split ], [ %.pre, %for.body.for.body_crit_edge ]
  %indvars.iv = phi i64 [ 0, %entry.split ], [ %indvars.iv.next, %for.body.for.body_crit_edge ]
  %tmp.014 = phi double [ 0.000000e+00, %entry.split ], [ %add, %for.body.for.body_crit_edge ]
  %add = fadd double %tmp.014, %1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 4194560
  br i1 %exitcond, label %for.end, label %for.body.for.body_crit_edge

for.body.for.body_crit_edge:                      ; preds = %for.body
  %arrayidx.phi.trans.insert = getelementptr inbounds double, double* %0, i64 %indvars.iv.next
  %.pre = load double, double* %arrayidx.phi.trans.insert, align 8, !tbaa !2
  br label %for.body

for.end:                                          ; preds = %for.body
  %cmp2 = fcmp ugt double %add, 1.000000e+01
  br i1 %cmp2, label %cond.false, label %cond.end

cond.false:                                       ; preds = %for.end
  tail call void @__assert_fail(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0), i32 123, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @__PRETTY_FUNCTION__.polybench_flush_cache, i64 0, i64 0)) #7
  unreachable

cond.end:                                         ; preds = %for.end
  tail call void @free(i8* nonnull %call) #6
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #1

; Function Attrs: nounwind
declare noalias i8* @calloc(i64, i64) local_unnamed_addr #2

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) local_unnamed_addr #3

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #2

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #1

; Function Attrs: nounwind uwtable
define void @polybench_prepare_instruments() local_unnamed_addr #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %call.i = tail call noalias i8* @calloc(i64 4194560, i64 8) #6
  %0 = bitcast i8* %call.i to double*
  br label %for.body.for.body_crit_edge.i

for.body.for.body_crit_edge.i:                    ; preds = %entry.split, %for.body.for.body_crit_edge.i
  %indvars.iv.next.i2 = phi i64 [ 1, %entry.split ], [ %indvars.iv.next.i, %for.body.for.body_crit_edge.i ]
  %add.i1 = phi double [ 0.000000e+00, %entry.split ], [ %add.i, %for.body.for.body_crit_edge.i ]
  %arrayidx.phi.trans.insert.i = getelementptr inbounds double, double* %0, i64 %indvars.iv.next.i2
  %.pre.i = load double, double* %arrayidx.phi.trans.insert.i, align 8, !tbaa !2
  %add.i = fadd double %.pre.i, %add.i1
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.next.i2, 1
  %exitcond.i = icmp eq i64 %indvars.iv.next.i, 4194560
  br i1 %exitcond.i, label %for.end.i, label %for.body.for.body_crit_edge.i

for.end.i:                                        ; preds = %for.body.for.body_crit_edge.i
  %cmp2.i = fcmp ugt double %add.i, 1.000000e+01
  br i1 %cmp2.i, label %cond.false.i, label %polybench_flush_cache.exit

cond.false.i:                                     ; preds = %for.end.i
  tail call void @__assert_fail(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0), i32 123, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @__PRETTY_FUNCTION__.polybench_flush_cache, i64 0, i64 0)) #7
  unreachable

polybench_flush_cache.exit:                       ; preds = %for.end.i
  tail call void @free(i8* nonnull %call.i) #6
  ret void
}

; Function Attrs: nounwind uwtable
define void @polybench_timer_start() local_unnamed_addr #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %call.i.i = tail call noalias i8* @calloc(i64 4194560, i64 8) #6
  %0 = bitcast i8* %call.i.i to double*
  br label %for.body.for.body_crit_edge.i.i

for.body.for.body_crit_edge.i.i:                  ; preds = %for.body.for.body_crit_edge.i.i, %entry.split
  %indvars.iv.next.i2.i = phi i64 [ 1, %entry.split ], [ %indvars.iv.next.i.i, %for.body.for.body_crit_edge.i.i ]
  %add.i1.i = phi double [ 0.000000e+00, %entry.split ], [ %add.i.i, %for.body.for.body_crit_edge.i.i ]
  %arrayidx.phi.trans.insert.i.i = getelementptr inbounds double, double* %0, i64 %indvars.iv.next.i2.i
  %.pre.i.i = load double, double* %arrayidx.phi.trans.insert.i.i, align 8, !tbaa !2
  %add.i.i = fadd double %add.i1.i, %.pre.i.i
  %indvars.iv.next.i.i = add nuw nsw i64 %indvars.iv.next.i2.i, 1
  %exitcond.i.i = icmp eq i64 %indvars.iv.next.i.i, 4194560
  br i1 %exitcond.i.i, label %for.end.i.i, label %for.body.for.body_crit_edge.i.i

for.end.i.i:                                      ; preds = %for.body.for.body_crit_edge.i.i
  %cmp2.i.i = fcmp ugt double %add.i.i, 1.000000e+01
  br i1 %cmp2.i.i, label %cond.false.i.i, label %polybench_prepare_instruments.exit

cond.false.i.i:                                   ; preds = %for.end.i.i
  tail call void @__assert_fail(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0), i32 123, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @__PRETTY_FUNCTION__.polybench_flush_cache, i64 0, i64 0)) #7
  unreachable

polybench_prepare_instruments.exit:               ; preds = %for.end.i.i
  tail call void @free(i8* nonnull %call.i.i) #6
  store double 0.000000e+00, double* @polybench_t_start, align 8, !tbaa !2
  ret void
}

; Function Attrs: norecurse nounwind uwtable
define void @polybench_timer_stop() local_unnamed_addr #4 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  store double 0.000000e+00, double* @polybench_t_end, align 8, !tbaa !2
  ret void
}

; Function Attrs: norecurse nounwind readnone uwtable
define void @polybench_timer_print() local_unnamed_addr #5 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  ret void
}

; Function Attrs: nounwind uwtable
define void @polybench_free_data(i8* nocapture %ptr) local_unnamed_addr #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  tail call void @free(i8* %ptr) #6
  ret void
}

; Function Attrs: nounwind uwtable
define i8* @polybench_alloc_data(i64 %n, i32 %elt_size) local_unnamed_addr #0 {
entry:
  %ret.i = alloca i8*, align 8
  br label %entry.split

entry.split:                                      ; preds = %entry
  %conv = sext i32 %elt_size to i64
  %mul = mul i64 %conv, %n
  %0 = bitcast i8** %ret.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %0) #6
  store i8* null, i8** %ret.i, align 8, !tbaa !6
  %call.i = call i32 @posix_memalign(i8** nonnull %ret.i, i64 4096, i64 %mul) #6
  %1 = load i8*, i8** %ret.i, align 8, !tbaa !6
  %tobool.i = icmp eq i8* %1, null
  %tobool2.i = icmp ne i32 %call.i, 0
  %or.cond.i = or i1 %tobool2.i, %tobool.i
  br i1 %or.cond.i, label %if.then.i, label %xmalloc.exit

if.then.i:                                        ; preds = %entry.split
  call void @exit(i32 1) #7
  unreachable

xmalloc.exit:                                     ; preds = %entry.split
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %0) #6
  ret i8* %1
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %Packed_B.i = alloca [256 x [384 x [4 x double]]], align 64
  %Packed_A.i = alloca [16 x [384 x [4 x double]]], align 64
  %ret.i.i8 = alloca i8*, align 8
  %ret.i.i1 = alloca i8*, align 8
  %ret.i.i = alloca i8*, align 8
  br label %entry.split

entry.split:                                      ; preds = %entry
  %0 = bitcast i8** %ret.i.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %0) #6
  store i8* null, i8** %ret.i.i, align 8, !tbaa !6
  %call.i.i = call i32 @posix_memalign(i8** nonnull %ret.i.i, i64 4096, i64 36800000) #6
  %1 = load i8*, i8** %ret.i.i, align 8, !tbaa !6
  %tobool.i.i = icmp eq i8* %1, null
  %tobool2.i.i = icmp ne i32 %call.i.i, 0
  %or.cond.i.i = or i1 %tobool2.i.i, %tobool.i.i
  br i1 %or.cond.i.i, label %if.then.i.i, label %polybench_alloc_data.exit

if.then.i.i:                                      ; preds = %entry.split
  call void @exit(i32 1) #7
  unreachable

polybench_alloc_data.exit:                        ; preds = %entry.split
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %0) #6
  %2 = bitcast i8** %ret.i.i1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %2) #6
  store i8* null, i8** %ret.i.i1, align 8, !tbaa !6
  %call.i.i2 = call i32 @posix_memalign(i8** nonnull %ret.i.i1, i64 4096, i64 41600000) #6
  %3 = load i8*, i8** %ret.i.i1, align 8, !tbaa !6
  %tobool.i.i3 = icmp eq i8* %3, null
  %tobool2.i.i4 = icmp ne i32 %call.i.i2, 0
  %or.cond.i.i5 = or i1 %tobool2.i.i4, %tobool.i.i3
  br i1 %or.cond.i.i5, label %if.then.i.i6, label %polybench_alloc_data.exit7

if.then.i.i6:                                     ; preds = %polybench_alloc_data.exit
  call void @exit(i32 1) #7
  unreachable

polybench_alloc_data.exit7:                       ; preds = %polybench_alloc_data.exit
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %2) #6
  %4 = bitcast i8** %ret.i.i8 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %4) #6
  store i8* null, i8** %ret.i.i8, align 8, !tbaa !6
  %call.i.i9 = call i32 @posix_memalign(i8** nonnull %ret.i.i8, i64 4096, i64 47840000) #6
  %5 = load i8*, i8** %ret.i.i8, align 8, !tbaa !6
  %tobool.i.i10 = icmp eq i8* %5, null
  %tobool2.i.i11 = icmp ne i32 %call.i.i9, 0
  %or.cond.i.i12 = or i1 %tobool2.i.i11, %tobool.i.i10
  br i1 %or.cond.i.i12, label %if.then.i.i13, label %polybench_alloc_data.exit14

if.then.i.i13:                                    ; preds = %polybench_alloc_data.exit7
  call void @exit(i32 1) #7
  unreachable

polybench_alloc_data.exit14:                      ; preds = %polybench_alloc_data.exit7
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %4) #6
  %arraydecay = bitcast i8* %1 to [2300 x double]*
  %arraydecay3 = bitcast i8* %3 to [2600 x double]*
  br label %for.cond1.preheader.i

for.cond1.preheader.i:                            ; preds = %for.inc7.i, %polybench_alloc_data.exit14
  %indvars.iv124.i = phi i64 [ %indvars.iv.next125.i, %for.inc7.i ], [ 0, %polybench_alloc_data.exit14 ]
  br label %for.body3.i

for.body3.i:                                      ; preds = %for.body3.i, %for.cond1.preheader.i
  %indvars.iv118.i = phi i64 [ %indvars.iv.next119.i, %for.body3.i ], [ 0, %for.cond1.preheader.i ]
  %6 = mul nuw nsw i64 %indvars.iv118.i, %indvars.iv124.i
  %7 = add nuw nsw i64 %6, 1
  %8 = trunc i64 %7 to i32
  %rem.i = srem i32 %8, 2000
  %conv.i = sitofp i32 %rem.i to double
  %div.i = fdiv double %conv.i, 2.000000e+03
  %arrayidx6.i = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay, i64 %indvars.iv124.i, i64 %indvars.iv118.i
  store double %div.i, double* %arrayidx6.i, align 8, !tbaa !2, !alias.scope !8, !noalias !11
  %indvars.iv.next119.i = add nuw nsw i64 %indvars.iv118.i, 1
  %exitcond123.i = icmp eq i64 %indvars.iv.next119.i, 2300
  br i1 %exitcond123.i, label %for.inc7.i, label %for.body3.i

for.inc7.i:                                       ; preds = %for.body3.i
  %indvars.iv.next125.i = add nuw nsw i64 %indvars.iv124.i, 1
  %exitcond127.i = icmp eq i64 %indvars.iv.next125.i, 2000
  br i1 %exitcond127.i, label %for.cond14.preheader.i.preheader, label %for.cond1.preheader.i

for.cond14.preheader.i.preheader:                 ; preds = %for.inc7.i
  %arraydecay4 = bitcast i8* %5 to [2300 x double]*
  br label %for.cond14.preheader.i

for.cond14.preheader.i:                           ; preds = %for.cond14.preheader.i.preheader, %for.inc31.i
  %indvars.iv114.i = phi i64 [ %indvars.iv.next115.i, %for.inc31.i ], [ 0, %for.cond14.preheader.i.preheader ]
  br label %for.body17.i

for.body17.i:                                     ; preds = %for.body17.i, %for.cond14.preheader.i
  %indvars.iv109.i = phi i64 [ %indvars.iv.next110.i, %for.body17.i ], [ 0, %for.cond14.preheader.i ]
  %indvars.iv.next110.i = add nuw nsw i64 %indvars.iv109.i, 1
  %9 = mul nuw nsw i64 %indvars.iv.next110.i, %indvars.iv114.i
  %10 = trunc i64 %9 to i32
  %rem20.i = srem i32 %10, 2600
  %conv21.i = sitofp i32 %rem20.i to double
  %div23.i = fdiv double %conv21.i, 2.600000e+03
  %arrayidx27.i = getelementptr inbounds [2600 x double], [2600 x double]* %arraydecay3, i64 %indvars.iv114.i, i64 %indvars.iv109.i
  store double %div23.i, double* %arrayidx27.i, align 8, !tbaa !2, !alias.scope !14, !noalias !15
  %exitcond113.i = icmp eq i64 %indvars.iv.next110.i, 2600
  br i1 %exitcond113.i, label %for.inc31.i, label %for.body17.i

for.inc31.i:                                      ; preds = %for.body17.i
  %indvars.iv.next115.i = add nuw nsw i64 %indvars.iv114.i, 1
  %exitcond117.i = icmp eq i64 %indvars.iv.next115.i, 2000
  br i1 %exitcond117.i, label %for.cond38.preheader.i, label %for.cond14.preheader.i

for.cond38.preheader.i:                           ; preds = %for.inc31.i, %for.inc55.i
  %indvars.iv105.i = phi i64 [ %indvars.iv.next106.i, %for.inc55.i ], [ 0, %for.inc31.i ]
  br label %for.body41.i

for.body41.i:                                     ; preds = %for.body41.i, %for.cond38.preheader.i
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %for.body41.i ], [ 0, %for.cond38.preheader.i ]
  %11 = add nuw nsw i64 %indvars.iv.i, 2
  %12 = mul nuw nsw i64 %11, %indvars.iv105.i
  %13 = trunc i64 %12 to i32
  %rem44.i = srem i32 %13, 2300
  %conv45.i = sitofp i32 %rem44.i to double
  %div47.i = fdiv double %conv45.i, 2.300000e+03
  %arrayidx51.i = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay4, i64 %indvars.iv105.i, i64 %indvars.iv.i
  store double %div47.i, double* %arrayidx51.i, align 8, !tbaa !2, !alias.scope !16, !noalias !17
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  %exitcond.i = icmp eq i64 %indvars.iv.next.i, 2300
  br i1 %exitcond.i, label %for.inc55.i, label %for.body41.i

for.inc55.i:                                      ; preds = %for.body41.i
  %indvars.iv.next106.i = add nuw nsw i64 %indvars.iv105.i, 1
  %exitcond108.i = icmp eq i64 %indvars.iv.next106.i, 2600
  br i1 %exitcond108.i, label %init_array.exit, label %for.cond38.preheader.i

init_array.exit:                                  ; preds = %for.inc55.i
  %14 = bitcast [256 x [384 x [4 x double]]]* %Packed_B.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 3145728, i8* nonnull %14)
  %15 = bitcast [16 x [384 x [4 x double]]]* %Packed_A.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 196608, i8* nonnull %15)
  br label %polly.loop_header.i

polly.loop_header.i:                              ; preds = %polly.loop_exit77.i, %init_array.exit
  %polly.indvar.i = phi i64 [ 0, %init_array.exit ], [ %polly.indvar_next.i, %polly.loop_exit77.i ]
  %16 = shl nsw i64 %polly.indvar.i, 5
  %17 = sub nuw nsw i64 2000, %16
  %18 = add nsw i64 %17, -1
  %19 = icmp slt i64 %18, 31
  %20 = select i1 %19, i64 %18, i64 31
  %polly.loop_guard86.i = icmp sgt i64 %20, -1
  br i1 %polly.loop_guard86.i, label %polly.loop_header75.us.i, label %polly.loop_exit77.i

polly.loop_header75.us.i:                         ; preds = %polly.loop_header.i, %polly.loop_exit85.loopexit.us.i
  %polly.indvar79.us.i = phi i64 [ %polly.indvar_next80.us.i, %polly.loop_exit85.loopexit.us.i ], [ 0, %polly.loop_header.i ]
  %21 = shl nsw i64 %polly.indvar79.us.i, 5
  %22 = sub nuw nsw i64 2300, %21
  %23 = add nsw i64 %22, -1
  %24 = icmp slt i64 %23, 31
  %25 = select i1 %24, i64 %23, i64 31
  %polly.loop_guard94.us.i = icmp sgt i64 %25, -1
  br i1 %polly.loop_guard94.us.i, label %polly.loop_header83.us.us.i, label %polly.loop_exit85.loopexit.us.i

polly.loop_exit85.loopexit.us.i:                  ; preds = %polly.loop_exit93.loopexit.us.us.i, %polly.loop_header75.us.i
  %polly.indvar_next80.us.i = add nuw nsw i64 %polly.indvar79.us.i, 1
  %exitcond57.i = icmp eq i64 %polly.indvar_next80.us.i, 72
  br i1 %exitcond57.i, label %polly.loop_exit77.i, label %polly.loop_header75.us.i

polly.loop_header83.us.us.i:                      ; preds = %polly.loop_header75.us.i, %polly.loop_exit93.loopexit.us.us.i
  %polly.indvar87.us.us.i = phi i64 [ %polly.indvar_next88.us.us.i, %polly.loop_exit93.loopexit.us.us.i ], [ 0, %polly.loop_header75.us.i ]
  %26 = add nuw nsw i64 %polly.indvar87.us.us.i, %16
  br label %polly.loop_header91.us.us.i

polly.loop_exit93.loopexit.us.us.i:               ; preds = %polly.loop_header91.us.us.i
  %polly.indvar_next88.us.us.i = add nuw nsw i64 %polly.indvar87.us.us.i, 1
  %polly.loop_cond89.us.us.i = icmp slt i64 %polly.indvar87.us.us.i, %20
  br i1 %polly.loop_cond89.us.us.i, label %polly.loop_header83.us.us.i, label %polly.loop_exit85.loopexit.us.i

polly.loop_header91.us.us.i:                      ; preds = %polly.loop_header91.us.us.i, %polly.loop_header83.us.us.i
  %polly.indvar95.us.us.i = phi i64 [ %polly.indvar_next96.us.us.i, %polly.loop_header91.us.us.i ], [ 0, %polly.loop_header83.us.us.i ]
  %27 = add nuw nsw i64 %polly.indvar95.us.us.i, %21
  %scevgep.us.us.i = getelementptr [2300 x double], [2300 x double]* %arraydecay, i64 %26, i64 %27
  %_p_scalar_.us.us.i = load double, double* %scevgep.us.us.i, align 8, !alias.scope !18, !noalias !23
  %p_mul.us.us.i = fmul double %_p_scalar_.us.us.i, 1.200000e+00
  store double %p_mul.us.us.i, double* %scevgep.us.us.i, align 8, !alias.scope !18, !noalias !23
  %polly.indvar_next96.us.us.i = add nuw nsw i64 %polly.indvar95.us.us.i, 1
  %polly.loop_cond97.us.us.i = icmp slt i64 %polly.indvar95.us.us.i, %25
  br i1 %polly.loop_cond97.us.us.i, label %polly.loop_header91.us.us.i, label %polly.loop_exit93.loopexit.us.us.i

polly.loop_exit77.i:                              ; preds = %polly.loop_exit85.loopexit.us.i, %polly.loop_header.i
  %polly.indvar_next.i = add nuw nsw i64 %polly.indvar.i, 1
  %exitcond58.i = icmp eq i64 %polly.indvar_next.i, 63
  br i1 %exitcond58.i, label %polly.loop_header100.i, label %polly.loop_header.i

polly.loop_header100.i:                           ; preds = %polly.loop_exit77.i, %polly.loop_exit110.i
  %polly.indvar104.i = phi i64 [ %polly.indvar_next105.i, %polly.loop_exit110.i ], [ 0, %polly.loop_exit77.i ]
  %28 = shl nsw i64 %polly.indvar104.i, 10
  %29 = or i64 %28, 1023
  %30 = icmp slt i64 %29, 2299
  %31 = select i1 %30, i64 %29, i64 2299
  %polly.loop_guard127.i = icmp sgt i64 %28, %31
  %32 = mul nsw i64 %polly.indvar104.i, -256
  %33 = icmp eq i64 %polly.indvar104.i, 0
  %34 = add nsw i64 %32, 574
  %35 = icmp slt i64 %34, 255
  %36 = select i1 %35, i64 %34, i64 255
  %polly.loop_guard175.i = icmp slt i64 %36, 0
  br label %polly.loop_header108.i

polly.loop_exit110.i:                             ; preds = %polly.loop_exit137.i
  %polly.indvar_next105.i = add nuw nsw i64 %polly.indvar104.i, 1
  %exitcond55.i = icmp eq i64 %polly.indvar_next105.i, 3
  br i1 %exitcond55.i, label %kernel_gemm.exit, label %polly.loop_header100.i

polly.loop_header108.i:                           ; preds = %polly.loop_exit137.i, %polly.loop_header100.i
  %polly.indvar112.i = phi i64 [ %polly.indvar_next113.i, %polly.loop_exit137.i ], [ 0, %polly.loop_header100.i ]
  %37 = mul nuw nsw i64 %polly.indvar112.i, 384
  %38 = add nuw nsw i64 %37, 383
  %39 = icmp slt i64 %38, 2599
  %40 = select i1 %39, i64 %38, i64 2599
  %polly.loop_guard119.i = icmp sle i64 %37, %40
  br i1 %polly.loop_guard119.i, label %polly.loop_header116.preheader.i, label %polly.loop_header135.preheader.i

polly.loop_header116.preheader.i:                 ; preds = %polly.loop_header108.i
  %41 = sub nsw i64 %32, %polly.indvar112.i
  br i1 %polly.loop_guard127.i, label %polly.loop_header135.preheader.i, label %polly.loop_header116.i

polly.loop_header135.preheader.i:                 ; preds = %polly.loop_exit126.i, %polly.loop_header116.preheader.i, %polly.loop_header108.i
  %42 = sub nuw nsw i64 2600, %37
  %43 = add nsw i64 %42, -1
  %44 = icmp slt i64 %43, 383
  %45 = select i1 %44, i64 %43, i64 383
  %polly.loop_guard192.i = icmp sgt i64 %45, -1
  br label %polly.loop_header135.i

polly.loop_exit137.i:                             ; preds = %polly.merge578.i
  %polly.indvar_next113.i = add nuw nsw i64 %polly.indvar112.i, 1
  %exitcond54.i = icmp eq i64 %polly.indvar_next113.i, 7
  br i1 %exitcond54.i, label %polly.loop_exit110.i, label %polly.loop_header108.i

polly.loop_header116.i:                           ; preds = %polly.loop_header116.preheader.i, %polly.loop_exit126.i
  %polly.indvar120.i = phi i64 [ %polly.indvar_next121.i, %polly.loop_exit126.i ], [ %37, %polly.loop_header116.preheader.i ]
  %polly.access.mul.B.i = mul nuw nsw i64 %polly.indvar120.i, 2300
  br label %polly.loop_header124.i

polly.loop_exit126.i:                             ; preds = %polly.loop_header124.i
  %polly.indvar_next121.i = add nuw nsw i64 %polly.indvar120.i, 1
  %polly.loop_cond122.i = icmp slt i64 %polly.indvar120.i, %40
  br i1 %polly.loop_cond122.i, label %polly.loop_header116.i, label %polly.loop_header135.preheader.i

polly.loop_header124.i:                           ; preds = %polly.loop_header124.i, %polly.loop_header116.i
  %polly.indvar128.i = phi i64 [ %polly.indvar_next129.i, %polly.loop_header124.i ], [ %28, %polly.loop_header116.i ]
  %polly.access.add.B.i = add nuw nsw i64 %polly.indvar128.i, %polly.access.mul.B.i
  %polly.access.B.i = getelementptr [2300 x double], [2300 x double]* %arraydecay4, i64 0, i64 %polly.access.add.B.i
  %46 = bitcast double* %polly.access.B.i to i64*
  %polly.access.B.load2.i = load i64, i64* %46, align 8, !alias.scope !31, !noalias !32
  %pexp.p_div_q.i = lshr i64 %polly.indvar128.i, 2
  %tmp.i = add i64 %41, %pexp.p_div_q.i
  %tmp3.i = mul i64 %tmp.i, 384
  %polly.access.add.Packed_B.i = add i64 %tmp3.i, %polly.indvar120.i
  %polly.access.mul.Packed_B131.i = shl nsw i64 %polly.access.add.Packed_B.i, 2
  %pexp.pdiv_r.i = and i64 %polly.indvar128.i, 3
  %polly.access.add.Packed_B132.i = or i64 %polly.access.mul.Packed_B131.i, %pexp.pdiv_r.i
  %polly.access.Packed_B.i = getelementptr [256 x [384 x [4 x double]]], [256 x [384 x [4 x double]]]* %Packed_B.i, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B132.i
  %47 = bitcast double* %polly.access.Packed_B.i to i64*
  store i64 %polly.access.B.load2.i, i64* %47, align 8, !noalias !33
  %polly.indvar_next129.i = add nuw nsw i64 %polly.indvar128.i, 1
  %polly.loop_cond130.i = icmp slt i64 %polly.indvar128.i, %31
  br i1 %polly.loop_cond130.i, label %polly.loop_header124.i, label %polly.loop_exit126.i

polly.loop_header135.i:                           ; preds = %polly.merge578.i, %polly.loop_header135.preheader.i
  %polly.indvar139.i = phi i64 [ %polly.indvar_next140.i, %polly.merge578.i ], [ 0, %polly.loop_header135.preheader.i ]
  %48 = shl nsw i64 %polly.indvar139.i, 6
  br i1 %33, label %polly.then144.i, label %polly.cond166.i

polly.cond166.i:                                  ; preds = %polly.loop_exit157.loopexit.us.i, %polly.loop_header147.preheader.i, %polly.then144.i, %polly.loop_header135.i
  br i1 %polly.loop_guard175.i, label %polly.merge578.i, label %polly.loop_header172.preheader.i

polly.merge578.i:                                 ; preds = %polly.merge528.i, %polly.cond166.i
  %polly.indvar_next140.i = add nuw nsw i64 %polly.indvar139.i, 1
  %exitcond.i15 = icmp eq i64 %polly.indvar_next140.i, 32
  br i1 %exitcond.i15, label %polly.loop_exit137.i, label %polly.loop_header135.i

polly.then144.i:                                  ; preds = %polly.loop_header135.i
  %49 = or i64 %48, 63
  %50 = icmp slt i64 %49, 1999
  %51 = select i1 %50, i64 %49, i64 1999
  %polly.loop_guard150.i = icmp sgt i64 %48, %51
  br i1 %polly.loop_guard150.i, label %polly.cond166.i, label %polly.loop_header147.preheader.i

polly.loop_header147.preheader.i:                 ; preds = %polly.then144.i
  %52 = mul nsw i64 %polly.indvar139.i, -16
  %53 = sub nsw i64 %52, %polly.indvar112.i
  br i1 %polly.loop_guard119.i, label %polly.loop_header147.us.i, label %polly.cond166.i

polly.loop_header147.us.i:                        ; preds = %polly.loop_header147.preheader.i, %polly.loop_exit157.loopexit.us.i
  %polly.indvar151.us.i = phi i64 [ %polly.indvar_next152.us.i, %polly.loop_exit157.loopexit.us.i ], [ %48, %polly.loop_header147.preheader.i ]
  %polly.access.mul.A.us.i = mul nuw nsw i64 %polly.indvar151.us.i, 2600
  %pexp.p_div_q162.us.i = lshr i64 %polly.indvar151.us.i, 2
  %tmp5.us.i = add i64 %53, %pexp.p_div_q162.us.i
  %tmp6.us.i = mul i64 %tmp5.us.i, 384
  %pexp.pdiv_r164.us.i = and i64 %polly.indvar151.us.i, 3
  br label %polly.loop_header155.us.i

polly.loop_header155.us.i:                        ; preds = %polly.loop_header155.us.i, %polly.loop_header147.us.i
  %polly.indvar159.us.i = phi i64 [ %polly.indvar_next160.us.i, %polly.loop_header155.us.i ], [ %37, %polly.loop_header147.us.i ]
  %polly.access.add.A.us.i = add nuw nsw i64 %polly.indvar159.us.i, %polly.access.mul.A.us.i
  %polly.access.A.us.i = getelementptr [2600 x double], [2600 x double]* %arraydecay3, i64 0, i64 %polly.access.add.A.us.i
  %54 = bitcast double* %polly.access.A.us.i to i64*
  %polly.access.A.load1.us.i = load i64, i64* %54, align 8, !alias.scope !34, !noalias !35
  %polly.access.add.Packed_A.us.i = add i64 %polly.indvar159.us.i, %tmp6.us.i
  %polly.access.mul.Packed_A163.us.i = shl nsw i64 %polly.access.add.Packed_A.us.i, 2
  %polly.access.add.Packed_A165.us.i = or i64 %polly.access.mul.Packed_A163.us.i, %pexp.pdiv_r164.us.i
  %polly.access.Packed_A.us.i = getelementptr [16 x [384 x [4 x double]]], [16 x [384 x [4 x double]]]* %Packed_A.i, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A165.us.i
  %55 = bitcast double* %polly.access.Packed_A.us.i to i64*
  store i64 %polly.access.A.load1.us.i, i64* %55, align 8, !noalias !33
  %polly.indvar_next160.us.i = add nuw nsw i64 %polly.indvar159.us.i, 1
  %polly.loop_cond161.us.i = icmp slt i64 %polly.indvar159.us.i, %40
  br i1 %polly.loop_cond161.us.i, label %polly.loop_header155.us.i, label %polly.loop_exit157.loopexit.us.i

polly.loop_exit157.loopexit.us.i:                 ; preds = %polly.loop_header155.us.i
  %polly.indvar_next152.us.i = add nuw nsw i64 %polly.indvar151.us.i, 1
  %polly.loop_cond153.us.i = icmp slt i64 %polly.indvar151.us.i, %51
  br i1 %polly.loop_cond153.us.i, label %polly.loop_header147.us.i, label %polly.cond166.i

polly.loop_header172.preheader.i:                 ; preds = %polly.cond166.i
  %56 = mul nsw i64 %polly.indvar139.i, -16
  %57 = add nsw i64 %56, 499
  %58 = icmp slt i64 %57, 15
  %59 = select i1 %58, i64 %57, i64 15
  %polly.loop_guard184.i = icmp sgt i64 %59, -1
  br label %polly.loop_header172.i

polly.loop_header172.i:                           ; preds = %polly.merge528.i, %polly.loop_header172.preheader.i
  %polly.indvar176.i = phi i64 [ %polly.indvar_next177.i, %polly.merge528.i ], [ 0, %polly.loop_header172.preheader.i ]
  br i1 %polly.loop_guard184.i, label %polly.loop_header181.preheader.i, label %polly.merge528.i

polly.loop_header181.preheader.i:                 ; preds = %polly.loop_header172.i
  %60 = shl nsw i64 %polly.indvar176.i, 2
  %61 = add nuw nsw i64 %60, %28
  %polly.access.mul.Packed_B204.i = mul nuw nsw i64 %polly.indvar176.i, 384
  %62 = or i64 %61, 1
  %63 = or i64 %61, 2
  %64 = or i64 %61, 3
  br label %polly.loop_header181.i

polly.merge528.i:                                 ; preds = %polly.loop_exit191.i, %polly.loop_header172.i
  %polly.indvar_next177.i = add nuw nsw i64 %polly.indvar176.i, 1
  %polly.loop_cond178.i = icmp slt i64 %polly.indvar176.i, %36
  br i1 %polly.loop_cond178.i, label %polly.loop_header172.i, label %polly.merge578.i

polly.loop_header181.i:                           ; preds = %polly.loop_exit191.i, %polly.loop_header181.preheader.i
  %polly.indvar185.i = phi i64 [ %polly.indvar_next186.i, %polly.loop_exit191.i ], [ 0, %polly.loop_header181.preheader.i ]
  br i1 %polly.loop_guard192.i, label %polly.loop_header189.preheader.i, label %polly.loop_exit191.i

polly.loop_header189.preheader.i:                 ; preds = %polly.loop_header181.i
  %65 = shl nsw i64 %polly.indvar185.i, 2
  %66 = add nuw nsw i64 %65, %48
  %polly.access.mul.Packed_A197.i = mul nuw nsw i64 %polly.indvar185.i, 384
  %scevgep210.i = getelementptr [2300 x double], [2300 x double]* %arraydecay, i64 %66, i64 %61
  %scevgep230.i = getelementptr [2300 x double], [2300 x double]* %arraydecay, i64 %66, i64 %62
  %scevgep251.i = getelementptr [2300 x double], [2300 x double]* %arraydecay, i64 %66, i64 %63
  %scevgep272.i = getelementptr [2300 x double], [2300 x double]* %arraydecay, i64 %66, i64 %64
  %67 = or i64 %66, 1
  %scevgep293.i = getelementptr [2300 x double], [2300 x double]* %arraydecay, i64 %67, i64 %61
  %scevgep314.i = getelementptr [2300 x double], [2300 x double]* %arraydecay, i64 %67, i64 %62
  %scevgep335.i = getelementptr [2300 x double], [2300 x double]* %arraydecay, i64 %67, i64 %63
  %scevgep356.i = getelementptr [2300 x double], [2300 x double]* %arraydecay, i64 %67, i64 %64
  %68 = or i64 %66, 2
  %scevgep377.i = getelementptr [2300 x double], [2300 x double]* %arraydecay, i64 %68, i64 %61
  %scevgep398.i = getelementptr [2300 x double], [2300 x double]* %arraydecay, i64 %68, i64 %62
  %scevgep419.i = getelementptr [2300 x double], [2300 x double]* %arraydecay, i64 %68, i64 %63
  %scevgep440.i = getelementptr [2300 x double], [2300 x double]* %arraydecay, i64 %68, i64 %64
  %69 = or i64 %66, 3
  %scevgep461.i = getelementptr [2300 x double], [2300 x double]* %arraydecay, i64 %69, i64 %61
  %scevgep482.i = getelementptr [2300 x double], [2300 x double]* %arraydecay, i64 %69, i64 %62
  %scevgep503.i = getelementptr [2300 x double], [2300 x double]* %arraydecay, i64 %69, i64 %63
  %scevgep524.i = getelementptr [2300 x double], [2300 x double]* %arraydecay, i64 %69, i64 %64
  %scevgep210.promoted.i = load double, double* %scevgep210.i, align 8, !alias.scope !36, !noalias !23
  %scevgep230.promoted.i = load double, double* %scevgep230.i, align 8, !alias.scope !38, !noalias !40
  %scevgep251.promoted.i = load double, double* %scevgep251.i, align 8, !alias.scope !41, !noalias !43
  %scevgep272.promoted.i = load double, double* %scevgep272.i, align 8, !alias.scope !44, !noalias !46
  %scevgep293.promoted.i = load double, double* %scevgep293.i, align 8, !alias.scope !47, !noalias !49
  %scevgep314.promoted.i = load double, double* %scevgep314.i, align 8, !alias.scope !50, !noalias !52
  %scevgep335.promoted.i = load double, double* %scevgep335.i, align 8, !alias.scope !53, !noalias !55
  %scevgep356.promoted.i = load double, double* %scevgep356.i, align 8, !alias.scope !56, !noalias !58
  %scevgep377.promoted.i = load double, double* %scevgep377.i, align 8, !alias.scope !59, !noalias !61
  %scevgep398.promoted.i = load double, double* %scevgep398.i, align 8, !alias.scope !62, !noalias !64
  %scevgep419.promoted.i = load double, double* %scevgep419.i, align 8, !alias.scope !65, !noalias !67
  %scevgep440.promoted.i = load double, double* %scevgep440.i, align 8, !alias.scope !68, !noalias !70
  %scevgep461.promoted.i = load double, double* %scevgep461.i, align 8, !alias.scope !71, !noalias !73
  %scevgep482.promoted.i = load double, double* %scevgep482.i, align 8, !alias.scope !74, !noalias !76
  %scevgep503.promoted.i = load double, double* %scevgep503.i, align 8, !alias.scope !77, !noalias !79
  %scevgep524.promoted.i = load double, double* %scevgep524.i, align 8, !alias.scope !80, !noalias !82
  br label %polly.loop_header189.i

polly.loop_exit191.loopexit.i:                    ; preds = %polly.loop_header189.i
  store double %p_add.i, double* %scevgep210.i, align 8, !alias.scope !36, !noalias !23
  store double %p_add232.i, double* %scevgep230.i, align 8, !alias.scope !38, !noalias !40
  store double %p_add253.i, double* %scevgep251.i, align 8, !alias.scope !41, !noalias !43
  store double %p_add274.i, double* %scevgep272.i, align 8, !alias.scope !44, !noalias !46
  store double %p_add295.i, double* %scevgep293.i, align 8, !alias.scope !47, !noalias !49
  store double %p_add316.i, double* %scevgep314.i, align 8, !alias.scope !50, !noalias !52
  store double %p_add337.i, double* %scevgep335.i, align 8, !alias.scope !53, !noalias !55
  store double %p_add358.i, double* %scevgep356.i, align 8, !alias.scope !56, !noalias !58
  store double %p_add379.i, double* %scevgep377.i, align 8, !alias.scope !59, !noalias !61
  store double %p_add400.i, double* %scevgep398.i, align 8, !alias.scope !62, !noalias !64
  store double %p_add421.i, double* %scevgep419.i, align 8, !alias.scope !65, !noalias !67
  store double %p_add442.i, double* %scevgep440.i, align 8, !alias.scope !68, !noalias !70
  store double %p_add463.i, double* %scevgep461.i, align 8, !alias.scope !71, !noalias !73
  store double %p_add484.i, double* %scevgep482.i, align 8, !alias.scope !74, !noalias !76
  store double %p_add505.i, double* %scevgep503.i, align 8, !alias.scope !77, !noalias !79
  store double %p_add526.i, double* %scevgep524.i, align 8, !alias.scope !80, !noalias !82
  br label %polly.loop_exit191.i

polly.loop_exit191.i:                             ; preds = %polly.loop_exit191.loopexit.i, %polly.loop_header181.i
  %polly.indvar_next186.i = add nuw nsw i64 %polly.indvar185.i, 1
  %polly.loop_cond187.i = icmp slt i64 %polly.indvar185.i, %59
  br i1 %polly.loop_cond187.i, label %polly.loop_header181.i, label %polly.merge528.i

polly.loop_header189.i:                           ; preds = %polly.loop_header189.i, %polly.loop_header189.preheader.i
  %p_add52625.i = phi double [ %p_add526.i, %polly.loop_header189.i ], [ %scevgep524.promoted.i, %polly.loop_header189.preheader.i ]
  %p_add50524.i = phi double [ %p_add505.i, %polly.loop_header189.i ], [ %scevgep503.promoted.i, %polly.loop_header189.preheader.i ]
  %p_add48423.i = phi double [ %p_add484.i, %polly.loop_header189.i ], [ %scevgep482.promoted.i, %polly.loop_header189.preheader.i ]
  %p_add46322.i = phi double [ %p_add463.i, %polly.loop_header189.i ], [ %scevgep461.promoted.i, %polly.loop_header189.preheader.i ]
  %p_add44221.i = phi double [ %p_add442.i, %polly.loop_header189.i ], [ %scevgep440.promoted.i, %polly.loop_header189.preheader.i ]
  %p_add42120.i = phi double [ %p_add421.i, %polly.loop_header189.i ], [ %scevgep419.promoted.i, %polly.loop_header189.preheader.i ]
  %p_add40019.i = phi double [ %p_add400.i, %polly.loop_header189.i ], [ %scevgep398.promoted.i, %polly.loop_header189.preheader.i ]
  %p_add37918.i = phi double [ %p_add379.i, %polly.loop_header189.i ], [ %scevgep377.promoted.i, %polly.loop_header189.preheader.i ]
  %p_add35817.i = phi double [ %p_add358.i, %polly.loop_header189.i ], [ %scevgep356.promoted.i, %polly.loop_header189.preheader.i ]
  %p_add33716.i = phi double [ %p_add337.i, %polly.loop_header189.i ], [ %scevgep335.promoted.i, %polly.loop_header189.preheader.i ]
  %p_add31615.i = phi double [ %p_add316.i, %polly.loop_header189.i ], [ %scevgep314.promoted.i, %polly.loop_header189.preheader.i ]
  %p_add29514.i = phi double [ %p_add295.i, %polly.loop_header189.i ], [ %scevgep293.promoted.i, %polly.loop_header189.preheader.i ]
  %p_add27413.i = phi double [ %p_add274.i, %polly.loop_header189.i ], [ %scevgep272.promoted.i, %polly.loop_header189.preheader.i ]
  %p_add25312.i = phi double [ %p_add253.i, %polly.loop_header189.i ], [ %scevgep251.promoted.i, %polly.loop_header189.preheader.i ]
  %p_add23211.i = phi double [ %p_add232.i, %polly.loop_header189.i ], [ %scevgep230.promoted.i, %polly.loop_header189.preheader.i ]
  %p_add10.i = phi double [ %p_add.i, %polly.loop_header189.i ], [ %scevgep210.promoted.i, %polly.loop_header189.preheader.i ]
  %polly.indvar193.i = phi i64 [ %polly.indvar_next194.i, %polly.loop_header189.i ], [ 0, %polly.loop_header189.preheader.i ]
  %polly.access.add.Packed_A198.i = add nuw nsw i64 %polly.indvar193.i, %polly.access.mul.Packed_A197.i
  %polly.access.mul.Packed_A199.i = shl nsw i64 %polly.access.add.Packed_A198.i, 2
  %polly.access.Packed_A201.i = getelementptr [16 x [384 x [4 x double]]], [16 x [384 x [4 x double]]]* %Packed_A.i, i64 0, i64 0, i64 0, i64 %polly.access.mul.Packed_A199.i
  %_p_scalar_202.i = load double, double* %polly.access.Packed_A201.i, align 32, !noalias !33
  %p_mul16.i = fmul double %_p_scalar_202.i, 1.500000e+00
  %polly.access.add.Packed_B205.i = add nuw nsw i64 %polly.indvar193.i, %polly.access.mul.Packed_B204.i
  %polly.access.mul.Packed_B206.i = shl nsw i64 %polly.access.add.Packed_B205.i, 2
  %polly.access.Packed_B208.i = getelementptr [256 x [384 x [4 x double]]], [256 x [384 x [4 x double]]]* %Packed_B.i, i64 0, i64 0, i64 0, i64 %polly.access.mul.Packed_B206.i
  %_p_scalar_209.i = load double, double* %polly.access.Packed_B208.i, align 32, !noalias !33
  %p_mul21.i = fmul double %p_mul16.i, %_p_scalar_209.i
  %p_add.i = fadd double %p_add10.i, %p_mul21.i
  %polly.access.add.Packed_B226.i = or i64 %polly.access.mul.Packed_B206.i, 1
  %polly.access.Packed_B227.i = getelementptr [256 x [384 x [4 x double]]], [256 x [384 x [4 x double]]]* %Packed_B.i, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B226.i
  %_p_scalar_228.i = load double, double* %polly.access.Packed_B227.i, align 8, !noalias !33
  %p_mul21229.i = fmul double %p_mul16.i, %_p_scalar_228.i
  %p_add232.i = fadd double %p_add23211.i, %p_mul21229.i
  %polly.access.add.Packed_B247.i = or i64 %polly.access.mul.Packed_B206.i, 2
  %polly.access.Packed_B248.i = getelementptr [256 x [384 x [4 x double]]], [256 x [384 x [4 x double]]]* %Packed_B.i, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B247.i
  %_p_scalar_249.i = load double, double* %polly.access.Packed_B248.i, align 16, !noalias !33
  %p_mul21250.i = fmul double %p_mul16.i, %_p_scalar_249.i
  %p_add253.i = fadd double %p_add25312.i, %p_mul21250.i
  %polly.access.add.Packed_B268.i = or i64 %polly.access.mul.Packed_B206.i, 3
  %polly.access.Packed_B269.i = getelementptr [256 x [384 x [4 x double]]], [256 x [384 x [4 x double]]]* %Packed_B.i, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_B268.i
  %_p_scalar_270.i = load double, double* %polly.access.Packed_B269.i, align 8, !noalias !33
  %p_mul21271.i = fmul double %p_mul16.i, %_p_scalar_270.i
  %p_add274.i = fadd double %p_add27413.i, %p_mul21271.i
  %polly.access.add.Packed_A281.i = or i64 %polly.access.mul.Packed_A199.i, 1
  %polly.access.Packed_A282.i = getelementptr [16 x [384 x [4 x double]]], [16 x [384 x [4 x double]]]* %Packed_A.i, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A281.i
  %_p_scalar_283.i = load double, double* %polly.access.Packed_A282.i, align 8, !noalias !33
  %p_mul16284.i = fmul double %_p_scalar_283.i, 1.500000e+00
  %p_mul21292.i = fmul double %_p_scalar_209.i, %p_mul16284.i
  %p_add295.i = fadd double %p_add29514.i, %p_mul21292.i
  %p_mul21313.i = fmul double %_p_scalar_228.i, %p_mul16284.i
  %p_add316.i = fadd double %p_add31615.i, %p_mul21313.i
  %p_mul21334.i = fmul double %_p_scalar_249.i, %p_mul16284.i
  %p_add337.i = fadd double %p_add33716.i, %p_mul21334.i
  %p_mul21355.i = fmul double %_p_scalar_270.i, %p_mul16284.i
  %p_add358.i = fadd double %p_add35817.i, %p_mul21355.i
  %polly.access.add.Packed_A365.i = or i64 %polly.access.mul.Packed_A199.i, 2
  %polly.access.Packed_A366.i = getelementptr [16 x [384 x [4 x double]]], [16 x [384 x [4 x double]]]* %Packed_A.i, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A365.i
  %_p_scalar_367.i = load double, double* %polly.access.Packed_A366.i, align 16, !noalias !33
  %p_mul16368.i = fmul double %_p_scalar_367.i, 1.500000e+00
  %p_mul21376.i = fmul double %_p_scalar_209.i, %p_mul16368.i
  %p_add379.i = fadd double %p_add37918.i, %p_mul21376.i
  %p_mul21397.i = fmul double %_p_scalar_228.i, %p_mul16368.i
  %p_add400.i = fadd double %p_add40019.i, %p_mul21397.i
  %p_mul21418.i = fmul double %_p_scalar_249.i, %p_mul16368.i
  %p_add421.i = fadd double %p_add42120.i, %p_mul21418.i
  %p_mul21439.i = fmul double %_p_scalar_270.i, %p_mul16368.i
  %p_add442.i = fadd double %p_add44221.i, %p_mul21439.i
  %polly.access.add.Packed_A449.i = or i64 %polly.access.mul.Packed_A199.i, 3
  %polly.access.Packed_A450.i = getelementptr [16 x [384 x [4 x double]]], [16 x [384 x [4 x double]]]* %Packed_A.i, i64 0, i64 0, i64 0, i64 %polly.access.add.Packed_A449.i
  %_p_scalar_451.i = load double, double* %polly.access.Packed_A450.i, align 8, !noalias !33
  %p_mul16452.i = fmul double %_p_scalar_451.i, 1.500000e+00
  %p_mul21460.i = fmul double %_p_scalar_209.i, %p_mul16452.i
  %p_add463.i = fadd double %p_add46322.i, %p_mul21460.i
  %p_mul21481.i = fmul double %_p_scalar_228.i, %p_mul16452.i
  %p_add484.i = fadd double %p_add48423.i, %p_mul21481.i
  %p_mul21502.i = fmul double %_p_scalar_249.i, %p_mul16452.i
  %p_add505.i = fadd double %p_add50524.i, %p_mul21502.i
  %p_mul21523.i = fmul double %_p_scalar_270.i, %p_mul16452.i
  %p_add526.i = fadd double %p_add52625.i, %p_mul21523.i
  %polly.indvar_next194.i = add nuw nsw i64 %polly.indvar193.i, 1
  %polly.loop_cond195.i = icmp slt i64 %polly.indvar193.i, %45
  br i1 %polly.loop_cond195.i, label %polly.loop_header189.i, label %polly.loop_exit191.loopexit.i

kernel_gemm.exit:                                 ; preds = %polly.loop_exit110.i
  call void @llvm.lifetime.end.p0i8(i64 3145728, i8* nonnull %14)
  call void @llvm.lifetime.end.p0i8(i64 196608, i8* nonnull %15)
  call void @free(i8* %1) #6
  call void @free(i8* %3) #6
  call void @free(i8* %5) #6
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @posix_memalign(i8**, i64, i64) local_unnamed_addr #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) local_unnamed_addr #3

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 5.0.0 (trunk 304791)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"double", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!7, !7, i64 0}
!7 = !{!"any pointer", !4, i64 0}
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
!18 = !{!19, !20, !"polly.alias.scope.MemRef0", !21}
!19 = distinct !{!19, !20, !"polly.alias.scope.MemRef0"}
!20 = distinct !{!20, !"polly.alias.scope.domain"}
!21 = distinct !{!21, !22, !"kernel_gemm: %C"}
!22 = distinct !{!22, !"kernel_gemm"}
!23 = !{!24, !25, !26, !27, !28, !29, !30}
!24 = distinct !{!24, !20, !"polly.alias.scope.Packed_A"}
!25 = distinct !{!25, !20, !"polly.alias.scope.MemRef1"}
!26 = distinct !{!26, !20, !"polly.alias.scope.MemRef3"}
!27 = distinct !{!27, !20, !"polly.alias.scope.MemRef4"}
!28 = distinct !{!28, !20, !"polly.alias.scope.MemRef2"}
!29 = distinct !{!29, !22, !"kernel_gemm: %A"}
!30 = distinct !{!30, !22, !"kernel_gemm: %B"}
!31 = !{!27, !20, !"polly.alias.scope.MemRef4", !30}
!32 = !{!24, !25, !26, !19, !28, !21, !29}
!33 = !{!21, !29, !30}
!34 = !{!28, !20, !"polly.alias.scope.MemRef2", !29}
!35 = !{!24, !25, !26, !19, !27, !21, !30}
!36 = !{!37, !19, !"second level alias metadata", !21}
!37 = distinct !{!37, !19, !"second level alias metadata"}
!38 = !{!39, !19, !"second level alias metadata", !21}
!39 = distinct !{!39, !19, !"second level alias metadata"}
!40 = !{!24, !25, !26, !27, !28, !37, !29, !30}
!41 = !{!42, !19, !"second level alias metadata", !21}
!42 = distinct !{!42, !19, !"second level alias metadata"}
!43 = !{!24, !25, !26, !27, !28, !37, !39, !29, !30}
!44 = !{!45, !19, !"second level alias metadata", !21}
!45 = distinct !{!45, !19, !"second level alias metadata"}
!46 = !{!24, !25, !26, !27, !28, !37, !39, !42, !29, !30}
!47 = !{!48, !19, !"second level alias metadata", !21}
!48 = distinct !{!48, !19, !"second level alias metadata"}
!49 = !{!24, !25, !26, !27, !28, !37, !39, !42, !45, !29, !30}
!50 = !{!51, !19, !"second level alias metadata", !21}
!51 = distinct !{!51, !19, !"second level alias metadata"}
!52 = !{!24, !25, !26, !27, !28, !37, !39, !42, !45, !48, !29, !30}
!53 = !{!54, !19, !"second level alias metadata", !21}
!54 = distinct !{!54, !19, !"second level alias metadata"}
!55 = !{!24, !25, !26, !27, !28, !37, !39, !42, !45, !48, !51, !29, !30}
!56 = !{!57, !19, !"second level alias metadata", !21}
!57 = distinct !{!57, !19, !"second level alias metadata"}
!58 = !{!24, !25, !26, !27, !28, !37, !39, !42, !45, !48, !51, !54, !29, !30}
!59 = !{!60, !19, !"second level alias metadata", !21}
!60 = distinct !{!60, !19, !"second level alias metadata"}
!61 = !{!24, !25, !26, !27, !28, !37, !39, !42, !45, !48, !51, !54, !57, !29, !30}
!62 = !{!63, !19, !"second level alias metadata", !21}
!63 = distinct !{!63, !19, !"second level alias metadata"}
!64 = !{!24, !25, !26, !27, !28, !37, !39, !42, !45, !48, !51, !54, !57, !60, !29, !30}
!65 = !{!66, !19, !"second level alias metadata", !21}
!66 = distinct !{!66, !19, !"second level alias metadata"}
!67 = !{!24, !25, !26, !27, !28, !37, !39, !42, !45, !48, !51, !54, !57, !60, !63, !29, !30}
!68 = !{!69, !19, !"second level alias metadata", !21}
!69 = distinct !{!69, !19, !"second level alias metadata"}
!70 = !{!24, !25, !26, !27, !28, !37, !39, !42, !45, !48, !51, !54, !57, !60, !63, !66, !29, !30}
!71 = !{!72, !19, !"second level alias metadata", !21}
!72 = distinct !{!72, !19, !"second level alias metadata"}
!73 = !{!24, !25, !26, !27, !28, !37, !39, !42, !45, !48, !51, !54, !57, !60, !63, !66, !69, !29, !30}
!74 = !{!75, !19, !"second level alias metadata", !21}
!75 = distinct !{!75, !19, !"second level alias metadata"}
!76 = !{!24, !25, !26, !27, !28, !37, !39, !42, !45, !48, !51, !54, !57, !60, !63, !66, !69, !72, !29, !30}
!77 = !{!78, !19, !"second level alias metadata", !21}
!78 = distinct !{!78, !19, !"second level alias metadata"}
!79 = !{!24, !25, !26, !27, !28, !37, !39, !42, !45, !48, !51, !54, !57, !60, !63, !66, !69, !72, !75, !29, !30}
!80 = !{!81, !19, !"second level alias metadata", !21}
!81 = distinct !{!81, !19, !"second level alias metadata"}
!82 = !{!24, !25, !26, !27, !28, !37, !39, !42, !45, !48, !51, !54, !57, !60, !63, !66, !69, !72, !75, !78, !29, !30}
