; String constant declarations
@.str.27 = private unnamed_addr constant [1 x i8] c"\00", align 1
@.str.17 = private unnamed_addr constant [13 x i8] c"
length() : \00", align 1
@.str.35 = private unnamed_addr constant [26 x i8] c"Typename Function called \00", align 1
@.str.33 = private unnamed_addr constant [22 x i8] c"VOID Dispatach Found \00", align 1
@.str.26 = private unnamed_addr constant [2 x i8] c"
\00", align 1
@.str.6 = private unnamed_addr constant [75 x i8] c"out_string() : (will print s argument, but class member contains 'Hello')
\00", align 1
@.str.29 = private unnamed_addr constant [4 x i8] c"%d
\00", align 1
@.str.38 = private unnamed_addr constant [7 x i8] c"String\00", align 1
@.str.11 = private unnamed_addr constant [12 x i8] c"
Got int : \00", align 1
@.str.25 = private unnamed_addr constant [6 x i8] c"World\00", align 1
@.str.39 = private unnamed_addr constant [4 x i8] c"Int\00", align 1
@.str.1 = private unnamed_addr constant [60 x i8] c"A->B->C, A has a member a with value 1. Printing it from C
\00", align 1
@.str.10 = private unnamed_addr constant [27 x i8] c"
in_int() : (enter a int)
\00", align 1
@.str.0 = private unnamed_addr constant [6 x i8] c"Hello\00", align 1
@.str.15 = private unnamed_addr constant [72 x i8] c"
To get substring at index i of length l, where i and l are given by : \00", align 1
@.str.40 = private unnamed_addr constant [5 x i8] c"Bool\00", align 1
@.str.5 = private unnamed_addr constant [31 x i8] c"Calling functions in IO class
\00", align 1
@.str.9 = private unnamed_addr constant [15 x i8] c"
Got string : \00", align 1
@.str.12 = private unnamed_addr constant [35 x i8] c"Calling functions in String class
\00", align 1
@.str.4 = private unnamed_addr constant [11 x i8] c"abort() : \00", align 1
@.str.3 = private unnamed_addr constant [35 x i8] c"Calling functions in Object class
\00", align 1
@.str.8 = private unnamed_addr constant [33 x i8] c"
in_string() : (enter a string)
\00", align 1
@.str.19 = private unnamed_addr constant [9 x i8] c"A String\00", align 1
@.str.28 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.16 = private unnamed_addr constant [2 x i8] c" \00", align 1
@.str.23 = private unnamed_addr constant [4 x i8] c"AAA\00", align 1
@.str.13 = private unnamed_addr constant [16 x i8] c"Input String : \00", align 1
@.str.37 = private unnamed_addr constant [3 x i8] c"IO\00", align 1
@.str.20 = private unnamed_addr constant [13 x i8] c"
concat() : \00", align 1
@.str.30 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.24 = private unnamed_addr constant [7 x i8] c"Hello \00", align 1
@.str.22 = private unnamed_addr constant [13 x i8] c"
substr() : \00", align 1
@.str.32 = private unnamed_addr constant [32 x i8] c"Exception Divide By Zero Found \00", align 1
@.str.34 = private unnamed_addr constant [22 x i8] c"ABORT Message called \00", align 1
@.str.2 = private unnamed_addr constant [13 x i8] c"
Completed

\00", align 1
@.str.14 = private unnamed_addr constant [19 x i8] c"
To concat with : \00", align 1
@.str.18 = private unnamed_addr constant [27 x i8] c"
length() of 'A String' : \00", align 1
@.str.7 = private unnamed_addr constant [67 x i8] c"
out_int() : (will print c argument, but class member contains 3)
\00", align 1
@.str.36 = private unnamed_addr constant [7 x i8] c"Object\00", align 1
@.str.21 = private unnamed_addr constant [23 x i8] c"
concat() 'A String': \00", align 1
@.str.31 = private unnamed_addr constant [10 x i8] c"%1024[^
]\00", align 1

; Class Declarations
%class.Object = type {}
%class.IO = type { %class.Object }
%class.A = type { %class.Object, i32 }
%class.B = type { %class.A, i32 }
%class.C = type { %class.B, i32, %class.IO*, %class.Object*, i8* }
%class.Main = type { %class.Object, %class.C* }


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
  store i32 1, i32* %1, align 4
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

