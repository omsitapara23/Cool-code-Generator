; ModuleID = 'omisbest'
source_filename = "omisbest"

; String constant declarations
@.str.27 = private unnamed_addr constant [1 x i8] c"\00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c"Int : \00", align 1
@.str.35 = private unnamed_addr constant [26 x i8] c"Typename Function called \00", align 1
@.str.8 = private unnamed_addr constant [19 x i8] c"Object is not void\00", align 1
@.str.33 = private unnamed_addr constant [22 x i8] c"VOID Dispatach Found \00", align 1
@.str.0 = private unnamed_addr constant [38 x i8] c"Printing default values of each type
\00", align 1
@.str.6 = private unnamed_addr constant [42 x i8] c"
Other class without new, here class B : \00", align 1
@.str.9 = private unnamed_addr constant [39 x i8] c"
Other class with new, here class B : \00", align 1
@.str.4 = private unnamed_addr constant [5 x i8] c"True\00", align 1
@.str.21 = private unnamed_addr constant [47 x i8] c"
Dynamic type F, static type F, called on F : \00", align 1
@.str.26 = private unnamed_addr constant [2 x i8] c"
\00", align 1
@.str.5 = private unnamed_addr constant [6 x i8] c"False\00", align 1
@.str.13 = private unnamed_addr constant [47 x i8] c"
Dynamic type B, static type B, called on A : \00", align 1
@.str.29 = private unnamed_addr constant [4 x i8] c"%d
\00", align 1
@.str.38 = private unnamed_addr constant [7 x i8] c"String\00", align 1
@.str.17 = private unnamed_addr constant [47 x i8] c"
Dynamic type A, static type A, called on A : \00", align 1
@.str.39 = private unnamed_addr constant [4 x i8] c"Int\00", align 1
@.str.23 = private unnamed_addr constant [6 x i8] c"Hello\00", align 1
@.str.40 = private unnamed_addr constant [5 x i8] c"Bool\00", align 1
@.str.11 = private unnamed_addr constant [90 x i8] c"Calling static dispatch on f1(), member of A gives 0, member of B gives 1 np member in F
\00", align 1
@.str.22 = private unnamed_addr constant [73 x i8] c"Displaying consts 1 and 'Hello', and test with if for Bool const 'true'
\00", align 1
@.str.18 = private unnamed_addr constant [47 x i8] c"
Dynamic type F, static type A, called on A : \00", align 1
@.str.7 = private unnamed_addr constant [15 x i8] c"Object is void\00", align 1
@.str.15 = private unnamed_addr constant [47 x i8] c"
Dynamic type B, static type A, called on A : \00", align 1
@.str.28 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.20 = private unnamed_addr constant [47 x i8] c"
Dynamic type F, static type F, called on A : \00", align 1
@.str.12 = private unnamed_addr constant [46 x i8] c"Dynamic type B, static type B, called on B : \00", align 1
@.str.16 = private unnamed_addr constant [58 x i8] c"
Dynamic type A, static type A, called on B : Not allowed\00", align 1
@.str.37 = private unnamed_addr constant [3 x i8] c"IO\00", align 1
@.str.25 = private unnamed_addr constant [6 x i8] c"false\00", align 1
@.str.14 = private unnamed_addr constant [58 x i8] c"
Dynamic type B, static type A, called on B : Not allowed\00", align 1
@.str.2 = private unnamed_addr constant [11 x i8] c"
String : \00", align 1
@.str.3 = private unnamed_addr constant [9 x i8] c"
Bool : \00", align 1
@.str.30 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.32 = private unnamed_addr constant [32 x i8] c"Exception Divide By Zero Found \00", align 1
@.str.34 = private unnamed_addr constant [22 x i8] c"ABORT Message called \00", align 1
@.str.10 = private unnamed_addr constant [13 x i8] c"
Completed

\00", align 1
@.str.19 = private unnamed_addr constant [58 x i8] c"
Dynamic type F, static type A, called on F : Not allowed\00", align 1
@.str.24 = private unnamed_addr constant [5 x i8] c"true\00", align 1
@.str.36 = private unnamed_addr constant [7 x i8] c"Object\00", align 1
@.str.31 = private unnamed_addr constant [10 x i8] c"%1024[^
]\00", align 1

; Class Declarations
%class.Object = type {}
%class.IO = type { %class.Object }
%class.A = type { %class.Object, i32 }
%class.B = type { %class.A, i32 }
%class.F = type { %class.B, i32 }
%class.E = type { %class.A, i32 }
%class.C = type { %class.Object, i32, i8, i8*, %class.B*, %class.B*, %class.IO*, %class.A*, %class.A*, %class.A*, %class.F*, %class.A* }
%class.Main = type { %class.Object, %class.C*, %class.A* }


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

