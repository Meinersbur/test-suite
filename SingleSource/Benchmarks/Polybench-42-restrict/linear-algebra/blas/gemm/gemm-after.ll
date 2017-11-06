; ModuleID = 'gemm.c'
source_filename = "gemm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@polybench_papi_counters_threadid = global i32 0, align 4
@polybench_program_total_flops = global double 0.000000e+00, align 8
@.str = private unnamed_addr constant [12 x i8] c"tmp <= 10.0\00", align 1
@.str.1 = private unnamed_addr constant [31 x i8] c"../../../utilities/polybench.c\00", align 1
@__PRETTY_FUNCTION__.polybench_flush_cache = private unnamed_addr constant [29 x i8] c"void polybench_flush_cache()\00", align 1
@polybench_t_start = common global double 0.000000e+00, align 8
@polybench_t_end = common global double 0.000000e+00, align 8
@.str.2 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@polybench_c_start = common global i64 0, align 8
@polybench_c_end = common global i64 0, align 8
@polybench_inter_array_padding_sz = internal global i64 0, align 8

; Function Attrs: nounwind uwtable
define void @polybench_flush_cache() #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %call = tail call noalias i8* @calloc(i64 4194560, i64 8) #6
  %0 = bitcast i8* %call to double*
  br label %for.body

for.body:                                         ; preds = %entry.split, %for.body
  %indvars.iv = phi i64 [ 0, %entry.split ], [ %indvars.iv.next, %for.body ]
  %tmp.014 = phi double [ 0.000000e+00, %entry.split ], [ %add, %for.body ]
  %arrayidx = getelementptr inbounds double, double* %0, i64 %indvars.iv
  %1 = load double, double* %arrayidx, align 8, !tbaa !2
  %add = fadd double %tmp.014, %1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp ne i64 %indvars.iv.next, 4194560
  br i1 %exitcond, label %for.body, label %for.end

for.end:                                          ; preds = %for.body
  %add.lcssa = phi double [ %add, %for.body ]
  %cmp2 = fcmp ugt double %add.lcssa, 1.000000e+01
  br i1 %cmp2, label %cond.false, label %cond.end

cond.false:                                       ; preds = %for.end
  tail call void @__assert_fail(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0), i32 123, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @__PRETTY_FUNCTION__.polybench_flush_cache, i64 0, i64 0)) #7
  unreachable

cond.end:                                         ; preds = %for.end
  tail call void @free(i8* %call) #6
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #1

; Function Attrs: nounwind
declare noalias i8* @calloc(i64, i64) #2

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #3

; Function Attrs: nounwind
declare void @free(i8* nocapture) #2

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #1

; Function Attrs: nounwind uwtable
define void @polybench_prepare_instruments() #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  tail call void @polybench_flush_cache()
  ret void
}

; Function Attrs: nounwind uwtable
define void @polybench_timer_start() #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  tail call void @polybench_prepare_instruments()
  %call = tail call double @rtclock()
  store double %call, double* @polybench_t_start, align 8, !tbaa !2
  ret void
}

; Function Attrs: nounwind uwtable
define void @polybench_timer_stop() #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %call = tail call double @rtclock()
  store double %call, double* @polybench_t_end, align 8, !tbaa !2
  ret void
}

; Function Attrs: nounwind uwtable
define void @polybench_timer_print() #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  ret void
}

; Function Attrs: nounwind uwtable
define void @polybench_free_data(i8* %ptr) #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  tail call void @free(i8* %ptr) #6
  ret void
}

; Function Attrs: nounwind uwtable
define i8* @polybench_alloc_data(i64 %n, i32 %elt_size) #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %conv = sext i32 %elt_size to i64
  %mul = mul i64 %conv, %n
  %call = tail call i8* @xmalloc(i64 %mul)
  ret i8* %call
}

; Function Attrs: nounwind uwtable
define internal i8* @xmalloc(i64 %alloc_sz) #0 {
entry:
  %ret = alloca i8*, align 8
  br label %entry.split

entry.split:                                      ; preds = %entry
  %0 = bitcast i8** %ret to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %0) #6
  store i8* null, i8** %ret, align 8, !tbaa !6
  %1 = load i64, i64* @polybench_inter_array_padding_sz, align 8, !tbaa !8
  %add1 = add i64 %1, %alloc_sz
  %call = call i32 @posix_memalign(i8** nonnull %ret, i64 4096, i64 %add1) #6
  %2 = load i8*, i8** %ret, align 8, !tbaa !6
  %tobool = icmp eq i8* %2, null
  %tobool2 = icmp ne i32 %call, 0
  %or.cond = or i1 %tobool2, %tobool
  br i1 %or.cond, label %if.then, label %if.end

if.then:                                          ; preds = %entry.split
  call void @exit(i32 1) #7
  unreachable

if.end:                                           ; preds = %entry.split
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %0) #6
  ret i8* %2
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %alpha = alloca double, align 8
  %beta = alloca double, align 8
  br label %entry.split

entry.split:                                      ; preds = %entry
  %0 = bitcast double* %alpha to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %0) #6
  %1 = bitcast double* %beta to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %1) #6
  %call = tail call i8* @polybench_alloc_data(i64 4600000, i32 8)
  %call1 = tail call i8* @polybench_alloc_data(i64 5200000, i32 8)
  %call2 = tail call i8* @polybench_alloc_data(i64 5980000, i32 8)
  %arraydecay = bitcast i8* %call to [2300 x double]*
  %arraydecay3 = bitcast i8* %call1 to [2600 x double]*
  %arraydecay4 = bitcast i8* %call2 to [2300 x double]*
  call void @init_array(i32 2000, i32 2300, i32 2600, double* nonnull %alpha, double* nonnull %beta, [2300 x double]* %arraydecay, [2600 x double]* %arraydecay3, [2300 x double]* %arraydecay4)
  %2 = load double, double* %alpha, align 8, !tbaa !2
  %3 = load double, double* %beta, align 8, !tbaa !2
  call void @kernel_gemm(i32 2000, i32 2300, i32 2600, double %2, double %3, [2300 x double]* %arraydecay, [2600 x double]* %arraydecay3, [2300 x double]* %arraydecay4)
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %cond.true, label %if.end51

cond.true:                                        ; preds = %entry.split
  %4 = load i8*, i8** %argv, align 8, !tbaa !6
  %5 = load i8, i8* %4, align 1, !tbaa !10
  %phitmp = icmp eq i8 %5, 0
  br i1 %phitmp, label %if.then49, label %if.end51

if.then49:                                        ; preds = %cond.true
  call void @print_array(i32 2000, i32 2300, [2300 x double]* %arraydecay)
  br label %if.end51

if.end51:                                         ; preds = %cond.true, %if.then49, %entry.split
  call void @free(i8* %call) #6
  call void @free(i8* %call1) #6
  call void @free(i8* %call2) #6
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %1) #6
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %0) #6
  ret i32 0
}

; Function Attrs: nounwind uwtable
define internal void @init_array(i32 %ni, i32 %nj, i32 %nk, double* %alpha, double* %beta, [2300 x double]* noalias %C, [2600 x double]* noalias %A, [2300 x double]* noalias %B) #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  store double 1.500000e+00, double* %alpha, align 8, !tbaa !2
  store double 1.200000e+00, double* %beta, align 8, !tbaa !2
  %cmp100 = icmp sgt i32 %ni, 0
  br i1 %cmp100, label %for.cond1.preheader.lr.ph, label %for.cond10.preheader

for.cond1.preheader.lr.ph:                        ; preds = %entry.split
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond1.preheader.lr.ph, %for.inc7
  %indvars.iv124 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next125, %for.inc7 ]
  %cmp298 = icmp sgt i32 %nj, 0
  br i1 %cmp298, label %for.body3.lr.ph, label %for.inc7

for.body3.lr.ph:                                  ; preds = %for.cond1.preheader
  br label %for.body3

for.cond.for.cond10.preheader_crit_edge:          ; preds = %for.inc7
  br label %for.cond10.preheader

for.cond10.preheader:                             ; preds = %for.cond.for.cond10.preheader_crit_edge, %entry.split
  %cmp1195 = icmp sgt i32 %ni, 0
  br i1 %cmp1195, label %for.cond14.preheader.lr.ph, label %for.cond34.preheader

for.cond14.preheader.lr.ph:                       ; preds = %for.cond10.preheader
  br label %for.cond14.preheader

for.body3:                                        ; preds = %for.body3.lr.ph, %for.body3
  %indvars.iv118 = phi i64 [ 0, %for.body3.lr.ph ], [ %indvars.iv.next119, %for.body3 ]
  %0 = mul nuw nsw i64 %indvars.iv118, %indvars.iv124
  %1 = add nuw nsw i64 %0, 1
  %2 = trunc i64 %1 to i32
  %rem = srem i32 %2, %ni
  %conv = sitofp i32 %rem to double
  %conv4 = sitofp i32 %ni to double
  %div = fdiv double %conv, %conv4
  %arrayidx6 = getelementptr inbounds [2300 x double], [2300 x double]* %C, i64 %indvars.iv124, i64 %indvars.iv118
  store double %div, double* %arrayidx6, align 8, !tbaa !2
  %indvars.iv.next119 = add nuw nsw i64 %indvars.iv118, 1
  %wide.trip.count122 = zext i32 %nj to i64
  %exitcond123 = icmp ne i64 %indvars.iv.next119, %wide.trip.count122
  br i1 %exitcond123, label %for.body3, label %for.cond1.for.inc7_crit_edge

for.cond1.for.inc7_crit_edge:                     ; preds = %for.body3
  br label %for.inc7

for.inc7:                                         ; preds = %for.cond1.for.inc7_crit_edge, %for.cond1.preheader
  %indvars.iv.next125 = add nuw nsw i64 %indvars.iv124, 1
  %wide.trip.count126 = zext i32 %ni to i64
  %exitcond127 = icmp ne i64 %indvars.iv.next125, %wide.trip.count126
  br i1 %exitcond127, label %for.cond1.preheader, label %for.cond.for.cond10.preheader_crit_edge

for.cond14.preheader:                             ; preds = %for.cond14.preheader.lr.ph, %for.inc31
  %indvars.iv114 = phi i64 [ 0, %for.cond14.preheader.lr.ph ], [ %indvars.iv.next115, %for.inc31 ]
  %cmp1593 = icmp sgt i32 %nk, 0
  br i1 %cmp1593, label %for.body17.lr.ph, label %for.inc31

for.body17.lr.ph:                                 ; preds = %for.cond14.preheader
  br label %for.body17

for.cond10.for.cond34.preheader_crit_edge:        ; preds = %for.inc31
  br label %for.cond34.preheader

for.cond34.preheader:                             ; preds = %for.cond10.for.cond34.preheader_crit_edge, %for.cond10.preheader
  %cmp3590 = icmp sgt i32 %nk, 0
  br i1 %cmp3590, label %for.cond38.preheader.lr.ph, label %for.end57

for.cond38.preheader.lr.ph:                       ; preds = %for.cond34.preheader
  br label %for.cond38.preheader

for.body17:                                       ; preds = %for.body17.lr.ph, %for.body17
  %indvars.iv109 = phi i64 [ 0, %for.body17.lr.ph ], [ %indvars.iv.next110, %for.body17 ]
  %indvars.iv.next110 = add nuw nsw i64 %indvars.iv109, 1
  %3 = mul nuw nsw i64 %indvars.iv.next110, %indvars.iv114
  %4 = trunc i64 %3 to i32
  %rem20 = srem i32 %4, %nk
  %conv21 = sitofp i32 %rem20 to double
  %conv22 = sitofp i32 %nk to double
  %div23 = fdiv double %conv21, %conv22
  %arrayidx27 = getelementptr inbounds [2600 x double], [2600 x double]* %A, i64 %indvars.iv114, i64 %indvars.iv109
  store double %div23, double* %arrayidx27, align 8, !tbaa !2
  %wide.trip.count112 = zext i32 %nk to i64
  %exitcond113 = icmp ne i64 %indvars.iv.next110, %wide.trip.count112
  br i1 %exitcond113, label %for.body17, label %for.cond14.for.inc31_crit_edge

for.cond14.for.inc31_crit_edge:                   ; preds = %for.body17
  br label %for.inc31

for.inc31:                                        ; preds = %for.cond14.for.inc31_crit_edge, %for.cond14.preheader
  %indvars.iv.next115 = add nuw nsw i64 %indvars.iv114, 1
  %wide.trip.count116 = zext i32 %ni to i64
  %exitcond117 = icmp ne i64 %indvars.iv.next115, %wide.trip.count116
  br i1 %exitcond117, label %for.cond14.preheader, label %for.cond10.for.cond34.preheader_crit_edge

for.cond38.preheader:                             ; preds = %for.cond38.preheader.lr.ph, %for.inc55
  %indvars.iv105 = phi i64 [ 0, %for.cond38.preheader.lr.ph ], [ %indvars.iv.next106, %for.inc55 ]
  %cmp3988 = icmp sgt i32 %nj, 0
  br i1 %cmp3988, label %for.body41.lr.ph, label %for.inc55

for.body41.lr.ph:                                 ; preds = %for.cond38.preheader
  br label %for.body41

for.body41:                                       ; preds = %for.body41.lr.ph, %for.body41
  %indvars.iv = phi i64 [ 0, %for.body41.lr.ph ], [ %indvars.iv.next, %for.body41 ]
  %5 = add nuw nsw i64 %indvars.iv, 2
  %6 = mul nuw nsw i64 %5, %indvars.iv105
  %7 = trunc i64 %6 to i32
  %rem44 = srem i32 %7, %nj
  %conv45 = sitofp i32 %rem44 to double
  %conv46 = sitofp i32 %nj to double
  %div47 = fdiv double %conv45, %conv46
  %arrayidx51 = getelementptr inbounds [2300 x double], [2300 x double]* %B, i64 %indvars.iv105, i64 %indvars.iv
  store double %div47, double* %arrayidx51, align 8, !tbaa !2
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %wide.trip.count = zext i32 %nj to i64
  %exitcond = icmp ne i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.body41, label %for.cond38.for.inc55_crit_edge

for.cond38.for.inc55_crit_edge:                   ; preds = %for.body41
  br label %for.inc55

