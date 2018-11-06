; String constant declarations
@.str.2 = private unnamed_addr constant [2 x i8] c" \00", align 1
@.str.8 = private unnamed_addr constant [1 x i8] c"\00", align 1
@.str.16 = private unnamed_addr constant [26 x i8] c"Typename Function called \00", align 1
@.str.14 = private unnamed_addr constant [22 x i8] c"VOID Dispatach Found \00", align 1
@.str.3 = private unnamed_addr constant [8 x i8] c"
Sum : \00", align 1
@.str.18 = private unnamed_addr constant [3 x i8] c"IO\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"
\00", align 1
@.str.10 = private unnamed_addr constant [4 x i8] c"%d
\00", align 1
@.str.19 = private unnamed_addr constant [7 x i8] c"String\00", align 1
@.str.6 = private unnamed_addr constant [13 x i8] c"
Quotient : \00", align 1
@.str.11 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.20 = private unnamed_addr constant [4 x i8] c"Int\00", align 1
@.str.13 = private unnamed_addr constant [32 x i8] c"Exception Divide By Zero Found \00", align 1
@.str.21 = private unnamed_addr constant [5 x i8] c"Bool\00", align 1
@.str.15 = private unnamed_addr constant [22 x i8] c"ABORT Message called \00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"
Difference : \00", align 1
@.str.0 = private unnamed_addr constant [37 x i8] c"Demonstrating arithmetic operations
\00", align 1
@.str.1 = private unnamed_addr constant [27 x i8] c"Parameters received are : \00", align 1
@.str.17 = private unnamed_addr constant [7 x i8] c"Object\00", align 1
@.str.5 = private unnamed_addr constant [12 x i8] c"
Product : \00", align 1
@.str.12 = private unnamed_addr constant [10 x i8] c"%1024[^
]\00", align 1
@.str.9 = private unnamed_addr constant [3 x i8] c"%d\00", align 1

; Class Declarations
%class.Object = type {}
%class.IO = type { %class.Object }
%class.Expression = type { %class.IO, i32 }
%class.Main = type { %class.Object, %class.Expression* }


; class : 'Object function : constructor
define void @_CObject6_FObject6_(%class.Object* %this) {

entry:
  ret void
}

; class : 'IO function : constructor
define void @_CIO2_FIO2_(%class.IO* %this) {

entry:
  %0 = bitcast %class.IO* %this to %class.Object*
  call void @_CObject6_FObject6_(%class.Object* %0)
  ret void
}

; class : 'Expression function : constructor
define void @_CExpression10_FExpression10_(%class.Expression* %this) {

entry:
  %0 = bitcast %class.Expression* %this to %class.IO*
  call void @_CIO2_FIO2_(%class.IO* %0)
  %1 = getelementptr inbounds %class.Expression, %class.Expression* %this,  i32 0, i32 1
  store i32 0, i32* %1, align 4
  ret void
}

; class : 'Main function : constructor
define void @_CMain4_FMain4_(%class.Main* %this) {

entry:
  %0 = bitcast %class.Main* %this to %class.Object*
  call void @_CObject6_FObject6_(%class.Object* %0)
  %1 = getelementptr inbounds %class.Main, %class.Main* %this,  i32 0, i32 1
  %2 = call noalias i8* @malloc(i64 20)
  %3 = bitcast i8* %2 to %class.Expression*
  call void @_CExpression10_FExpression10_(%class.Expression* %3)
  store %class.Expression* %3, %class.Expression** %1, align 4
  ret void
}

; malloc for C
declare noalias i8* @malloc(i64)

; printf for C
declare i32 @printf(i8*, ...)

; scanf for C
declare i32 @scanf(i8*, ...)

; strlen for C
declare i64 @strlen(i8*)

; strcat for C
declare i8* @strcat(i8*, i8*)

; strcpy for C
declare i8* @strcpy(i8*, i8*)

; strncpy for C
declare i8* @strncpy(i8*, i8*, i64)

; exit for C
declare void @exit(i32)

; Class: Object, Method: type_name
define i8* @_CObject6_Ftype_name9_(%class.Object* %this) {
entry:
  %0 = getelementptr inbounds [26 x i8], [26 x i8]* @.str.16, i32 0, i32 0
  ret i8* %0
}

; Class: Object, Method: abort
define %class.Object* @_CObject6_Fabort5_(%class.Object* %this) {
entry:
  %0 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.11, i32 0, i32 0
  %1 = getelementptr inbounds [22 x i8], [22 x i8]* @.str.15, i32 0, i32 0
  %2 = call i32 (i8*, ...) @printf(i8* %0, i8* %1)
  %3 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.7, i32 0, i32 0
  %4 = call i32 (i8*, ...) @printf(i8* %0, i8* %3)
  call void @exit(i32 0)
  ret %class.Object* %this
}

