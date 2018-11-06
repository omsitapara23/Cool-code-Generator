; ModuleID = 'omisbest'
source_filename = "omisbest"

; String constant declarations
@.str.4 = private unnamed_addr constant [16 x i8] c"
Object<-Int : \00", align 1
@.str.12 = private unnamed_addr constant [1 x i8] c"\00", align 1
@.str.20 = private unnamed_addr constant [26 x i8] c"Typename Function called \00", align 1
@.str.18 = private unnamed_addr constant [22 x i8] c"VOID Dispatach Found \00", align 1
@.str.2 = private unnamed_addr constant [9 x i8] c"
C<-C : \00", align 1
@.str.11 = private unnamed_addr constant [2 x i8] c"
\00", align 1
@.str.14 = private unnamed_addr constant [4 x i8] c"%d
\00", align 1
@.str.23 = private unnamed_addr constant [7 x i8] c"String\00", align 1
@.str.24 = private unnamed_addr constant [4 x i8] c"Int\00", align 1
@.str.1 = private unnamed_addr constant [9 x i8] c"
B<-B : \00", align 1
@.str.25 = private unnamed_addr constant [5 x i8] c"Bool\00", align 1
@.str.8 = private unnamed_addr constant [11 x i8] c"
IO<-IO : \00", align 1
@.str.13 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.22 = private unnamed_addr constant [3 x i8] c"IO\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"
Object<-IO : \00", align 1
@.str.10 = private unnamed_addr constant [9 x i8] c"
B<-C : \00", align 1
@.str.15 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.9 = private unnamed_addr constant [10 x i8] c"
IO<-A : \00", align 1
@.str.7 = private unnamed_addr constant [17 x i8] c"
Object<-Bool : \00", align 1
@.str.17 = private unnamed_addr constant [32 x i8] c"Exception Divide By Zero Found \00", align 1
@.str.0 = private unnamed_addr constant [9 x i8] c"
A<-A : \00", align 1
@.str.19 = private unnamed_addr constant [22 x i8] c"ABORT Message called \00", align 1
@.str.3 = private unnamed_addr constant [14 x i8] c"
Object<-A : \00", align 1
@.str.21 = private unnamed_addr constant [7 x i8] c"Object\00", align 1
@.str.6 = private unnamed_addr constant [19 x i8] c"
Object<-String : \00", align 1
@.str.16 = private unnamed_addr constant [10 x i8] c"%1024[^
]\00", align 1

; Class Declarations
%class.Object = type {}
%class.IO = type { %class.Object }
%class.A = type { %class.IO, i32 }
%class.B = type { %class.Object, i32 }
%class.C = type { %class.B, i32 }
%class.E = type { %class.Object, %class.A*, %class.B*, %class.C*, %class.Object*, %class.Object*, %class.Object*, %class.Object*, %class.Object*, %class.IO*, %class.IO*, %class.B* }
%class.Main = type { %class.Object, %class.E* }


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
  %0 = bitcast %class.A* %this to %class.IO*
  call void @_CIO2_FIO2_(%class.IO* %0)
  %1 = getelementptr inbounds %class.A, %class.A* %this,  i32 0, i32 1
  store i32 0, i32* %1, align 4
  ret void
}

; class : 'B function : constructor
define void @_CB1_FB1_(%class.B* %this) {

entry:
  %0 = bitcast %class.B* %this to %class.Object*
  call void @_CObject6_FObject6_(%class.Object* %0)
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
  store i32 0, i32* %1, align 4
  ret void
}

