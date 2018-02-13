; ModuleID = 'gemm.c'
source_filename = "gemm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@polybench_t_start = common global double 0.000000e+00, align 8
@polybench_t_end = common global double 0.000000e+00, align 8
@polybench_c_start = common global i64 0, align 8
@polybench_c_end = common global i64 0, align 8
@polybench_inter_array_padding_sz = internal global i64 0, align 8

; Function Attrs: noinline nounwind optnone uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %ni = alloca i32, align 4
  %nj = alloca i32, align 4
  %nk = alloca i32, align 4
  %alpha = alloca double, align 8
  %beta = alloca double, align 8
  %C = alloca [2300 x double*]*, align 8
  %A = alloca [2600 x double*]*, align 8
  %B = alloca [2300 x double*]*, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  store i32 2000, i32* %ni, align 4
  store i32 2300, i32* %nj, align 4
  store i32 2600, i32* %nk, align 4
  %call = call i8* @polybench_alloc_data(i64 4600000, i32 8)
  %0 = bitcast i8* %call to [2000 x [2300 x double]]*
  %1 = bitcast [2000 x [2300 x double]]* %0 to [2300 x double*]*
  store [2300 x double*]* %1, [2300 x double*]** %C, align 8
  %call1 = call i8* @polybench_alloc_data(i64 5200000, i32 8)
  %2 = bitcast i8* %call1 to [2000 x [2600 x double]]*
  %3 = bitcast [2000 x [2600 x double]]* %2 to [2600 x double*]*
  store [2600 x double*]* %3, [2600 x double*]** %A, align 8
  %call2 = call i8* @polybench_alloc_data(i64 5980000, i32 8)
  %4 = bitcast i8* %call2 to [2600 x [2300 x double]]*
  %5 = bitcast [2600 x [2300 x double]]* %4 to [2300 x double*]*
  store [2300 x double*]* %5, [2300 x double*]** %B, align 8
  %6 = load i32, i32* %ni, align 4
  %7 = load i32, i32* %nj, align 4
  %8 = load i32, i32* %nk, align 4
  %9 = load double, double* %alpha, align 8
  %10 = load double, double* %beta, align 8
  %11 = load [2300 x double*]*, [2300 x double*]** %C, align 8
  %arraydecay = getelementptr inbounds [2300 x double*], [2300 x double*]* %11, i32 0, i32 0
  %12 = bitcast double** %arraydecay to [2300 x double]*
  %13 = load [2600 x double*]*, [2600 x double*]** %A, align 8
  %arraydecay3 = getelementptr inbounds [2600 x double*], [2600 x double*]* %13, i32 0, i32 0
  %14 = bitcast double** %arraydecay3 to [2600 x double]*
  %15 = load [2300 x double*]*, [2300 x double*]** %B, align 8
  %arraydecay4 = getelementptr inbounds [2300 x double*], [2300 x double*]* %15, i32 0, i32 0
  %16 = bitcast double** %arraydecay4 to [2300 x double]*
  call void @kernel_gemm(i32 %6, i32 %7, i32 %8, double %9, double %10, [2300 x double]* %12, [2600 x double]* %14, [2300 x double]* %16)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i8* @polybench_alloc_data(i64 %n, i32 %elt_size) #0 {