; class : 'C function : constructor
define void @_CC1_FC1_(%class.C* %this) {

entry:
  %0 = bitcast %class.C* %this to %class.B*
  call void @_CB1_FB1_(%class.B* %0)
  %1 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 1
  store i32 3, i32* %1, align 4
  %2 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %3 = call noalias i8* @malloc(i64 8)
  %4 = bitcast i8* %3 to %class.IO*
  call void @_CIO2_FIO2_(%class.IO* %4)
  store %class.IO* %4, %class.IO** %2, align 4
  %5 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 3
  %6 = call noalias i8* @malloc(i64 0)
  %7 = bitcast i8* %6 to %class.Object*
  call void @_CObject6_FObject6_(%class.Object* %7)
  store %class.Object* %7, %class.Object** %5, align 4
  %8 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 4
  %9 = getelementptr inbounds [6 x i8], [6 x i8]* @.str.0, i32 0, i32 0
  store i8* %9, i8** %8, align 8
  ret void
}

; class : 'Main function : constructor
define void @_CMain4_FMain4_(%class.Main* %this) {

entry:
  %0 = bitcast %class.Main* %this to %class.Object*
  call void @_CObject6_FObject6_(%class.Object* %0)
  %1 = getelementptr inbounds %class.Main, %class.Main* %this,  i32 0, i32 1
  %2 = call noalias i8* @malloc(i64 60)
  %3 = bitcast i8* %2 to %class.C*
  call void @_CC1_FC1_(%class.C* %3)
  store %class.C* %3, %class.C** %1, align 4
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
  %0 = getelementptr inbounds %class.B, %class.B* %this,  i32 0, i32 0, i32 1
  %1 = load i32, i32* %0, align 4
  ret i32 %1
}

; Class: 'C' Function : 'useInheritedAttributes'
define i32 @_CC1_FuseInheritedAttributes22_(%class.C* %this
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
  %0 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %1 = load %class.IO*, %class.IO** %0, align 8
  %2 = icmp eq %class.IO* %1, null
  br i1 %2, label %static.void, label %branch.normal

branch.normal:
  %3 = getelementptr inbounds [60 x i8], [60 x i8]* @.str.1, i32 0, i32 0
  %4 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %1, i8* %3)
  %5 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %6 = load %class.IO*, %class.IO** %5, align 8
  %7 = icmp eq %class.IO* %6, null
  br i1 %7, label %static.void, label %branch.normal.1

branch.normal.1:
  %8 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 0, i32 0, i32 1
  %9 = load i32, i32* %8, align 4
  %10 = call %class.IO* @_CIO2_Fout_int7_(%class.IO* %6, i32 %9)
  %11 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %12 = load %class.IO*, %class.IO** %11, align 8
  %13 = icmp eq %class.IO* %12, null
  br i1 %13, label %static.void, label %branch.normal.2

branch.normal.2:
  %14 = getelementptr inbounds [13 x i8], [13 x i8]* @.str.2, i32 0, i32 0
  %15 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %12, i8* %14)
  ret i32 0
}

; Class: 'C' Function : 'testObjectFunctions'
define i32 @_CC1_FtestObjectFunctions19_(%class.C* %this
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
  %0 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %1 = load %class.IO*, %class.IO** %0, align 8
  %2 = icmp eq %class.IO* %1, null
  br i1 %2, label %static.void, label %branch.normal.3

branch.normal.3:
  %3 = getelementptr inbounds [35 x i8], [35 x i8]* @.str.3, i32 0, i32 0
  %4 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %1, i8* %3)
  %5 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %6 = load %class.IO*, %class.IO** %5, align 8
  %7 = icmp eq %class.IO* %6, null
  br i1 %7, label %static.void, label %branch.normal.4

branch.normal.4:
  %8 = getelementptr inbounds [11 x i8], [11 x i8]* @.str.4, i32 0, i32 0
  %9 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %6, i8* %8)
  %10 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 3
  %11 = load %class.Object*, %class.Object** %10, align 8
  %12 = icmp eq %class.Object* %11, null
  br i1 %12, label %static.void, label %branch.normal.5