; class : 'A function : constructor
define void @_CA1_FA1_(%class.A* %this) {

entry:
  %0 = bitcast %class.A* %this to %class.Object*
  call void @_CObject6_FObject6_(%class.Object* %0)
  %1 = getelementptr inbounds %class.A, %class.A* %this,  i32 0, i32 1
  store i32 0, i32* %1, align 4
  ret void
}

; class : 'B function : constructor
define void @_CB1_FB1_(%class.B* %this) {

entry:
  %0 = bitcast %class.B* %this to %class.A*
  call void @_CA1_FA1_(%class.A* %0)
  %1 = getelementptr inbounds %class.B, %class.B* %this,  i32 0, i32 1
  store i32 0, i32* %1, align 4
  ret void
}

; class : 'F function : constructor
define void @_CF1_FF1_(%class.F* %this) {

entry:
  %0 = bitcast %class.F* %this to %class.B*
  call void @_CB1_FB1_(%class.B* %0)
  %1 = getelementptr inbounds %class.F, %class.F* %this,  i32 0, i32 1
  store i32 0, i32* %1, align 4
  ret void
}

; class : 'E function : constructor
define void @_CE1_FE1_(%class.E* %this) {

entry:
  %0 = bitcast %class.E* %this to %class.A*
  call void @_CA1_FA1_(%class.A* %0)
  %1 = getelementptr inbounds %class.E, %class.E* %this,  i32 0, i32 1
  store i32 0, i32* %1, align 4
  ret void
}

; class : 'C function : constructor
define void @_CC1_FC1_(%class.C* %this) {

entry:
  %0 = bitcast %class.C* %this to %class.Object*
  call void @_CObject6_FObject6_(%class.Object* %0)
  %1 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 1
  store i32 0, i32* %1, align 4
  %2 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  store i8 0, i8* %2, align 4
  %3 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 3
  %4 = getelementptr inbounds [1 x i8], [1 x i8]* @.str.27, i32 0, i32 0
  store i8* %4, i8** %3, align 8
  %5 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 4
  store %class.B* null, %class.B** %5, align 4
  %6 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 5
  %7 = call noalias i8* @malloc(i64 24)
  %8 = bitcast i8* %7 to %class.B*
  call void @_CB1_FB1_(%class.B* %8)
  store %class.B* %8, %class.B** %6, align 4
  %9 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 6
  %10 = call noalias i8* @malloc(i64 8)
  %11 = bitcast i8* %10 to %class.IO*
  call void @_CIO2_FIO2_(%class.IO* %11)
  store %class.IO* %11, %class.IO** %9, align 4
  %12 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 7
  %13 = call noalias i8* @malloc(i64 24)
  %14 = bitcast i8* %13 to %class.B*
  call void @_CB1_FB1_(%class.B* %14)
  %15 = bitcast %class.B* %14 to %class.A*
  store %class.A* %15, %class.A** %12, align 4
  %16 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 8
  %17 = call noalias i8* @malloc(i64 12)
  %18 = bitcast i8* %17 to %class.A*
  call void @_CA1_FA1_(%class.A* %18)
  store %class.A* %18, %class.A** %16, align 4
  %19 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 9
  store %class.A* null, %class.A** %19, align 4
  %20 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 10
  %21 = call noalias i8* @malloc(i64 36)
  %22 = bitcast i8* %21 to %class.F*
  call void @_CF1_FF1_(%class.F* %22)
  store %class.F* %22, %class.F** %20, align 4
  %23 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 11
  %24 = call noalias i8* @malloc(i64 36)
  %25 = bitcast i8* %24 to %class.F*
  call void @_CF1_FF1_(%class.F* %25)
  %26 = bitcast %class.F* %25 to %class.B*
  %27 = bitcast %class.B* %26 to %class.A*
  store %class.A* %27, %class.A** %23, align 4
  ret void
}

; class : 'Main function : constructor
define void @_CMain4_FMain4_(%class.Main* %this) {

entry:
  %0 = bitcast %class.Main* %this to %class.Object*
  call void @_CObject6_FObject6_(%class.Object* %0)
  %1 = getelementptr inbounds %class.Main, %class.Main* %this,  i32 0, i32 1
  %2 = call noalias i8* @malloc(i64 85)
  %3 = bitcast i8* %2 to %class.C*
  call void @_CC1_FC1_(%class.C* %3)
  store %class.C* %3, %class.C** %1, align 4
  %4 = getelementptr inbounds %class.Main, %class.Main* %this,  i32 0, i32 2
  store %class.A* null, %class.A** %4, align 4
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
  %0 = getelementptr inbounds [26 x i8], [26 x i8]* @.str.35, i32 0, i32 0
  ret i8* %0
}