for.inc55:                                        ; preds = %for.cond38.for.inc55_crit_edge, %for.cond38.preheader
  %indvars.iv.next106 = add nuw nsw i64 %indvars.iv105, 1
  %wide.trip.count107 = zext i32 %nk to i64
  %exitcond108 = icmp ne i64 %indvars.iv.next106, %wide.trip.count107
  br i1 %exitcond108, label %for.cond38.preheader, label %for.cond34.for.end57_crit_edge

for.cond34.for.end57_crit_edge:                   ; preds = %for.inc55
  br label %for.end57

for.end57:                                        ; preds = %for.cond34.for.end57_crit_edge, %for.cond34.preheader
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @kernel_gemm(i32 %ni, i32 %nj, i32 %nk, double %alpha, double %beta, [2300 x double]* noalias %C, [2600 x double]* noalias %A, [2300 x double]* noalias %B) #4 {
entry:
  %alpha.s2a = alloca double
  %beta.s2a = alloca double
  %Packed_B = alloca [256 x [384 x [4 x double]]], align 64
  %Packed_A = alloca [16 x [384 x [4 x double]]], align 64
  br label %polly.split_new_and_old

polly.split_new_and_old:                          ; preds = %entry
  %0 = sext i32 %nj to i64
  %1 = icmp sle i64 %0, 2300
  %2 = sext i32 %nk to i64
  %3 = icmp sle i64 %2, 2600
  %4 = and i1 %1, %3
  br i1 %4, label %polly.start, label %entry.split.pre_entry_bb

entry.split.pre_entry_bb:                         ; preds = %polly.split_new_and_old
  br label %entry.split

entry.split:                                      ; preds = %entry.split.pre_entry_bb
  %cmp59 = icmp sgt i32 %ni, 0
  br i1 %cmp59, label %for.cond1.preheader.lr.ph, label %for.end34.region_exiting

for.cond1.preheader.lr.ph:                        ; preds = %entry.split
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond1.preheader.lr.ph, %for.inc32
  %indvars.iv69 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next70, %for.inc32 ]
  %cmp253 = icmp sgt i32 %nj, 0
  br i1 %cmp253, label %for.body3.lr.ph, label %for.cond6.preheader

for.body3.lr.ph:                                  ; preds = %for.cond1.preheader
  br label %for.body3

for.cond1.for.cond6.preheader_crit_edge:          ; preds = %for.body3
  br label %for.cond6.preheader

for.cond6.preheader:                              ; preds = %for.cond1.for.cond6.preheader_crit_edge, %for.cond1.preheader
  %cmp757 = icmp sgt i32 %nk, 0
  br i1 %cmp757, label %for.cond9.preheader.lr.ph, label %for.inc32

for.cond9.preheader.lr.ph:                        ; preds = %for.cond6.preheader
  br label %for.cond9.preheader

for.body3:                                        ; preds = %for.body3.lr.ph, %for.body3
  %indvars.iv = phi i64 [ 0, %for.body3.lr.ph ], [ %indvars.iv.next, %for.body3 ]
  %arrayidx5 = getelementptr inbounds [2300 x double], [2300 x double]* %C, i64 %indvars.iv69, i64 %indvars.iv
  %5 = load double, double* %arrayidx5, align 8, !tbaa !2
  %mul = fmul double %5, %beta
  store double %mul, double* %arrayidx5, align 8, !tbaa !2
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %wide.trip.count = zext i32 %nj to i64
  %exitcond = icmp ne i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.body3, label %for.cond1.for.cond6.preheader_crit_edge

for.cond9.preheader:                              ; preds = %for.cond9.preheader.lr.ph, %for.inc29
  %indvars.iv65 = phi i64 [ 0, %for.cond9.preheader.lr.ph ], [ %indvars.iv.next66, %for.inc29 ]
  %cmp1055 = icmp sgt i32 %nj, 0
  br i1 %cmp1055, label %for.body11.lr.ph, label %for.inc29

for.body11.lr.ph:                                 ; preds = %for.cond9.preheader
  br label %for.body11

for.body11:                                       ; preds = %for.body11.lr.ph, %for.body11
  %indvars.iv61 = phi i64 [ 0, %for.body11.lr.ph ], [ %indvars.iv.next62, %for.body11 ]
  %arrayidx15 = getelementptr inbounds [2600 x double], [2600 x double]* %A, i64 %indvars.iv69, i64 %indvars.iv65
  %6 = load double, double* %arrayidx15, align 8, !tbaa !2
  %mul16 = fmul double %6, %alpha
  %arrayidx20 = getelementptr inbounds [2300 x double], [2300 x double]* %B, i64 %indvars.iv65, i64 %indvars.iv61
  %7 = load double, double* %arrayidx20, align 8, !tbaa !2
  %mul21 = fmul double %mul16, %7
  %arrayidx25 = getelementptr inbounds [2300 x double], [2300 x double]* %C, i64 %indvars.iv69, i64 %indvars.iv61
  %8 = load double, double* %arrayidx25, align 8, !tbaa !2
  %add = fadd double %8, %mul21
  store double %add, double* %arrayidx25, align 8, !tbaa !2
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %wide.trip.count63 = zext i32 %nj to i64
  %exitcond64 = icmp ne i64 %indvars.iv.next62, %wide.trip.count63
  br i1 %exitcond64, label %for.body11, label %for.cond9.for.inc29_crit_edge

for.cond9.for.inc29_crit_edge:                    ; preds = %for.body11
  br label %for.inc29

for.inc29:                                        ; preds = %for.cond9.for.inc29_crit_edge, %for.cond9.preheader
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %wide.trip.count67 = zext i32 %nk to i64
  %exitcond68 = icmp ne i64 %indvars.iv.next66, %wide.trip.count67
  br i1 %exitcond68, label %for.cond9.preheader, label %for.cond6.for.inc32_crit_edge

for.cond6.for.inc32_crit_edge:                    ; preds = %for.inc29
  br label %for.inc32

for.inc32:                                        ; preds = %for.cond6.for.inc32_crit_edge, %for.cond6.preheader
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %wide.trip.count71 = zext i32 %ni to i64
  %exitcond72 = icmp ne i64 %indvars.iv.next70, %wide.trip.count71
  br i1 %exitcond72, label %for.cond1.preheader, label %for.cond.for.end34_crit_edge

for.cond.for.end34_crit_edge:                     ; preds = %for.inc32
  br label %for.end34.region_exiting

for.end34.region_exiting:                         ; preds = %entry.split, %for.cond.for.end34_crit_edge
  br label %polly.merge_new_and_old

polly.merge_new_and_old:                          ; preds = %polly.exiting, %for.end34.region_exiting
  br label %for.end34

for.end34:                                        ; preds = %polly.merge_new_and_old
  ret void

polly.start:                                      ; preds = %polly.split_new_and_old
  store double %beta, double* %beta.s2a
  store double %alpha, double* %alpha.s2a
  %9 = sext i32 %ni to i64
  %10 = sub nsw i64 %9, 1
  %polly.fdiv_q.shr = ashr i64 %10, 5
  br label %polly.loop_if

polly.loop_exit:                                  ; preds = %polly.loop_exit77, %polly.loop_if
  br label %polly.cond

polly.cond:                                       ; preds = %polly.loop_exit
  %11 = sext i32 %ni to i64
  %12 = icmp sge i64 %11, 1
  br i1 %12, label %polly.then, label %polly.else

polly.merge:                                      ; preds = %polly.else, %polly.loop_exit102
  br label %polly.exiting

polly.exiting:                                    ; preds = %polly.merge
  br label %polly.merge_new_and_old

polly.loop_if:                                    ; preds = %polly.start
  %polly.loop_guard = icmp sle i64 0, %polly.fdiv_q.shr
  br i1 %polly.loop_guard, label %polly.loop_preheader, label %polly.loop_exit

polly.loop_header:                                ; preds = %polly.loop_exit77, %polly.loop_preheader
  %polly.indvar = phi i64 [ 0, %polly.loop_preheader ], [ %polly.indvar_next, %polly.loop_exit77 ]
  %13 = sext i32 %nj to i64
  %14 = sub nsw i64 %13, 1
  %polly.fdiv_q.shr73 = ashr i64 %14, 5
  br label %polly.loop_if74

polly.loop_exit77:                                ; preds = %polly.loop_exit85, %polly.loop_if74
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp sle i64 %polly.indvar_next, %polly.fdiv_q.shr
  br i1 %polly.loop_cond, label %polly.loop_header, label %polly.loop_exit

polly.loop_preheader:                             ; preds = %polly.loop_if
  %15 = zext i32 %nj to i64
  br label %polly.loop_header

polly.loop_if74:                                  ; preds = %polly.loop_header
  %polly.loop_guard78 = icmp sle i64 0, %polly.fdiv_q.shr73
  br i1 %polly.loop_guard78, label %polly.loop_preheader76, label %polly.loop_exit77

polly.loop_header75:                              ; preds = %polly.loop_exit85, %polly.loop_preheader76
  %polly.indvar79 = phi i64 [ 0, %polly.loop_preheader76 ], [ %polly.indvar_next80, %polly.loop_exit85 ]
  %16 = mul nsw i64 32, %polly.indvar
  %17 = sext i32 %ni to i64
  %18 = sub nsw i64 %17, %16
  %19 = sub nsw i64 %18, 1
  %20 = icmp slt i64 31, %19
  %21 = select i1 %20, i64 31, i64 %19
  br label %polly.loop_if82

polly.loop_exit85:                                ; preds = %polly.loop_exit93, %polly.loop_if82
  %polly.indvar_next80 = add nsw i64 %polly.indvar79, 1
  %polly.loop_cond81 = icmp sle i64 %polly.indvar_next80, %polly.fdiv_q.shr73
  br i1 %polly.loop_cond81, label %polly.loop_header75, label %polly.loop_exit77

polly.loop_preheader76:                           ; preds = %polly.loop_if74
  br label %polly.loop_header75

polly.loop_if82:                                  ; preds = %polly.loop_header75
  %polly.loop_guard86 = icmp sle i64 0, %21
  br i1 %polly.loop_guard86, label %polly.loop_preheader84, label %polly.loop_exit85

polly.loop_header83:                              ; preds = %polly.loop_exit93, %polly.loop_preheader84
  %polly.indvar87 = phi i64 [ 0, %polly.loop_preheader84 ], [ %polly.indvar_next88, %polly.loop_exit93 ]
  %22 = mul nsw i64 32, %polly.indvar79
  %23 = sext i32 %nj to i64
  %24 = sub nsw i64 %23, %22
  %25 = sub nsw i64 %24, 1
  %26 = icmp slt i64 31, %25
  %27 = select i1 %26, i64 31, i64 %25
  br label %polly.loop_if90

polly.loop_exit93:                                ; preds = %polly.stmt.for.body3, %polly.loop_if90
  %polly.indvar_next88 = add nsw i64 %polly.indvar87, 1
  %polly.loop_cond89 = icmp sle i64 %polly.indvar_next88, %21
  br i1 %polly.loop_cond89, label %polly.loop_header83, label %polly.loop_exit85

polly.loop_preheader84:                           ; preds = %polly.loop_if82
  br label %polly.loop_header83

polly.loop_if90:                                  ; preds = %polly.loop_header83
  %polly.loop_guard94 = icmp sle i64 0, %27
  br i1 %polly.loop_guard94, label %polly.loop_preheader92, label %polly.loop_exit93

polly.loop_header91:                              ; preds = %polly.stmt.for.body3, %polly.loop_preheader92
  %polly.indvar95 = phi i64 [ 0, %polly.loop_preheader92 ], [ %polly.indvar_next96, %polly.stmt.for.body3 ]
  %28 = mul nsw i64 32, %polly.indvar
  %29 = add nsw i64 %28, %polly.indvar87
  %30 = mul nsw i64 32, %polly.indvar79
  %31 = add nsw i64 %30, %polly.indvar95
  br label %polly.stmt.for.body3

polly.stmt.for.body3:                             ; preds = %polly.loop_header91
  %beta.s2a.reload = load double, double* %beta.s2a
  %scevgep = getelementptr [2300 x double], [2300 x double]* %C, i64 %29, i64 %31
  %_p_scalar_ = load double, double* %scevgep, align 8, !alias.scope !11, !noalias !13
  %p_mul = fmul double %_p_scalar_, %beta.s2a.reload
  store double %p_mul, double* %scevgep, align 8, !alias.scope !11, !noalias !13
  %polly.indvar_next96 = add nsw i64 %polly.indvar95, 1
  %polly.loop_cond97 = icmp sle i64 %polly.indvar_next96, %27
  br i1 %polly.loop_cond97, label %polly.loop_header91, label %polly.loop_exit93

polly.loop_preheader92:                           ; preds = %polly.loop_if90
  br label %polly.loop_header91

polly.then:                                       ; preds = %polly.cond
  %32 = sext i32 %nj to i64
  %33 = sub nsw i64 %32, 1
  %polly.fdiv_q.shr98 = ashr i64 %33, 10
  br label %polly.loop_if99

polly.loop_exit102:                               ; preds = %polly.loop_exit110, %polly.loop_if99
  br label %polly.merge

polly.else:                                       ; preds = %polly.cond
  br label %polly.merge

polly.loop_if99:                                  ; preds = %polly.then
  %polly.loop_guard103 = icmp sle i64 0, %polly.fdiv_q.shr98
  br i1 %polly.loop_guard103, label %polly.loop_preheader101, label %polly.loop_exit102

polly.loop_header100:                             ; preds = %polly.loop_exit110, %polly.loop_preheader101
  %polly.indvar104 = phi i64 [ 0, %polly.loop_preheader101 ], [ %polly.indvar_next105, %polly.loop_exit110 ]
  %34 = sext i32 %nk to i64
  %35 = sub nsw i64 %34, 1
  %pexp.fdiv_q.0 = sub nsw i64 %35, 384
  %pexp.fdiv_q.1 = add nsw i64 %pexp.fdiv_q.0, 1
  %pexp.fdiv_q.2 = icmp slt i64 %35, 0
  %pexp.fdiv_q.3 = select i1 %pexp.fdiv_q.2, i64 %pexp.fdiv_q.1, i64 %35
  %pexp.fdiv_q.4 = sdiv i64 %pexp.fdiv_q.3, 384
  br label %polly.loop_if107

polly.loop_exit110:                               ; preds = %polly.loop_exit137, %polly.loop_if107
  %polly.indvar_next105 = add nsw i64 %polly.indvar104, 1
  %polly.loop_cond106 = icmp sle i64 %polly.indvar_next105, %polly.fdiv_q.shr98
  br i1 %polly.loop_cond106, label %polly.loop_header100, label %polly.loop_exit102