; class : 'E function : constructor
define void @_CE1_FE1_(%class.E* %this) {

entry:
  %0 = bitcast %class.E* %this to %class.Object*
  call void @_CObject6_FObject6_(%class.Object* %0)
  %1 = getelementptr inbounds %class.E, %class.E* %this,  i32 0, i32 1
  %2 = call noalias i8* @malloc(i64 20)
  %3 = bitcast i8* %2 to %class.A*
  call void @_CA1_FA1_(%class.A* %3)
  store %class.A* %3, %class.A** %1, align 4
  %4 = getelementptr inbounds %class.E, %class.E* %this,  i32 0, i32 2
  %5 = call noalias i8* @malloc(i64 12)
  %6 = bitcast i8* %5 to %class.B*
  call void @_CB1_FB1_(%class.B* %6)
  store %class.B* %6, %class.B** %4, align 4
  %7 = getelementptr inbounds %class.E, %class.E* %this,  i32 0, i32 3
  %8 = call noalias i8* @malloc(i64 24)
  %9 = bitcast i8* %8 to %class.C*
  call void @_CC1_FC1_(%class.C* %9)
  store %class.C* %9, %class.C** %7, align 4
  %10 = getelementptr inbounds %class.E, %class.E* %this,  i32 0, i32 4
  %11 = call noalias i8* @malloc(i64 20)
  %12 = bitcast i8* %11 to %class.A*
  call void @_CA1_FA1_(%class.A* %12)
  %13 = bitcast %class.A* %12 to %class.IO*
  %14 = bitcast %class.IO* %13 to %class.Object*
  store %class.Object* %14, %class.Object** %10, align 4
  %15 = getelementptr inbounds %class.E, %class.E* %this,  i32 0, i32 5
  %16 = call noalias i8* @malloc(i64 0)
  %17 = bitcast i8* %16 to %class.Object*
  call void @_CObject6_FObject6_(%class.Object* %17)
  store %class.Object* %17, %class.Object** %15, align 4
  %18 = getelementptr inbounds %class.E, %class.E* %this,  i32 0, i32 6
  %19 = call noalias i8* @malloc(i64 8)
  %20 = bitcast i8* %19 to %class.IO*
  call void @_CIO2_FIO2_(%class.IO* %20)
  %21 = bitcast %class.IO* %20 to %class.Object*
  store %class.Object* %21, %class.Object** %18, align 4
  %22 = getelementptr inbounds %class.E, %class.E* %this,  i32 0, i32 7
  %23 = getelementptr inbounds [1 x i8], [1 x i8]* @.str.12, i32 0, i32 0
  %24 = call noalias i8* @malloc(i64 0)
  %25 = bitcast i8* %24 to %class.Object*
  call void @_CObject6_FObject6_(%class.Object* %25)
  store %class.Object* %25, %class.Object** %22, align 4
  %26 = getelementptr inbounds %class.E, %class.E* %this,  i32 0, i32 8
  %27 = call noalias i8* @malloc(i64 0)
  %28 = bitcast i8* %27 to %class.Object*
  call void @_CObject6_FObject6_(%class.Object* %28)
  store %class.Object* %28, %class.Object** %26, align 4
  %29 = getelementptr inbounds %class.E, %class.E* %this,  i32 0, i32 9
  %30 = call noalias i8* @malloc(i64 8)
  %31 = bitcast i8* %30 to %class.IO*
  call void @_CIO2_FIO2_(%class.IO* %31)
  store %class.IO* %31, %class.IO** %29, align 4
  %32 = getelementptr inbounds %class.E, %class.E* %this,  i32 0, i32 10
  %33 = call noalias i8* @malloc(i64 20)
  %34 = bitcast i8* %33 to %class.A*
  call void @_CA1_FA1_(%class.A* %34)
  %35 = bitcast %class.A* %34 to %class.IO*
  store %class.IO* %35, %class.IO** %32, align 4
  %36 = getelementptr inbounds %class.E, %class.E* %this,  i32 0, i32 11
  %37 = call noalias i8* @malloc(i64 24)
  %38 = bitcast i8* %37 to %class.C*
  call void @_CC1_FC1_(%class.C* %38)
  %39 = bitcast %class.C* %38 to %class.B*
  store %class.B* %39, %class.B** %36, align 4
  ret void
}

; class : 'Main function : constructor
define void @_CMain4_FMain4_(%class.Main* %this) {

entry:
  %0 = bitcast %class.Main* %this to %class.Object*
  call void @_CObject6_FObject6_(%class.Object* %0)
  %1 = getelementptr inbounds %class.Main, %class.Main* %this,  i32 0, i32 1
  %2 = call noalias i8* @malloc(i64 96)
  %3 = bitcast i8* %2 to %class.E*
  call void @_CE1_FE1_(%class.E* %3)
  store %class.E* %3, %class.E** %1, align 4
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
  %0 = getelementptr inbounds [26 x i8], [26 x i8]* @.str.20, i32 0, i32 0
  ret i8* %0
}

