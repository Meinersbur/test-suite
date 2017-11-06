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
  br label %entry.split

entry.split:                                      ; preds = %entry
  %arraydecay = bitcast i8* %CC to [2300 x double]*
  %arraydecay1 = bitcast i8* %AA to [2600 x double]*
  br label %for.cond1.preheader.i.i

for.cond1.preheader.i.i:                          ; preds = %for.inc7.i.i, %entry.split
  %indvars.iv24.i.i = phi i64 [ 0, %entry.split ], [ %indvars.iv.next25.i.i, %for.inc7.i.i ]
  br label %for.body3.i.i

for.body3.i.i:                                    ; preds = %for.body3.i.i, %for.cond1.preheader.i.i
  %indvars.iv19.i.i = phi i64 [ 0, %for.cond1.preheader.i.i ], [ %indvars.iv.next20.i.i, %for.body3.i.i ]
  %0 = mul nuw nsw i64 %indvars.iv19.i.i, %indvars.iv24.i.i
  %1 = add nuw nsw i64 %0, 1
  %2 = trunc i64 %1 to i32
  %rem.i.i = srem i32 %2, 2000
  %conv.i.i = sitofp i32 %rem.i.i to double
  %div.i.i = fdiv double %conv.i.i, 2.000000e+03
  %arrayidx6.i.i = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay, i64 %indvars.iv24.i.i, i64 %indvars.iv19.i.i
  store double %div.i.i, double* %arrayidx6.i.i, align 8, !tbaa !6, !alias.scope !8, !noalias !13
  %indvars.iv.next20.i.i = add nuw nsw i64 %indvars.iv19.i.i, 1
  %exitcond23.i.i = icmp eq i64 %indvars.iv.next20.i.i, 2300
  br i1 %exitcond23.i.i, label %for.inc7.i.i, label %for.body3.i.i

for.inc7.i.i:                                     ; preds = %for.body3.i.i
  %indvars.iv.next25.i.i = add nuw nsw i64 %indvars.iv24.i.i, 1
  %exitcond26.i.i = icmp eq i64 %indvars.iv.next25.i.i, 2000
  br i1 %exitcond26.i.i, label %for.cond14.preheader.i.i.preheader, label %for.cond1.preheader.i.i

for.cond14.preheader.i.i.preheader:               ; preds = %for.inc7.i.i
  %arraydecay2 = bitcast i8* %BB to [2300 x double]*
  br label %for.cond14.preheader.i.i

for.cond14.preheader.i.i:                         ; preds = %for.cond14.preheader.i.i.preheader, %for.inc31.i.i
  %indvars.iv16.i.i = phi i64 [ %indvars.iv.next17.i.i, %for.inc31.i.i ], [ 0, %for.cond14.preheader.i.i.preheader ]
  br label %for.body17.i.i

for.body17.i.i:                                   ; preds = %for.body17.i.i, %for.cond14.preheader.i.i
  %indvars.iv12.i.i = phi i64 [ 0, %for.cond14.preheader.i.i ], [ %indvars.iv.next13.i.i, %for.body17.i.i ]
  %indvars.iv.next13.i.i = add nuw nsw i64 %indvars.iv12.i.i, 1
  %3 = mul nuw nsw i64 %indvars.iv.next13.i.i, %indvars.iv16.i.i
  %4 = trunc i64 %3 to i32
  %rem20.i.i = srem i32 %4, 2600
  %conv21.i.i = sitofp i32 %rem20.i.i to double
  %div23.i.i = fdiv double %conv21.i.i, 2.600000e+03
  %arrayidx27.i.i = getelementptr inbounds [2600 x double], [2600 x double]* %arraydecay1, i64 %indvars.iv16.i.i, i64 %indvars.iv12.i.i
  store double %div23.i.i, double* %arrayidx27.i.i, align 8, !tbaa !6, !alias.scope !18, !noalias !19
  %exitcond15.i.i = icmp eq i64 %indvars.iv.next13.i.i, 2600
  br i1 %exitcond15.i.i, label %for.inc31.i.i, label %for.body17.i.i

for.inc31.i.i:                                    ; preds = %for.body17.i.i
  %indvars.iv.next17.i.i = add nuw nsw i64 %indvars.iv16.i.i, 1
  %exitcond18.i.i = icmp eq i64 %indvars.iv.next17.i.i, 2000
  br i1 %exitcond18.i.i, label %for.cond38.preheader.i.i, label %for.cond14.preheader.i.i