polly.loop_preheader101:                          ; preds = %polly.loop_if99
  %36 = zext i32 %nj to i64
  %37 = zext i32 %nj to i64
  %38 = zext i32 %nj to i64
  %39 = zext i32 %nj to i64
  %40 = zext i32 %nj to i64
  %41 = zext i32 %nj to i64
  %42 = zext i32 %nj to i64
  %43 = zext i32 %nj to i64
  %44 = zext i32 %nj to i64
  %45 = zext i32 %nj to i64
  %46 = zext i32 %nj to i64
  %47 = zext i32 %nj to i64
  %48 = zext i32 %nj to i64
  %49 = zext i32 %nj to i64
  %50 = zext i32 %nj to i64
  %51 = zext i32 %nj to i64
  %52 = zext i32 %nj to i64
  %53 = zext i32 %nj to i64
  br label %polly.loop_header100

polly.loop_if107:                                 ; preds = %polly.loop_header100
  %polly.loop_guard111 = icmp sle i64 0, %pexp.fdiv_q.4
  br i1 %polly.loop_guard111, label %polly.loop_preheader109, label %polly.loop_exit110

polly.loop_header108:                             ; preds = %polly.loop_exit137, %polly.loop_preheader109
  %polly.indvar112 = phi i64 [ 0, %polly.loop_preheader109 ], [ %polly.indvar_next113, %polly.loop_exit137 ]
  %54 = mul nsw i64 384, %polly.indvar112
  %55 = sext i32 %nk to i64
  %56 = sub nsw i64 %55, 1
  %57 = mul nsw i64 384, %polly.indvar112
  %58 = add nsw i64 %57, 383
  %59 = icmp slt i64 %56, %58
  %60 = select i1 %59, i64 %56, i64 %58
  br label %polly.loop_if115

polly.loop_exit118:                               ; preds = %polly.loop_exit126, %polly.loop_if115
  %61 = sext i32 %ni to i64
  %62 = sub nsw i64 %61, 1
  %polly.fdiv_q.shr133 = ashr i64 %62, 6
  br label %polly.loop_if134

polly.loop_exit137:                               ; preds = %polly.merge578, %polly.loop_if134
  %polly.indvar_next113 = add nsw i64 %polly.indvar112, 1
  %polly.loop_cond114 = icmp sle i64 %polly.indvar_next113, %pexp.fdiv_q.4
  br i1 %polly.loop_cond114, label %polly.loop_header108, label %polly.loop_exit110

polly.loop_preheader109:                          ; preds = %polly.loop_if107
  br label %polly.loop_header108

polly.loop_if115:                                 ; preds = %polly.loop_header108
  %polly.loop_guard119 = icmp sle i64 %54, %60
  br i1 %polly.loop_guard119, label %polly.loop_preheader117, label %polly.loop_exit118

polly.loop_header116:                             ; preds = %polly.loop_exit126, %polly.loop_preheader117
  %polly.indvar120 = phi i64 [ %54, %polly.loop_preheader117 ], [ %polly.indvar_next121, %polly.loop_exit126 ]
  %63 = mul nsw i64 1024, %polly.indvar104
  %64 = sext i32 %nj to i64
  %65 = sub nsw i64 %64, 1
  %66 = mul nsw i64 1024, %polly.indvar104
  %67 = add nsw i64 %66, 1023
  %68 = icmp slt i64 %65, %67
  %69 = select i1 %68, i64 %65, i64 %67
  br label %polly.loop_if123

polly.loop_exit126:                               ; preds = %polly.loop_header124, %polly.loop_if123
  %polly.indvar_next121 = add nsw i64 %polly.indvar120, 1
  %polly.loop_cond122 = icmp sle i64 %polly.indvar_next121, %60
  br i1 %polly.loop_cond122, label %polly.loop_header116, label %polly.loop_exit118

polly.loop_preheader117:                          ; preds = %polly.loop_if115
  br label %polly.loop_header116

polly.loop_if123:                                 ; preds = %polly.loop_header116
  %polly.loop_guard127 = icmp sle i64 %63, %69
  br i1 %polly.loop_guard127, label %polly.loop_preheader125, label %polly.loop_exit126

polly.loop_header124:                             ; preds = %polly.loop_header124, %polly.loop_preheader125
  %polly.indvar128 = phi i64 [ %63, %polly.loop_preheader125 ], [ %polly.indvar_next129, %polly.loop_header124 ]
  %polly.access.cast.B = bitcast [2300 x double]* %B to double*
  %polly.access.mul.B = mul nsw i64 %polly.indvar120, 2300
  %polly.access.add.B = add nsw i64 %polly.access.mul.B, %polly.indvar128
  %polly.access.B = getelementptr double, double* %polly.access.cast.B, i64 %polly.access.add.B
  %polly.access.B.load = load double, double* %polly.access.B, !alias.scope !17, !noalias !19
  %polly.access.cast.Packed_B = bitcast [256 x [384 x [4 x double]]]* %Packed_B to double*
  %70 = mul nsw i64 -256, %polly.indvar104
  %pexp.p_div_q = udiv i64 %polly.indvar128, 4
  %71 = add nsw i64 %70, %pexp.p_div_q
  %polly.access.mul.Packed_B = mul nsw i64 %71, 384
  %72 = mul nsw i64 -384, %polly.indvar112
  %73 = add nsw i64 %72, %polly.indvar120
  %polly.access.add.Packed_B = add nsw i64 %polly.access.mul.Packed_B, %73
  %polly.access.mul.Packed_B131 = mul nsw i64 %polly.access.add.Packed_B, 4
  %pexp.pdiv_r = urem i64 %polly.indvar128, 4
  %polly.access.add.Packed_B132 = add nsw i64 %polly.access.mul.Packed_B131, %pexp.pdiv_r
  %polly.access.Packed_B = getelementptr double, double* %polly.access.cast.Packed_B, i64 %polly.access.add.Packed_B132
  store double %polly.access.B.load, double* %polly.access.Packed_B
  %polly.indvar_next129 = add nsw i64 %polly.indvar128, 1
  %polly.loop_cond130 = icmp sle i64 %polly.indvar_next129, %69
  br i1 %polly.loop_cond130, label %polly.loop_header124, label %polly.loop_exit126

polly.loop_preheader125:                          ; preds = %polly.loop_if123
  br label %polly.loop_header124

polly.loop_if134:                                 ; preds = %polly.loop_exit118
  %polly.loop_guard138 = icmp sle i64 0, %polly.fdiv_q.shr133
  br i1 %polly.loop_guard138, label %polly.loop_preheader136, label %polly.loop_exit137

polly.loop_header135:                             ; preds = %polly.merge578, %polly.loop_preheader136
  %polly.indvar139 = phi i64 [ 0, %polly.loop_preheader136 ], [ %polly.indvar_next140, %polly.merge578 ]
  br label %polly.cond142

polly.cond142:                                    ; preds = %polly.loop_header135
  %74 = icmp eq i64 %polly.indvar104, 0
  br i1 %74, label %polly.then144, label %polly.else145

polly.merge143:                                   ; preds = %polly.else145, %polly.loop_exit149
  br label %polly.cond166

polly.cond166:                                    ; preds = %polly.merge143
  %75 = mul nsw i64 64, %polly.indvar139
  %76 = add nsw i64 %75, 4
  %77 = sext i32 %ni to i64
  %78 = icmp sge i64 %77, %76
  br i1 %78, label %polly.then168, label %polly.else169

polly.merge167:                                   ; preds = %polly.else169, %polly.loop_exit174
  br label %polly.cond577

polly.cond577:                                    ; preds = %polly.merge167
  %79 = mul nsw i64 64, %polly.indvar139
  %80 = add nsw i64 %79, 3
  %81 = sext i32 %ni to i64
  %82 = icmp sge i64 %80, %81
  %83 = mul nsw i64 1024, %polly.indvar104
  %84 = add nsw i64 %83, 1023
  %85 = sext i32 %nj to i64
  %86 = icmp sge i64 %84, %85
  %87 = sext i32 %nj to i64
  %pexp.pdiv_r581 = urem i64 %87, 4
  %88 = icmp sge i64 %pexp.pdiv_r581, 1
  %89 = and i1 %86, %88
  %90 = or i1 %82, %89
  br i1 %90, label %polly.then579, label %polly.else580

polly.merge578:                                   ; preds = %polly.else580, %polly.loop_exit586
  %polly.indvar_next140 = add nsw i64 %polly.indvar139, 1
  %polly.loop_cond141 = icmp sle i64 %polly.indvar_next140, %polly.fdiv_q.shr133
  br i1 %polly.loop_cond141, label %polly.loop_header135, label %polly.loop_exit137

polly.loop_preheader136:                          ; preds = %polly.loop_if134
  br label %polly.loop_header135

polly.then144:                                    ; preds = %polly.cond142
  %91 = mul nsw i64 64, %polly.indvar139
  %92 = sext i32 %ni to i64
  %93 = sub nsw i64 %92, 1
  %94 = mul nsw i64 64, %polly.indvar139
  %95 = add nsw i64 %94, 63
  %96 = icmp slt i64 %93, %95
  %97 = select i1 %96, i64 %93, i64 %95
  br label %polly.loop_if146

polly.loop_exit149:                               ; preds = %polly.loop_exit157, %polly.loop_if146
  br label %polly.merge143

polly.else145:                                    ; preds = %polly.cond142
  br label %polly.merge143

polly.loop_if146:                                 ; preds = %polly.then144
  %polly.loop_guard150 = icmp sle i64 %91, %97
  br i1 %polly.loop_guard150, label %polly.loop_preheader148, label %polly.loop_exit149

polly.loop_header147:                             ; preds = %polly.loop_exit157, %polly.loop_preheader148
  %polly.indvar151 = phi i64 [ %91, %polly.loop_preheader148 ], [ %polly.indvar_next152, %polly.loop_exit157 ]
  %98 = mul nsw i64 384, %polly.indvar112
  %99 = sext i32 %nk to i64
  %100 = sub nsw i64 %99, 1
  %101 = mul nsw i64 384, %polly.indvar112
  %102 = add nsw i64 %101, 383
  %103 = icmp slt i64 %100, %102
  %104 = select i1 %103, i64 %100, i64 %102
  br label %polly.loop_if154

polly.loop_exit157:                               ; preds = %polly.loop_header155, %polly.loop_if154
  %polly.indvar_next152 = add nsw i64 %polly.indvar151, 1
  %polly.loop_cond153 = icmp sle i64 %polly.indvar_next152, %97
  br i1 %polly.loop_cond153, label %polly.loop_header147, label %polly.loop_exit149

polly.loop_preheader148:                          ; preds = %polly.loop_if146
  br label %polly.loop_header147

polly.loop_if154:                                 ; preds = %polly.loop_header147
  %polly.loop_guard158 = icmp sle i64 %98, %104
  br i1 %polly.loop_guard158, label %polly.loop_preheader156, label %polly.loop_exit157

polly.loop_header155:                             ; preds = %polly.loop_header155, %polly.loop_preheader156
  %polly.indvar159 = phi i64 [ %98, %polly.loop_preheader156 ], [ %polly.indvar_next160, %polly.loop_header155 ]
  %polly.access.cast.A = bitcast [2600 x double]* %A to double*
  %polly.access.mul.A = mul nsw i64 %polly.indvar151, 2600
  %polly.access.add.A = add nsw i64 %polly.access.mul.A, %polly.indvar159
  %polly.access.A = getelementptr double, double* %polly.access.cast.A, i64 %polly.access.add.A
  %polly.access.A.load = load double, double* %polly.access.A, !alias.scope !18, !noalias !20
  %polly.access.cast.Packed_A = bitcast [16 x [384 x [4 x double]]]* %Packed_A to double*
  %105 = mul nsw i64 -16, %polly.indvar139
  %pexp.p_div_q162 = udiv i64 %polly.indvar151, 4
  %106 = add nsw i64 %105, %pexp.p_div_q162
  %polly.access.mul.Packed_A = mul nsw i64 %106, 384
  %107 = mul nsw i64 -384, %polly.indvar112
  %108 = add nsw i64 %107, %polly.indvar159
  %polly.access.add.Packed_A = add nsw i64 %polly.access.mul.Packed_A, %108
  %polly.access.mul.Packed_A163 = mul nsw i64 %polly.access.add.Packed_A, 4
  %pexp.pdiv_r164 = urem i64 %polly.indvar151, 4
  %polly.access.add.Packed_A165 = add nsw i64 %polly.access.mul.Packed_A163, %pexp.pdiv_r164
  %polly.access.Packed_A = getelementptr double, double* %polly.access.cast.Packed_A, i64 %polly.access.add.Packed_A165
  store double %polly.access.A.load, double* %polly.access.Packed_A
  %polly.indvar_next160 = add nsw i64 %polly.indvar159, 1
  %polly.loop_cond161 = icmp sle i64 %polly.indvar_next160, %104
  br i1 %polly.loop_cond161, label %polly.loop_header155, label %polly.loop_exit157

polly.loop_preheader156:                          ; preds = %polly.loop_if154
  br label %polly.loop_header155

polly.then168:                                    ; preds = %polly.cond166
  %109 = mul nsw i64 -256, %polly.indvar104
  %110 = sext i32 %nj to i64
  %pexp.p_div_q170 = udiv i64 %110, 4
  %111 = add nsw i64 %109, %pexp.p_div_q170
  %112 = sub nsw i64 %111, 1
  %113 = icmp slt i64 255, %112
  %114 = select i1 %113, i64 255, i64 %112
  br label %polly.loop_if171

polly.loop_exit174:                               ; preds = %polly.merge528, %polly.loop_if171
  br label %polly.merge167

polly.else169:                                    ; preds = %polly.cond166
  br label %polly.merge167

polly.loop_if171:                                 ; preds = %polly.then168
  %polly.loop_guard175 = icmp sle i64 0, %114
  br i1 %polly.loop_guard175, label %polly.loop_preheader173, label %polly.loop_exit174

polly.loop_header172:                             ; preds = %polly.merge528, %polly.loop_preheader173
  %polly.indvar176 = phi i64 [ 0, %polly.loop_preheader173 ], [ %polly.indvar_next177, %polly.merge528 ]
  %115 = mul nsw i64 -16, %polly.indvar139
  %116 = sext i32 %ni to i64
  %pexp.p_div_q179 = udiv i64 %116, 4
  %117 = add nsw i64 %115, %pexp.p_div_q179
  %118 = sub nsw i64 %117, 1
  %119 = icmp slt i64 15, %118
  %120 = select i1 %119, i64 15, i64 %118
  br label %polly.loop_if180

