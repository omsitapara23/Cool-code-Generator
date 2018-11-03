; ModuleID = 'omisbest'
source_filename = "omisbest"

; String constant declarations
@.str.5 = private unnamed_addr constant [1 x i8] c"\00", align 1
@.str.0 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"B\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.14 = private unnamed_addr constant [3 x i8] c"IO\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"
\00", align 1
@.str.7 = private unnamed_addr constant [4 x i8] c"%d
\00", align 1
@.str.15 = private unnamed_addr constant [7 x i8] c"String\00", align 1
@.str.8 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.16 = private unnamed_addr constant [4 x i8] c"Int\00", align 1
@.str.17 = private unnamed_addr constant [5 x i8] c"Bool\00", align 1
@.str.11 = private unnamed_addr constant [32 x i8] c"VOID Dispatach Found at line - \00", align 1
@.str.12 = private unnamed_addr constant [33 x i8] c"ABORT Message called from class \00", align 1
@.str.13 = private unnamed_addr constant [7 x i8] c"Object\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"Main\00", align 1
@.str.9 = private unnamed_addr constant [10 x i8] c"%1024[^
]\00", align 1
@.str.6 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.10 = private unnamed_addr constant [42 x i8] c"Exception Divide By Zero Found at line - \00", align 1

; Class Declarations
%class.Object = type {i8*}
%class.IO = type { %class.Object }
%class.A = type { %class.Object, i32 }
%class.B = type { %class.A, i32 }
%class.C = type { %class.B, i32, %class.IO*, %class.Object*, i8* }
%class.Main = type { %class.Object, %class.C* }


; Class: C, Method: useInheritedAttributes
define i32 @_CC1_FuseInheritedAttributes22_(%class.C* %this) {

entry:
  %0 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %1 = load %class.IO*, %class.IO** %0, align 8
  %2 = icmp eq %class.IO* %1, null
  br i1 %2, label %if.then, label %if.else

if.then:
  call void @print_dispatch_on_void_error(i32 17)
  call void @exit(i32 1)
  br label %if.end

if.else:
  br label %if.end

if.end:
  %3 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %1, i8* null)
  %4 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %5 = load %class.IO*, %class.IO** %4, align 8
  %6 = icmp eq %class.IO* %5, null
  br i1 %6, label %if.then.1, label %if.else.1

if.then.1:
  call void @print_dispatch_on_void_error(i32 18)
  call void @exit(i32 1)
  br label %if.end.1

if.else.1:
  br label %if.end.1

if.end.1:
  %7 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 0, i32 0, i32 1
  %8 = load i32, i32* %7, align 4
  %9 = call %class.IO* @_CIO2_Fout_int7_(%class.IO* %5, i32 %8)
  %10 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %11 = load %class.IO*, %class.IO** %10, align 8
  %12 = icmp eq %class.IO* %11, null
  br i1 %12, label %if.then.2, label %if.else.2

if.then.2:
  call void @print_dispatch_on_void_error(i32 19)
  call void @exit(i32 1)
  br label %if.end.2

if.else.2:
  br label %if.end.2

if.end.2:
  %13 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %11, i8* null)
  ret i32 0
}

; Class: C, Method: testObjectFunctions
define i32 @_CC1_FtestObjectFunctions19_(%class.C* %this) {

entry:
  %0 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %1 = load %class.IO*, %class.IO** %0, align 8
  %2 = icmp eq %class.IO* %1, null
  br i1 %2, label %if.then.3, label %if.else.3

if.then.3:
  call void @print_dispatch_on_void_error(i32 26)
  call void @exit(i32 1)
  br label %if.end.3

if.else.3:
  br label %if.end.3

if.end.3:
  %3 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %1, i8* null)
  %4 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %5 = load %class.IO*, %class.IO** %4, align 8
  %6 = icmp eq %class.IO* %5, null
  br i1 %6, label %if.then.4, label %if.else.4

if.then.4:
  call void @print_dispatch_on_void_error(i32 27)
  call void @exit(i32 1)
  br label %if.end.4

if.else.4:
  br label %if.end.4

if.end.4:
  %7 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %5, i8* null)
  %8 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 3
  %9 = load %class.Object*, %class.Object** %8, align 8
  %10 = icmp eq %class.Object* %9, null
  br i1 %10, label %if.then.5, label %if.else.5