branch.normal.5:
  %13 = call %class.Object* @_CObject6_Fabort5_(%class.Object* %11)
  %14 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %15 = load %class.IO*, %class.IO** %14, align 8
  %16 = icmp eq %class.IO* %15, null
  br i1 %16, label %static.void, label %branch.normal.6

branch.normal.6:
  %17 = getelementptr inbounds [13 x i8], [13 x i8]* @.str.2, i32 0, i32 0
  %18 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %15, i8* %17)
  ret i32 0
}

; Class: 'C' Function : 'testIOFunctions'
define i32 @_CC1_FtestIOFunctions15_(%class.C* %this, i8* %s, i32 %c
) {
entry:
  %s.addr = alloca i8*, align 8
  store i8* %s, i8** %s.addr, align 8
  %c.addr = alloca i32, align 8
  store i32 %c, i32* %c.addr, align 4
  br label %method.body

static.void:
  call void @print_dispatch_on_void_error()
  br label %method.body

division.0:
  call void @print_div_by_zero_err_msg()
  br label %method.body

method.body:
  %0 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %1 = load %class.IO*, %class.IO** %0, align 8
  %2 = icmp eq %class.IO* %1, null
  br i1 %2, label %static.void, label %branch.normal.7

branch.normal.7:
  %3 = getelementptr inbounds [31 x i8], [31 x i8]* @.str.5, i32 0, i32 0
  %4 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %1, i8* %3)
  %5 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %6 = load %class.IO*, %class.IO** %5, align 8
  %7 = icmp eq %class.IO* %6, null
  br i1 %7, label %static.void, label %branch.normal.8

branch.normal.8:
  %8 = getelementptr inbounds [75 x i8], [75 x i8]* @.str.6, i32 0, i32 0
  %9 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %6, i8* %8)
  %10 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %11 = load %class.IO*, %class.IO** %10, align 8
  %12 = icmp eq %class.IO* %11, null
  br i1 %12, label %static.void, label %branch.normal.9

branch.normal.9:
  %13 = load i8*, i8** %s.addr, align 8
  %14 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %11, i8* %13)
  %15 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %16 = load %class.IO*, %class.IO** %15, align 8
  %17 = icmp eq %class.IO* %16, null
  br i1 %17, label %static.void, label %branch.normal.10

branch.normal.10:
  %18 = getelementptr inbounds [67 x i8], [67 x i8]* @.str.7, i32 0, i32 0
  %19 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %16, i8* %18)
  %20 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %21 = load %class.IO*, %class.IO** %20, align 8
  %22 = icmp eq %class.IO* %21, null
  br i1 %22, label %static.void, label %branch.normal.11

branch.normal.11:
  %23 = load i32, i32* %c.addr, align 4
  %24 = call %class.IO* @_CIO2_Fout_int7_(%class.IO* %21, i32 %23)
  %25 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %26 = load %class.IO*, %class.IO** %25, align 8
  %27 = icmp eq %class.IO* %26, null
  br i1 %27, label %static.void, label %branch.normal.12

branch.normal.12:
  %28 = getelementptr inbounds [33 x i8], [33 x i8]* @.str.8, i32 0, i32 0
  %29 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %26, i8* %28)
  %30 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %31 = load %class.IO*, %class.IO** %30, align 8
  %32 = icmp eq %class.IO* %31, null
  br i1 %32, label %static.void, label %branch.normal.13

branch.normal.13:
  %33 = call i8* @_CIO2_Fin_string9_(%class.IO* %31)
  store i8* %33, i8** %s.addr, align 8
  %34 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %35 = load %class.IO*, %class.IO** %34, align 8
  %36 = icmp eq %class.IO* %35, null
  br i1 %36, label %static.void, label %branch.normal.14

branch.normal.14:
  %37 = getelementptr inbounds [15 x i8], [15 x i8]* @.str.9, i32 0, i32 0
  %38 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %35, i8* %37)
  %39 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %40 = load %class.IO*, %class.IO** %39, align 8
  %41 = icmp eq %class.IO* %40, null
  br i1 %41, label %static.void, label %branch.normal.15

