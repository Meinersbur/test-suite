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
  %ret.i.i15 = alloca i8*, align 8
  %ret.i.i8 = alloca i8*, align 8
  %ret.i.i = alloca i8*, align 8
  br label %entry.split

entry.split:                                      ; preds = %entry
  %0 = bitcast i8** %ret.i.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %0) #5
  store i8* null, i8** %ret.i.i, align 8, !tbaa !2
  %call.i.i = call i32 @posix_memalign(i8** nonnull %ret.i.i, i64 4096, i64 36800000) #5
  %1 = load i8*, i8** %ret.i.i, align 8, !tbaa !2
  %tobool.i.i = icmp eq i8* %1, null
  %tobool2.i.i = icmp ne i32 %call.i.i, 0
  %or.cond.i.i = or i1 %tobool2.i.i, %tobool.i.i
  br i1 %or.cond.i.i, label %if.then.i.i, label %polybench_alloc_data.exit

if.then.i.i:                                      ; preds = %entry.split
  call void @exit(i32 1) #6
  unreachable

polybench_alloc_data.exit:                        ; preds = %entry.split
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %0) #5
  %2 = bitcast i8** %ret.i.i8 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %2) #5
  store i8* null, i8** %ret.i.i8, align 8, !tbaa !2
  %call.i.i9 = call i32 @posix_memalign(i8** nonnull %ret.i.i8, i64 4096, i64 41600000) #5
  %3 = load i8*, i8** %ret.i.i8, align 8, !tbaa !2
  %tobool.i.i10 = icmp eq i8* %3, null
  %tobool2.i.i11 = icmp ne i32 %call.i.i9, 0
  %or.cond.i.i12 = or i1 %tobool2.i.i11, %tobool.i.i10
  br i1 %or.cond.i.i12, label %if.then.i.i13, label %polybench_alloc_data.exit14

if.then.i.i13:                                    ; preds = %polybench_alloc_data.exit
  call void @exit(i32 1) #6
  unreachable

polybench_alloc_data.exit14:                      ; preds = %polybench_alloc_data.exit
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %2) #5
  %4 = bitcast i8** %ret.i.i15 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %4) #5
  store i8* null, i8** %ret.i.i15, align 8, !tbaa !2
  %call.i.i16 = call i32 @posix_memalign(i8** nonnull %ret.i.i15, i64 4096, i64 47840000) #5
  %5 = load i8*, i8** %ret.i.i15, align 8, !tbaa !2
  %tobool.i.i17 = icmp eq i8* %5, null
  %tobool2.i.i18 = icmp ne i32 %call.i.i16, 0
  %or.cond.i.i19 = or i1 %tobool2.i.i18, %tobool.i.i17
  br i1 %or.cond.i.i19, label %if.then.i.i20, label %polybench_alloc_data.exit21

if.then.i.i20:                                    ; preds = %polybench_alloc_data.exit14
  call void @exit(i32 1) #6
  unreachable

polybench_alloc_data.exit21:                      ; preds = %polybench_alloc_data.exit14
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %4) #5
  %arraydecay.i = bitcast i8* %1 to [2300 x double]*
  %arraydecay1.i = bitcast i8* %3 to [2600 x double]*
  %arraydecay2.i = bitcast i8* %5 to [2300 x double]*
  call fastcc void @kernel_gemm([2300 x double]* %arraydecay.i, [2600 x double]* %arraydecay1.i, [2300 x double]* %arraydecay2.i) #5
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
  br label %entry.split

entry.split:                                      ; preds = %entry
  br label %for.cond1.preheader.i

for.cond1.preheader.i:                            ; preds = %for.inc7.i, %entry.split
  %indvars.iv24.i = phi i64 [ 0, %entry.split ], [ %indvars.iv.next25.i, %for.inc7.i ]
  br label %for.body3.i

for.body3.i:                                      ; preds = %for.body3.i, %for.cond1.preheader.i
  %indvars.iv19.i = phi i64 [ 0, %for.cond1.preheader.i ], [ %indvars.iv.next20.i, %for.body3.i ]
  %0 = mul nuw nsw i64 %indvars.iv19.i, %indvars.iv24.i
  %1 = add nuw nsw i64 %0, 1
  %2 = trunc i64 %1 to i32
  %rem.i = srem i32 %2, 2000
  %conv.i = sitofp i32 %rem.i to double
  %div.i = fdiv double %conv.i, 2.000000e+03
  %arrayidx6.i = getelementptr inbounds [2300 x double], [2300 x double]* %C, i64 %indvars.iv24.i, i64 %indvars.iv19.i
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
  %3 = mul nuw nsw i64 %indvars.iv.next13.i, %indvars.iv16.i
  %4 = trunc i64 %3 to i32
  %rem20.i = srem i32 %4, 2600
  %conv21.i = sitofp i32 %rem20.i to double
  %div23.i = fdiv double %conv21.i, 2.600000e+03
  %arrayidx27.i = getelementptr inbounds [2600 x double], [2600 x double]* %A, i64 %indvars.iv16.i, i64 %indvars.iv12.i
  store double %div23.i, double* %arrayidx27.i, align 8, !tbaa !6, !alias.scope !14, !noalias !15
  %exitcond15.i = icmp eq i64 %indvars.iv.next13.i, 2600
  br i1 %exitcond15.i, label %for.inc31.i, label %for.body17.i