if.then.5:
  call void @print_dispatch_on_void_error(i32 28)
  call void @exit(i32 1)
  br label %if.end.5

if.else.5:
  br label %if.end.5

if.end.5:
  %11 = call %class.Object* @_CObject6_Fabort5_(%class.Object* %9)
  %12 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %13 = load %class.IO*, %class.IO** %12, align 8
  %14 = icmp eq %class.IO* %13, null
  br i1 %14, label %if.then.6, label %if.else.6

if.then.6:
  call void @print_dispatch_on_void_error(i32 29)
  call void @exit(i32 1)
  br label %if.end.6

if.else.6:
  br label %if.end.6

if.end.6:
  %15 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %13, i8* null)
  ret i32 0
}

; Class: C, Method: testIOFunctions
define i32 @_CC1_FtestIOFunctions15_(%class.C* %this, i8* %s, i32 %c) {

entry:
  %s.addr = alloca i8*, align 8
  store i8* %s, i8** %s.addr, align 8
  %c.addr = alloca i32, align 8
  store i32 %c, i32* %c.addr, align 4
  %0 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %1 = load %class.IO*, %class.IO** %0, align 8
  %2 = icmp eq %class.IO* %1, null
  br i1 %2, label %if.then.7, label %if.else.7

if.then.7:
  call void @print_dispatch_on_void_error(i32 36)
  call void @exit(i32 1)
  br label %if.end.7

if.else.7:
  br label %if.end.7

if.end.7:
  %3 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %1, i8* null)
  %4 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %5 = load %class.IO*, %class.IO** %4, align 8
  %6 = icmp eq %class.IO* %5, null
  br i1 %6, label %if.then.8, label %if.else.8

if.then.8:
  call void @print_dispatch_on_void_error(i32 37)
  call void @exit(i32 1)
  br label %if.end.8

if.else.8:
  br label %if.end.8

if.end.8:
  %7 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %5, i8* null)
  %8 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %9 = load %class.IO*, %class.IO** %8, align 8
  %10 = icmp eq %class.IO* %9, null
  br i1 %10, label %if.then.9, label %if.else.9

if.then.9:
  call void @print_dispatch_on_void_error(i32 38)
  call void @exit(i32 1)
  br label %if.end.9

if.else.9:
  br label %if.end.9

if.end.9:
  %11 = load i8*, i8** %s.addr, align 8
  %12 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %9, i8* %11)
  %13 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %14 = load %class.IO*, %class.IO** %13, align 8
  %15 = icmp eq %class.IO* %14, null
  br i1 %15, label %if.then.10, label %if.else.10

if.then.10:
  call void @print_dispatch_on_void_error(i32 39)
  call void @exit(i32 1)
  br label %if.end.10

if.else.10:
  br label %if.end.10

if.end.10:
  %16 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %14, i8* null)
  %17 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %18 = load %class.IO*, %class.IO** %17, align 8
  %19 = icmp eq %class.IO* %18, null
  br i1 %19, label %if.then.11, label %if.else.11

if.then.11:
  call void @print_dispatch_on_void_error(i32 40)
  call void @exit(i32 1)
  br label %if.end.11

if.else.11:
  br label %if.end.11

if.end.11:
  %20 = load i32, i32* %c.addr, align 4
  %21 = call %class.IO* @_CIO2_Fout_int7_(%class.IO* %18, i32 %20)
  %22 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %23 = load %class.IO*, %class.IO** %22, align 8
  %24 = icmp eq %class.IO* %23, null
  br i1 %24, label %if.then.12, label %if.else.12

if.then.12:
  call void @print_dispatch_on_void_error(i32 41)
  call void @exit(i32 1)
  br label %if.end.12

if.else.12:
  br label %if.end.12

if.end.12:
  %25 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %23, i8* null)
  %26 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %27 = load %class.IO*, %class.IO** %26, align 8
  %28 = icmp eq %class.IO* %27, null
  br i1 %28, label %if.then.13, label %if.else.13

if.then.13:
  call void @print_dispatch_on_void_error(i32 42)
  call void @exit(i32 1)
  br label %if.end.13

if.else.13:
  br label %if.end.13