; Class: Object, Method: abort
define %class.Object* @_CObject6_Fabort5_(%class.Object* %this) {
entry:
  %0 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.15, i32 0, i32 0
  %1 = getelementptr inbounds [22 x i8], [22 x i8]* @.str.19, i32 0, i32 0
  %2 = call i32 (i8*, ...) @printf(i8* %0, i8* %1)
  %3 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.11, i32 0, i32 0
  %4 = call i32 (i8*, ...) @printf(i8* %0, i8* %3)
  call void @exit(i32 0)
  ret %class.Object* %this
}

; Class: IO, Method: out_int
define %class.IO* @_CIO2_Fout_int7_(%class.IO* %this, i32 %d) {
entry:
  %0 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.13, i32 0, i32 0
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
  %1 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.13, i32 0, i32 0
  %call = call i32 (i8*, ...) @scanf(i8* %1, i32* %0)
  %2 = load i32, i32* %0, align 4
  ret i32 %2
}

; Class: IO, Method: out_string
define %class.IO* @_CIO2_Fout_string10_(%class.IO* %this, i8* %s) {
entry:
  %0 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.15, i32 0, i32 0
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
  %2 = getelementptr inbounds [10 x i8], [10 x i8]* @.str.16, i32 0, i32 0
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
  %0 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.15, i32 0, i32 0
  %1 = getelementptr inbounds [22 x i8], [22 x i8]* @.str.18, i32 0, i32 0
 %2 = call i32 (i8*, ...) @printf(i8* %0, i8* %1)
  %3 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.11, i32 0, i32 0
 %4 = call i32 (i8*, ...) @printf(i8* %0, i8* %3)
  call void @exit(i32 1)
 ret void
}

define void @print_div_by_zero_err_msg() {
entry:
  %0 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.15, i32 0, i32 0
  %1 = getelementptr inbounds [32 x i8], [32 x i8]* @.str.17, i32 0, i32 0
 %2 = call i32 (i8*, ...) @printf(i8* %0, i8* %1)
  %3 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.11, i32 0, i32 0
 %4 = call i32 (i8*, ...) @printf(i8* %0, i8* %3)
  call void @exit(i32 1)
 ret void
}

; Class: 'E' Function : 'checkTypes'
define i32 @_CE1_FcheckTypes10_(%class.E* %this
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
  %0 = getelementptr inbounds %class.E, %class.E* %this,  i32 0, i32 9
  %1 = load %class.IO*, %class.IO** %0, align 8
  %2 = icmp eq %class.IO* %1, null
  br i1 %2, label %static.void, label %branch.normal

branch.normal:
  %3 = getelementptr inbounds [9 x i8], [9 x i8]* @.str.0, i32 0, i32 0
  %4 = getelementptr inbounds %class.E, %class.E* %this,  i32 0, i32 1
  %5 = load %class.A*, %class.A** %4, align 8
  %6 = icmp eq %class.A* %5, null
  br i1 %6, label %static.void, label %branch.normal.1

branch.normal.1:
  %7 = bitcast %class.A* %5 to %class.Object*
  %8 = call i8* @_CObject6_Ftype_name9_(%class.Object* %7)
  %9 = call i8* @_CString6_Fconcat6_(i8* %3, i8* %8)
  %10 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %1, i8* %9)
  %11 = getelementptr inbounds %class.E, %class.E* %this,  i32 0, i32 9
  %12 = load %class.IO*, %class.IO** %11, align 8
  %13 = icmp eq %class.IO* %12, null
  br i1 %13, label %static.void, label %branch.normal.2

branch.normal.2:
  %14 = getelementptr inbounds [9 x i8], [9 x i8]* @.str.1, i32 0, i32 0
  %15 = getelementptr inbounds %class.E, %class.E* %this,  i32 0, i32 2
  %16 = load %class.B*, %class.B** %15, align 8
  %17 = icmp eq %class.B* %16, null
  br i1 %17, label %static.void, label %branch.normal.3

branch.normal.3:
  %18 = bitcast %class.B* %16 to %class.Object*
  %19 = call i8* @_CObject6_Ftype_name9_(%class.Object* %18)
  %20 = call i8* @_CString6_Fconcat6_(i8* %14, i8* %19)
  %21 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %12, i8* %20)
  %22 = getelementptr inbounds %class.E, %class.E* %this,  i32 0, i32 9
  %23 = load %class.IO*, %class.IO** %22, align 8
  %24 = icmp eq %class.IO* %23, null
  br i1 %24, label %static.void, label %branch.normal.4