branch.normal.15:
  %42 = load i8*, i8** %s.addr, align 8
  %43 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %40, i8* %42)
  %44 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %45 = load %class.IO*, %class.IO** %44, align 8
  %46 = icmp eq %class.IO* %45, null
  br i1 %46, label %static.void, label %branch.normal.16

branch.normal.16:
  %47 = getelementptr inbounds [27 x i8], [27 x i8]* @.str.10, i32 0, i32 0
  %48 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %45, i8* %47)
  %49 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %50 = load %class.IO*, %class.IO** %49, align 8
  %51 = icmp eq %class.IO* %50, null
  br i1 %51, label %static.void, label %branch.normal.17

branch.normal.17:
  %52 = call i32 @_CIO2_Fin_int6_(%class.IO* %50)
  store i32 %52, i32* %c.addr, align 4
  %53 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %54 = load %class.IO*, %class.IO** %53, align 8
  %55 = icmp eq %class.IO* %54, null
  br i1 %55, label %static.void, label %branch.normal.18

branch.normal.18:
  %56 = getelementptr inbounds [12 x i8], [12 x i8]* @.str.11, i32 0, i32 0
  %57 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %54, i8* %56)
  %58 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %59 = load %class.IO*, %class.IO** %58, align 8
  %60 = icmp eq %class.IO* %59, null
  br i1 %60, label %static.void, label %branch.normal.19

branch.normal.19:
  %61 = load i32, i32* %c.addr, align 4
  %62 = call %class.IO* @_CIO2_Fout_int7_(%class.IO* %59, i32 %61)
  %63 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %64 = load %class.IO*, %class.IO** %63, align 8
  %65 = icmp eq %class.IO* %64, null
  br i1 %65, label %static.void, label %branch.normal.20

branch.normal.20:
  %66 = getelementptr inbounds [13 x i8], [13 x i8]* @.str.2, i32 0, i32 0
  %67 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %64, i8* %66)
  ret i32 0
}

; Class: 'C' Function : 'testStringFunctions'
define i32 @_CC1_FtestStringFunctions19_(%class.C* %this, i8* %s1, i8* %s2, i32 %x, i32 %l
) {
entry:
  %s1.addr = alloca i8*, align 8
  store i8* %s1, i8** %s1.addr, align 8
  %s2.addr = alloca i8*, align 8
  store i8* %s2, i8** %s2.addr, align 8
  %x.addr = alloca i32, align 8
  store i32 %x, i32* %x.addr, align 4
  %l.addr = alloca i32, align 8
  store i32 %l, i32* %l.addr, align 4
  br label %method.body

static.void:
  call void @print_dispatch_on_void_error()
  br label %method.body

division.0:
  call void @print_div_by_zero_err_msg()
  br label %method.body

method.body:
  %0 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %1 = load %class.IO*, %class.IO** %0, align 8
  %2 = icmp eq %class.IO* %1, null
  br i1 %2, label %static.void, label %branch.normal.21

branch.normal.21:
  %3 = getelementptr inbounds [35 x i8], [35 x i8]* @.str.12, i32 0, i32 0
  %4 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %1, i8* %3)
  %5 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %6 = load %class.IO*, %class.IO** %5, align 8
  %7 = icmp eq %class.IO* %6, null
  br i1 %7, label %static.void, label %branch.normal.22

branch.normal.22:
  %8 = getelementptr inbounds [16 x i8], [16 x i8]* @.str.13, i32 0, i32 0
  %9 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %6, i8* %8)
  %10 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %11 = load %class.IO*, %class.IO** %10, align 8
  %12 = icmp eq %class.IO* %11, null
  br i1 %12, label %static.void, label %branch.normal.23

branch.normal.23:
  %13 = load i8*, i8** %s1.addr, align 8
  %14 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %11, i8* %13)
  %15 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %16 = load %class.IO*, %class.IO** %15, align 8
  %17 = icmp eq %class.IO* %16, null
  br i1 %17, label %static.void, label %branch.normal.24

branch.normal.24:
  %18 = getelementptr inbounds [19 x i8], [19 x i8]* @.str.14, i32 0, i32 0
  %19 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %16, i8* %18)
  %20 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %21 = load %class.IO*, %class.IO** %20, align 8
  %22 = icmp eq %class.IO* %21, null
  br i1 %22, label %static.void, label %branch.normal.25