; Class: IO, Method: out_int
define %class.IO* @_CIO2_Fout_int7_(%class.IO* %this, i32 %d) {
entry:
  %0 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.9, i32 0, i32 0
  %call = call i32 (i8*, ...) @printf(i8* %0, i32 %d)
  %1 = call noalias i8* @malloc(i64 8)
  %2 = bitcast i8* %1 to %class.IO*
  call void @_CIO2_FIO2_(%class.IO* %2)
  ret %class.IO* %2
}

; Class: IO, Method: in_int
define i32 @_CIO2_Fin_int6_(%class.IO* %this) {
entry:
  %0 = alloca i32, align 8
  %1 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.9, i32 0, i32 0
  %call = call i32 (i8*, ...) @scanf(i8* %1, i32* %0)
  %2 = load i32, i32* %0, align 4
  ret i32 %2
}

; Class: IO, Method: out_string
define %class.IO* @_CIO2_Fout_string10_(%class.IO* %this, i8* %s) {
entry:
  %0 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.11, i32 0, i32 0
  %call = call i32 (i8*, ...) @printf(i8* %0, i8* %s)
  %1 = call noalias i8* @malloc(i64 8)
  %2 = bitcast i8* %1 to %class.IO*
  call void @_CIO2_FIO2_(%class.IO* %2)
  ret %class.IO* %2
}

; Class: IO, Method: in_string
define i8* @_CIO2_Fin_string9_(%class.IO* %this) {
entry:
  %0 = alloca i8*, align 8
  %1 = load i8*, i8** %0, align 8
  %2 = getelementptr inbounds [10 x i8], [10 x i8]* @.str.12, i32 0, i32 0
  %call = call i32 (i8*, ...) @scanf(i8* %2, i8* %1)
  %3 = load i8*, i8** %0, align 8
  ret i8* %3
}

; Class: String, Method: concat
define i8* @_CString6_Fconcat6_(i8* %s1, i8* %s2) {
entry:
  %0 = call i64 @strlen(i8* %s1)
  %1 = call i64 @strlen(i8* %s2)
  %2 = add nsw i64 %0, %1
  %3 = add nsw i64 %2, 1
  %4 = call noalias i8* @malloc(i64 %3)
  %5 = call i8* @strcpy(i8* %4, i8* %s1)
  %6 = call i8* @strcat(i8* %4, i8* %s2)
  ret i8* %4
}

; Class: String, Method: substr
define i8* @_CString6_Fsubstr6_(i8* %s1, i32 %index, i32 %len) {
entry:
  %0 = zext i32 %len to i64
  %1 = call noalias i8* @malloc(i64 %0)
  %2 = getelementptr inbounds i8, i8* %s1, i32 %index
  %3 = call i8* @strncpy(i8* %1, i8* %2, i64 %0)
  ret i8* %1
}

define void @print_dispatch_on_void_error() {
entry:
  %0 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.11, i32 0, i32 0
  %1 = getelementptr inbounds [22 x i8], [22 x i8]* @.str.14, i32 0, i32 0
 %2 = call i32 (i8*, ...) @printf(i8* %0, i8* %1)
  %3 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.7, i32 0, i32 0
 %4 = call i32 (i8*, ...) @printf(i8* %0, i8* %3)
  call void @exit(i32 1)
 ret void
}

define void @print_div_by_zero_err_msg() {
entry:
  %0 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.11, i32 0, i32 0
  %1 = getelementptr inbounds [32 x i8], [32 x i8]* @.str.13, i32 0, i32 0
 %2 = call i32 (i8*, ...) @printf(i8* %0, i8* %1)
  %3 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.7, i32 0, i32 0
 %4 = call i32 (i8*, ...) @printf(i8* %0, i8* %3)
  call void @exit(i32 1)
 ret void
}

; Class: 'Expression' Function : 'operations'
define i32 @_CExpression10_Foperations10_(%class.Expression* %this, i32 %x, i32 %y, i32 %z
) {
entry:
  %x.addr = alloca i32, align 8
  store i32 %x, i32* %x.addr, align 4
  %y.addr = alloca i32, align 8
  store i32 %y, i32* %y.addr, align 4
  %z.addr = alloca i32, align 8
  store i32 %z, i32* %z.addr, align 4
  br label %method.body

static.void:
  call void @print_dispatch_on_void_error()
  br label %method.body

division.0:
  call void @print_div_by_zero_err_msg()
  br label %method.body

method.body:
  %0 = icmp eq %class.Expression* %this, null
  br i1 %0, label %static.void, label %branch.normal

branch.normal:
  %1 = bitcast %class.Expression* %this to %class.IO*
  %2 = getelementptr inbounds [37 x i8], [37 x i8]* @.str.0, i32 0, i32 0
  %3 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %1, i8* %2)
  %4 = icmp eq %class.Expression* %this, null
  br i1 %4, label %static.void, label %branch.normal.1