; Class: Object, Method: abort
define %class.Object* @_CObject6_Fabort5_(%class.Object* %this) {
entry:
  %0 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.30, i32 0, i32 0
  %1 = getelementptr inbounds [22 x i8], [22 x i8]* @.str.34, i32 0, i32 0
  %2 = call i32 (i8*, ...) @printf(i8* %0, i8* %1)
  %3 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.26, i32 0, i32 0
  %4 = call i32 (i8*, ...) @printf(i8* %0, i8* %3)
  call void @exit(i32 0)
  ret %class.Object* %this
}

; Class: IO, Method: out_int
define %class.IO* @_CIO2_Fout_int7_(%class.IO* %this, i32 %d) {
entry:
  %0 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.28, i32 0, i32 0
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
  %1 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.28, i32 0, i32 0
  %call = call i32 (i8*, ...) @scanf(i8* %1, i32* %0)
  %2 = load i32, i32* %0, align 4
  ret i32 %2
}

; Class: IO, Method: out_string
define %class.IO* @_CIO2_Fout_string10_(%class.IO* %this, i8* %s) {
entry:
  %0 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.30, i32 0, i32 0
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
  %2 = getelementptr inbounds [10 x i8], [10 x i8]* @.str.31, i32 0, i32 0
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
  %0 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.30, i32 0, i32 0
  %1 = getelementptr inbounds [22 x i8], [22 x i8]* @.str.33, i32 0, i32 0
 %2 = call i32 (i8*, ...) @printf(i8* %0, i8* %1)
  %3 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.26, i32 0, i32 0
 %4 = call i32 (i8*, ...) @printf(i8* %0, i8* %3)
  call void @exit(i32 1)
 ret void
}

define void @print_div_by_zero_err_msg() {
entry:
  %0 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.30, i32 0, i32 0
  %1 = getelementptr inbounds [32 x i8], [32 x i8]* @.str.32, i32 0, i32 0
 %2 = call i32 (i8*, ...) @printf(i8* %0, i8* %1)
  %3 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.26, i32 0, i32 0
 %4 = call i32 (i8*, ...) @printf(i8* %0, i8* %3)
  call void @exit(i32 1)
 ret void
}

; Class: 'A' Function : 'f1'
define i32 @_CA1_Ff12_(%class.A* %this
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
  ret i32 0
}

; Class: 'B' Function : 'f1'
define i32 @_CB1_Ff12_(%class.B* %this
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
  ret i32 1
}

; Class: 'C' Function : 'checkDefaultValues'
define %class.Object* @_CC1_FcheckDefaultValues18_(%class.C* %this
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
  %0 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 6
  %1 = load %class.IO*, %class.IO** %0, align 8
  %2 = icmp eq %class.IO* %1, null
  br i1 %2, label %static.void, label %branch.normal

branch.normal:
  %3 = getelementptr inbounds [38 x i8], [38 x i8]* @.str.0, i32 0, i32 0
  %4 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %1, i8* %3)
  %5 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 6
  %6 = load %class.IO*, %class.IO** %5, align 8
  %7 = icmp eq %class.IO* %6, null
  br i1 %7, label %static.void, label %branch.normal.1

branch.normal.1:
  %8 = getelementptr inbounds [7 x i8], [7 x i8]* @.str.1, i32 0, i32 0
  %9 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %6, i8* %8)
  %10 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 6
  %11 = load %class.IO*, %class.IO** %10, align 8
  %12 = icmp eq %class.IO* %11, null
  br i1 %12, label %static.void, label %branch.normal.2

branch.normal.2:
  %13 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 1
  %14 = load i32, i32* %13, align 4
  %15 = call %class.IO* @_CIO2_Fout_int7_(%class.IO* %11, i32 %14)
  %16 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 6
  %17 = load %class.IO*, %class.IO** %16, align 8
  %18 = icmp eq %class.IO* %17, null
  br i1 %18, label %static.void, label %branch.normal.3

branch.normal.3:
  %19 = getelementptr inbounds [11 x i8], [11 x i8]* @.str.2, i32 0, i32 0
  %20 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %17, i8* %19)
  %21 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 6
  %22 = load %class.IO*, %class.IO** %21, align 8
  %23 = icmp eq %class.IO* %22, null
  br i1 %23, label %static.void, label %branch.normal.4

branch.normal.4:
  %24 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 3
  %25 = load i8*, i8** %24, align 8
  %26 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %22, i8* %25)
  %27 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 6
  %28 = load %class.IO*, %class.IO** %27, align 8
  %29 = icmp eq %class.IO* %28, null
  br i1 %29, label %static.void, label %branch.normal.5