branch.normal.25:
  %23 = load i8*, i8** %s2.addr, align 8
  %24 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %21, i8* %23)
  %25 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %26 = load %class.IO*, %class.IO** %25, align 8
  %27 = icmp eq %class.IO* %26, null
  br i1 %27, label %static.void, label %branch.normal.26

branch.normal.26:
  %28 = getelementptr inbounds [72 x i8], [72 x i8]* @.str.15, i32 0, i32 0
  %29 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %26, i8* %28)
  %30 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %31 = load %class.IO*, %class.IO** %30, align 8
  %32 = icmp eq %class.IO* %31, null
  br i1 %32, label %static.void, label %branch.normal.27

branch.normal.27:
  %33 = load i32, i32* %x.addr, align 4
  %34 = call %class.IO* @_CIO2_Fout_int7_(%class.IO* %31, i32 %33)
  %35 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %36 = load %class.IO*, %class.IO** %35, align 8
  %37 = icmp eq %class.IO* %36, null
  br i1 %37, label %static.void, label %branch.normal.28

branch.normal.28:
  %38 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.16, i32 0, i32 0
  %39 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %36, i8* %38)
  %40 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %41 = load %class.IO*, %class.IO** %40, align 8
  %42 = icmp eq %class.IO* %41, null
  br i1 %42, label %static.void, label %branch.normal.29

branch.normal.29:
  %43 = load i32, i32* %l.addr, align 4
  %44 = call %class.IO* @_CIO2_Fout_int7_(%class.IO* %41, i32 %43)
  %45 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %46 = load %class.IO*, %class.IO** %45, align 8
  %47 = icmp eq %class.IO* %46, null
  br i1 %47, label %static.void, label %branch.normal.30

branch.normal.30:
  %48 = getelementptr inbounds [13 x i8], [13 x i8]* @.str.17, i32 0, i32 0
  %49 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %46, i8* %48)
  %50 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %51 = load %class.IO*, %class.IO** %50, align 8
  %52 = icmp eq %class.IO* %51, null
  br i1 %52, label %static.void, label %branch.normal.31

branch.normal.31:
  %53 = load i8*, i8** %s1.addr, align 8
  %54 = call i64 @strlen(i8* %53)
  %55 = trunc i64 %54 to i32
  %56 = call %class.IO* @_CIO2_Fout_int7_(%class.IO* %51, i32 %55)
  %57 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %58 = load %class.IO*, %class.IO** %57, align 8
  %59 = icmp eq %class.IO* %58, null
  br i1 %59, label %static.void, label %branch.normal.32

branch.normal.32:
  %60 = getelementptr inbounds [27 x i8], [27 x i8]* @.str.18, i32 0, i32 0
  %61 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %58, i8* %60)
  %62 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %63 = load %class.IO*, %class.IO** %62, align 8
  %64 = icmp eq %class.IO* %63, null
  br i1 %64, label %static.void, label %branch.normal.33

branch.normal.33:
  %65 = getelementptr inbounds [9 x i8], [9 x i8]* @.str.19, i32 0, i32 0
  %66 = call i64 @strlen(i8* %65)
  %67 = trunc i64 %66 to i32
  %68 = call %class.IO* @_CIO2_Fout_int7_(%class.IO* %63, i32 %67)
  %69 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %70 = load %class.IO*, %class.IO** %69, align 8
  %71 = icmp eq %class.IO* %70, null
  br i1 %71, label %static.void, label %branch.normal.34

branch.normal.34:
  %72 = getelementptr inbounds [13 x i8], [13 x i8]* @.str.20, i32 0, i32 0
  %73 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %70, i8* %72)
  %74 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %75 = load %class.IO*, %class.IO** %74, align 8
  %76 = icmp eq %class.IO* %75, null
  br i1 %76, label %static.void, label %branch.normal.35

branch.normal.35:
  %77 = load i8*, i8** %s1.addr, align 8
  %78 = load i8*, i8** %s2.addr, align 8
  %79 = call i8* @_CString6_Fconcat6_(i8* %77, i8* %78)
  %80 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %75, i8* %79)
  %81 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %82 = load %class.IO*, %class.IO** %81, align 8
  %83 = icmp eq %class.IO* %82, null
  br i1 %83, label %static.void, label %branch.normal.36