branch.normal.1:
  %5 = bitcast %class.Expression* %this to %class.IO*
  %6 = getelementptr inbounds [27 x i8], [27 x i8]* @.str.1, i32 0, i32 0
  %7 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %5, i8* %6)
  %8 = icmp eq %class.Expression* %this, null
  br i1 %8, label %static.void, label %branch.normal.2

branch.normal.2:
  %9 = bitcast %class.Expression* %this to %class.IO*
  %10 = load i32, i32* %x.addr, align 4
  %11 = call %class.IO* @_CIO2_Fout_int7_(%class.IO* %9, i32 %10)
  %12 = icmp eq %class.Expression* %this, null
  br i1 %12, label %static.void, label %branch.normal.3

branch.normal.3:
  %13 = bitcast %class.Expression* %this to %class.IO*
  %14 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.2, i32 0, i32 0
  %15 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %13, i8* %14)
  %16 = icmp eq %class.Expression* %this, null
  br i1 %16, label %static.void, label %branch.normal.4

branch.normal.4:
  %17 = bitcast %class.Expression* %this to %class.IO*
  %18 = load i32, i32* %y.addr, align 4
  %19 = call %class.IO* @_CIO2_Fout_int7_(%class.IO* %17, i32 %18)
  %20 = icmp eq %class.Expression* %this, null
  br i1 %20, label %static.void, label %branch.normal.5

branch.normal.5:
  %21 = bitcast %class.Expression* %this to %class.IO*
  %22 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.2, i32 0, i32 0
  %23 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %21, i8* %22)
  %24 = icmp eq %class.Expression* %this, null
  br i1 %24, label %static.void, label %branch.normal.6

branch.normal.6:
  %25 = bitcast %class.Expression* %this to %class.IO*
  %26 = load i32, i32* %z.addr, align 4
  %27 = call %class.IO* @_CIO2_Fout_int7_(%class.IO* %25, i32 %26)
  %28 = icmp eq %class.Expression* %this, null
  br i1 %28, label %static.void, label %branch.normal.7

branch.normal.7:
  %29 = bitcast %class.Expression* %this to %class.IO*
  %30 = getelementptr inbounds [8 x i8], [8 x i8]* @.str.3, i32 0, i32 0
  %31 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %29, i8* %30)
  %32 = load i32, i32* %x.addr, align 4
  %33 = load i32, i32* %y.addr, align 4
  %34 = add nsw i32 %32, %33
  %35 = load i32, i32* %z.addr, align 4
  %36 = add nsw i32 %34, %35
  %37 = getelementptr inbounds %class.Expression, %class.Expression* %this,  i32 0, i32 1
  store i32 %36, i32* %37, align 4
  %38 = icmp eq %class.Expression* %this, null
  br i1 %38, label %static.void, label %branch.normal.8

branch.normal.8:
  %39 = bitcast %class.Expression* %this to %class.IO*
  %40 = getelementptr inbounds %class.Expression, %class.Expression* %this,  i32 0, i32 1
  %41 = load i32, i32* %40, align 4
  %42 = call %class.IO* @_CIO2_Fout_int7_(%class.IO* %39, i32 %41)
  %43 = icmp eq %class.Expression* %this, null
  br i1 %43, label %static.void, label %branch.normal.9

branch.normal.9:
  %44 = bitcast %class.Expression* %this to %class.IO*
  %45 = getelementptr inbounds [15 x i8], [15 x i8]* @.str.4, i32 0, i32 0
  %46 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %44, i8* %45)
  %47 = load i32, i32* %x.addr, align 4
  %48 = load i32, i32* %y.addr, align 4
  %49 = sub nsw i32 %47, %48
  %50 = getelementptr inbounds %class.Expression, %class.Expression* %this,  i32 0, i32 1
  store i32 %49, i32* %50, align 4
  %51 = icmp eq %class.Expression* %this, null
  br i1 %51, label %static.void, label %branch.normal.10