if.end.13:
  %29 = call i8* @_CIO2_Fin_string9_(%class.IO* %27)
  store i8* %29, i8** %s.addr, align 8
  %30 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %31 = load %class.IO*, %class.IO** %30, align 8
  %32 = icmp eq %class.IO* %31, null
  br i1 %32, label %if.then.14, label %if.else.14

if.then.14:
  call void @print_dispatch_on_void_error(i32 43)
  call void @exit(i32 1)
  br label %if.end.14

if.else.14:
  br label %if.end.14

if.end.14:
  %33 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %31, i8* null)
  %34 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %35 = load %class.IO*, %class.IO** %34, align 8
  %36 = icmp eq %class.IO* %35, null
  br i1 %36, label %if.then.15, label %if.else.15

if.then.15:
  call void @print_dispatch_on_void_error(i32 44)
  call void @exit(i32 1)
  br label %if.end.15

if.else.15:
  br label %if.end.15

if.end.15:
  %37 = load i8*, i8** %s.addr, align 8
  %38 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %35, i8* %37)
  %39 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %40 = load %class.IO*, %class.IO** %39, align 8
  %41 = icmp eq %class.IO* %40, null
  br i1 %41, label %if.then.16, label %if.else.16

if.then.16:
  call void @print_dispatch_on_void_error(i32 45)
  call void @exit(i32 1)
  br label %if.end.16

if.else.16:
  br label %if.end.16

if.end.16:
  %42 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %40, i8* null)
  %43 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %44 = load %class.IO*, %class.IO** %43, align 8
  %45 = icmp eq %class.IO* %44, null
  br i1 %45, label %if.then.17, label %if.else.17

if.then.17:
  call void @print_dispatch_on_void_error(i32 46)
  call void @exit(i32 1)
  br label %if.end.17

if.else.17:
  br label %if.end.17

if.end.17:
  %46 = call i32 @_CIO2_Fin_int6_(%class.IO* %44)
  store i32 %46, i32* %c.addr, align 4
  %47 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %48 = load %class.IO*, %class.IO** %47, align 8
  %49 = icmp eq %class.IO* %48, null
  br i1 %49, label %if.then.18, label %if.else.18

if.then.18:
  call void @print_dispatch_on_void_error(i32 47)
  call void @exit(i32 1)
  br label %if.end.18

if.else.18:
  br label %if.end.18

if.end.18:
  %50 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %48, i8* null)
  %51 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %52 = load %class.IO*, %class.IO** %51, align 8
  %53 = icmp eq %class.IO* %52, null
  br i1 %53, label %if.then.19, label %if.else.19

if.then.19:
  call void @print_dispatch_on_void_error(i32 48)
  call void @exit(i32 1)
  br label %if.end.19

if.else.19:
  br label %if.end.19

if.end.19:
  %54 = load i32, i32* %c.addr, align 4
  %55 = call %class.IO* @_CIO2_Fout_int7_(%class.IO* %52, i32 %54)
  %56 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %57 = load %class.IO*, %class.IO** %56, align 8
  %58 = icmp eq %class.IO* %57, null
  br i1 %58, label %if.then.20, label %if.else.20

if.then.20:
  call void @print_dispatch_on_void_error(i32 49)
  call void @exit(i32 1)
  br label %if.end.20

if.else.20:
  br label %if.end.20

if.end.20:
  %59 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %57, i8* null)
  ret i32 0
}

; Class: C, Method: testStringFunctions
define i32 @_CC1_FtestStringFunctions19_(%class.C* %this, i8* %s1, i8* %s2, i32 %x, i32 %l) {

entry:
  %s1.addr = alloca i8*, align 8
  store i8* %s1, i8** %s1.addr, align 8
  %s2.addr = alloca i8*, align 8
  store i8* %s2, i8** %s2.addr, align 8
  %x.addr = alloca i32, align 8
  store i32 %x, i32* %x.addr, align 4
  %l.addr = alloca i32, align 8
  store i32 %l, i32* %l.addr, align 4
  %0 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %1 = load %class.IO*, %class.IO** %0, align 8
  %2 = icmp eq %class.IO* %1, null
  br i1 %2, label %if.then.21, label %if.else.21

if.then.21:
  call void @print_dispatch_on_void_error(i32 56)
  call void @exit(i32 1)
  br label %if.end.21

if.else.21:
  br label %if.end.21

if.end.21:
  %3 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %1, i8* null)
  %4 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %5 = load %class.IO*, %class.IO** %4, align 8
  %6 = icmp eq %class.IO* %5, null
  br i1 %6, label %if.then.22, label %if.else.22