branch.normal.4:
  %25 = getelementptr inbounds [9 x i8], [9 x i8]* @.str.2, i32 0, i32 0
  %26 = getelementptr inbounds %class.E, %class.E* %this,  i32 0, i32 3
  %27 = load %class.C*, %class.C** %26, align 8
  %28 = icmp eq %class.C* %27, null
  br i1 %28, label %static.void, label %branch.normal.5

branch.normal.5:
  %29 = bitcast %class.C* %27 to %class.Object*
  %30 = call i8* @_CObject6_Ftype_name9_(%class.Object* %29)
  %31 = call i8* @_CString6_Fconcat6_(i8* %25, i8* %30)
  %32 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %23, i8* %31)
  %33 = getelementptr inbounds %class.E, %class.E* %this,  i32 0, i32 9
  %34 = load %class.IO*, %class.IO** %33, align 8
  %35 = icmp eq %class.IO* %34, null
  br i1 %35, label %static.void, label %branch.normal.6

branch.normal.6:
  %36 = getelementptr inbounds [14 x i8], [14 x i8]* @.str.3, i32 0, i32 0
  %37 = getelementptr inbounds %class.E, %class.E* %this,  i32 0, i32 4
  %38 = load %class.Object*, %class.Object** %37, align 8
  %39 = icmp eq %class.Object* %38, null
  br i1 %39, label %static.void, label %branch.normal.7

branch.normal.7:
  %40 = call i8* @_CObject6_Ftype_name9_(%class.Object* %38)
  %41 = call i8* @_CString6_Fconcat6_(i8* %36, i8* %40)
  %42 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %34, i8* %41)
  %43 = getelementptr inbounds %class.E, %class.E* %this,  i32 0, i32 9
  %44 = load %class.IO*, %class.IO** %43, align 8
  %45 = icmp eq %class.IO* %44, null
  br i1 %45, label %static.void, label %branch.normal.8

branch.normal.8:
  %46 = getelementptr inbounds [16 x i8], [16 x i8]* @.str.4, i32 0, i32 0
  %47 = getelementptr inbounds %class.E, %class.E* %this,  i32 0, i32 5
  %48 = load %class.Object*, %class.Object** %47, align 8
  %49 = icmp eq %class.Object* %48, null
  br i1 %49, label %static.void, label %branch.normal.9

branch.normal.9:
  %50 = call i8* @_CObject6_Ftype_name9_(%class.Object* %48)
  %51 = call i8* @_CString6_Fconcat6_(i8* %46, i8* %50)
  %52 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %44, i8* %51)
  %53 = getelementptr inbounds %class.E, %class.E* %this,  i32 0, i32 9
  %54 = load %class.IO*, %class.IO** %53, align 8
  %55 = icmp eq %class.IO* %54, null
  br i1 %55, label %static.void, label %branch.normal.10

branch.normal.10:
  %56 = getelementptr inbounds [15 x i8], [15 x i8]* @.str.5, i32 0, i32 0
  %57 = getelementptr inbounds %class.E, %class.E* %this,  i32 0, i32 6
  %58 = load %class.Object*, %class.Object** %57, align 8
  %59 = icmp eq %class.Object* %58, null
  br i1 %59, label %static.void, label %branch.normal.11

branch.normal.11:
  %60 = call i8* @_CObject6_Ftype_name9_(%class.Object* %58)
  %61 = call i8* @_CString6_Fconcat6_(i8* %56, i8* %60)
  %62 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %54, i8* %61)
  %63 = getelementptr inbounds %class.E, %class.E* %this,  i32 0, i32 9
  %64 = load %class.IO*, %class.IO** %63, align 8
  %65 = icmp eq %class.IO* %64, null
  br i1 %65, label %static.void, label %branch.normal.12

branch.normal.12:
  %66 = getelementptr inbounds [19 x i8], [19 x i8]* @.str.6, i32 0, i32 0
  %67 = getelementptr inbounds %class.E, %class.E* %this,  i32 0, i32 7
  %68 = load %class.Object*, %class.Object** %67, align 8
  %69 = icmp eq %class.Object* %68, null
  br i1 %69, label %static.void, label %branch.normal.13

