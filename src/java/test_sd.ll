; ModuleID = 'omisbest'
source_filename = "omisbest"

; String constant declarations
@.str.1 = private unnamed_addr constant [1 x i8] c"\00", align 1
@.str.7 = private unnamed_addr constant [22 x i8] c"VOID Dispatach Found \00", align 1
@.str.10 = private unnamed_addr constant [3 x i8] c"IO\00", align 1
@.str.0 = private unnamed_addr constant [2 x i8] c"
\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"%d
\00", align 1
@.str.11 = private unnamed_addr constant [7 x i8] c"String\00", align 1
@.str.4 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.12 = private unnamed_addr constant [4 x i8] c"Int\00", align 1
@.str.6 = private unnamed_addr constant [32 x i8] c"Exception Divide By Zero Found \00", align 1
@.str.13 = private unnamed_addr constant [5 x i8] c"Bool\00", align 1
@.str.8 = private unnamed_addr constant [33 x i8] c"ABORT Message called from class \00", align 1
@.str.9 = private unnamed_addr constant [7 x i8] c"Object\00", align 1
@.str.5 = private unnamed_addr constant [10 x i8] c"%1024[^
]\00", align 1
@.str.2 = private unnamed_addr constant [3 x i8] c"%d\00", align 1

; Class Declarations
%class.Object = type {i8*}
%class.IO = type { %class.Object }
%class.Main = type { %class.Object, i32, i32 }


; Constructor of class 'Object'
define void @_CObject6_FObject6_(%class.Object* %this) {

entry:
  ret void
}

; Constructor of class 'IO'
define void @_CIO2_FIO2_(%class.IO* %this) {

entry:
  %0 = bitcast %class.IO* %this to %class.Object*
  call void @_CObject6_FObject6_(%class.Object* %0)
  ret void
}

; Constructor of class 'Main'
define void @_CMain4_FMain4_(%class.Main* %this) {

entry:
  %0 = bitcast %class.Main* %this to %class.Object*
  call void @_CObject6_FObject6_(%class.Object* %0)
  %1 = getelementptr inbounds %class.Main, %class.Main* %this,  i32 0, i32 1
  store i32 0, i32* %1, align 4
  %2 = getelementptr inbounds %class.Main, %class.Main* %this,  i32 0, i32 2
  store i32 0, i32* %2, align 4
  ret void
}

; C malloc declaration
declare noalias i8* @malloc(i64)

; C printf declaration
declare i32 @printf(i8*, ...)

; C scanf declaration
declare i32 @scanf(i8*, ...)

; C strlen declaration
declare i64 @strlen(i8*)

; C strcat declaration
declare i8* @strcat(i8*, i8*)

; C strcpy declaration
declare i8* @strcpy(i8*, i8*)

; C strncpy declaration
declare i8* @strncpy(i8*, i8*, i64)

; C exit declaration
declare void @exit(i32)

; Class: Object, Method: type_name
define i8* @_CObject6_Ftype_name9_(%class.Object* %this) {
entry:
  %0 = getelementptr inbounds %class.Object, %class.Object* %this, i32 0, i32 0
  %1 = load i8*, i8** %0, align 8
  ret i8* %1
}

; Class: Object, Method: abort
define %class.Object* @_CObject6_Fabort5_(%class.Object* %this) {
entry:
  %0 = getelementptr inbounds %class.Object, %class.Object* %this, i32 0, i32 0
  %1 = load i8*, i8** %0, align 8
  %2 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.4, i32 0, i32 0
  %3 = getelementptr inbounds [33 x i8], [33 x i8]* @.str.8, i32 0, i32 0
  %4 = call i32 (i8*, ...) @printf(i8* %2, i8* %3)
  %5 = call i32 (i8*, ...) @printf(i8* %2, i8* %1)
  %6 = call i32 (i8*, ...) @printf(i8* %2, i8* %3)
  call void @exit(i32 0)
  %7 = call noalias i8* @malloc(i64 0)
  %8 = bitcast i8* %7 to %class.Object*
  call void @_CObject6_FObject6_(%class.Object* %8)
  ret %class.Object* %8
}

; Class: IO, Method: out_int
define %class.IO* @_CIO2_Fout_int7_(%class.IO* %this, i32 %d) {
entry:
  %0 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.2, i32 0, i32 0
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
  %1 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.2, i32 0, i32 0
  %call = call i32 (i8*, ...) @scanf(i8* %1, i32* %0)
  %2 = load i32, i32* %0, align 4
  ret i32 %2
}

; Class: IO, Method: out_string
define %class.IO* @_CIO2_Fout_string10_(%class.IO* %this, i8* %s) {
entry:
  %0 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.4, i32 0, i32 0
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
  %2 = getelementptr inbounds [10 x i8], [10 x i8]* @.str.5, i32 0, i32 0
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
  %0 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.4, i32 0, i32 0
  %1 = getelementptr inbounds [22 x i8], [22 x i8]* @.str.7, i32 0, i32 0
 %2 = call i32 (i8*, ...) @printf(i8* %0, i8* %1)
  %3 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.0, i32 0, i32 0
 %4 = call i32 (i8*, ...) @printf(i8* %0, i8* %3)
  call void @exit(i32 1)
 ret void
}

define void @print_div_by_zero_err_msg() {
entry:
  %0 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.4, i32 0, i32 0
  %1 = getelementptr inbounds [32 x i8], [32 x i8]* @.str.6, i32 0, i32 0
 %2 = call i32 (i8*, ...) @printf(i8* %0, i8* %1)
  %3 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.0, i32 0, i32 0
 %4 = call i32 (i8*, ...) @printf(i8* %0, i8* %3)
  call void @exit(i32 1)
 ret void
}

; Class: Main, Method: main
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
  %1 = load i32, i32* %0, align 4
  %2 = getelementptr inbounds %class.Main, %class.Main* %this,  i32 0, i32 2
  %3 = load i32, i32* %2, align 4
  %4 = add nsw i32 %1, %3
  %5 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.4, i32 0, i32 0
  %6 = getelementptr inbounds [33 x i8], [33 x i8]* @.str.8, i32 0, i32 0
  %7 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.0, i32 0, i32 0
  %8 = getelementptr inbounds [4 x i8], [4 x i8]* @.str.12, i32 0, i32 0
  %9 = call i32 (i8*, ...) @printf(i8* %5, i8* %6)
  %10 = call i32 (i8*, ...) @printf(i8* %5, i8* %8)
  %11 = call i32 (i8*, ...) @printf(i8* %5, i8* %7)
  call void @exit(i32 0)
  %12 = call noalias i8* @malloc(i64 0)
  %13 = bitcast i8* %12 to %class.Object*
  call void @_CObject6_FObject6_(%class.Object* %13)
  ret i32 0
}

define i32 @main() {
entry:
 %main = alloca %class.Main, align 8
 call void @_CMain4_FMain4_(%class.Main* %main)
 %dummyretval = call i32 @_CMain4_Fmain4_(%class.Main* %main)
 ret i32 0}