branch.normal.5:
  %30 = getelementptr inbounds [9 x i8], [9 x i8]* @.str.3, i32 0, i32 0
  %31 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %28, i8* %30)
  %32 = alloca %class.IO, align 8
  %33 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %34 = load i8, i8* %33, align 4
  %35 = trunc i8 %34 to i1
  br i1 %35, label %cond.true, label %cond.false

cond.true:
  %36 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 6
  %37 = load %class.IO*, %class.IO** %36, align 8
  %38 = icmp eq %class.IO* %37, null
  br i1 %38, label %static.void, label %branch.normal.7

branch.normal.7:
  %39 = getelementptr inbounds [5 x i8], [5 x i8]* @.str.4, i32 0, i32 0
  %40 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %37, i8* %39)
  %41 = load %class.IO, %class.IO* %40, align 4
  store %class.IO %41, %class.IO* %32, align 4
  br label %branch.normal.6

cond.false:
  %42 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 6
  %43 = load %class.IO*, %class.IO** %42, align 8
  %44 = icmp eq %class.IO* %43, null
  br i1 %44, label %static.void, label %branch.normal.8

branch.normal.8:
  %45 = getelementptr inbounds [6 x i8], [6 x i8]* @.str.5, i32 0, i32 0
  %46 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %43, i8* %45)
  %47 = load %class.IO, %class.IO* %46, align 4
  store %class.IO %47, %class.IO* %32, align 4
  br label %branch.normal.6

branch.normal.6:
  %48 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 6
  %49 = load %class.IO*, %class.IO** %48, align 8
  %50 = icmp eq %class.IO* %49, null
  br i1 %50, label %static.void, label %branch.normal.9

branch.normal.9:
  %51 = getelementptr inbounds [42 x i8], [42 x i8]* @.str.6, i32 0, i32 0
  %52 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %49, i8* %51)
  %53 = alloca %class.IO, align 8
  %54 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 4
  %55 = load %class.B*, %class.B** %54, align 8
  %56 = icmp eq %class.B* %55, null
  %57 = zext i1 %56 to i8
  %58 = trunc i8 %57 to i1
  br i1 %58, label %cond.true.1, label %cond.false.1

cond.true.1:
  %59 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 6
  %60 = load %class.IO*, %class.IO** %59, align 8
  %61 = icmp eq %class.IO* %60, null
  br i1 %61, label %static.void, label %branch.normal.11

branch.normal.11:
  %62 = getelementptr inbounds [15 x i8], [15 x i8]* @.str.7, i32 0, i32 0
  %63 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %60, i8* %62)
  %64 = load %class.IO, %class.IO* %63, align 4
  store %class.IO %64, %class.IO* %53, align 4
  br label %branch.normal.10

cond.false.1:
  %65 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 6
  %66 = load %class.IO*, %class.IO** %65, align 8
  %67 = icmp eq %class.IO* %66, null
  br i1 %67, label %static.void, label %branch.normal.12

branch.normal.12:
  %68 = getelementptr inbounds [19 x i8], [19 x i8]* @.str.8, i32 0, i32 0
  %69 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %66, i8* %68)
  %70 = load %class.IO, %class.IO* %69, align 4
  store %class.IO %70, %class.IO* %53, align 4
  br label %branch.normal.10

branch.normal.10:
  %71 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 6
  %72 = load %class.IO*, %class.IO** %71, align 8
  %73 = icmp eq %class.IO* %72, null
  br i1 %73, label %static.void, label %branch.normal.13

branch.normal.13:
  %74 = getelementptr inbounds [39 x i8], [39 x i8]* @.str.9, i32 0, i32 0
  %75 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %72, i8* %74)
  %76 = alloca %class.IO, align 8
  %77 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 5
  %78 = load %class.B*, %class.B** %77, align 8
  %79 = icmp eq %class.B* %78, null
  %80 = zext i1 %79 to i8
  %81 = trunc i8 %80 to i1
  br i1 %81, label %cond.true.2, label %cond.false.2

cond.true.2:
  %82 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 6
  %83 = load %class.IO*, %class.IO** %82, align 8
  %84 = icmp eq %class.IO* %83, null
  br i1 %84, label %static.void, label %branch.normal.15

branch.normal.15:
  %85 = getelementptr inbounds [15 x i8], [15 x i8]* @.str.7, i32 0, i32 0
  %86 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %83, i8* %85)
  %87 = load %class.IO, %class.IO* %86, align 4
  store %class.IO %87, %class.IO* %76, align 4
  br label %branch.normal.14

cond.false.2:
  %88 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 6
  %89 = load %class.IO*, %class.IO** %88, align 8
  %90 = icmp eq %class.IO* %89, null
  br i1 %90, label %static.void, label %branch.normal.16