if.then.22:
  call void @print_dispatch_on_void_error(i32 57)
  call void @exit(i32 1)
  br label %if.end.22

if.else.22:
  br label %if.end.22

if.end.22:
  %7 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %5, i8* null)
  %8 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %9 = load %class.IO*, %class.IO** %8, align 8
  %10 = icmp eq %class.IO* %9, null
  br i1 %10, label %if.then.23, label %if.else.23

if.then.23:
  call void @print_dispatch_on_void_error(i32 58)
  call void @exit(i32 1)
  br label %if.end.23

if.else.23:
  br label %if.end.23

if.end.23:
  %11 = load i8*, i8** %s1.addr, align 8
  %12 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %9, i8* %11)
  %13 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %14 = load %class.IO*, %class.IO** %13, align 8
  %15 = icmp eq %class.IO* %14, null
  br i1 %15, label %if.then.24, label %if.else.24

if.then.24:
  call void @print_dispatch_on_void_error(i32 59)
  call void @exit(i32 1)
  br label %if.end.24

if.else.24:
  br label %if.end.24

if.end.24:
  %16 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %14, i8* null)
  %17 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %18 = load %class.IO*, %class.IO** %17, align 8
  %19 = icmp eq %class.IO* %18, null
  br i1 %19, label %if.then.25, label %if.else.25

if.then.25:
  call void @print_dispatch_on_void_error(i32 60)
  call void @exit(i32 1)
  br label %if.end.25

if.else.25:
  br label %if.end.25

if.end.25:
  %20 = load i8*, i8** %s2.addr, align 8
  %21 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %18, i8* %20)
  %22 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %23 = load %class.IO*, %class.IO** %22, align 8
  %24 = icmp eq %class.IO* %23, null
  br i1 %24, label %if.then.26, label %if.else.26

if.then.26:
  call void @print_dispatch_on_void_error(i32 61)
  call void @exit(i32 1)
  br label %if.end.26

if.else.26:
  br label %if.end.26

if.end.26:
  %25 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %23, i8* null)
  %26 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %27 = load %class.IO*, %class.IO** %26, align 8
  %28 = icmp eq %class.IO* %27, null
  br i1 %28, label %if.then.27, label %if.else.27

if.then.27:
  call void @print_dispatch_on_void_error(i32 62)
  call void @exit(i32 1)
  br label %if.end.27

if.else.27:
  br label %if.end.27

if.end.27:
  %29 = load i32, i32* %x.addr, align 4
  %30 = call %class.IO* @_CIO2_Fout_int7_(%class.IO* %27, i32 %29)
  %31 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %32 = load %class.IO*, %class.IO** %31, align 8
  %33 = icmp eq %class.IO* %32, null
  br i1 %33, label %if.then.28, label %if.else.28

if.then.28:
  call void @print_dispatch_on_void_error(i32 63)
  call void @exit(i32 1)
  br label %if.end.28

if.else.28:
  br label %if.end.28

if.end.28:
  %34 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %32, i8* null)
  %35 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %36 = load %class.IO*, %class.IO** %35, align 8
  %37 = icmp eq %class.IO* %36, null
  br i1 %37, label %if.then.29, label %if.else.29

if.then.29:
  call void @print_dispatch_on_void_error(i32 64)
  call void @exit(i32 1)
  br label %if.end.29

if.else.29:
  br label %if.end.29

if.end.29:
  %38 = load i32, i32* %l.addr, align 4
  %39 = call %class.IO* @_CIO2_Fout_int7_(%class.IO* %36, i32 %38)
  %40 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %41 = load %class.IO*, %class.IO** %40, align 8
  %42 = icmp eq %class.IO* %41, null
  br i1 %42, label %if.then.30, label %if.else.30

if.then.30:
  call void @print_dispatch_on_void_error(i32 65)
  call void @exit(i32 1)
  br label %if.end.30