branch.normal.13:
  %70 = call i8* @_CObject6_Ftype_name9_(%class.Object* %68)
  %71 = call i8* @_CString6_Fconcat6_(i8* %66, i8* %70)
  %72 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %64, i8* %71)
  %73 = getelementptr inbounds %class.E, %class.E* %this,  i32 0, i32 9
  %74 = load %class.IO*, %class.IO** %73, align 8
  %75 = icmp eq %class.IO* %74, null
  br i1 %75, label %static.void, label %branch.normal.14

branch.normal.14:
  %76 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.7, i32 0, i32 0
  %77 = getelementptr inbounds %class.E, %class.E* %this,  i32 0, i32 8
  %78 = load %class.Object*, %class.Object** %77, align 8
  %79 = icmp eq %class.Object* %78, null
  br i1 %79, label %static.void, label %branch.normal.15

branch.normal.15:
  %80 = call i8* @_CObject6_Ftype_name9_(%class.Object* %78)
  %81 = call i8* @_CString6_Fconcat6_(i8* %76, i8* %80)
  %82 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %74, i8* %81)
  %83 = getelementptr inbounds %class.E, %class.E* %this,  i32 0, i32 9
  %84 = load %class.IO*, %class.IO** %83, align 8
  %85 = icmp eq %class.IO* %84, null
  br i1 %85, label %static.void, label %branch.normal.16

branch.normal.16:
  %86 = getelementptr inbounds [11 x i8], [11 x i8]* @.str.8, i32 0, i32 0
  %87 = getelementptr inbounds %class.E, %class.E* %this,  i32 0, i32 9
  %88 = load %class.IO*, %class.IO** %87, align 8
  %89 = icmp eq %class.IO* %88, null
  br i1 %89, label %static.void, label %branch.normal.17

branch.normal.17:
  %90 = bitcast %class.IO* %88 to %class.Object*
  %91 = call i8* @_CObject6_Ftype_name9_(%class.Object* %90)
  %92 = call i8* @_CString6_Fconcat6_(i8* %86, i8* %91)
  %93 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %84, i8* %92)
  %94 = getelementptr inbounds %class.E, %class.E* %this,  i32 0, i32 9
  %95 = load %class.IO*, %class.IO** %94, align 8
  %96 = icmp eq %class.IO* %95, null
  br i1 %96, label %static.void, label %branch.normal.18

branch.normal.18:
  %97 = getelementptr inbounds [10 x i8], [10 x i8]* @.str.9, i32 0, i32 0
  %98 = getelementptr inbounds %class.E, %class.E* %this,  i32 0, i32 10
  %99 = load %class.IO*, %class.IO** %98, align 8
  %100 = icmp eq %class.IO* %99, null
  br i1 %100, label %static.void, label %branch.normal.19

branch.normal.19:
  %101 = bitcast %class.IO* %99 to %class.Object*
  %102 = call i8* @_CObject6_Ftype_name9_(%class.Object* %101)
  %103 = call i8* @_CString6_Fconcat6_(i8* %97, i8* %102)
  %104 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %95, i8* %103)
  %105 = getelementptr inbounds %class.E, %class.E* %this,  i32 0, i32 9
  %106 = load %class.IO*, %class.IO** %105, align 8
  %107 = icmp eq %class.IO* %106, null
  br i1 %107, label %static.void, label %branch.normal.20

branch.normal.20:
  %108 = getelementptr inbounds [9 x i8], [9 x i8]* @.str.10, i32 0, i32 0
  %109 = getelementptr inbounds %class.E, %class.E* %this,  i32 0, i32 11
  %110 = load %class.B*, %class.B** %109, align 8
  %111 = icmp eq %class.B* %110, null
  br i1 %111, label %static.void, label %branch.normal.21

branch.normal.21:
  %112 = bitcast %class.B* %110 to %class.Object*
  %113 = call i8* @_CObject6_Ftype_name9_(%class.Object* %112)
  %114 = call i8* @_CString6_Fconcat6_(i8* %108, i8* %113)
  %115 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %106, i8* %114)
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
  %1 = load %class.E*, %class.E** %0, align 8
  %2 = icmp eq %class.E* %1, null
  br i1 %2, label %static.void, label %branch.normal.22

branch.normal.22:
  %3 = call i32 @_CE1_FcheckTypes10_(%class.E* %1)
  ret i32 %3
}

define i32 @main() {
entry:
 %main = alloca %class.Main, align 8
 call void @_CMain4_FMain4_(%class.Main* %main)
 %dummyretval = call i32 @_CMain4_Fmain4_(%class.Main* %main)
 ret i32 0}