branch.normal.16:
  %91 = getelementptr inbounds [19 x i8], [19 x i8]* @.str.8, i32 0, i32 0
  %92 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %89, i8* %91)
  %93 = load %class.IO, %class.IO* %92, align 4
  store %class.IO %93, %class.IO* %76, align 4
  br label %branch.normal.14

branch.normal.14:
  %94 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 6
  %95 = load %class.IO*, %class.IO** %94, align 8
  %96 = icmp eq %class.IO* %95, null
  br i1 %96, label %static.void, label %branch.normal.17

branch.normal.17:
  %97 = getelementptr inbounds [13 x i8], [13 x i8]* @.str.10, i32 0, i32 0
  %98 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %95, i8* %97)
  %99 = bitcast %class.IO* %98 to %class.Object*
  ret %class.Object* %99
}

; Class: 'C' Function : 'testStaticDispatch'
define i32 @_CC1_FtestStaticDispatch18_(%class.C* %this
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
  %0 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 6
  %1 = load %class.IO*, %class.IO** %0, align 8
  %2 = icmp eq %class.IO* %1, null
  br i1 %2, label %static.void, label %branch.normal.18

branch.normal.18:
  %3 = getelementptr inbounds [90 x i8], [90 x i8]* @.str.11, i32 0, i32 0
  %4 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %1, i8* %3)
  %5 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 6
  %6 = load %class.IO*, %class.IO** %5, align 8
  %7 = icmp eq %class.IO* %6, null
  br i1 %7, label %static.void, label %branch.normal.19

branch.normal.19:
  %8 = getelementptr inbounds [46 x i8], [46 x i8]* @.str.12, i32 0, i32 0
  %9 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %6, i8* %8)
  %10 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 6
  %11 = load %class.IO*, %class.IO** %10, align 8
  %12 = icmp eq %class.IO* %11, null
  br i1 %12, label %static.void, label %branch.normal.20

branch.normal.20:
  %13 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 5
  %14 = load %class.B*, %class.B** %13, align 8
  %15 = icmp eq %class.B* %14, null
  br i1 %15, label %static.void, label %branch.normal.21

branch.normal.21:
  %16 = call i32 @_CB1_Ff12_(%class.B* %14)
  %17 = call %class.IO* @_CIO2_Fout_int7_(%class.IO* %11, i32 %16)
  %18 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 6
  %19 = load %class.IO*, %class.IO** %18, align 8
  %20 = icmp eq %class.IO* %19, null
  br i1 %20, label %static.void, label %branch.normal.22

branch.normal.22:
  %21 = getelementptr inbounds [47 x i8], [47 x i8]* @.str.13, i32 0, i32 0
  %22 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %19, i8* %21)
  %23 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 6
  %24 = load %class.IO*, %class.IO** %23, align 8
  %25 = icmp eq %class.IO* %24, null
  br i1 %25, label %static.void, label %branch.normal.23

branch.normal.23:
  %26 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 5
  %27 = load %class.B*, %class.B** %26, align 8
  %28 = icmp eq %class.B* %27, null
  br i1 %28, label %static.void, label %branch.normal.24

branch.normal.24:
  %29 = bitcast %class.B* %27 to %class.A*
  %30 = call i32 @_CA1_Ff12_(%class.A* %29)
  %31 = call %class.IO* @_CIO2_Fout_int7_(%class.IO* %24, i32 %30)
  %32 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 6
  %33 = load %class.IO*, %class.IO** %32, align 8
  %34 = icmp eq %class.IO* %33, null
  br i1 %34, label %static.void, label %branch.normal.25

branch.normal.25:
  %35 = getelementptr inbounds [58 x i8], [58 x i8]* @.str.14, i32 0, i32 0
  %36 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %33, i8* %35)
  %37 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 6
  %38 = load %class.IO*, %class.IO** %37, align 8
  %39 = icmp eq %class.IO* %38, null
  br i1 %39, label %static.void, label %branch.normal.26

branch.normal.26:
  %40 = getelementptr inbounds [47 x i8], [47 x i8]* @.str.15, i32 0, i32 0
  %41 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %38, i8* %40)
  %42 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 6
  %43 = load %class.IO*, %class.IO** %42, align 8
  %44 = icmp eq %class.IO* %43, null
  br i1 %44, label %static.void, label %branch.normal.27

branch.normal.27:
  %45 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 7
  %46 = load %class.A*, %class.A** %45, align 8
  %47 = icmp eq %class.A* %46, null
  br i1 %47, label %static.void, label %branch.normal.28

branch.normal.28:
  %48 = call i32 @_CA1_Ff12_(%class.A* %46)
  %49 = call %class.IO* @_CIO2_Fout_int7_(%class.IO* %43, i32 %48)
  %50 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 6
  %51 = load %class.IO*, %class.IO** %50, align 8
  %52 = icmp eq %class.IO* %51, null
  br i1 %52, label %static.void, label %branch.normal.29