polly.loop_exit183:                               ; preds = %polly.loop_exit191, %polly.loop_if180
  br label %polly.cond527

polly.cond527:                                    ; preds = %polly.loop_exit183
  %121 = mul nsw i64 64, %polly.indvar139
  %122 = add nsw i64 %121, 63
  %123 = sext i32 %ni to i64
  %124 = icmp sge i64 %122, %123
  br i1 %124, label %polly.then529, label %polly.else530

polly.merge528:                                   ; preds = %polly.else530, %polly.loop_exit534
  %polly.indvar_next177 = add nsw i64 %polly.indvar176, 1
  %polly.loop_cond178 = icmp sle i64 %polly.indvar_next177, %114
  br i1 %polly.loop_cond178, label %polly.loop_header172, label %polly.loop_exit174

polly.loop_preheader173:                          ; preds = %polly.loop_if171
  br label %polly.loop_header172

polly.loop_if180:                                 ; preds = %polly.loop_header172
  %polly.loop_guard184 = icmp sle i64 0, %120
  br i1 %polly.loop_guard184, label %polly.loop_preheader182, label %polly.loop_exit183

polly.loop_header181:                             ; preds = %polly.loop_exit191, %polly.loop_preheader182
  %polly.indvar185 = phi i64 [ 0, %polly.loop_preheader182 ], [ %polly.indvar_next186, %polly.loop_exit191 ]
  %125 = mul nsw i64 384, %polly.indvar112
  %126 = sext i32 %nk to i64
  %127 = sub nsw i64 %126, %125
  %128 = sub nsw i64 %127, 1
  %129 = icmp slt i64 383, %128
  %130 = select i1 %129, i64 383, i64 %128
  br label %polly.loop_if188

polly.loop_exit191:                               ; preds = %polly.stmt.for.body11506, %polly.loop_if188
  %polly.indvar_next186 = add nsw i64 %polly.indvar185, 1
  %polly.loop_cond187 = icmp sle i64 %polly.indvar_next186, %120
  br i1 %polly.loop_cond187, label %polly.loop_header181, label %polly.loop_exit183

polly.loop_preheader182:                          ; preds = %polly.loop_if180
  br label %polly.loop_header181

polly.loop_if188:                                 ; preds = %polly.loop_header181
  %polly.loop_guard192 = icmp sle i64 0, %130
  br i1 %polly.loop_guard192, label %polly.loop_preheader190, label %polly.loop_exit191

polly.loop_header189:                             ; preds = %polly.stmt.for.body11506, %polly.loop_preheader190
  %polly.indvar193 = phi i64 [ 0, %polly.loop_preheader190 ], [ %polly.indvar_next194, %polly.stmt.for.body11506 ]
  %131 = mul nsw i64 64, %polly.indvar139
  %132 = mul nsw i64 4, %polly.indvar185
  %133 = add nsw i64 %131, %132
  %134 = mul nsw i64 384, %polly.indvar112
  %135 = add nsw i64 %134, %polly.indvar193
  %136 = mul nsw i64 1024, %polly.indvar104
  %137 = mul nsw i64 4, %polly.indvar176
  %138 = add nsw i64 %136, %137
  br label %polly.stmt.for.body11

polly.stmt.for.body11:                            ; preds = %polly.loop_header189
  %alpha.s2a.reload = load double, double* %alpha.s2a
  %polly.access.cast.Packed_A196 = bitcast [16 x [384 x [4 x double]]]* %Packed_A to double*
  %polly.access.mul.Packed_A197 = mul nsw i64 %polly.indvar185, 384
  %polly.access.add.Packed_A198 = add nsw i64 %polly.access.mul.Packed_A197, %polly.indvar193
  %polly.access.mul.Packed_A199 = mul nsw i64 %polly.access.add.Packed_A198, 4
  %polly.access.add.Packed_A200 = add nsw i64 %polly.access.mul.Packed_A199, 0
  %polly.access.Packed_A201 = getelementptr double, double* %polly.access.cast.Packed_A196, i64 %polly.access.add.Packed_A200
  %_p_scalar_202 = load double, double* %polly.access.Packed_A201, align 8
  %p_mul16 = fmul double %_p_scalar_202, %alpha.s2a.reload
  %polly.access.cast.Packed_B203 = bitcast [256 x [384 x [4 x double]]]* %Packed_B to double*
  %polly.access.mul.Packed_B204 = mul nsw i64 %polly.indvar176, 384
  %polly.access.add.Packed_B205 = add nsw i64 %polly.access.mul.Packed_B204, %polly.indvar193
  %polly.access.mul.Packed_B206 = mul nsw i64 %polly.access.add.Packed_B205, 4
  %polly.access.add.Packed_B207 = add nsw i64 %polly.access.mul.Packed_B206, 0
  %polly.access.Packed_B208 = getelementptr double, double* %polly.access.cast.Packed_B203, i64 %polly.access.add.Packed_B207
  %_p_scalar_209 = load double, double* %polly.access.Packed_B208, align 8
  %p_mul21 = fmul double %p_mul16, %_p_scalar_209
  %scevgep210 = getelementptr [2300 x double], [2300 x double]* %C, i64 %133, i64 %138
  %_p_scalar_211 = load double, double* %scevgep210, align 8, !alias.scope !21, !noalias !13
  %p_add = fadd double %_p_scalar_211, %p_mul21
  store double %p_add, double* %scevgep210, align 8, !alias.scope !21, !noalias !13
  %139 = mul nsw i64 64, %polly.indvar139
  %140 = mul nsw i64 4, %polly.indvar185
  %141 = add nsw i64 %139, %140
  %142 = mul nsw i64 384, %polly.indvar112
  %143 = add nsw i64 %142, %polly.indvar193
  %144 = mul nsw i64 1024, %polly.indvar104
  %145 = mul nsw i64 4, %polly.indvar176
  %146 = add nsw i64 %144, %145
  %147 = add nsw i64 %146, 1
  br label %polly.stmt.for.body11212

polly.stmt.for.body11212:                         ; preds = %polly.stmt.for.body11
  %alpha.s2a.reload213 = load double, double* %alpha.s2a
  %polly.access.cast.Packed_A214 = bitcast [16 x [384 x [4 x double]]]* %Packed_A to double*
  %polly.access.mul.Packed_A215 = mul nsw i64 %polly.indvar185, 384
  %polly.access.add.Packed_A216 = add nsw i64 %polly.access.mul.Packed_A215, %polly.indvar193
  %polly.access.mul.Packed_A217 = mul nsw i64 %polly.access.add.Packed_A216, 4
  %polly.access.add.Packed_A218 = add nsw i64 %polly.access.mul.Packed_A217, 0
  %polly.access.Packed_A219 = getelementptr double, double* %polly.access.cast.Packed_A214, i64 %polly.access.add.Packed_A218
  %_p_scalar_220 = load double, double* %polly.access.Packed_A219, align 8
  %p_mul16221 = fmul double %_p_scalar_220, %alpha.s2a.reload213
  %polly.access.cast.Packed_B222 = bitcast [256 x [384 x [4 x double]]]* %Packed_B to double*
  %polly.access.mul.Packed_B223 = mul nsw i64 %polly.indvar176, 384
  %polly.access.add.Packed_B224 = add nsw i64 %polly.access.mul.Packed_B223, %polly.indvar193
  %polly.access.mul.Packed_B225 = mul nsw i64 %polly.access.add.Packed_B224, 4
  %polly.access.add.Packed_B226 = add nsw i64 %polly.access.mul.Packed_B225, 1
  %polly.access.Packed_B227 = getelementptr double, double* %polly.access.cast.Packed_B222, i64 %polly.access.add.Packed_B226
  %_p_scalar_228 = load double, double* %polly.access.Packed_B227, align 8
  %p_mul21229 = fmul double %p_mul16221, %_p_scalar_228
  %scevgep230 = getelementptr [2300 x double], [2300 x double]* %C, i64 %141, i64 %147
  %_p_scalar_231 = load double, double* %scevgep230, align 8, !alias.scope !22, !noalias !23
  %p_add232 = fadd double %_p_scalar_231, %p_mul21229
  store double %p_add232, double* %scevgep230, align 8, !alias.scope !22, !noalias !23
  %148 = mul nsw i64 64, %polly.indvar139
  %149 = mul nsw i64 4, %polly.indvar185
  %150 = add nsw i64 %148, %149
  %151 = mul nsw i64 384, %polly.indvar112
  %152 = add nsw i64 %151, %polly.indvar193
  %153 = mul nsw i64 1024, %polly.indvar104
  %154 = mul nsw i64 4, %polly.indvar176
  %155 = add nsw i64 %153, %154
  %156 = add nsw i64 %155, 2
  br label %polly.stmt.for.body11233

polly.stmt.for.body11233:                         ; preds = %polly.stmt.for.body11212
  %alpha.s2a.reload234 = load double, double* %alpha.s2a
  %polly.access.cast.Packed_A235 = bitcast [16 x [384 x [4 x double]]]* %Packed_A to double*
  %polly.access.mul.Packed_A236 = mul nsw i64 %polly.indvar185, 384
  %polly.access.add.Packed_A237 = add nsw i64 %polly.access.mul.Packed_A236, %polly.indvar193
  %polly.access.mul.Packed_A238 = mul nsw i64 %polly.access.add.Packed_A237, 4
  %polly.access.add.Packed_A239 = add nsw i64 %polly.access.mul.Packed_A238, 0
  %polly.access.Packed_A240 = getelementptr double, double* %polly.access.cast.Packed_A235, i64 %polly.access.add.Packed_A239
  %_p_scalar_241 = load double, double* %polly.access.Packed_A240, align 8
  %p_mul16242 = fmul double %_p_scalar_241, %alpha.s2a.reload234
  %polly.access.cast.Packed_B243 = bitcast [256 x [384 x [4 x double]]]* %Packed_B to double*
  %polly.access.mul.Packed_B244 = mul nsw i64 %polly.indvar176, 384
  %polly.access.add.Packed_B245 = add nsw i64 %polly.access.mul.Packed_B244, %polly.indvar193
  %polly.access.mul.Packed_B246 = mul nsw i64 %polly.access.add.Packed_B245, 4
  %polly.access.add.Packed_B247 = add nsw i64 %polly.access.mul.Packed_B246, 2
  %polly.access.Packed_B248 = getelementptr double, double* %polly.access.cast.Packed_B243, i64 %polly.access.add.Packed_B247
  %_p_scalar_249 = load double, double* %polly.access.Packed_B248, align 8
  %p_mul21250 = fmul double %p_mul16242, %_p_scalar_249
  %scevgep251 = getelementptr [2300 x double], [2300 x double]* %C, i64 %150, i64 %156
  %_p_scalar_252 = load double, double* %scevgep251, align 8, !alias.scope !24, !noalias !25
  %p_add253 = fadd double %_p_scalar_252, %p_mul21250
  store double %p_add253, double* %scevgep251, align 8, !alias.scope !24, !noalias !25
  %157 = mul nsw i64 64, %polly.indvar139
  %158 = mul nsw i64 4, %polly.indvar185
  %159 = add nsw i64 %157, %158
  %160 = mul nsw i64 384, %polly.indvar112
  %161 = add nsw i64 %160, %polly.indvar193
  %162 = mul nsw i64 1024, %polly.indvar104
  %163 = mul nsw i64 4, %polly.indvar176
  %164 = add nsw i64 %162, %163
  %165 = add nsw i64 %164, 3
  br label %polly.stmt.for.body11254

polly.stmt.for.body11254:                         ; preds = %polly.stmt.for.body11233
  %alpha.s2a.reload255 = load double, double* %alpha.s2a
  %polly.access.cast.Packed_A256 = bitcast [16 x [384 x [4 x double]]]* %Packed_A to double*
  %polly.access.mul.Packed_A257 = mul nsw i64 %polly.indvar185, 384
  %polly.access.add.Packed_A258 = add nsw i64 %polly.access.mul.Packed_A257, %polly.indvar193
  %polly.access.mul.Packed_A259 = mul nsw i64 %polly.access.add.Packed_A258, 4
  %polly.access.add.Packed_A260 = add nsw i64 %polly.access.mul.Packed_A259, 0
  %polly.access.Packed_A261 = getelementptr double, double* %polly.access.cast.Packed_A256, i64 %polly.access.add.Packed_A260
  %_p_scalar_262 = load double, double* %polly.access.Packed_A261, align 8
  %p_mul16263 = fmul double %_p_scalar_262, %alpha.s2a.reload255
  %polly.access.cast.Packed_B264 = bitcast [256 x [384 x [4 x double]]]* %Packed_B to double*
  %polly.access.mul.Packed_B265 = mul nsw i64 %polly.indvar176, 384
  %polly.access.add.Packed_B266 = add nsw i64 %polly.access.mul.Packed_B265, %polly.indvar193
  %polly.access.mul.Packed_B267 = mul nsw i64 %polly.access.add.Packed_B266, 4
  %polly.access.add.Packed_B268 = add nsw i64 %polly.access.mul.Packed_B267, 3
  %polly.access.Packed_B269 = getelementptr double, double* %polly.access.cast.Packed_B264, i64 %polly.access.add.Packed_B268
  %_p_scalar_270 = load double, double* %polly.access.Packed_B269, align 8
  %p_mul21271 = fmul double %p_mul16263, %_p_scalar_270
  %scevgep272 = getelementptr [2300 x double], [2300 x double]* %C, i64 %159, i64 %165
  %_p_scalar_273 = load double, double* %scevgep272, align 8, !alias.scope !26, !noalias !27
  %p_add274 = fadd double %_p_scalar_273, %p_mul21271
  store double %p_add274, double* %scevgep272, align 8, !alias.scope !26, !noalias !27
  %166 = mul nsw i64 64, %polly.indvar139
  %167 = mul nsw i64 4, %polly.indvar185
  %168 = add nsw i64 %166, %167
  %169 = add nsw i64 %168, 1
  %170 = mul nsw i64 384, %polly.indvar112
  %171 = add nsw i64 %170, %polly.indvar193
  %172 = mul nsw i64 1024, %polly.indvar104
  %173 = mul nsw i64 4, %polly.indvar176
  %174 = add nsw i64 %172, %173
  br label %polly.stmt.for.body11275