entry:
  %n.addr = alloca i64, align 8
  %elt_size.addr = alloca i32, align 4
  %val = alloca i64, align 8
  %ret = alloca i8*, align 8
  store i64 %n, i64* %n.addr, align 8
  store i32 %elt_size, i32* %elt_size.addr, align 4
  %0 = load i64, i64* %n.addr, align 8
  store i64 %0, i64* %val, align 8
  %1 = load i32, i32* %elt_size.addr, align 4
  %conv = sext i32 %1 to i64
  %2 = load i64, i64* %val, align 8
  %mul = mul i64 %2, %conv
  store i64 %mul, i64* %val, align 8
  %3 = load i64, i64* %val, align 8
  %call = call i8* @xmalloc(i64 %3)
  store i8* %call, i8** %ret, align 8
  %4 = load i8*, i8** %ret, align 8
  ret i8* %4
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @kernel_gemm(i32 %ni, i32 %nj, i32 %nk, double %alpha, double %beta, [2300 x double]* noalias %C, [2600 x double]* noalias %A, [2300 x double]* noalias %B) #0 {
entry:
  %ni.addr = alloca i32, align 4
  %nj.addr = alloca i32, align 4
  %nk.addr = alloca i32, align 4
  %alpha.addr = alloca double, align 8
  %beta.addr = alloca double, align 8
  %C.addr = alloca [2300 x double]*, align 8
  %A.addr = alloca [2600 x double]*, align 8
  %B.addr = alloca [2300 x double]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 %ni, i32* %ni.addr, align 4
  store i32 %nj, i32* %nj.addr, align 4
  store i32 %nk, i32* %nk.addr, align 4
  store double %alpha, double* %alpha.addr, align 8
  store double %beta, double* %beta.addr, align 8
  store [2300 x double]* %C, [2300 x double]** %C.addr, align 8
  store [2600 x double]* %A, [2600 x double]** %A.addr, align 8
  store [2300 x double]* %B, [2300 x double]** %B.addr, align 8
  %0 = load i32, i32* %ni.addr, align 4
  %1 = load i32, i32* %nj.addr, align 4
  %2 = load i32, i32* %nk.addr, align 4
  %3 = load [2300 x double]*, [2300 x double]** %C.addr, align 8
  %4 = load [2600 x double]*, [2600 x double]** %A.addr, align 8
  %5 = load [2300 x double]*, [2300 x double]** %B.addr, align 8
  call void @init_array(i32 %0, i32 %1, i32 %2, double* %alpha.addr, double* %beta.addr, [2300 x double]* %3, [2600 x double]* %4, [2300 x double]* %5)
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc32, %entry
  %6 = load i32, i32* %i, align 4
  %7 = load i32, i32* %ni.addr, align 4
  %cmp = icmp slt i32 %6, %7
  br i1 %cmp, label %for.body, label %for.end34

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %8 = load i32, i32* %j, align 4
  %9 = load i32, i32* %nj.addr, align 4
  %cmp2 = icmp slt i32 %8, %9
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %10 = load double, double* %beta.addr, align 8
  %11 = load [2300 x double]*, [2300 x double]** %C.addr, align 8
  %12 = load i32, i32* %i, align 4
  %idxprom = sext i32 %12 to i64
  %arrayidx = getelementptr inbounds [2300 x double], [2300 x double]* %11, i64 %idxprom
  %13 = load i32, i32* %j, align 4
  %idxprom4 = sext i32 %13 to i64
  %arrayidx5 = getelementptr inbounds [2300 x double], [2300 x double]* %arrayidx, i64 0, i64 %idxprom4
  %14 = load double, double* %arrayidx5, align 8
  %mul = fmul double %14, %10
  store double %mul, double* %arrayidx5, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %15 = load i32, i32* %j, align 4
  %inc = add nsw i32 %15, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  store i32 0, i32* %k, align 4
  br label %for.cond6

for.cond6:                                        ; preds = %for.inc29, %for.end
  %16 = load i32, i32* %k, align 4
  %17 = load i32, i32* %nk.addr, align 4
  %cmp7 = icmp slt i32 %16, %17
  br i1 %cmp7, label %for.body8, label %for.end31

for.body8:                                        ; preds = %for.cond6
  store i32 0, i32* %j, align 4
  br label %for.cond9

for.cond9:                                        ; preds = %for.inc26, %for.body8
  %18 = load i32, i32* %j, align 4
  %19 = load i32, i32* %nj.addr, align 4
  %cmp10 = icmp slt i32 %18, %19
  br i1 %cmp10, label %for.body11, label %for.end28