for.cond38.preheader.i.i:                         ; preds = %for.inc31.i.i, %for.inc55.i.i
  %indvars.iv9.i.i = phi i64 [ %indvars.iv.next10.i.i, %for.inc55.i.i ], [ 0, %for.inc31.i.i ]
  br label %for.body41.i.i

for.body41.i.i:                                   ; preds = %for.body41.i.i, %for.cond38.preheader.i.i
  %indvars.iv.i.i = phi i64 [ 0, %for.cond38.preheader.i.i ], [ %indvars.iv.next.i.i, %for.body41.i.i ]
  %5 = add nuw nsw i64 %indvars.iv.i.i, 2
  %6 = mul nuw nsw i64 %5, %indvars.iv9.i.i
  %7 = trunc i64 %6 to i32
  %rem44.i.i = srem i32 %7, 2300
  %conv45.i.i = sitofp i32 %rem44.i.i to double
  %div47.i.i = fdiv double %conv45.i.i, 2.300000e+03
  %arrayidx51.i.i = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay2, i64 %indvars.iv9.i.i, i64 %indvars.iv.i.i
  store double %div47.i.i, double* %arrayidx51.i.i, align 8, !tbaa !6, !alias.scope !20, !noalias !21
  %indvars.iv.next.i.i = add nuw nsw i64 %indvars.iv.i.i, 1
  %exitcond.i.i = icmp eq i64 %indvars.iv.next.i.i, 2300
  br i1 %exitcond.i.i, label %for.inc55.i.i, label %for.body41.i.i

for.inc55.i.i:                                    ; preds = %for.body41.i.i
  %indvars.iv.next10.i.i = add nuw nsw i64 %indvars.iv9.i.i, 1
  %exitcond11.i.i = icmp eq i64 %indvars.iv.next10.i.i, 2600
  br i1 %exitcond11.i.i, label %for.cond1.preheader.i, label %for.cond38.preheader.i.i

for.cond1.preheader.i:                            ; preds = %for.inc55.i.i, %for.inc32.i
  %indvars.iv11.i = phi i64 [ %indvars.iv.next12.i, %for.inc32.i ], [ 0, %for.inc55.i.i ]
  br label %for.body3.i

for.body3.i:                                      ; preds = %for.body3.i, %for.cond1.preheader.i
  %indvars.iv.i = phi i64 [ 0, %for.cond1.preheader.i ], [ %indvars.iv.next.i, %for.body3.i ]
  %arrayidx5.i = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay, i64 %indvars.iv11.i, i64 %indvars.iv.i
  %8 = load double, double* %arrayidx5.i, align 8, !tbaa !6, !alias.scope !22, !noalias !23
  %mul.i = fmul double %8, 1.200000e+00
  store double %mul.i, double* %arrayidx5.i, align 8, !tbaa !6, !alias.scope !22, !noalias !23
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  %exitcond.i = icmp eq i64 %indvars.iv.next.i, 2300
  br i1 %exitcond.i, label %for.cond9.preheader.i, label %for.body3.i

for.cond9.preheader.i:                            ; preds = %for.body3.i, %for.inc29.i
  %indvars.iv8.i = phi i64 [ %indvars.iv.next9.i, %for.inc29.i ], [ 0, %for.body3.i ]
  %arrayidx15.i = getelementptr inbounds [2600 x double], [2600 x double]* %arraydecay1, i64 %indvars.iv11.i, i64 %indvars.iv8.i
  %9 = load double, double* %arrayidx15.i, align 8, !tbaa !6, !alias.scope !24, !noalias !25
  %mul16.i = fmul double %9, 1.500000e+00
  br label %for.body11.i

for.body11.i:                                     ; preds = %for.body11.i, %for.cond9.preheader.i
  %indvars.iv5.i = phi i64 [ 0, %for.cond9.preheader.i ], [ %indvars.iv.next6.i, %for.body11.i ]
  %arrayidx20.i = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay2, i64 %indvars.iv8.i, i64 %indvars.iv5.i
  %10 = load double, double* %arrayidx20.i, align 8, !tbaa !6, !alias.scope !26, !noalias !27
  %mul21.i = fmul double %mul16.i, %10
  %arrayidx25.i = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay, i64 %indvars.iv11.i, i64 %indvars.iv5.i
  %11 = load double, double* %arrayidx25.i, align 8, !tbaa !6, !alias.scope !22, !noalias !23
  %add.i = fadd double %11, %mul21.i
  store double %add.i, double* %arrayidx25.i, align 8, !tbaa !6, !alias.scope !22, !noalias !23
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
  br i1 %exitcond13.i, label %kernel_gemm.exit, label %for.cond1.preheader.i

kernel_gemm.exit:                                 ; preds = %for.inc32.i
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