polly.stmt.for.body11275:                         ; preds = %polly.stmt.for.body11254
  %alpha.s2a.reload276 = load double, double* %alpha.s2a
  %polly.access.cast.Packed_A277 = bitcast [16 x [384 x [4 x double]]]* %Packed_A to double*
  %polly.access.mul.Packed_A278 = mul nsw i64 %polly.indvar185, 384
  %polly.access.add.Packed_A279 = add nsw i64 %polly.access.mul.Packed_A278, %polly.indvar193
  %polly.access.mul.Packed_A280 = mul nsw i64 %polly.access.add.Packed_A279, 4
  %polly.access.add.Packed_A281 = add nsw i64 %polly.access.mul.Packed_A280, 1
  %polly.access.Packed_A282 = getelementptr double, double* %polly.access.cast.Packed_A277, i64 %polly.access.add.Packed_A281
  %_p_scalar_283 = load double, double* %polly.access.Packed_A282, align 8
  %p_mul16284 = fmul double %_p_scalar_283, %alpha.s2a.reload276
  %polly.access.cast.Packed_B285 = bitcast [256 x [384 x [4 x double]]]* %Packed_B to double*
  %polly.access.mul.Packed_B286 = mul nsw i64 %polly.indvar176, 384
  %polly.access.add.Packed_B287 = add nsw i64 %polly.access.mul.Packed_B286, %polly.indvar193
  %polly.access.mul.Packed_B288 = mul nsw i64 %polly.access.add.Packed_B287, 4
  %polly.access.add.Packed_B289 = add nsw i64 %polly.access.mul.Packed_B288, 0
  %polly.access.Packed_B290 = getelementptr double, double* %polly.access.cast.Packed_B285, i64 %polly.access.add.Packed_B289
  %_p_scalar_291 = load double, double* %polly.access.Packed_B290, align 8
  %p_mul21292 = fmul double %p_mul16284, %_p_scalar_291
  %scevgep293 = getelementptr [2300 x double], [2300 x double]* %C, i64 %169, i64 %174
  %_p_scalar_294 = load double, double* %scevgep293, align 8, !alias.scope !28, !noalias !29
  %p_add295 = fadd double %_p_scalar_294, %p_mul21292
  store double %p_add295, double* %scevgep293, align 8, !alias.scope !28, !noalias !29
  %175 = mul nsw i64 64, %polly.indvar139
  %176 = mul nsw i64 4, %polly.indvar185
  %177 = add nsw i64 %175, %176
  %178 = add nsw i64 %177, 1
  %179 = mul nsw i64 384, %polly.indvar112
  %180 = add nsw i64 %179, %polly.indvar193
  %181 = mul nsw i64 1024, %polly.indvar104
  %182 = mul nsw i64 4, %polly.indvar176
  %183 = add nsw i64 %181, %182
  %184 = add nsw i64 %183, 1
  br label %polly.stmt.for.body11296

polly.stmt.for.body11296:                         ; preds = %polly.stmt.for.body11275
  %alpha.s2a.reload297 = load double, double* %alpha.s2a
  %polly.access.cast.Packed_A298 = bitcast [16 x [384 x [4 x double]]]* %Packed_A to double*
  %polly.access.mul.Packed_A299 = mul nsw i64 %polly.indvar185, 384
  %polly.access.add.Packed_A300 = add nsw i64 %polly.access.mul.Packed_A299, %polly.indvar193
  %polly.access.mul.Packed_A301 = mul nsw i64 %polly.access.add.Packed_A300, 4
  %polly.access.add.Packed_A302 = add nsw i64 %polly.access.mul.Packed_A301, 1
  %polly.access.Packed_A303 = getelementptr double, double* %polly.access.cast.Packed_A298, i64 %polly.access.add.Packed_A302
  %_p_scalar_304 = load double, double* %polly.access.Packed_A303, align 8
  %p_mul16305 = fmul double %_p_scalar_304, %alpha.s2a.reload297
  %polly.access.cast.Packed_B306 = bitcast [256 x [384 x [4 x double]]]* %Packed_B to double*
  %polly.access.mul.Packed_B307 = mul nsw i64 %polly.indvar176, 384
  %polly.access.add.Packed_B308 = add nsw i64 %polly.access.mul.Packed_B307, %polly.indvar193
  %polly.access.mul.Packed_B309 = mul nsw i64 %polly.access.add.Packed_B308, 4
  %polly.access.add.Packed_B310 = add nsw i64 %polly.access.mul.Packed_B309, 1
  %polly.access.Packed_B311 = getelementptr double, double* %polly.access.cast.Packed_B306, i64 %polly.access.add.Packed_B310
  %_p_scalar_312 = load double, double* %polly.access.Packed_B311, align 8
  %p_mul21313 = fmul double %p_mul16305, %_p_scalar_312
  %scevgep314 = getelementptr [2300 x double], [2300 x double]* %C, i64 %178, i64 %184
  %_p_scalar_315 = load double, double* %scevgep314, align 8, !alias.scope !30, !noalias !31
  %p_add316 = fadd double %_p_scalar_315, %p_mul21313
  store double %p_add316, double* %scevgep314, align 8, !alias.scope !30, !noalias !31
  %185 = mul nsw i64 64, %polly.indvar139
  %186 = mul nsw i64 4, %polly.indvar185
  %187 = add nsw i64 %185, %186
  %188 = add nsw i64 %187, 1
  %189 = mul nsw i64 384, %polly.indvar112
  %190 = add nsw i64 %189, %polly.indvar193
  %191 = mul nsw i64 1024, %polly.indvar104
  %192 = mul nsw i64 4, %polly.indvar176
  %193 = add nsw i64 %191, %192
  %194 = add nsw i64 %193, 2
  br label %polly.stmt.for.body11317

polly.stmt.for.body11317:                         ; preds = %polly.stmt.for.body11296
  %alpha.s2a.reload318 = load double, double* %alpha.s2a
  %polly.access.cast.Packed_A319 = bitcast [16 x [384 x [4 x double]]]* %Packed_A to double*
  %polly.access.mul.Packed_A320 = mul nsw i64 %polly.indvar185, 384
  %polly.access.add.Packed_A321 = add nsw i64 %polly.access.mul.Packed_A320, %polly.indvar193
  %polly.access.mul.Packed_A322 = mul nsw i64 %polly.access.add.Packed_A321, 4
  %polly.access.add.Packed_A323 = add nsw i64 %polly.access.mul.Packed_A322, 1
  %polly.access.Packed_A324 = getelementptr double, double* %polly.access.cast.Packed_A319, i64 %polly.access.add.Packed_A323
  %_p_scalar_325 = load double, double* %polly.access.Packed_A324, align 8
  %p_mul16326 = fmul double %_p_scalar_325, %alpha.s2a.reload318
  %polly.access.cast.Packed_B327 = bitcast [256 x [384 x [4 x double]]]* %Packed_B to double*
  %polly.access.mul.Packed_B328 = mul nsw i64 %polly.indvar176, 384
  %polly.access.add.Packed_B329 = add nsw i64 %polly.access.mul.Packed_B328, %polly.indvar193
  %polly.access.mul.Packed_B330 = mul nsw i64 %polly.access.add.Packed_B329, 4
  %polly.access.add.Packed_B331 = add nsw i64 %polly.access.mul.Packed_B330, 2
  %polly.access.Packed_B332 = getelementptr double, double* %polly.access.cast.Packed_B327, i64 %polly.access.add.Packed_B331
  %_p_scalar_333 = load double, double* %polly.access.Packed_B332, align 8
  %p_mul21334 = fmul double %p_mul16326, %_p_scalar_333
  %scevgep335 = getelementptr [2300 x double], [2300 x double]* %C, i64 %188, i64 %194
  %_p_scalar_336 = load double, double* %scevgep335, align 8, !alias.scope !32, !noalias !33
  %p_add337 = fadd double %_p_scalar_336, %p_mul21334
  store double %p_add337, double* %scevgep335, align 8, !alias.scope !32, !noalias !33
  %195 = mul nsw i64 64, %polly.indvar139
  %196 = mul nsw i64 4, %polly.indvar185
  %197 = add nsw i64 %195, %196
  %198 = add nsw i64 %197, 1
  %199 = mul nsw i64 384, %polly.indvar112
  %200 = add nsw i64 %199, %polly.indvar193
  %201 = mul nsw i64 1024, %polly.indvar104
  %202 = mul nsw i64 4, %polly.indvar176
  %203 = add nsw i64 %201, %202
  %204 = add nsw i64 %203, 3
  br label %polly.stmt.for.body11338

polly.stmt.for.body11338:                         ; preds = %polly.stmt.for.body11317
  %alpha.s2a.reload339 = load double, double* %alpha.s2a
  %polly.access.cast.Packed_A340 = bitcast [16 x [384 x [4 x double]]]* %Packed_A to double*
  %polly.access.mul.Packed_A341 = mul nsw i64 %polly.indvar185, 384
  %polly.access.add.Packed_A342 = add nsw i64 %polly.access.mul.Packed_A341, %polly.indvar193
  %polly.access.mul.Packed_A343 = mul nsw i64 %polly.access.add.Packed_A342, 4
  %polly.access.add.Packed_A344 = add nsw i64 %polly.access.mul.Packed_A343, 1
  %polly.access.Packed_A345 = getelementptr double, double* %polly.access.cast.Packed_A340, i64 %polly.access.add.Packed_A344
  %_p_scalar_346 = load double, double* %polly.access.Packed_A345, align 8
  %p_mul16347 = fmul double %_p_scalar_346, %alpha.s2a.reload339
  %polly.access.cast.Packed_B348 = bitcast [256 x [384 x [4 x double]]]* %Packed_B to double*
  %polly.access.mul.Packed_B349 = mul nsw i64 %polly.indvar176, 384
  %polly.access.add.Packed_B350 = add nsw i64 %polly.access.mul.Packed_B349, %polly.indvar193
  %polly.access.mul.Packed_B351 = mul nsw i64 %polly.access.add.Packed_B350, 4
  %polly.access.add.Packed_B352 = add nsw i64 %polly.access.mul.Packed_B351, 3
  %polly.access.Packed_B353 = getelementptr double, double* %polly.access.cast.Packed_B348, i64 %polly.access.add.Packed_B352
  %_p_scalar_354 = load double, double* %polly.access.Packed_B353, align 8
  %p_mul21355 = fmul double %p_mul16347, %_p_scalar_354
  %scevgep356 = getelementptr [2300 x double], [2300 x double]* %C, i64 %198, i64 %204
  %_p_scalar_357 = load double, double* %scevgep356, align 8, !alias.scope !34, !noalias !35
  %p_add358 = fadd double %_p_scalar_357, %p_mul21355
  store double %p_add358, double* %scevgep356, align 8, !alias.scope !34, !noalias !35
  %205 = mul nsw i64 64, %polly.indvar139
  %206 = mul nsw i64 4, %polly.indvar185
  %207 = add nsw i64 %205, %206
  %208 = add nsw i64 %207, 2
  %209 = mul nsw i64 384, %polly.indvar112
  %210 = add nsw i64 %209, %polly.indvar193
  %211 = mul nsw i64 1024, %polly.indvar104
  %212 = mul nsw i64 4, %polly.indvar176
  %213 = add nsw i64 %211, %212
  br label %polly.stmt.for.body11359

polly.stmt.for.body11359:                         ; preds = %polly.stmt.for.body11338
  %alpha.s2a.reload360 = load double, double* %alpha.s2a
  %polly.access.cast.Packed_A361 = bitcast [16 x [384 x [4 x double]]]* %Packed_A to double*
  %polly.access.mul.Packed_A362 = mul nsw i64 %polly.indvar185, 384
  %polly.access.add.Packed_A363 = add nsw i64 %polly.access.mul.Packed_A362, %polly.indvar193
  %polly.access.mul.Packed_A364 = mul nsw i64 %polly.access.add.Packed_A363, 4
  %polly.access.add.Packed_A365 = add nsw i64 %polly.access.mul.Packed_A364, 2
  %polly.access.Packed_A366 = getelementptr double, double* %polly.access.cast.Packed_A361, i64 %polly.access.add.Packed_A365
  %_p_scalar_367 = load double, double* %polly.access.Packed_A366, align 8
  %p_mul16368 = fmul double %_p_scalar_367, %alpha.s2a.reload360
  %polly.access.cast.Packed_B369 = bitcast [256 x [384 x [4 x double]]]* %Packed_B to double*
  %polly.access.mul.Packed_B370 = mul nsw i64 %polly.indvar176, 384
  %polly.access.add.Packed_B371 = add nsw i64 %polly.access.mul.Packed_B370, %polly.indvar193
  %polly.access.mul.Packed_B372 = mul nsw i64 %polly.access.add.Packed_B371, 4
  %polly.access.add.Packed_B373 = add nsw i64 %polly.access.mul.Packed_B372, 0
  %polly.access.Packed_B374 = getelementptr double, double* %polly.access.cast.Packed_B369, i64 %polly.access.add.Packed_B373
  %_p_scalar_375 = load double, double* %polly.access.Packed_B374, align 8
  %p_mul21376 = fmul double %p_mul16368, %_p_scalar_375
  %scevgep377 = getelementptr [2300 x double], [2300 x double]* %C, i64 %208, i64 %213
  %_p_scalar_378 = load double, double* %scevgep377, align 8, !alias.scope !36, !noalias !37
  %p_add379 = fadd double %_p_scalar_378, %p_mul21376
  store double %p_add379, double* %scevgep377, align 8, !alias.scope !36, !noalias !37
  %214 = mul nsw i64 64, %polly.indvar139
  %215 = mul nsw i64 4, %polly.indvar185
  %216 = add nsw i64 %214, %215
  %217 = add nsw i64 %216, 2
  %218 = mul nsw i64 384, %polly.indvar112
  %219 = add nsw i64 %218, %polly.indvar193
  %220 = mul nsw i64 1024, %polly.indvar104
  %221 = mul nsw i64 4, %polly.indvar176
  %222 = add nsw i64 %220, %221
  %223 = add nsw i64 %222, 1
  br label %polly.stmt.for.body11380