branch.normal.29:
  %53 = getelementptr inbounds [58 x i8], [58 x i8]* @.str.16, i32 0, i32 0
  %54 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %51, i8* %53)
  %55 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 6
  %56 = load %class.IO*, %class.IO** %55, align 8
  %57 = icmp eq %class.IO* %56, null
  br i1 %57, label %static.void, label %branch.normal.30

branch.normal.30:
  %58 = getelementptr inbounds [47 x i8], [47 x i8]* @.str.17, i32 0, i32 0
  %59 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %56, i8* %58)
  %60 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 6
  %61 = load %class.IO*, %class.IO** %60, align 8
  %62 = icmp eq %class.IO* %61, null
  br i1 %62, label %static.void, label %branch.normal.31

branch.normal.31:
  %63 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 8
  %64 = load %class.A*, %class.A** %63, align 8
  %65 = icmp eq %class.A* %64, null
  br i1 %65, label %static.void, label %branch.normal.32

branch.normal.32:
  %66 = call i32 @_CA1_Ff12_(%class.A* %64)
  %67 = call %class.IO* @_CIO2_Fout_int7_(%class.IO* %61, i32 %66)
  %68 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 6
  %69 = load %class.IO*, %class.IO** %68, align 8
  %70 = icmp eq %class.IO* %69, null
  br i1 %70, label %static.void, label %branch.normal.33

branch.normal.33:
  %71 = getelementptr inbounds [47 x i8], [47 x i8]* @.str.18, i32 0, i32 0
  %72 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %69, i8* %71)
  %73 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 6
  %74 = load %class.IO*, %class.IO** %73, align 8
  %75 = icmp eq %class.IO* %74, null
  br i1 %75, label %static.void, label %branch.normal.34

branch.normal.34:
  %76 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 11
  %77 = load %class.A*, %class.A** %76, align 8
  %78 = icmp eq %class.A* %77, null
  br i1 %78, label %static.void, label %branch.normal.35

branch.normal.35:
  %79 = call i32 @_CA1_Ff12_(%class.A* %77)
  %80 = call %class.IO* @_CIO2_Fout_int7_(%class.IO* %74, i32 %79)
  %81 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 6
  %82 = load %class.IO*, %class.IO** %81, align 8
  %83 = icmp eq %class.IO* %82, null
  br i1 %83, label %static.void, label %branch.normal.36

branch.normal.36:
  %84 = getelementptr inbounds [58 x i8], [58 x i8]* @.str.19, i32 0, i32 0
  %85 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %82, i8* %84)
  %86 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 6
  %87 = load %class.IO*, %class.IO** %86, align 8
  %88 = icmp eq %class.IO* %87, null
  br i1 %88, label %static.void, label %branch.normal.37

branch.normal.37:
  %89 = getelementptr inbounds [47 x i8], [47 x i8]* @.str.20, i32 0, i32 0
  %90 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %87, i8* %89)
  %91 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 6
  %92 = load %class.IO*, %class.IO** %91, align 8
  %93 = icmp eq %class.IO* %92, null
  br i1 %93, label %static.void, label %branch.normal.38

branch.normal.38:
  %94 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 10
  %95 = load %class.F*, %class.F** %94, align 8
  %96 = icmp eq %class.F* %95, null
  br i1 %96, label %static.void, label %branch.normal.39

branch.normal.39:
  %97 = bitcast %class.F* %95 to %class.A*
  %98 = call i32 @_CA1_Ff12_(%class.A* %97)
  %99 = call %class.IO* @_CIO2_Fout_int7_(%class.IO* %92, i32 %98)
  %100 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 6
  %101 = load %class.IO*, %class.IO** %100, align 8
  %102 = icmp eq %class.IO* %101, null
  br i1 %102, label %static.void, label %branch.normal.40

branch.normal.40:
  %103 = getelementptr inbounds [47 x i8], [47 x i8]* @.str.21, i32 0, i32 0
  %104 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %101, i8* %103)
  %105 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 6
  %106 = load %class.IO*, %class.IO** %105, align 8
  %107 = icmp eq %class.IO* %106, null
  br i1 %107, label %static.void, label %branch.normal.41

branch.normal.41:
  %108 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 10
  %109 = load %class.F*, %class.F** %108, align 8
  %110 = icmp eq %class.F* %109, null
  br i1 %110, label %static.void, label %branch.normal.42

branch.normal.42:
  %111 = bitcast %class.F* %109 to %class.B*
  %112 = call i32 @_CB1_Ff12_(%class.B* %111)
  %113 = call %class.IO* @_CIO2_Fout_int7_(%class.IO* %106, i32 %112)
  %114 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 6
  %115 = load %class.IO*, %class.IO** %114, align 8
  %116 = icmp eq %class.IO* %115, null
  br i1 %116, label %static.void, label %branch.normal.43