for.body11:                                       ; preds = %for.cond9
  %20 = load double, double* %alpha.addr, align 8
  %21 = load [2600 x double]*, [2600 x double]** %A.addr, align 8
  %22 = load i32, i32* %i, align 4
  %idxprom12 = sext i32 %22 to i64
  %arrayidx13 = getelementptr inbounds [2600 x double], [2600 x double]* %21, i64 %idxprom12
  %23 = load i32, i32* %k, align 4
  %idxprom14 = sext i32 %23 to i64
  %arrayidx15 = getelementptr inbounds [2600 x double], [2600 x double]* %arrayidx13, i64 0, i64 %idxprom14
  %24 = load double, double* %arrayidx15, align 8
  %mul16 = fmul double %20, %24
  %25 = load [2300 x double]*, [2300 x double]** %B.addr, align 8
  %26 = load i32, i32* %k, align 4
  %idxprom17 = sext i32 %26 to i64
  %arrayidx18 = getelementptr inbounds [2300 x double], [2300 x double]* %25, i64 %idxprom17
  %27 = load i32, i32* %j, align 4
  %idxprom19 = sext i32 %27 to i64
  %arrayidx20 = getelementptr inbounds [2300 x double], [2300 x double]* %arrayidx18, i64 0, i64 %idxprom19
  %28 = load double, double* %arrayidx20, align 8
  %mul21 = fmul double %mul16, %28
  %29 = load [2300 x double]*, [2300 x double]** %C.addr, align 8
  %30 = load i32, i32* %i, align 4
  %idxprom22 = sext i32 %30 to i64
  %arrayidx23 = getelementptr inbounds [2300 x double], [2300 x double]* %29, i64 %idxprom22
  %31 = load i32, i32* %j, align 4
  %idxprom24 = sext i32 %31 to i64
  %arrayidx25 = getelementptr inbounds [2300 x double], [2300 x double]* %arrayidx23, i64 0, i64 %idxprom24
  %32 = load double, double* %arrayidx25, align 8
  %add = fadd double %32, %mul21
  store double %add, double* %arrayidx25, align 8
  br label %for.inc26

for.inc26:                                        ; preds = %for.body11
  %33 = load i32, i32* %j, align 4
  %inc27 = add nsw i32 %33, 1
  store i32 %inc27, i32* %j, align 4
  br label %for.cond9

for.end28:                                        ; preds = %for.cond9
  br label %for.inc29

for.inc29:                                        ; preds = %for.end28
  %34 = load i32, i32* %k, align 4
  %inc30 = add nsw i32 %34, 1
  store i32 %inc30, i32* %k, align 4
  br label %for.cond6

for.end31:                                        ; preds = %for.cond6
  br label %for.inc32

for.inc32:                                        ; preds = %for.end31
  %35 = load i32, i32* %i, align 4
  %inc33 = add nsw i32 %35, 1
  store i32 %inc33, i32* %i, align 4
  br label %for.cond

for.end34:                                        ; preds = %for.cond
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i8* @xmalloc(i64 %alloc_sz) #0 {
entry:
  %alloc_sz.addr = alloca i64, align 8
  %ret = alloca i8*, align 8
  %padded_sz = alloca i64, align 8
  %err = alloca i32, align 4
  store i64 %alloc_sz, i64* %alloc_sz.addr, align 8
  store i8* null, i8** %ret, align 8
  %0 = load i64, i64* @polybench_inter_array_padding_sz, align 8
  %add = add i64 %0, 0
  store i64 %add, i64* @polybench_inter_array_padding_sz, align 8
  %1 = load i64, i64* %alloc_sz.addr, align 8
  %2 = load i64, i64* @polybench_inter_array_padding_sz, align 8
  %add1 = add i64 %1, %2
  store i64 %add1, i64* %padded_sz, align 8
  %3 = load i64, i64* %padded_sz, align 8
  %call = call i32 @posix_memalign(i8** %ret, i64 4096, i64 %3) #3
  store i32 %call, i32* %err, align 4
  %4 = load i8*, i8** %ret, align 8
  %tobool = icmp ne i8* %4, null
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %5 = load i32, i32* %err, align 4
  %tobool2 = icmp ne i32 %5, 0
  br i1 %tobool2, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  call void @exit(i32 1) #4
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  %6 = load i8*, i8** %ret, align 8
  ret i8* %6
}

; Function Attrs: nounwind
declare i32 @posix_memalign(i8**, i64, i64) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