polly.stmt.for.body11380:                         ; preds = %polly.stmt.for.body11359
  %alpha.s2a.reload381 = load double, double* %alpha.s2a
  %polly.access.cast.Packed_A382 = bitcast [16 x [384 x [4 x double]]]* %Packed_A to double*
  %polly.access.mul.Packed_A383 = mul nsw i64 %polly.indvar185, 384
  %polly.access.add.Packed_A384 = add nsw i64 %polly.access.mul.Packed_A383, %polly.indvar193
  %polly.access.mul.Packed_A385 = mul nsw i64 %polly.access.add.Packed_A384, 4
  %polly.access.add.Packed_A386 = add nsw i64 %polly.access.mul.Packed_A385, 2
  %polly.access.Packed_A387 = getelementptr double, double* %polly.access.cast.Packed_A382, i64 %polly.access.add.Packed_A386
  %_p_scalar_388 = load double, double* %polly.access.Packed_A387, align 8
  %p_mul16389 = fmul double %_p_scalar_388, %alpha.s2a.reload381
  %polly.access.cast.Packed_B390 = bitcast [256 x [384 x [4 x double]]]* %Packed_B to double*
  %polly.access.mul.Packed_B391 = mul nsw i64 %polly.indvar176, 384
  %polly.access.add.Packed_B392 = add nsw i64 %polly.access.mul.Packed_B391, %polly.indvar193
  %polly.access.mul.Packed_B393 = mul nsw i64 %polly.access.add.Packed_B392, 4
  %polly.access.add.Packed_B394 = add nsw i64 %polly.access.mul.Packed_B393, 1
  %polly.access.Packed_B395 = getelementptr double, double* %polly.access.cast.Packed_B390, i64 %polly.access.add.Packed_B394
  %_p_scalar_396 = load double, double* %polly.access.Packed_B395, align 8
  %p_mul21397 = fmul double %p_mul16389, %_p_scalar_396
  %scevgep398 = getelementptr [2300 x double], [2300 x double]* %C, i64 %217, i64 %223
  %_p_scalar_399 = load double, double* %scevgep398, align 8, !alias.scope !38, !noalias !39
  %p_add400 = fadd double %_p_scalar_399, %p_mul21397
  store double %p_add400, double* %scevgep398, align 8, !alias.scope !38, !noalias !39
  %224 = mul nsw i64 64, %polly.indvar139
  %225 = mul nsw i64 4, %polly.indvar185
  %226 = add nsw i64 %224, %225
  %227 = add nsw i64 %226, 2
  %228 = mul nsw i64 384, %polly.indvar112
  %229 = add nsw i64 %228, %polly.indvar193
  %230 = mul nsw i64 1024, %polly.indvar104
  %231 = mul nsw i64 4, %polly.indvar176
  %232 = add nsw i64 %230, %231
  %233 = add nsw i64 %232, 2
  br label %polly.stmt.for.body11401

polly.stmt.for.body11401:                         ; preds = %polly.stmt.for.body11380
  %alpha.s2a.reload402 = load double, double* %alpha.s2a
  %polly.access.cast.Packed_A403 = bitcast [16 x [384 x [4 x double]]]* %Packed_A to double*
  %polly.access.mul.Packed_A404 = mul nsw i64 %polly.indvar185, 384
  %polly.access.add.Packed_A405 = add nsw i64 %polly.access.mul.Packed_A404, %polly.indvar193
  %polly.access.mul.Packed_A406 = mul nsw i64 %polly.access.add.Packed_A405, 4
  %polly.access.add.Packed_A407 = add nsw i64 %polly.access.mul.Packed_A406, 2
  %polly.access.Packed_A408 = getelementptr double, double* %polly.access.cast.Packed_A403, i64 %polly.access.add.Packed_A407
  %_p_scalar_409 = load double, double* %polly.access.Packed_A408, align 8
  %p_mul16410 = fmul double %_p_scalar_409, %alpha.s2a.reload402
  %polly.access.cast.Packed_B411 = bitcast [256 x [384 x [4 x double]]]* %Packed_B to double*
  %polly.access.mul.Packed_B412 = mul nsw i64 %polly.indvar176, 384
  %polly.access.add.Packed_B413 = add nsw i64 %polly.access.mul.Packed_B412, %polly.indvar193
  %polly.access.mul.Packed_B414 = mul nsw i64 %polly.access.add.Packed_B413, 4
  %polly.access.add.Packed_B415 = add nsw i64 %polly.access.mul.Packed_B414, 2
  %polly.access.Packed_B416 = getelementptr double, double* %polly.access.cast.Packed_B411, i64 %polly.access.add.Packed_B415
  %_p_scalar_417 = load double, double* %polly.access.Packed_B416, align 8
  %p_mul21418 = fmul double %p_mul16410, %_p_scalar_417
  %scevgep419 = getelementptr [2300 x double], [2300 x double]* %C, i64 %227, i64 %233
  %_p_scalar_420 = load double, double* %scevgep419, align 8, !alias.scope !40, !noalias !41
  %p_add421 = fadd double %_p_scalar_420, %p_mul21418
  store double %p_add421, double* %scevgep419, align 8, !alias.scope !40, !noalias !41
  %234 = mul nsw i64 64, %polly.indvar139
  %235 = mul nsw i64 4, %polly.indvar185
  %236 = add nsw i64 %234, %235
  %237 = add nsw i64 %236, 2
  %238 = mul nsw i64 384, %polly.indvar112
  %239 = add nsw i64 %238, %polly.indvar193
  %240 = mul nsw i64 1024, %polly.indvar104
  %241 = mul nsw i64 4, %polly.indvar176
  %242 = add nsw i64 %240, %241
  %243 = add nsw i64 %242, 3
  br label %polly.stmt.for.body11422

polly.stmt.for.body11422:                         ; preds = %polly.stmt.for.body11401
  %alpha.s2a.reload423 = load double, double* %alpha.s2a
  %polly.access.cast.Packed_A424 = bitcast [16 x [384 x [4 x double]]]* %Packed_A to double*
  %polly.access.mul.Packed_A425 = mul nsw i64 %polly.indvar185, 384
  %polly.access.add.Packed_A426 = add nsw i64 %polly.access.mul.Packed_A425, %polly.indvar193
  %polly.access.mul.Packed_A427 = mul nsw i64 %polly.access.add.Packed_A426, 4
  %polly.access.add.Packed_A428 = add nsw i64 %polly.access.mul.Packed_A427, 2
  %polly.access.Packed_A429 = getelementptr double, double* %polly.access.cast.Packed_A424, i64 %polly.access.add.Packed_A428
  %_p_scalar_430 = load double, double* %polly.access.Packed_A429, align 8
  %p_mul16431 = fmul double %_p_scalar_430, %alpha.s2a.reload423
  %polly.access.cast.Packed_B432 = bitcast [256 x [384 x [4 x double]]]* %Packed_B to double*
  %polly.access.mul.Packed_B433 = mul nsw i64 %polly.indvar176, 384
  %polly.access.add.Packed_B434 = add nsw i64 %polly.access.mul.Packed_B433, %polly.indvar193
  %polly.access.mul.Packed_B435 = mul nsw i64 %polly.access.add.Packed_B434, 4
  %polly.access.add.Packed_B436 = add nsw i64 %polly.access.mul.Packed_B435, 3
  %polly.access.Packed_B437 = getelementptr double, double* %polly.access.cast.Packed_B432, i64 %polly.access.add.Packed_B436
  %_p_scalar_438 = load double, double* %polly.access.Packed_B437, align 8
  %p_mul21439 = fmul double %p_mul16431, %_p_scalar_438
  %scevgep440 = getelementptr [2300 x double], [2300 x double]* %C, i64 %237, i64 %243
  %_p_scalar_441 = load double, double* %scevgep440, align 8, !alias.scope !42, !noalias !43
  %p_add442 = fadd double %_p_scalar_441, %p_mul21439
  store double %p_add442, double* %scevgep440, align 8, !alias.scope !42, !noalias !43
  %244 = mul nsw i64 64, %polly.indvar139
  %245 = mul nsw i64 4, %polly.indvar185
  %246 = add nsw i64 %244, %245
  %247 = add nsw i64 %246, 3
  %248 = mul nsw i64 384, %polly.indvar112
  %249 = add nsw i64 %248, %polly.indvar193
  %250 = mul nsw i64 1024, %polly.indvar104
  %251 = mul nsw i64 4, %polly.indvar176
  %252 = add nsw i64 %250, %251
  br label %polly.stmt.for.body11443

polly.stmt.for.body11443:                         ; preds = %polly.stmt.for.body11422
  %alpha.s2a.reload444 = load double, double* %alpha.s2a
  %polly.access.cast.Packed_A445 = bitcast [16 x [384 x [4 x double]]]* %Packed_A to double*
  %polly.access.mul.Packed_A446 = mul nsw i64 %polly.indvar185, 384
  %polly.access.add.Packed_A447 = add nsw i64 %polly.access.mul.Packed_A446, %polly.indvar193
  %polly.access.mul.Packed_A448 = mul nsw i64 %polly.access.add.Packed_A447, 4
  %polly.access.add.Packed_A449 = add nsw i64 %polly.access.mul.Packed_A448, 3
  %polly.access.Packed_A450 = getelementptr double, double* %polly.access.cast.Packed_A445, i64 %polly.access.add.Packed_A449
  %_p_scalar_451 = load double, double* %polly.access.Packed_A450, align 8
  %p_mul16452 = fmul double %_p_scalar_451, %alpha.s2a.reload444
  %polly.access.cast.Packed_B453 = bitcast [256 x [384 x [4 x double]]]* %Packed_B to double*
  %polly.access.mul.Packed_B454 = mul nsw i64 %polly.indvar176, 384
  %polly.access.add.Packed_B455 = add nsw i64 %polly.access.mul.Packed_B454, %polly.indvar193
  %polly.access.mul.Packed_B456 = mul nsw i64 %polly.access.add.Packed_B455, 4
  %polly.access.add.Packed_B457 = add nsw i64 %polly.access.mul.Packed_B456, 0
  %polly.access.Packed_B458 = getelementptr double, double* %polly.access.cast.Packed_B453, i64 %polly.access.add.Packed_B457
  %_p_scalar_459 = load double, double* %polly.access.Packed_B458, align 8
  %p_mul21460 = fmul double %p_mul16452, %_p_scalar_459
  %scevgep461 = getelementptr [2300 x double], [2300 x double]* %C, i64 %247, i64 %252
  %_p_scalar_462 = load double, double* %scevgep461, align 8, !alias.scope !44, !noalias !45
  %p_add463 = fadd double %_p_scalar_462, %p_mul21460
  store double %p_add463, double* %scevgep461, align 8, !alias.scope !44, !noalias !45
  %253 = mul nsw i64 64, %polly.indvar139
  %254 = mul nsw i64 4, %polly.indvar185
  %255 = add nsw i64 %253, %254
  %256 = add nsw i64 %255, 3
  %257 = mul nsw i64 384, %polly.indvar112
  %258 = add nsw i64 %257, %polly.indvar193
  %259 = mul nsw i64 1024, %polly.indvar104
  %260 = mul nsw i64 4, %polly.indvar176
  %261 = add nsw i64 %259, %260
  %262 = add nsw i64 %261, 1
  br label %polly.stmt.for.body11464

polly.stmt.for.body11464:                         ; preds = %polly.stmt.for.body11443
  %alpha.s2a.reload465 = load double, double* %alpha.s2a
  %polly.access.cast.Packed_A466 = bitcast [16 x [384 x [4 x double]]]* %Packed_A to double*
  %polly.access.mul.Packed_A467 = mul nsw i64 %polly.indvar185, 384
  %polly.access.add.Packed_A468 = add nsw i64 %polly.access.mul.Packed_A467, %polly.indvar193
  %polly.access.mul.Packed_A469 = mul nsw i64 %polly.access.add.Packed_A468, 4
  %polly.access.add.Packed_A470 = add nsw i64 %polly.access.mul.Packed_A469, 3
  %polly.access.Packed_A471 = getelementptr double, double* %polly.access.cast.Packed_A466, i64 %polly.access.add.Packed_A470
  %_p_scalar_472 = load double, double* %polly.access.Packed_A471, align 8
  %p_mul16473 = fmul double %_p_scalar_472, %alpha.s2a.reload465
  %polly.access.cast.Packed_B474 = bitcast [256 x [384 x [4 x double]]]* %Packed_B to double*
  %polly.access.mul.Packed_B475 = mul nsw i64 %polly.indvar176, 384
  %polly.access.add.Packed_B476 = add nsw i64 %polly.access.mul.Packed_B475, %polly.indvar193
  %polly.access.mul.Packed_B477 = mul nsw i64 %polly.access.add.Packed_B476, 4
  %polly.access.add.Packed_B478 = add nsw i64 %polly.access.mul.Packed_B477, 1
  %polly.access.Packed_B479 = getelementptr double, double* %polly.access.cast.Packed_B474, i64 %polly.access.add.Packed_B478
  %_p_scalar_480 = load double, double* %polly.access.Packed_B479, align 8
  %p_mul21481 = fmul double %p_mul16473, %_p_scalar_480
  %scevgep482 = getelementptr [2300 x double], [2300 x double]* %C, i64 %256, i64 %262
  %_p_scalar_483 = load double, double* %scevgep482, align 8, !alias.scope !46, !noalias !47
  %p_add484 = fadd double %_p_scalar_483, %p_mul21481
  store double %p_add484, double* %scevgep482, align 8, !alias.scope !46, !noalias !47
  %263 = mul nsw i64 64, %polly.indvar139
  %264 = mul nsw i64 4, %polly.indvar185
  %265 = add nsw i64 %263, %264
  %266 = add nsw i64 %265, 3
  %267 = mul nsw i64 384, %polly.indvar112
  %268 = add nsw i64 %267, %polly.indvar193
  %269 = mul nsw i64 1024, %polly.indvar104
  %270 = mul nsw i64 4, %polly.indvar176
  %271 = add nsw i64 %269, %270
  %272 = add nsw i64 %271, 2
  br label %polly.stmt.for.body11485