branch.normal.10:
  %52 = bitcast %class.Expression* %this to %class.IO*
  %53 = getelementptr inbounds %class.Expression, %class.Expression* %this,  i32 0, i32 1
  %54 = load i32, i32* %53, align 4
  %55 = call %class.IO* @_CIO2_Fout_int7_(%class.IO* %52, i32 %54)
  %56 = icmp eq %class.Expression* %this, null
  br i1 %56, label %static.void, label %branch.normal.11

branch.normal.11:
  %57 = bitcast %class.Expression* %this to %class.IO*
  %58 = getelementptr inbounds [12 x i8], [12 x i8]* @.str.5, i32 0, i32 0
  %59 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %57, i8* %58)
  %60 = load i32, i32* %x.addr, align 4
  %61 = load i32, i32* %y.addr, align 4
  %62 = mul nsw i32 %60, %61
  %63 = load i32, i32* %z.addr, align 4
  %64 = mul nsw i32 %62, %63
  %65 = getelementptr inbounds %class.Expression, %class.Expression* %this,  i32 0, i32 1
  store i32 %64, i32* %65, align 4
  %66 = icmp eq %class.Expression* %this, null
  br i1 %66, label %static.void, label %branch.normal.12

branch.normal.12:
  %67 = bitcast %class.Expression* %this to %class.IO*
  %68 = getelementptr inbounds %class.Expression, %class.Expression* %this,  i32 0, i32 1
  %69 = load i32, i32* %68, align 4
  %70 = call %class.IO* @_CIO2_Fout_int7_(%class.IO* %67, i32 %69)
  %71 = icmp eq %class.Expression* %this, null
  br i1 %71, label %static.void, label %branch.normal.13

branch.normal.13:
  %72 = bitcast %class.Expression* %this to %class.IO*
  %73 = getelementptr inbounds [13 x i8], [13 x i8]* @.str.6, i32 0, i32 0
  %74 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %72, i8* %73)
  %75 = load i32, i32* %x.addr, align 4
  %76 = load i32, i32* %y.addr, align 4
  %77 = icmp eq i32 %76, 0
  br i1 %77, label %division.0, label %branch.normal.14

branch.normal.14:
  %78 = sdiv i32 %75, %76
  %79 = getelementptr inbounds %class.Expression, %class.Expression* %this,  i32 0, i32 1
  store i32 %78, i32* %79, align 4
  %80 = icmp eq %class.Expression* %this, null
  br i1 %80, label %static.void, label %branch.normal.15

branch.normal.15:
  %81 = bitcast %class.Expression* %this to %class.IO*
  %82 = getelementptr inbounds %class.Expression, %class.Expression* %this,  i32 0, i32 1
  %83 = load i32, i32* %82, align 4
  %84 = call %class.IO* @_CIO2_Fout_int7_(%class.IO* %81, i32 %83)
  ret i32 0
}

; Class: 'Main' Function : 'main'
define i32 @_CMain4_Fmain4_(%class.Main* %this
) {
entry:
  br label %method.body

static.void:
  call void @print_dispatch_on_void_error()
  br label %method.body

division.0:
  call void @print_div_by_zero_err_msg()
  br label %method.body

method.body:
  %0 = getelementptr inbounds %class.Main, %class.Main* %this,  i32 0, i32 1
  %1 = load %class.Expression*, %class.Expression** %0, align 8
  %2 = icmp eq %class.Expression* %1, null
  br i1 %2, label %static.void, label %branch.normal.16

branch.normal.16:
  %3 = call i32 @_CExpression10_Foperations10_(%class.Expression* %1, i32 1, i32 2, i32 3)
  %4 = getelementptr inbounds %class.Main, %class.Main* %this,  i32 0, i32 1
  %5 = load %class.Expression*, %class.Expression** %4, align 8
  %6 = icmp eq %class.Expression* %5, null
  br i1 %6, label %static.void, label %branch.normal.17

branch.normal.17:
  %7 = call i32 @_CExpression10_Foperations10_(%class.Expression* %5, i32 1, i32 1, i32 1)
  %8 = getelementptr inbounds %class.Main, %class.Main* %this,  i32 0, i32 1
  %9 = load %class.Expression*, %class.Expression** %8, align 8
  %10 = icmp eq %class.Expression* %9, null
  br i1 %10, label %static.void, label %branch.normal.18

branch.normal.18:
  %11 = call i32 @_CExpression10_Foperations10_(%class.Expression* %9, i32 1, i32 2, i32 1)
  ret i32 %11
}

define i32 @main() {
entry:
 %main = alloca %class.Main, align 8
 call void @_CMain4_FMain4_(%class.Main* %main)
 %dummyretval = call i32 @_CMain4_Fmain4_(%class.Main* %main)
 ret i32 0}