if.else.30:
  br label %if.end.30

if.end.30:
  %43 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %41, i8* null)
  %44 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %45 = load %class.IO*, %class.IO** %44, align 8
  %46 = icmp eq %class.IO* %45, null
  br i1 %46, label %if.then.31, label %if.else.31

if.then.31:
  call void @print_dispatch_on_void_error(i32 66)
  call void @exit(i32 1)
  br label %if.end.31

if.else.31:
  br label %if.end.31

if.end.31:
  %47 = load i8*, i8** %s1.addr, align 8
  %48 = call i64 @strlen(i8* %47)
  %49 = trunc i64 %48 to i32
  %50 = call %class.IO* @_CIO2_Fout_int7_(%class.IO* %45, i32 %49)
  %51 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %52 = load %class.IO*, %class.IO** %51, align 8
  %53 = icmp eq %class.IO* %52, null
  br i1 %53, label %if.then.32, label %if.else.32

if.then.32:
  call void @print_dispatch_on_void_error(i32 67)
  call void @exit(i32 1)
  br label %if.end.32

if.else.32:
  br label %if.end.32

if.end.32:
  %54 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %52, i8* null)
  %55 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %56 = load %class.IO*, %class.IO** %55, align 8
  %57 = icmp eq %class.IO* %56, null
  br i1 %57, label %if.then.33, label %if.else.33

if.then.33:
  call void @print_dispatch_on_void_error(i32 68)
  call void @exit(i32 1)
  br label %if.end.33

if.else.33:
  br label %if.end.33

if.end.33:
  %58 = call i64 @strlen(i8* null)
  %59 = trunc i64 %58 to i32
  %60 = call %class.IO* @_CIO2_Fout_int7_(%class.IO* %56, i32 %59)
  %61 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %62 = load %class.IO*, %class.IO** %61, align 8
  %63 = icmp eq %class.IO* %62, null
  br i1 %63, label %if.then.34, label %if.else.34

if.then.34:
  call void @print_dispatch_on_void_error(i32 69)
  call void @exit(i32 1)
  br label %if.end.34

if.else.34:
  br label %if.end.34

if.end.34:
  %64 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %62, i8* null)
  %65 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %66 = load %class.IO*, %class.IO** %65, align 8
  %67 = icmp eq %class.IO* %66, null
  br i1 %67, label %if.then.35, label %if.else.35

if.then.35:
  call void @print_dispatch_on_void_error(i32 70)
  call void @exit(i32 1)
  br label %if.end.35

if.else.35:
  br label %if.end.35

if.end.35:
  %68 = load i8*, i8** %s1.addr, align 8
  %69 = load i8*, i8** %s2.addr, align 8
  %70 = call i8* @_CString6_Fconcat6_(i8* %68, i8* %69)
  %71 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %66, i8* %70)
  %72 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %73 = load %class.IO*, %class.IO** %72, align 8
  %74 = icmp eq %class.IO* %73, null
  br i1 %74, label %if.then.36, label %if.else.36

if.then.36:
  call void @print_dispatch_on_void_error(i32 71)
  call void @exit(i32 1)
  br label %if.end.36

if.else.36:
  br label %if.end.36

if.end.36:
  %75 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %73, i8* null)
  %76 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %77 = load %class.IO*, %class.IO** %76, align 8
  %78 = icmp eq %class.IO* %77, null
  br i1 %78, label %if.then.37, label %if.else.37

if.then.37:
  call void @print_dispatch_on_void_error(i32 72)
  call void @exit(i32 1)
  br label %if.end.37

if.else.37:
  br label %if.end.37

if.end.37:
  %79 = load i8*, i8** %s2.addr, align 8
  %80 = call i8* @_CString6_Fconcat6_(i8* null, i8* %79)
  %81 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %77, i8* %80)
  %82 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %83 = load %class.IO*, %class.IO** %82, align 8
  %84 = icmp eq %class.IO* %83, null
  br i1 %84, label %if.then.38, label %if.else.38

if.then.38:
  call void @print_dispatch_on_void_error(i32 73)
  call void @exit(i32 1)
  br label %if.end.38

if.else.38:
  br label %if.end.38