polly.stmt.for.body11485:                         ; preds = %polly.stmt.for.body11464
  %alpha.s2a.reload486 = load double, double* %alpha.s2a
  %polly.access.cast.Packed_A487 = bitcast [16 x [384 x [4 x double]]]* %Packed_A to double*
  %polly.access.mul.Packed_A488 = mul nsw i64 %polly.indvar185, 384
  %polly.access.add.Packed_A489 = add nsw i64 %polly.access.mul.Packed_A488, %polly.indvar193
  %polly.access.mul.Packed_A490 = mul nsw i64 %polly.access.add.Packed_A489, 4
  %polly.access.add.Packed_A491 = add nsw i64 %polly.access.mul.Packed_A490, 3
  %polly.access.Packed_A492 = getelementptr double, double* %polly.access.cast.Packed_A487, i64 %polly.access.add.Packed_A491
  %_p_scalar_493 = load double, double* %polly.access.Packed_A492, align 8
  %p_mul16494 = fmul double %_p_scalar_493, %alpha.s2a.reload486
  %polly.access.cast.Packed_B495 = bitcast [256 x [384 x [4 x double]]]* %Packed_B to double*
  %polly.access.mul.Packed_B496 = mul nsw i64 %polly.indvar176, 384
  %polly.access.add.Packed_B497 = add nsw i64 %polly.access.mul.Packed_B496, %polly.indvar193
  %polly.access.mul.Packed_B498 = mul nsw i64 %polly.access.add.Packed_B497, 4
  %polly.access.add.Packed_B499 = add nsw i64 %polly.access.mul.Packed_B498, 2
  %polly.access.Packed_B500 = getelementptr double, double* %polly.access.cast.Packed_B495, i64 %polly.access.add.Packed_B499
  %_p_scalar_501 = load double, double* %polly.access.Packed_B500, align 8
  %p_mul21502 = fmul double %p_mul16494, %_p_scalar_501
  %scevgep503 = getelementptr [2300 x double], [2300 x double]* %C, i64 %266, i64 %272
  %_p_scalar_504 = load double, double* %scevgep503, align 8, !alias.scope !48, !noalias !49
  %p_add505 = fadd double %_p_scalar_504, %p_mul21502
  store double %p_add505, double* %scevgep503, align 8, !alias.scope !48, !noalias !49
  %273 = mul nsw i64 64, %polly.indvar139
  %274 = mul nsw i64 4, %polly.indvar185
  %275 = add nsw i64 %273, %274
  %276 = add nsw i64 %275, 3
  %277 = mul nsw i64 384, %polly.indvar112
  %278 = add nsw i64 %277, %polly.indvar193
  %279 = mul nsw i64 1024, %polly.indvar104
  %280 = mul nsw i64 4, %polly.indvar176
  %281 = add nsw i64 %279, %280
  %282 = add nsw i64 %281, 3
  br label %polly.stmt.for.body11506

polly.stmt.for.body11506:                         ; preds = %polly.stmt.for.body11485
  %alpha.s2a.reload507 = load double, double* %alpha.s2a
  %polly.access.cast.Packed_A508 = bitcast [16 x [384 x [4 x double]]]* %Packed_A to double*
  %polly.access.mul.Packed_A509 = mul nsw i64 %polly.indvar185, 384
  %polly.access.add.Packed_A510 = add nsw i64 %polly.access.mul.Packed_A509, %polly.indvar193
  %polly.access.mul.Packed_A511 = mul nsw i64 %polly.access.add.Packed_A510, 4
  %polly.access.add.Packed_A512 = add nsw i64 %polly.access.mul.Packed_A511, 3
  %polly.access.Packed_A513 = getelementptr double, double* %polly.access.cast.Packed_A508, i64 %polly.access.add.Packed_A512
  %_p_scalar_514 = load double, double* %polly.access.Packed_A513, align 8
  %p_mul16515 = fmul double %_p_scalar_514, %alpha.s2a.reload507
  %polly.access.cast.Packed_B516 = bitcast [256 x [384 x [4 x double]]]* %Packed_B to double*
  %polly.access.mul.Packed_B517 = mul nsw i64 %polly.indvar176, 384
  %polly.access.add.Packed_B518 = add nsw i64 %polly.access.mul.Packed_B517, %polly.indvar193
  %polly.access.mul.Packed_B519 = mul nsw i64 %polly.access.add.Packed_B518, 4
  %polly.access.add.Packed_B520 = add nsw i64 %polly.access.mul.Packed_B519, 3
  %polly.access.Packed_B521 = getelementptr double, double* %polly.access.cast.Packed_B516, i64 %polly.access.add.Packed_B520
  %_p_scalar_522 = load double, double* %polly.access.Packed_B521, align 8
  %p_mul21523 = fmul double %p_mul16515, %_p_scalar_522
  %scevgep524 = getelementptr [2300 x double], [2300 x double]* %C, i64 %276, i64 %282
  %_p_scalar_525 = load double, double* %scevgep524, align 8, !alias.scope !50, !noalias !51
  %p_add526 = fadd double %_p_scalar_525, %p_mul21523
  store double %p_add526, double* %scevgep524, align 8, !alias.scope !50, !noalias !51
  %polly.indvar_next194 = add nsw i64 %polly.indvar193, 1
  %polly.loop_cond195 = icmp sle i64 %polly.indvar_next194, %130
  br i1 %polly.loop_cond195, label %polly.loop_header189, label %polly.loop_exit191

polly.loop_preheader190:                          ; preds = %polly.loop_if188
  br label %polly.loop_header189

polly.then529:                                    ; preds = %polly.cond527
  %283 = mul nsw i64 384, %polly.indvar112
  %284 = sext i32 %nk to i64
  %285 = sub nsw i64 %284, %283
  %286 = sub nsw i64 %285, 1
  %287 = icmp slt i64 383, %286
  %288 = select i1 %287, i64 383, i64 %286
  br label %polly.loop_if531

polly.loop_exit534:                               ; preds = %polly.loop_exit543, %polly.loop_if531
  br label %polly.merge528

polly.else530:                                    ; preds = %polly.cond527
  br label %polly.merge528

polly.loop_if531:                                 ; preds = %polly.then529
  %polly.loop_guard535 = icmp sle i64 0, %288
  br i1 %polly.loop_guard535, label %polly.loop_preheader533, label %polly.loop_exit534

polly.loop_header532:                             ; preds = %polly.loop_exit543, %polly.loop_preheader533
  %polly.indvar536 = phi i64 [ 0, %polly.loop_preheader533 ], [ %polly.indvar_next537, %polly.loop_exit543 ]
  %289 = sext i32 %ni to i64
  %pexp.pdiv_r539 = urem i64 %289, 4
  br label %polly.loop_if540

polly.loop_exit543:                               ; preds = %polly.loop_exit550, %polly.loop_if540
  %polly.indvar_next537 = add nsw i64 %polly.indvar536, 1
  %polly.loop_cond538 = icmp sle i64 %polly.indvar_next537, %288
  br i1 %polly.loop_cond538, label %polly.loop_header532, label %polly.loop_exit534

polly.loop_preheader533:                          ; preds = %polly.loop_if531
  br label %polly.loop_header532

polly.loop_if540:                                 ; preds = %polly.loop_header532
  %polly.loop_guard544 = icmp slt i64 0, %pexp.pdiv_r539
  br i1 %polly.loop_guard544, label %polly.loop_preheader542, label %polly.loop_exit543

polly.loop_header541:                             ; preds = %polly.loop_exit550, %polly.loop_preheader542
  %polly.indvar545 = phi i64 [ 0, %polly.loop_preheader542 ], [ %polly.indvar_next546, %polly.loop_exit550 ]
  br label %polly.loop_preheader549

polly.loop_exit550:                               ; preds = %polly.stmt.for.body11555
  %polly.indvar_next546 = add nsw i64 %polly.indvar545, 1
  %polly.loop_cond547 = icmp slt i64 %polly.indvar_next546, %pexp.pdiv_r539
  br i1 %polly.loop_cond547, label %polly.loop_header541, label %polly.loop_exit543

polly.loop_preheader542:                          ; preds = %polly.loop_if540
  br label %polly.loop_header541

polly.loop_header548:                             ; preds = %polly.stmt.for.body11555, %polly.loop_preheader549
  %polly.indvar551 = phi i64 [ 0, %polly.loop_preheader549 ], [ %polly.indvar_next552, %polly.stmt.for.body11555 ]
  %290 = sext i32 %ni to i64
  %291 = add nsw i64 %290, 4
  %pexp.pdiv_r554 = urem i64 %291, 4
  %292 = sub nsw i64 0, %pexp.pdiv_r554
  %293 = sext i32 %ni to i64
  %294 = add nsw i64 %292, %293
  %295 = add nsw i64 %294, %polly.indvar545
  %296 = mul nsw i64 384, %polly.indvar112
  %297 = add nsw i64 %296, %polly.indvar536
  %298 = mul nsw i64 1024, %polly.indvar104
  %299 = mul nsw i64 4, %polly.indvar176
  %300 = add nsw i64 %298, %299
  %301 = add nsw i64 %300, %polly.indvar551
  br label %polly.stmt.for.body11555

polly.stmt.for.body11555:                         ; preds = %polly.loop_header548
  %alpha.s2a.reload556 = load double, double* %alpha.s2a
  %polly.access.cast.Packed_A557 = bitcast [16 x [384 x [4 x double]]]* %Packed_A to double*
  %302 = mul nsw i64 -16, %polly.indvar139
  %303 = sext i32 %ni to i64
  %304 = sub nsw i64 %303, 1
  %pexp.p_div_q558 = udiv i64 %304, 4
  %305 = add nsw i64 %302, %pexp.p_div_q558
  %polly.access.mul.Packed_A559 = mul nsw i64 %305, 384
  %polly.access.add.Packed_A560 = add nsw i64 %polly.access.mul.Packed_A559, %polly.indvar536
  %polly.access.mul.Packed_A561 = mul nsw i64 %polly.access.add.Packed_A560, 4
  %polly.access.add.Packed_A562 = add nsw i64 %polly.access.mul.Packed_A561, %polly.indvar545
  %polly.access.Packed_A563 = getelementptr double, double* %polly.access.cast.Packed_A557, i64 %polly.access.add.Packed_A562
  %_p_scalar_564 = load double, double* %polly.access.Packed_A563, align 8
  %p_mul16565 = fmul double %_p_scalar_564, %alpha.s2a.reload556
  %polly.access.cast.Packed_B566 = bitcast [256 x [384 x [4 x double]]]* %Packed_B to double*
  %polly.access.mul.Packed_B567 = mul nsw i64 %polly.indvar176, 384
  %polly.access.add.Packed_B568 = add nsw i64 %polly.access.mul.Packed_B567, %polly.indvar536
  %polly.access.mul.Packed_B569 = mul nsw i64 %polly.access.add.Packed_B568, 4
  %polly.access.add.Packed_B570 = add nsw i64 %polly.access.mul.Packed_B569, %polly.indvar551
  %polly.access.Packed_B571 = getelementptr double, double* %polly.access.cast.Packed_B566, i64 %polly.access.add.Packed_B570
  %_p_scalar_572 = load double, double* %polly.access.Packed_B571, align 8
  %p_mul21573 = fmul double %p_mul16565, %_p_scalar_572
  %scevgep574 = getelementptr [2300 x double], [2300 x double]* %C, i64 %295, i64 %301
  %_p_scalar_575 = load double, double* %scevgep574, align 8, !alias.scope !52, !noalias !53
  %p_add576 = fadd double %_p_scalar_575, %p_mul21573
  store double %p_add576, double* %scevgep574, align 8, !alias.scope !52, !noalias !53
  %polly.indvar_next552 = add nsw i64 %polly.indvar551, 1
  %polly.loop_cond553 = icmp sle i64 %polly.indvar_next552, 3
  br i1 %polly.loop_cond553, label %polly.loop_header548, label %polly.loop_exit550

polly.loop_preheader549:                          ; preds = %polly.loop_header541
  br label %polly.loop_header548

polly.then579:                                    ; preds = %polly.cond577
  %306 = mul nsw i64 -256, %polly.indvar104
  %307 = sext i32 %nj to i64
  %308 = sub nsw i64 %307, 1
  %pexp.p_div_q582 = udiv i64 %308, 4
  %309 = add nsw i64 %306, %pexp.p_div_q582
  %310 = icmp slt i64 255, %309
  %311 = select i1 %310, i64 255, i64 %309
  br label %polly.loop_if583

polly.loop_exit586:                               ; preds = %polly.merge592, %polly.loop_if583
  br label %polly.merge578

polly.else580:                                    ; preds = %polly.cond577
  br label %polly.merge578

polly.loop_if583:                                 ; preds = %polly.then579
  %polly.loop_guard587 = icmp sle i64 0, %311
  br i1 %polly.loop_guard587, label %polly.loop_preheader585, label %polly.loop_exit586

polly.loop_header584:                             ; preds = %polly.merge592, %polly.loop_preheader585
  %polly.indvar588 = phi i64 [ 0, %polly.loop_preheader585 ], [ %polly.indvar_next589, %polly.merge592 ]
  br label %polly.cond591

polly.cond591:                                    ; preds = %polly.loop_header584
  %312 = mul nsw i64 64, %polly.indvar139
  %313 = add nsw i64 %312, 3
  %314 = sext i32 %ni to i64
  %315 = icmp sge i64 %313, %314
  %316 = mul nsw i64 1024, %polly.indvar104
  %317 = mul nsw i64 4, %polly.indvar588
  %318 = add nsw i64 %316, %317
  %319 = add nsw i64 %318, 3
  %320 = sext i32 %nj to i64
  %321 = icmp sge i64 %319, %320
  %322 = or i1 %315, %321
  br i1 %322, label %polly.then593, label %polly.else594

polly.merge592:                                   ; preds = %polly.else594, %polly.loop_exit599
  %polly.indvar_next589 = add nsw i64 %polly.indvar588, 1
  %polly.loop_cond590 = icmp sle i64 %polly.indvar_next589, %311
  br i1 %polly.loop_cond590, label %polly.loop_header584, label %polly.loop_exit586

polly.loop_preheader585:                          ; preds = %polly.loop_if583
  br label %polly.loop_header584

polly.then593:                                    ; preds = %polly.cond591
  %323 = mul nsw i64 -16, %polly.indvar139
  %324 = sext i32 %ni to i64
  %325 = sub nsw i64 %324, 1
  %pexp.p_div_q595 = udiv i64 %325, 4
  %326 = add nsw i64 %323, %pexp.p_div_q595
  %327 = icmp slt i64 15, %326
  %328 = select i1 %327, i64 15, i64 %326
  br label %polly.loop_if596

polly.loop_exit599:                               ; preds = %polly.merge605, %polly.loop_if596
  br label %polly.merge592

polly.else594:                                    ; preds = %polly.cond591
  br label %polly.merge592