branch.normal.43:
  %117 = getelementptr inbounds [13 x i8], [13 x i8]* @.str.10, i32 0, i32 0
  %118 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %115, i8* %117)
  ret i32 0
}

; Class: 'C' Function : 'staticDispatchOnNull'
define i32 @_CC1_FstaticDispatchOnNull20_(%class.C* %this
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
  %0 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 4
  %1 = load %class.B*, %class.B** %0, align 8
  %2 = icmp eq %class.B* %1, null
  br i1 %2, label %static.void, label %branch.normal.44

branch.normal.44:
  %3 = call i32 @_CB1_Ff12_(%class.B* %1)
  ret i32 %3
}

; Class: 'C' Function : 'checkConsts'
define i32 @_CC1_FcheckConsts11_(%class.C* %this
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
  %0 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 6
  %1 = load %class.IO*, %class.IO** %0, align 8
  %2 = icmp eq %class.IO* %1, null
  br i1 %2, label %static.void, label %branch.normal.45

branch.normal.45:
  %3 = getelementptr inbounds [73 x i8], [73 x i8]* @.str.22, i32 0, i32 0
  %4 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %1, i8* %3)
  %5 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 6
  %6 = load %class.IO*, %class.IO** %5, align 8
  %7 = icmp eq %class.IO* %6, null
  br i1 %7, label %static.void, label %branch.normal.46

branch.normal.46:
  %8 = getelementptr inbounds [7 x i8], [7 x i8]* @.str.1, i32 0, i32 0
  %9 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %6, i8* %8)
  %10 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 6
  %11 = load %class.IO*, %class.IO** %10, align 8
  %12 = icmp eq %class.IO* %11, null
  br i1 %12, label %static.void, label %branch.normal.47

branch.normal.47:
  %13 = call %class.IO* @_CIO2_Fout_int7_(%class.IO* %11, i32 1)
  %14 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 6
  %15 = load %class.IO*, %class.IO** %14, align 8
  %16 = icmp eq %class.IO* %15, null
  br i1 %16, label %static.void, label %branch.normal.48

branch.normal.48:
  %17 = getelementptr inbounds [11 x i8], [11 x i8]* @.str.2, i32 0, i32 0
  %18 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %15, i8* %17)
  %19 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 6
  %20 = load %class.IO*, %class.IO** %19, align 8
  %21 = icmp eq %class.IO* %20, null
  br i1 %21, label %static.void, label %branch.normal.49

branch.normal.49:
  %22 = getelementptr inbounds [6 x i8], [6 x i8]* @.str.23, i32 0, i32 0
  %23 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %20, i8* %22)
  %24 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 6
  %25 = load %class.IO*, %class.IO** %24, align 8
  %26 = icmp eq %class.IO* %25, null
  br i1 %26, label %static.void, label %branch.normal.50

branch.normal.50:
  %27 = getelementptr inbounds [9 x i8], [9 x i8]* @.str.3, i32 0, i32 0
  %28 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %25, i8* %27)
  %29 = alloca %class.IO, align 8
  %30 = trunc i8 1 to i1
  br i1 %30, label %cond.true.3, label %cond.false.3

cond.true.3:
  %31 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 6
  %32 = load %class.IO*, %class.IO** %31, align 8
  %33 = icmp eq %class.IO* %32, null
  br i1 %33, label %static.void, label %branch.normal.52

branch.normal.52:
  %34 = getelementptr inbounds [5 x i8], [5 x i8]* @.str.24, i32 0, i32 0
  %35 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %32, i8* %34)
  %36 = load %class.IO, %class.IO* %35, align 4
  store %class.IO %36, %class.IO* %29, align 4
  br label %branch.normal.51

cond.false.3:
  %37 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 6
  %38 = load %class.IO*, %class.IO** %37, align 8
  %39 = icmp eq %class.IO* %38, null
  br i1 %39, label %static.void, label %branch.normal.53

branch.normal.53:
  %40 = getelementptr inbounds [6 x i8], [6 x i8]* @.str.25, i32 0, i32 0
  %41 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %38, i8* %40)
  %42 = load %class.IO, %class.IO* %41, align 4
  store %class.IO %42, %class.IO* %29, align 4
  br label %branch.normal.51

branch.normal.51:
  %43 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 6
  %44 = load %class.IO*, %class.IO** %43, align 8
  %45 = icmp eq %class.IO* %44, null
  br i1 %45, label %static.void, label %branch.normal.54