if.end.38:
  %85 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %83, i8* null)
  %86 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %87 = load %class.IO*, %class.IO** %86, align 8
  %88 = icmp eq %class.IO* %87, null
  br i1 %88, label %if.then.39, label %if.else.39

if.then.39:
  call void @print_dispatch_on_void_error(i32 74)
  call void @exit(i32 1)
  br label %if.end.39

if.else.39:
  br label %if.end.39

if.end.39:
  %89 = load i8*, i8** %s1.addr, align 8
  %90 = load i32, i32* %x.addr, align 4
  %91 = load i32, i32* %l.addr, align 4
  %92 = call i8* @_CString6_Fsubstr6_(i8* %89, i32 %90, i32 %91)
  %93 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %87, i8* %92)
  %94 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 2
  %95 = load %class.IO*, %class.IO** %94, align 8
  %96 = icmp eq %class.IO* %95, null
  br i1 %96, label %if.then.40, label %if.else.40

if.then.40:
  call void @print_dispatch_on_void_error(i32 75)
  call void @exit(i32 1)
  br label %if.end.40

if.else.40:
  br label %if.end.40

if.end.40:
  %97 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %95, i8* null)
  ret i32 0
}

; Class: Main, Method: main
define i32 @_CMain4_Fmain4_(%class.Main* %this) {

entry:
  %0 = getelementptr inbounds %class.Main, %class.Main* %this,  i32 0, i32 1
  %1 = load %class.C*, %class.C** %0, align 8
  %2 = icmp eq %class.C* %1, null
  br i1 %2, label %if.then.41, label %if.else.41

if.then.41:
  call void @print_dispatch_on_void_error(i32 86)
  call void @exit(i32 1)
  br label %if.end.41

if.else.41:
  br label %if.end.41

if.end.41:
  %3 = call i32 @_CC1_FuseInheritedAttributes22_(%class.C* %1)
  %4 = getelementptr inbounds %class.Main, %class.Main* %this,  i32 0, i32 1
  %5 = load %class.C*, %class.C** %4, align 8
  %6 = icmp eq %class.C* %5, null
  br i1 %6, label %if.then.42, label %if.else.42

if.then.42:
  call void @print_dispatch_on_void_error(i32 87)
  call void @exit(i32 1)
  br label %if.end.42

if.else.42:
  br label %if.end.42

if.end.42:
  %7 = call i32 @_CC1_FtestIOFunctions15_(%class.C* %5, i8* null, i32 6)
  %8 = getelementptr inbounds %class.Main, %class.Main* %this,  i32 0, i32 1
  %9 = load %class.C*, %class.C** %8, align 8
  %10 = icmp eq %class.C* %9, null
  br i1 %10, label %if.then.43, label %if.else.43

if.then.43:
  call void @print_dispatch_on_void_error(i32 88)
  call void @exit(i32 1)
  br label %if.end.43

if.else.43:
  br label %if.end.43

if.end.43:
  %11 = call i32 @_CC1_FtestStringFunctions19_(%class.C* %9, i8* null, i8* null, i32 2, i32 3)
  %12 = getelementptr inbounds %class.Main, %class.Main* %this,  i32 0, i32 1
  %13 = load %class.C*, %class.C** %12, align 8
  %14 = icmp eq %class.C* %13, null
  br i1 %14, label %if.then.44, label %if.else.44

if.then.44:
  call void @print_dispatch_on_void_error(i32 89)
  call void @exit(i32 1)
  br label %if.end.44

if.else.44:
  br label %if.end.44

if.end.44:
  %15 = call i32 @_CC1_FtestObjectFunctions19_(%class.C* %13)
  ret i32 0
}

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

; Constructor of class 'A'
define void @_CA1_FA1_(%class.A* %this) {

entry:
  %0 = bitcast %class.A* %this to %class.Object*
  call void @_CObject6_FObject6_(%class.Object* %0)
  %1 = getelementptr inbounds %class.A, %class.A* %this,  i32 0, i32 1
  store i32 1, i32* %1, align 4
  ret void
}

; Constructor of class 'B'
define void @_CB1_FB1_(%class.B* %this) {

entry:
  %0 = bitcast %class.B* %this to %class.A*
  call void @_CA1_FA1_(%class.A* %0)
  %1 = getelementptr inbounds %class.B, %class.B* %this,  i32 0, i32 1
  store i32 0, i32* %1, align 4
  ret void
}

