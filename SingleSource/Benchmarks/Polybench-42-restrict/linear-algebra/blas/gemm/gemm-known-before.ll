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
  br label %entry.split

entry.split:                                      ; preds = %entry
  %0 = bitcast i8** %ret.i.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %0) #4
  store i8* null, i8** %ret.i.i, align 8, !tbaa !2
  %call.i.i = call i32 @posix_memalign(i8** nonnull %ret.i.i, i64 4096, i64 36800000) #4
  %1 = load i8*, i8** %ret.i.i, align 8, !tbaa !2
  %tobool.i.i = icmp eq i8* %1, null
  %tobool2.i.i = icmp ne i32 %call.i.i, 0
  %or.cond.i.i = or i1 %tobool2.i.i, %tobool.i.i
  br i1 %or.cond.i.i, label %if.then.i.i, label %polybench_alloc_data.exit

if.then.i.i:                                      ; preds = %entry.split
  call void @exit(i32 1) #5
  unreachable

polybench_alloc_data.exit:                        ; preds = %entry.split
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
  br label %for.cond1.preheader.i

for.cond1.preheader.i:                            ; preds = %for.inc7.i, %polybench_alloc_data.exit40
  %indvars.iv24.i = phi i64 [ 0, %polybench_alloc_data.exit40 ], [ %indvars.iv.next25.i, %for.inc7.i ]
  br label %for.body3.i

for.body3.i:                                      ; preds = %for.body3.i, %for.cond1.preheader.i
  %indvars.iv19.i = phi i64 [ 0, %for.cond1.preheader.i ], [ %indvars.iv.next20.i, %for.body3.i ]
  %6 = mul nuw nsw i64 %indvars.iv19.i, %indvars.iv24.i
  %7 = add nuw nsw i64 %6, 1
  %8 = trunc i64 %7 to i32
  %rem.i = srem i32 %8, 2000
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
  br i1 %exitcond26.i, label %for.cond14.preheader.i.preheader, label %for.cond1.preheader.i

for.cond14.preheader.i.preheader:                 ; preds = %for.inc7.i
  %arraydecay4 = bitcast i8* %5 to [2300 x double]*
  br label %for.cond14.preheader.i

for.cond14.preheader.i:                           ; preds = %for.cond14.preheader.i.preheader, %for.inc31.i
  %indvars.iv16.i = phi i64 [ %indvars.iv.next17.i, %for.inc31.i ], [ 0, %for.cond14.preheader.i.preheader ]
  br label %for.body17.i

for.body17.i:                                     ; preds = %for.body17.i, %for.cond14.preheader.i
  %indvars.iv12.i = phi i64 [ 0, %for.cond14.preheader.i ], [ %indvars.iv.next13.i, %for.body17.i ]
  %indvars.iv.next13.i = add nuw nsw i64 %indvars.iv12.i, 1
  %9 = mul nuw nsw i64 %indvars.iv.next13.i, %indvars.iv16.i
  %10 = trunc i64 %9 to i32
  %rem20.i = srem i32 %10, 2600
  %conv21.i = sitofp i32 %rem20.i to double
  %div23.i = fmul fast double %conv21.i, 0x3F3934C67F9B2CE6
  %arrayidx27.i = getelementptr inbounds [2600 x double], [2600 x double]* %arraydecay3, i64 %indvars.iv16.i, i64 %indvars.iv12.i
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
  %11 = add nuw nsw i64 %indvars.iv.i, 2
  %12 = mul nuw nsw i64 %11, %indvars.iv9.i
  %13 = trunc i64 %12 to i32
  %rem44.i = srem i32 %13, 2300
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
  %14 = load double, double* %arrayidx5.i, align 8, !tbaa !6, !alias.scope !18, !noalias !21
  %mul.i = fmul fast double %14, 1.200000e+00
  store double %mul.i, double* %arrayidx5.i, align 8, !tbaa !6, !alias.scope !18, !noalias !21
  %indvars.iv.next.i43 = add nuw nsw i64 %indvars.iv.i42, 1
  %exitcond.i44 = icmp eq i64 %indvars.iv.next.i43, 2300
  br i1 %exitcond.i44, label %for.cond9.preheader.i, label %for.body3.i45

for.cond9.preheader.i:                            ; preds = %for.body3.i45, %for.inc29.i
  %indvars.iv8.i = phi i64 [ %indvars.iv.next9.i, %for.inc29.i ], [ 0, %for.body3.i45 ]
  %arrayidx15.i = getelementptr inbounds [2600 x double], [2600 x double]* %arraydecay3, i64 %indvars.iv11.i, i64 %indvars.iv8.i
  %15 = load double, double* %arrayidx15.i, align 8, !tbaa !6, !alias.scope !24, !noalias !25
  %mul16.i = fmul fast double %15, 1.500000e+00
  br label %for.body11.i

for.body11.i:                                     ; preds = %for.body11.i, %for.cond9.preheader.i
  %indvars.iv5.i = phi i64 [ 0, %for.cond9.preheader.i ], [ %indvars.iv.next6.i, %for.body11.i ]
  %arrayidx20.i = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay4, i64 %indvars.iv8.i, i64 %indvars.iv5.i
  %16 = load double, double* %arrayidx20.i, align 8, !tbaa !6, !alias.scope !26, !noalias !27
  %mul21.i = fmul fast double %mul16.i, %16
  %arrayidx25.i = getelementptr inbounds [2300 x double], [2300 x double]* %arraydecay, i64 %indvars.iv11.i, i64 %indvars.iv5.i
  %17 = load double, double* %arrayidx25.i, align 8, !tbaa !6, !alias.scope !18, !noalias !21
  %add.i = fadd fast double %17, %mul21.i
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

kernel_gemm.exit:                                 ; preds = %for.inc32.i
  call void @free(i8* nonnull %1) #4
  call void @free(i8* %3) #4
  call void @free(i8* nonnull %5) #4
  ret i32 0
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

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="true" "no-jump-tables"="false" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="haswell" "target-features"="+aes,+avx,+avx2,+bmi,+bmi2,+cmov,+cx16,+f16c,+fma,+fsgsbase,+fxsr,+lzcnt,+mmx,+movbe,+pclmul,+popcnt,+rdrnd,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87,+xsave,+xsaveopt,-adx,-avx512bw,-avx512cd,-avx512dq,-avx512er,-avx512f,-avx512ifma,-avx512pf,-avx512vbmi,-avx512vl,-avx512vpopcntdq,-clflushopt,-clwb,-clzero,-fma4,-lwp,-mwaitx,-pku,-prefetchwt1,-prfchw,-rdseed,-rtm,-sgx,-sha,-sse4a,-tbm,-xop,-xsavec,-xsaves" "unsafe-fp-math"="true" "use-soft-float"="false" }
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