for.inc31.i:                                      ; preds = %for.body17.i
  %indvars.iv.next17.i = add nuw nsw i64 %indvars.iv16.i, 1
  %exitcond18.i = icmp eq i64 %indvars.iv.next17.i, 2000
  br i1 %exitcond18.i, label %for.cond38.preheader.i, label %for.cond14.preheader.i

for.cond38.preheader.i:                           ; preds = %for.inc31.i, %for.inc55.i
  %indvars.iv9.i = phi i64 [ %indvars.iv.next10.i, %for.inc55.i ], [ 0, %for.inc31.i ]
  br label %for.body41.i

for.body41.i:                                     ; preds = %for.body41.i, %for.cond38.preheader.i
  %indvars.iv.i = phi i64 [ 0, %for.cond38.preheader.i ], [ %indvars.iv.next.i, %for.body41.i ]
  %5 = add nuw nsw i64 %indvars.iv.i, 2
  %6 = mul nuw nsw i64 %5, %indvars.iv9.i
  %7 = trunc i64 %6 to i32
  %rem44.i = srem i32 %7, 2300
  %conv45.i = sitofp i32 %rem44.i to double
  %div47.i = fdiv double %conv45.i, 2.300000e+03
  %arrayidx51.i = getelementptr inbounds [2300 x double], [2300 x double]* %B, i64 %indvars.iv9.i, i64 %indvars.iv.i
  store double %div47.i, double* %arrayidx51.i, align 8, !tbaa !6, !alias.scope !16, !noalias !17
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  %exitcond.i = icmp eq i64 %indvars.iv.next.i, 2300
  br i1 %exitcond.i, label %for.inc55.i, label %for.body41.i

for.inc55.i:                                      ; preds = %for.body41.i
  %indvars.iv.next10.i = add nuw nsw i64 %indvars.iv9.i, 1
  %exitcond11.i = icmp eq i64 %indvars.iv.next10.i, 2600
  br i1 %exitcond11.i, label %for.cond1.preheader, label %for.cond38.preheader.i

for.cond1.preheader:                              ; preds = %for.inc55.i, %for.inc32
  %indvars.iv11 = phi i64 [ %indvars.iv.next12, %for.inc32 ], [ 0, %for.inc55.i ]
  br label %for.body3

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.body3 ]
  %arrayidx5 = getelementptr inbounds [2300 x double], [2300 x double]* %C, i64 %indvars.iv11, i64 %indvars.iv
  %8 = load double, double* %arrayidx5, align 8, !tbaa !6
  %mul = fmul double %8, 1.200000e+00
  store double %mul, double* %arrayidx5, align 8, !tbaa !6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2300
  br i1 %exitcond, label %for.cond9.preheader, label %for.body3

for.cond9.preheader:                              ; preds = %for.body3, %for.inc29
  %indvars.iv8 = phi i64 [ %indvars.iv.next9, %for.inc29 ], [ 0, %for.body3 ]
  %arrayidx15 = getelementptr inbounds [2600 x double], [2600 x double]* %A, i64 %indvars.iv11, i64 %indvars.iv8
  %9 = load double, double* %arrayidx15, align 8, !tbaa !6
  %mul16 = fmul double %9, 1.500000e+00
  br label %for.body11

for.body11:                                       ; preds = %for.body11, %for.cond9.preheader
  %indvars.iv5 = phi i64 [ 0, %for.cond9.preheader ], [ %indvars.iv.next6, %for.body11 ]
  %arrayidx20 = getelementptr inbounds [2300 x double], [2300 x double]* %B, i64 %indvars.iv8, i64 %indvars.iv5
  %10 = load double, double* %arrayidx20, align 8, !tbaa !6
  %mul21 = fmul double %mul16, %10
  %arrayidx25 = getelementptr inbounds [2300 x double], [2300 x double]* %C, i64 %indvars.iv11, i64 %indvars.iv5
  %11 = load double, double* %arrayidx25, align 8, !tbaa !6
  %add = fadd double %11, %mul21
  store double %add, double* %arrayidx25, align 8, !tbaa !6
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next6, 2300
  br i1 %exitcond7, label %for.inc29, label %for.body11

for.inc29:                                        ; preds = %for.body11
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next9, 2600
  br i1 %exitcond10, label %for.inc32, label %for.cond9.preheader

for.inc32:                                        ; preds = %for.inc29
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next12, 2000
  br i1 %exitcond13, label %for.end34, label %for.cond1.preheader

for.end34:                                        ; preds = %for.inc32
  ret void
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
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