; Constructor of class 'C'
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
  %5 = bitcast %class.IO* %4 to %class.Object*
  %6 = getelementptr inbounds %class.Object, %class.Object* %5, i32 0, i32 0
  %7 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.14, i32 0, i32 0
  store i8* %7, i8** %6, align 8
  store %class.IO* %4, %class.IO** %2, align 4
  %8 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 3
  %9 = call noalias i8* @malloc(i64 0)
  %10 = bitcast i8* %9 to %class.Object*
  call void @_CObject6_FObject6_(%class.Object* %10)
  %11 = getelementptr inbounds %class.Object, %class.Object* %10, i32 0, i32 0
  %12 = getelementptr inbounds [7 x i8], [7 x i8]* @.str.13, i32 0, i32 0
  store i8* %12, i8** %11, align 8
  store %class.Object* %10, %class.Object** %8, align 4
  %13 = getelementptr inbounds %class.C, %class.C* %this,  i32 0, i32 4
  %14 = getelementptr inbounds [1 x i8], [1 x i8]* @.str.5, i32 0, i32 0
  store i8* %14, i8** %13, align 8
  ret void
}

; Constructor of class 'Main'
define void @_CMain4_FMain4_(%class.Main* %this) {

entry:
  %0 = bitcast %class.Main* %this to %class.Object*
  call void @_CObject6_FObject6_(%class.Object* %0)
  %1 = getelementptr inbounds %class.Main, %class.Main* %this,  i32 0, i32 1
  %2 = call noalias i8* @malloc(i64 60)
  %3 = bitcast i8* %2 to %class.C*
  call void @_CC1_FC1_(%class.C* %3)
  %4 = bitcast %class.C* %3 to %class.Object*
  %5 = getelementptr inbounds %class.Object, %class.Object* %4, i32 0, i32 0
  %6 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.2, i32 0, i32 0
  store i8* %6, i8** %5, align 8
  store %class.C* %3, %class.C** %1, align 4
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
  %2 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.8, i32 0, i32 0
  %3 = getelementptr inbounds [33 x i8], [33 x i8]* @.str.12, i32 0, i32 0
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
  %0 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.6, i32 0, i32 0
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
  %1 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.6, i32 0, i32 0
  %call = call i32 (i8*, ...) @scanf(i8* %1, i32* %0)
  %2 = load i32, i32* %0, align 4
  ret i32 %2
}

; Class: IO, Method: out_string
define %class.IO* @_CIO2_Fout_string10_(%class.IO* %this, i8* %s) {
entry:
  %0 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.8, i32 0, i32 0
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
  %2 = getelementptr inbounds [10 x i8], [10 x i8]* @.str.9, i32 0, i32 0
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

define i32 @main() {
entry:
 %main = alloca %class.Main, align 8
 call void @_CMain4_FMain4_(%class.Main* %main)
 %retval = call i32 @_CMain4_Fmain4_(%class.Main* %main)
 ret i32 %retval
}

define void @print_dispatch_on_void_error(i32 %lineNo) {
entry:
  %0 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.8, i32 0, i32 0
  %1 = getelementptr inbounds [32 x i8], [32 x i8]* @.str.11, i32 0, i32 0
 %2 = call i32 (i8*, ...) @printf(i8* %0, i8* %1)
  %3 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.6, i32 0, i32 0
 %4 = call i32 (i8*, ...) @printf(i8* %3, i32 %lineNo)
  %5 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.4, i32 0, i32 0
 %6 = call i32 (i8*, ...) @printf(i8* %0, i8* %5)
 ret void
}

define void @print_div_by_zero_err_msg(i32 %lineNo) {
entry:
  %0 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.8, i32 0, i32 0
  %1 = getelementptr inbounds [42 x i8], [42 x i8]* @.str.10, i32 0, i32 0
 %2 = call i32 (i8*, ...) @printf(i8* %0, i8* %1)
  %3 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.6, i32 0, i32 0
 %4 = call i32 (i8*, ...) @printf(i8* %3, i32 %lineNo)
  %5 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.4, i32 0, i32 0
 %6 = call i32 (i8*, ...) @printf(i8* %0, i8* %5)
 ret void
}