; Function Attrs: noinline nounwind optnone uwtable
define internal void @init_array(i32 %ni, i32 %nj, i32 %nk, double* %alpha, double* %beta, [2300 x double]* noalias %C, [2600 x double]* noalias %A, [2300 x double]* noalias %B) #0 {
entry:
  %ni.addr = alloca i32, align 4
  %nj.addr = alloca i32, align 4
  %nk.addr = alloca i32, align 4
  %alpha.addr = alloca double*, align 8
  %beta.addr = alloca double*, align 8
  %C.addr = alloca [2300 x double]*, align 8
  %A.addr = alloca [2600 x double]*, align 8
  %B.addr = alloca [2300 x double]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %ni, i32* %ni.addr, align 4
  store i32 %nj, i32* %nj.addr, align 4
  store i32 %nk, i32* %nk.addr, align 4
  store double* %alpha, double** %alpha.addr, align 8
  store double* %beta, double** %beta.addr, align 8
  store [2300 x double]* %C, [2300 x double]** %C.addr, align 8
  store [2600 x double]* %A, [2600 x double]** %A.addr, align 8
  store [2300 x double]* %B, [2300 x double]** %B.addr, align 8
  %0 = load double*, double** %alpha.addr, align 8
  store double 1.500000e+00, double* %0, align 8
  %1 = load double*, double** %beta.addr, align 8
  store double 1.200000e+00, double* %1, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc7, %entry
  %2 = load i32, i32* %i, align 4
  %3 = load i32, i32* %ni.addr, align 4
  %cmp = icmp slt i32 %2, %3
  br i1 %cmp, label %for.body, label %for.end9

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %4 = load i32, i32* %j, align 4
  %5 = load i32, i32* %nj.addr, align 4
  %cmp2 = icmp slt i32 %4, %5
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %6 = load i32, i32* %i, align 4
  %7 = load i32, i32* %j, align 4
  %mul = mul nsw i32 %6, %7
  %add = add nsw i32 %mul, 1
  %8 = load i32, i32* %ni.addr, align 4
  %rem = srem i32 %add, %8
  %conv = sitofp i32 %rem to double
  %9 = load i32, i32* %ni.addr, align 4
  %conv4 = sitofp i32 %9 to double
  %div = fdiv double %conv, %conv4
  %10 = load [2300 x double]*, [2300 x double]** %C.addr, align 8
  %11 = load i32, i32* %i, align 4
  %idxprom = sext i32 %11 to i64
  %arrayidx = getelementptr inbounds [2300 x double], [2300 x double]* %10, i64 %idxprom
  %12 = load i32, i32* %j, align 4
  %idxprom5 = sext i32 %12 to i64
  %arrayidx6 = getelementptr inbounds [2300 x double], [2300 x double]* %arrayidx, i64 0, i64 %idxprom5
  store double %div, double* %arrayidx6, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %13 = load i32, i32* %j, align 4
  %inc = add nsw i32 %13, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  br label %for.inc7

for.inc7:                                         ; preds = %for.end
  %14 = load i32, i32* %i, align 4
  %inc8 = add nsw i32 %14, 1
  store i32 %inc8, i32* %i, align 4
  br label %for.cond

for.end9:                                         ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond10

for.cond10:                                       ; preds = %for.inc31, %for.end9
  %15 = load i32, i32* %i, align 4
  %16 = load i32, i32* %ni.addr, align 4
  %cmp11 = icmp slt i32 %15, %16
  br i1 %cmp11, label %for.body13, label %for.end33

for.body13:                                       ; preds = %for.cond10
  store i32 0, i32* %j, align 4
  br label %for.cond14

for.cond14:                                       ; preds = %for.inc28, %for.body13
  %17 = load i32, i32* %j, align 4
  %18 = load i32, i32* %nk.addr, align 4
  %cmp15 = icmp slt i32 %17, %18
  br i1 %cmp15, label %for.body17, label %for.end30