branch.normal.54:
  %46 = getelementptr inbounds [13 x i8], [13 x i8]* @.str.10, i32 0, i32 0
  %47 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %44, i8* %46)
  ret i32 0
}

; Class: 'C' Function : 'ifWithDifferentReturnTypes'
define %class.A* @_CC1_FifWithDifferentReturnTypes26_(%class.C* %this, i8 %b
) {
entry:
  %b.addr = alloca i8, align 8
  store i8 %b, i8* %b.addr, align 4
  br label %method.body

static.void:
  call void @print_dispatch_on_void_error()
  br label %method.body

division.0:
  call void @print_div_by_zero_err_msg()
  br label %method.body

method.body:
  %0 = alloca %class.A, align 8
  %1 = load i8, i8* %b.addr, align 4
  %2 = trunc i8 %1 to i1
  br i1 %2, label %cond.true.4, label %cond.false.4

cond.true.4:
  %3 = call noalias i8* @malloc(i64 24)
  %4 = bitcast i8* %3 to %class.B*
  call void @_CB1_FB1_(%class.B* %4)
  %5 = bitcast %class.B* %4 to %class.A*
  %6 = load %class.A, %class.A* %5, align 4
  store %class.A %6, %class.A* %0, align 4
  br label %branch.normal.55

cond.false.4:
  %7 = call noalias i8* @malloc(i64 24)
  %8 = bitcast i8* %7 to %class.E*
  call void @_CE1_FE1_(%class.E* %8)
  %9 = bitcast %class.E* %8 to %class.A*
  %10 = load %class.A, %class.A* %9, align 4
  store %class.A %10, %class.A* %0, align 4
  br label %branch.normal.55

branch.normal.55:
  %11 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 9
  store %class.A* %0, %class.A** %11, align 8
  %12 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 6
  %13 = load %class.IO*, %class.IO** %12, align 8
  %14 = icmp eq %class.IO* %13, null
  br i1 %14, label %static.void, label %branch.normal.56

branch.normal.56:
  %15 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 9
  %16 = load %class.A*, %class.A** %15, align 8
  %17 = icmp eq %class.A* %16, null
  br i1 %17, label %static.void, label %branch.normal.57

branch.normal.57:
  %18 = bitcast %class.A* %16 to %class.Object*
  %19 = call i8* @_CObject6_Ftype_name9_(%class.Object* %18)
  %20 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %13, i8* %19)
  %21 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 9
  %22 = load %class.A*, %class.A** %21, align 8
  ret %class.A* %22
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
  %1 = load %class.C*, %class.C** %0, align 8
  %2 = icmp eq %class.C* %1, null
  br i1 %2, label %static.void, label %branch.normal.58

branch.normal.58:
  %3 = call %class.Object* @_CC1_FcheckDefaultValues18_(%class.C* %1)
  %4 = getelementptr inbounds %class.Main, %class.Main* %this,  i32 0, i32 1
  %5 = load %class.C*, %class.C** %4, align 8
  %6 = icmp eq %class.C* %5, null
  br i1 %6, label %static.void, label %branch.normal.59

branch.normal.59:
  %7 = call i32 @_CC1_FtestStaticDispatch18_(%class.C* %5)
  %8 = getelementptr inbounds %class.Main, %class.Main* %this,  i32 0, i32 1
  %9 = load %class.C*, %class.C** %8, align 8
  %10 = icmp eq %class.C* %9, null
  br i1 %10, label %static.void, label %branch.normal.60

branch.normal.60:
  %11 = call i32 @_CC1_FcheckConsts11_(%class.C* %9)
  %12 = getelementptr inbounds %class.Main, %class.Main* %this,  i32 0, i32 1
  %13 = load %class.C*, %class.C** %12, align 8
  %14 = icmp eq %class.C* %13, null
  br i1 %14, label %static.void, label %branch.normal.61

branch.normal.61:
  %15 = call %class.A* @_CC1_FifWithDifferentReturnTypes26_(%class.C* %13, i8 1)
  %16 = getelementptr inbounds %class.Main, %class.Main* %this,  i32 0, i32 2
  store %class.A* %15, %class.A** %16, align 8
  %17 = getelementptr inbounds %class.Main, %class.Main* %this,  i32 0, i32 1
  %18 = load %class.C*, %class.C** %17, align 8
  %19 = icmp eq %class.C* %18, null
  br i1 %19, label %static.void, label %branch.normal.62

branch.normal.62:
  %20 = call i32 @_CC1_FstaticDispatchOnNull20_(%class.C* %18)
  ret i32 0
}

define i32 @main() {
entry:
 %main = alloca %class.Main, align 8
 call void @_CMain4_FMain4_(%class.Main* %main)
 %dummyretval = call i32 @_CMain4_Fmain4_(%class.Main* %main)
 ret i32 0}