polly.loop_if596:                                 ; preds = %polly.then593
  %polly.loop_guard600 = icmp sle i64 0, %328
  br i1 %polly.loop_guard600, label %polly.loop_preheader598, label %polly.loop_exit599

polly.loop_header597:                             ; preds = %polly.merge605, %polly.loop_preheader598
  %polly.indvar601 = phi i64 [ 0, %polly.loop_preheader598 ], [ %polly.indvar_next602, %polly.merge605 ]
  br label %polly.cond604

polly.cond604:                                    ; preds = %polly.loop_header597
  %329 = mul nsw i64 64, %polly.indvar139
  %330 = add nsw i64 %329, 4
  %331 = sext i32 %ni to i64
  %332 = icmp sge i64 %331, %330
  %333 = mul nsw i64 1024, %polly.indvar104
  %334 = mul nsw i64 4, %polly.indvar588
  %335 = add nsw i64 %333, %334
  %336 = add nsw i64 %335, 3
  %337 = sext i32 %nj to i64
  %338 = icmp sge i64 %336, %337
  %339 = and i1 %332, %338
  %340 = or i1 %339, true
  br i1 %340, label %polly.then606, label %polly.else607

polly.merge605:                                   ; preds = %polly.else607, %polly.loop_exit611
  %polly.indvar_next602 = add nsw i64 %polly.indvar601, 1
  %polly.loop_cond603 = icmp sle i64 %polly.indvar_next602, %328
  br i1 %polly.loop_cond603, label %polly.loop_header597, label %polly.loop_exit599

polly.loop_preheader598:                          ; preds = %polly.loop_if596
  br label %polly.loop_header597

polly.then606:                                    ; preds = %polly.cond604
  %341 = mul nsw i64 384, %polly.indvar112
  %342 = sext i32 %nk to i64
  %343 = sub nsw i64 %342, %341
  %344 = sub nsw i64 %343, 1
  %345 = icmp slt i64 383, %344
  %346 = select i1 %345, i64 383, i64 %344
  br label %polly.loop_if608

polly.loop_exit611:                               ; preds = %polly.loop_exit619, %polly.loop_if608
  br label %polly.merge605

polly.else607:                                    ; preds = %polly.cond604
  br label %polly.merge605

polly.loop_if608:                                 ; preds = %polly.then606
  %polly.loop_guard612 = icmp sle i64 0, %346
  br i1 %polly.loop_guard612, label %polly.loop_preheader610, label %polly.loop_exit611

polly.loop_header609:                             ; preds = %polly.loop_exit619, %polly.loop_preheader610
  %polly.indvar613 = phi i64 [ 0, %polly.loop_preheader610 ], [ %polly.indvar_next614, %polly.loop_exit619 ]
  %347 = mul nsw i64 64, %polly.indvar139
  %348 = sext i32 %ni to i64
  %349 = sub nsw i64 %348, %347
  %350 = mul nsw i64 4, %polly.indvar601
  %351 = sub nsw i64 %349, %350
  %352 = sub nsw i64 %351, 1
  %353 = icmp slt i64 3, %352
  %354 = select i1 %353, i64 3, i64 %352
  br label %polly.loop_if616

polly.loop_exit619:                               ; preds = %polly.loop_exit627, %polly.loop_if616
  %polly.indvar_next614 = add nsw i64 %polly.indvar613, 1
  %polly.loop_cond615 = icmp sle i64 %polly.indvar_next614, %346
  br i1 %polly.loop_cond615, label %polly.loop_header609, label %polly.loop_exit611

polly.loop_preheader610:                          ; preds = %polly.loop_if608
  br label %polly.loop_header609

polly.loop_if616:                                 ; preds = %polly.loop_header609
  %polly.loop_guard620 = icmp sle i64 0, %354
  br i1 %polly.loop_guard620, label %polly.loop_preheader618, label %polly.loop_exit619

polly.loop_header617:                             ; preds = %polly.loop_exit627, %polly.loop_preheader618
  %polly.indvar621 = phi i64 [ 0, %polly.loop_preheader618 ], [ %polly.indvar_next622, %polly.loop_exit627 ]
  %355 = mul nsw i64 1024, %polly.indvar104
  %356 = sext i32 %nj to i64
  %357 = sub nsw i64 %356, %355
  %358 = mul nsw i64 4, %polly.indvar588
  %359 = sub nsw i64 %357, %358
  %360 = sub nsw i64 %359, 1
  %361 = icmp slt i64 3, %360
  %362 = select i1 %361, i64 3, i64 %360
  br label %polly.loop_if624

polly.loop_exit627:                               ; preds = %polly.stmt.for.body11632, %polly.loop_if624
  %polly.indvar_next622 = add nsw i64 %polly.indvar621, 1
  %polly.loop_cond623 = icmp sle i64 %polly.indvar_next622, %354
  br i1 %polly.loop_cond623, label %polly.loop_header617, label %polly.loop_exit619

polly.loop_preheader618:                          ; preds = %polly.loop_if616
  br label %polly.loop_header617

polly.loop_if624:                                 ; preds = %polly.loop_header617
  %polly.loop_guard628 = icmp sle i64 0, %362
  br i1 %polly.loop_guard628, label %polly.loop_preheader626, label %polly.loop_exit627

polly.loop_header625:                             ; preds = %polly.stmt.for.body11632, %polly.loop_preheader626
  %polly.indvar629 = phi i64 [ 0, %polly.loop_preheader626 ], [ %polly.indvar_next630, %polly.stmt.for.body11632 ]
  %363 = mul nsw i64 64, %polly.indvar139
  %364 = mul nsw i64 4, %polly.indvar601
  %365 = add nsw i64 %363, %364
  %366 = add nsw i64 %365, %polly.indvar621
  %367 = mul nsw i64 384, %polly.indvar112
  %368 = add nsw i64 %367, %polly.indvar613
  %369 = mul nsw i64 1024, %polly.indvar104
  %370 = mul nsw i64 4, %polly.indvar588
  %371 = add nsw i64 %369, %370
  %372 = add nsw i64 %371, %polly.indvar629
  br label %polly.stmt.for.body11632

polly.stmt.for.body11632:                         ; preds = %polly.loop_header625
  %alpha.s2a.reload633 = load double, double* %alpha.s2a
  %polly.access.cast.Packed_A634 = bitcast [16 x [384 x [4 x double]]]* %Packed_A to double*
  %polly.access.mul.Packed_A635 = mul nsw i64 %polly.indvar601, 384
  %polly.access.add.Packed_A636 = add nsw i64 %polly.access.mul.Packed_A635, %polly.indvar613
  %polly.access.mul.Packed_A637 = mul nsw i64 %polly.access.add.Packed_A636, 4
  %polly.access.add.Packed_A638 = add nsw i64 %polly.access.mul.Packed_A637, %polly.indvar621
  %polly.access.Packed_A639 = getelementptr double, double* %polly.access.cast.Packed_A634, i64 %polly.access.add.Packed_A638
  %_p_scalar_640 = load double, double* %polly.access.Packed_A639, align 8
  %p_mul16641 = fmul double %_p_scalar_640, %alpha.s2a.reload633
  %polly.access.cast.Packed_B642 = bitcast [256 x [384 x [4 x double]]]* %Packed_B to double*
  %polly.access.mul.Packed_B643 = mul nsw i64 %polly.indvar588, 384
  %polly.access.add.Packed_B644 = add nsw i64 %polly.access.mul.Packed_B643, %polly.indvar613
  %polly.access.mul.Packed_B645 = mul nsw i64 %polly.access.add.Packed_B644, 4
  %polly.access.add.Packed_B646 = add nsw i64 %polly.access.mul.Packed_B645, %polly.indvar629
  %polly.access.Packed_B647 = getelementptr double, double* %polly.access.cast.Packed_B642, i64 %polly.access.add.Packed_B646
  %_p_scalar_648 = load double, double* %polly.access.Packed_B647, align 8
  %p_mul21649 = fmul double %p_mul16641, %_p_scalar_648
  %scevgep650 = getelementptr [2300 x double], [2300 x double]* %C, i64 %366, i64 %372
  %_p_scalar_651 = load double, double* %scevgep650, align 8, !alias.scope !54, !noalias !55
  %p_add652 = fadd double %_p_scalar_651, %p_mul21649
  store double %p_add652, double* %scevgep650, align 8, !alias.scope !54, !noalias !55
  %polly.indvar_next630 = add nsw i64 %polly.indvar629, 1
  %polly.loop_cond631 = icmp sle i64 %polly.indvar_next630, %362
  br i1 %polly.loop_cond631, label %polly.loop_header625, label %polly.loop_exit627

polly.loop_preheader626:                          ; preds = %polly.loop_if624
  br label %polly.loop_header625
}

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8* nocapture, i8* nocapture) #5

; Function Attrs: nounwind uwtable
define internal void @print_array(i32 %ni, i32 %nj, [2300 x double]* noalias %C) #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %cmp14 = icmp sgt i32 %ni, 0
  br i1 %cmp14, label %for.cond1.preheader.lr.ph, label %for.end7

for.cond1.preheader.lr.ph:                        ; preds = %entry.split
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond1.preheader.lr.ph, %for.inc5
  %i.015 = phi i32 [ 0, %for.cond1.preheader.lr.ph ], [ %inc6, %for.inc5 ]
  br label %for.cond1

for.cond1:                                        ; preds = %for.cond1, %for.cond1.preheader
  %j.0 = phi i32 [ %inc, %for.cond1 ], [ 0, %for.cond1.preheader ]
  %cmp2 = icmp slt i32 %j.0, %nj
  %inc = add nuw nsw i32 %j.0, 1
  br i1 %cmp2, label %for.cond1, label %for.inc5

for.inc5:                                         ; preds = %for.cond1
  %inc6 = add nuw nsw i32 %i.015, 1
  %exitcond = icmp ne i32 %inc6, %ni
  br i1 %exitcond, label %for.cond1.preheader, label %for.cond.for.end7_crit_edge

for.cond.for.end7_crit_edge:                      ; preds = %for.inc5
  br label %for.end7

for.end7:                                         ; preds = %for.cond.for.end7_crit_edge, %entry.split
  ret void
}

; Function Attrs: nounwind uwtable
define internal double @rtclock() #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  ret double 0.000000e+00
}

; Function Attrs: nounwind
declare i32 @posix_memalign(i8**, i64, i64) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
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
!8 = !{!9, !9, i64 0}
!9 = !{!"long", !4, i64 0}
!10 = !{!4, !4, i64 0}
!11 = distinct !{!11, !12, !"polly.alias.scope.MemRef0"}
!12 = distinct !{!12, !"polly.alias.scope.domain"}
!13 = !{!14, !15, !16, !17, !18}
!14 = distinct !{!14, !12, !"polly.alias.scope.Packed_A"}
!15 = distinct !{!15, !12, !"polly.alias.scope.MemRef1"}
!16 = distinct !{!16, !12, !"polly.alias.scope.MemRef3"}
!17 = distinct !{!17, !12, !"polly.alias.scope.MemRef4"}
!18 = distinct !{!18, !12, !"polly.alias.scope.MemRef2"}
!19 = !{!14, !15, !16, !11, !18}
!20 = !{!14, !15, !16, !11, !17}
!21 = distinct !{!21, !11, !"second level alias metadata"}
!22 = distinct !{!22, !11, !"second level alias metadata"}
!23 = !{!14, !15, !16, !17, !18, !21}
!24 = distinct !{!24, !11, !"second level alias metadata"}
!25 = !{!14, !15, !16, !17, !18, !21, !22}
!26 = distinct !{!26, !11, !"second level alias metadata"}
!27 = !{!14, !15, !16, !17, !18, !21, !22, !24}
!28 = distinct !{!28, !11, !"second level alias metadata"}
!29 = !{!14, !15, !16, !17, !18, !21, !22, !24, !26}
!30 = distinct !{!30, !11, !"second level alias metadata"}
!31 = !{!14, !15, !16, !17, !18, !21, !22, !24, !26, !28}
!32 = distinct !{!32, !11, !"second level alias metadata"}
!33 = !{!14, !15, !16, !17, !18, !21, !22, !24, !26, !28, !30}
!34 = distinct !{!34, !11, !"second level alias metadata"}
!35 = !{!14, !15, !16, !17, !18, !21, !22, !24, !26, !28, !30, !32}
!36 = distinct !{!36, !11, !"second level alias metadata"}
!37 = !{!14, !15, !16, !17, !18, !21, !22, !24, !26, !28, !30, !32, !34}
!38 = distinct !{!38, !11, !"second level alias metadata"}
!39 = !{!14, !15, !16, !17, !18, !21, !22, !24, !26, !28, !30, !32, !34, !36}
!40 = distinct !{!40, !11, !"second level alias metadata"}
!41 = !{!14, !15, !16, !17, !18, !21, !22, !24, !26, !28, !30, !32, !34, !36, !38}
!42 = distinct !{!42, !11, !"second level alias metadata"}
!43 = !{!14, !15, !16, !17, !18, !21, !22, !24, !26, !28, !30, !32, !34, !36, !38, !40}
!44 = distinct !{!44, !11, !"second level alias metadata"}
!45 = !{!14, !15, !16, !17, !18, !21, !22, !24, !26, !28, !30, !32, !34, !36, !38, !40, !42}
!46 = distinct !{!46, !11, !"second level alias metadata"}
!47 = !{!14, !15, !16, !17, !18, !21, !22, !24, !26, !28, !30, !32, !34, !36, !38, !40, !42, !44}
!48 = distinct !{!48, !11, !"second level alias metadata"}
!49 = !{!14, !15, !16, !17, !18, !21, !22, !24, !26, !28, !30, !32, !34, !36, !38, !40, !42, !44, !46}
!50 = distinct !{!50, !11, !"second level alias metadata"}
!51 = !{!14, !15, !16, !17, !18, !21, !22, !24, !26, !28, !30, !32, !34, !36, !38, !40, !42, !44, !46, !48}
!52 = distinct !{!52, !11, !"second level alias metadata"}
!53 = !{!14, !15, !16, !17, !18, !21, !22, !24, !26, !28, !30, !32, !34, !36, !38, !40, !42, !44, !46, !48, !50}
!54 = distinct !{!54, !11, !"second level alias metadata"}
!55 = !{!14, !15, !16, !17, !18, !21, !22, !24, !26, !28, !30, !32, !34, !36, !38, !40, !42, !44, !46, !48, !50, !52}