for.body17:                                       ; preds = %for.cond14
  %19 = load i32, i32* %i, align 4
  %20 = load i32, i32* %j, align 4
  %add18 = add nsw i32 %20, 1
  %mul19 = mul nsw i32 %19, %add18
  %21 = load i32, i32* %nk.addr, align 4
  %rem20 = srem i32 %mul19, %21
  %conv21 = sitofp i32 %rem20 to double
  %22 = load i32, i32* %nk.addr, align 4
  %conv22 = sitofp i32 %22 to double
  %div23 = fdiv double %conv21, %conv22
  %23 = load [2600 x double]*, [2600 x double]** %A.addr, align 8
  %24 = load i32, i32* %i, align 4
  %idxprom24 = sext i32 %24 to i64
  %arrayidx25 = getelementptr inbounds [2600 x double], [2600 x double]* %23, i64 %idxprom24
  %25 = load i32, i32* %j, align 4
  %idxprom26 = sext i32 %25 to i64
  %arrayidx27 = getelementptr inbounds [2600 x double], [2600 x double]* %arrayidx25, i64 0, i64 %idxprom26
  store double %div23, double* %arrayidx27, align 8
  br label %for.inc28

for.inc28:                                        ; preds = %for.body17
  %26 = load i32, i32* %j, align 4
  %inc29 = add nsw i32 %26, 1
  store i32 %inc29, i32* %j, align 4
  br label %for.cond14

for.end30:                                        ; preds = %for.cond14
  br label %for.inc31

for.inc31:                                        ; preds = %for.end30
  %27 = load i32, i32* %i, align 4
  %inc32 = add nsw i32 %27, 1
  store i32 %inc32, i32* %i, align 4
  br label %for.cond10

for.end33:                                        ; preds = %for.cond10
  store i32 0, i32* %i, align 4
  br label %for.cond34

for.cond34:                                       ; preds = %for.inc55, %for.end33
  %28 = load i32, i32* %i, align 4
  %29 = load i32, i32* %nk.addr, align 4
  %cmp35 = icmp slt i32 %28, %29
  br i1 %cmp35, label %for.body37, label %for.end57

for.body37:                                       ; preds = %for.cond34
  store i32 0, i32* %j, align 4
  br label %for.cond38

for.cond38:                                       ; preds = %for.inc52, %for.body37
  %30 = load i32, i32* %j, align 4
  %31 = load i32, i32* %nj.addr, align 4
  %cmp39 = icmp slt i32 %30, %31
  br i1 %cmp39, label %for.body41, label %for.end54

for.body41:                                       ; preds = %for.cond38
  %32 = load i32, i32* %i, align 4
  %33 = load i32, i32* %j, align 4
  %add42 = add nsw i32 %33, 2
  %mul43 = mul nsw i32 %32, %add42
  %34 = load i32, i32* %nj.addr, align 4
  %rem44 = srem i32 %mul43, %34
  %conv45 = sitofp i32 %rem44 to double
  %35 = load i32, i32* %nj.addr, align 4
  %conv46 = sitofp i32 %35 to double
  %div47 = fdiv double %conv45, %conv46
  %36 = load [2300 x double]*, [2300 x double]** %B.addr, align 8
  %37 = load i32, i32* %i, align 4
  %idxprom48 = sext i32 %37 to i64
  %arrayidx49 = getelementptr inbounds [2300 x double], [2300 x double]* %36, i64 %idxprom48
  %38 = load i32, i32* %j, align 4
  %idxprom50 = sext i32 %38 to i64
  %arrayidx51 = getelementptr inbounds [2300 x double], [2300 x double]* %arrayidx49, i64 0, i64 %idxprom50
  store double %div47, double* %arrayidx51, align 8
  br label %for.inc52

for.inc52:                                        ; preds = %for.body41
  %39 = load i32, i32* %j, align 4
  %inc53 = add nsw i32 %39, 1
  store i32 %inc53, i32* %j, align 4
  br label %for.cond38

for.end54:                                        ; preds = %for.cond38
  br label %for.inc55

for.inc55:                                        ; preds = %for.end54
  %40 = load i32, i32* %i, align 4
  %inc56 = add nsw i32 %40, 1
  store i32 %inc56, i32* %i, align 4
  br label %for.cond34

for.end57:                                        ; preds = %for.cond34
  ret void
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { noreturn nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 5.0.0 (trunk 304791)"}