branch.normal.36:
  %84 = getelementptr inbounds [23 x i8], [23 x i8]* @.str.21, i32 0, i32 0
  %85 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %82, i8* %84)
  %86 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %87 = load %class.IO*, %class.IO** %86, align 8
  %88 = icmp eq %class.IO* %87, null
  br i1 %88, label %static.void, label %branch.normal.37

branch.normal.37:
  %89 = getelementptr inbounds [9 x i8], [9 x i8]* @.str.19, i32 0, i32 0
  %90 = load i8*, i8** %s2.addr, align 8
  %91 = call i8* @_CString6_Fconcat6_(i8* %89, i8* %90)
  %92 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %87, i8* %91)
  %93 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %94 = load %class.IO*, %class.IO** %93, align 8
  %95 = icmp eq %class.IO* %94, null
  br i1 %95, label %static.void, label %branch.normal.38

branch.normal.38:
  %96 = getelementptr inbounds [13 x i8], [13 x i8]* @.str.22, i32 0, i32 0
  %97 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %94, i8* %96)
  %98 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %99 = load %class.IO*, %class.IO** %98, align 8
  %100 = icmp eq %class.IO* %99, null
  br i1 %100, label %static.void, label %branch.normal.39

branch.normal.39:
  %101 = load i8*, i8** %s1.addr, align 8
  %102 = load i32, i32* %x.addr, align 4
  %103 = load i32, i32* %l.addr, align 4
  %104 = call i8* @_CString6_Fsubstr6_(i8* %101, i32 %102, i32 %103)
  %105 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %99, i8* %104)
  %106 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %107 = load %class.IO*, %class.IO** %106, align 8
  %108 = icmp eq %class.IO* %107, null
  br i1 %108, label %static.void, label %branch.normal.40

branch.normal.40:
  %109 = getelementptr inbounds [13 x i8], [13 x i8]* @.str.2, i32 0, i32 0
  %110 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %107, i8* %109)
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
  %1 = load %class.C*, %class.C** %0, align 8
  %2 = icmp eq %class.C* %1, null
  br i1 %2, label %static.void, label %branch.normal.41

branch.normal.41:
  %3 = call i32 @_CC1_FuseInheritedAttributes22_(%class.C* %1)
  %4 = getelementptr inbounds %class.Main, %class.Main* %this,  i32 0, i32 1
  %5 = load %class.C*, %class.C** %4, align 8
  %6 = icmp eq %class.C* %5, null
  br i1 %6, label %static.void, label %branch.normal.42

branch.normal.42:
  %7 = getelementptr inbounds [4 x i8], [4 x i8]* @.str.23, i32 0, i32 0
  %8 = call i32 @_CC1_FtestIOFunctions15_(%class.C* %5, i8* %7, i32 6)
  %9 = getelementptr inbounds %class.Main, %class.Main* %this,  i32 0, i32 1
  %10 = load %class.C*, %class.C** %9, align 8
  %11 = icmp eq %class.C* %10, null
  br i1 %11, label %static.void, label %branch.normal.43

branch.normal.43:
  %12 = getelementptr inbounds [7 x i8], [7 x i8]* @.str.24, i32 0, i32 0
  %13 = getelementptr inbounds [6 x i8], [6 x i8]* @.str.25, i32 0, i32 0
  %14 = call i32 @_CC1_FtestStringFunctions19_(%class.C* %10, i8* %12, i8* %13, i32 2, i32 3)
  %15 = getelementptr inbounds %class.Main, %class.Main* %this,  i32 0, i32 1
  %16 = load %class.C*, %class.C** %15, align 8
  %17 = icmp eq %class.C* %16, null
  br i1 %17, label %static.void, label %branch.normal.44

branch.normal.44:
  %18 = call i32 @_CC1_FtestObjectFunctions19_(%class.C* %16)
  ret i32 0
}

define i32 @main() {
entry:
 %main = alloca %class.Main, align 8
 call void @_CMain4_FMain4_(%class.Main* %main)
 %dummyretval = call i32 @_CMain4_Fmain4_(%class.Main* %main)
 ret i32 0}
