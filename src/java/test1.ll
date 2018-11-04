; ModuleID = 'omisbest'
source_filename = "omisbest"

; String constant declarations
@.str.32 = private unnamed_addr constant [1 x i8] c"\00", align 1
@.str.3 = private unnamed_addr constant [8 x i8] c"
Sum : \00", align 1
@.str.25 = private unnamed_addr constant [5 x i8] c"n = \00", align 1
@.str.26 = private unnamed_addr constant [2 x i8] c"
\00", align 1
@.str.34 = private unnamed_addr constant [4 x i8] c"%d
\00", align 1
@.str.42 = private unnamed_addr constant [7 x i8] c"String\00", align 1
@.str.6 = private unnamed_addr constant [13 x i8] c"
Quotient : \00", align 1
@.str.15 = private unnamed_addr constant [20 x i8] c"Bool value is true
\00", align 1
@.str.19 = private unnamed_addr constant [12 x i8] c"Completed

\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Operands are : \00", align 1
@.str.8 = private unnamed_addr constant [31 x i8] c"
Comparing these operands now
\00", align 1
@.str.43 = private unnamed_addr constant [4 x i8] c"Int\00", align 1
@.str.13 = private unnamed_addr constant [16 x i8] c"Both are equal
\00", align 1
@.str.44 = private unnamed_addr constant [5 x i8] c"Bool\00", align 1
@.str.14 = private unnamed_addr constant [20 x i8] c"Both are not equal
\00", align 1
@.str.20 = private unnamed_addr constant [58 x i8] c"Testing if-else by finding the smallest of three numbers
\00", align 1
@.str.38 = private unnamed_addr constant [32 x i8] c"VOID Dispatach Found at line - \00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"
Difference : \00", align 1
@.str.10 = private unnamed_addr constant [26 x i8] c"First is lesser or equal
\00", align 1
@.str.22 = private unnamed_addr constant [31 x i8] c"
The smallest among them is : \00", align 1
@.str.0 = private unnamed_addr constant [38 x i8] c"Testing binary arithmetic operations
\00", align 1
@.str.18 = private unnamed_addr constant [26 x i8] c"It's complement is false
\00", align 1
@.str.16 = private unnamed_addr constant [21 x i8] c"Bool value is false
\00", align 1
@.str.17 = private unnamed_addr constant [25 x i8] c"It's complement is true
\00", align 1
@.str.5 = private unnamed_addr constant [12 x i8] c"
Product : \00", align 1
@.str.28 = private unnamed_addr constant [24 x i8] c"Value returned is void
\00", align 1
@.str.11 = private unnamed_addr constant [27 x i8] c"First is greater or equal
\00", align 1
@.str.33 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c" \00", align 1
@.str.24 = private unnamed_addr constant [41 x i8] c"Loop Test 1 : Print numbers from 1 to n
\00", align 1
@.str.21 = private unnamed_addr constant [20 x i8] c"The numbers are : 
\00", align 1
@.str.30 = private unnamed_addr constant [70 x i8] c"Loop Test 2 : Print a right angled triangle using * given the size n
\00", align 1
@.str.12 = private unnamed_addr constant [18 x i8] c"First is greater
\00", align 1
@.str.41 = private unnamed_addr constant [3 x i8] c"IO\00", align 1
@.str.7 = private unnamed_addr constant [22 x i8] c"
Negation of first : \00", align 1
@.str.31 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@.str.27 = private unnamed_addr constant [34 x i8] c"
Checking value returned by loop
\00", align 1
@.str.35 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.29 = private unnamed_addr constant [28 x i8] c"Value returned is not void
\00", align 1
@.str.9 = private unnamed_addr constant [13 x i8] c"Less than : \00", align 1
@.str.23 = private unnamed_addr constant [13 x i8] c"
Completed

\00", align 1
@.str.39 = private unnamed_addr constant [33 x i8] c"ABORT Message called from class \00", align 1
@.str.40 = private unnamed_addr constant [7 x i8] c"Object\00", align 1
@.str.36 = private unnamed_addr constant [10 x i8] c"%1024[^
]\00", align 1
@.str.37 = private unnamed_addr constant [42 x i8] c"Exception Divide By Zero Found at line - \00", align 1

; Class Declarations
%class.Object = type {i8*}
%class.IO = type { %class.Object }
%class.SimpleExprTests = type { %class.IO, i32, i8, %class.Object*, i32, %class.Object* }
%class.Main = type { %class.Object, %class.SimpleExprTests* }


; Class: SimpleExprTests, Method: binOpTest
define i32 @_CSimpleExprTests15_FbinOpTest9_(%class.SimpleExprTests* %this, i32 %x, i32 %y) {

entry:
  %x.addr = alloca i32, align 8
  store i32 %x, i32* %x.addr, align 4
  %y.addr = alloca i32, align 8
  store i32 %y, i32* %y.addr, align 4
  br label %method.body

static.void:
  call void @print_dispatch_on_void_error()
  br label %method.body

division.0:
  call void @print_div_by_zero_err_msg()
  br label %method.body

method.body:
  %0 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %0, label %static.void, label %branch.normal

branch.normal:
  %1 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %2 = getelementptr inbounds [38 x i8], [38 x i8]* @.str.0, i32 0, i32 0
  %3 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %1, i8* %2)
  %4 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %4, label %static.void, label %branch.normal.1

branch.normal.1:
  %5 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %6 = getelementptr inbounds [16 x i8], [16 x i8]* @.str.1, i32 0, i32 0
  %7 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %5, i8* %6)
  %8 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %8, label %static.void, label %branch.normal.2

branch.normal.2:
  %9 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %10 = load i32, i32* %x.addr, align 4
  %11 = call %class.IO* @_CIO2_Fout_int7_(%class.IO* %9, i32 %10)
  %12 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %12, label %static.void, label %branch.normal.3

branch.normal.3:
  %13 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %14 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.2, i32 0, i32 0
  %15 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %13, i8* %14)
  %16 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %16, label %static.void, label %branch.normal.4

branch.normal.4:
  %17 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %18 = load i32, i32* %y.addr, align 4
  %19 = call %class.IO* @_CIO2_Fout_int7_(%class.IO* %17, i32 %18)
  %20 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %20, label %static.void, label %branch.normal.5

branch.normal.5:
  %21 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %22 = getelementptr inbounds [8 x i8], [8 x i8]* @.str.3, i32 0, i32 0
  %23 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %21, i8* %22)
  %24 = load i32, i32* %x.addr, align 4
  %25 = load i32, i32* %y.addr, align 4
  %26 = add nsw i32 %24, %25
  %27 = getelementptr inbounds %class.SimpleExprTests, %class.SimpleExprTests* %this,  i32 0, i32 1
  store i32 %26, i32* %27, align 4
  %28 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %28, label %static.void, label %branch.normal.6

branch.normal.6:
  %29 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %30 = getelementptr inbounds %class.SimpleExprTests, %class.SimpleExprTests* %this,  i32 0, i32 1
  %31 = load i32, i32* %30, align 4
  %32 = call %class.IO* @_CIO2_Fout_int7_(%class.IO* %29, i32 %31)
  %33 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %33, label %static.void, label %branch.normal.7

branch.normal.7:
  %34 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %35 = getelementptr inbounds [15 x i8], [15 x i8]* @.str.4, i32 0, i32 0
  %36 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %34, i8* %35)
  %37 = load i32, i32* %x.addr, align 4
  %38 = load i32, i32* %y.addr, align 4
  %39 = sub nsw i32 %37, %38
  %40 = getelementptr inbounds %class.SimpleExprTests, %class.SimpleExprTests* %this,  i32 0, i32 1
  store i32 %39, i32* %40, align 4
  %41 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %41, label %static.void, label %branch.normal.8

branch.normal.8:
  %42 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %43 = getelementptr inbounds %class.SimpleExprTests, %class.SimpleExprTests* %this,  i32 0, i32 1
  %44 = load i32, i32* %43, align 4
  %45 = call %class.IO* @_CIO2_Fout_int7_(%class.IO* %42, i32 %44)
  %46 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %46, label %static.void, label %branch.normal.9

branch.normal.9:
  %47 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %48 = getelementptr inbounds [12 x i8], [12 x i8]* @.str.5, i32 0, i32 0
  %49 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %47, i8* %48)
  %50 = load i32, i32* %x.addr, align 4
  %51 = load i32, i32* %y.addr, align 4
  %52 = mul nsw i32 %50, %51
  %53 = getelementptr inbounds %class.SimpleExprTests, %class.SimpleExprTests* %this,  i32 0, i32 1
  store i32 %52, i32* %53, align 4
  %54 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %54, label %static.void, label %branch.normal.10

branch.normal.10:
  %55 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %56 = getelementptr inbounds %class.SimpleExprTests, %class.SimpleExprTests* %this,  i32 0, i32 1
  %57 = load i32, i32* %56, align 4
  %58 = call %class.IO* @_CIO2_Fout_int7_(%class.IO* %55, i32 %57)
  %59 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %59, label %static.void, label %branch.normal.11

branch.normal.11:
  %60 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %61 = getelementptr inbounds [13 x i8], [13 x i8]* @.str.6, i32 0, i32 0
  %62 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %60, i8* %61)
  %63 = load i32, i32* %x.addr, align 4
  %64 = load i32, i32* %y.addr, align 4
  %65 = icmp eq i32 %64, 0
  br i1 %65, label %division.0, label %branch.normal.12

branch.normal.12:
  %66 = sdiv i32 %63, %64
  %67 = getelementptr inbounds %class.SimpleExprTests, %class.SimpleExprTests* %this,  i32 0, i32 1
  store i32 %66, i32* %67, align 4
  %68 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %68, label %static.void, label %branch.normal.13

branch.normal.13:
  %69 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %70 = getelementptr inbounds %class.SimpleExprTests, %class.SimpleExprTests* %this,  i32 0, i32 1
  %71 = load i32, i32* %70, align 4
  %72 = call %class.IO* @_CIO2_Fout_int7_(%class.IO* %69, i32 %71)
  %73 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %73, label %static.void, label %branch.normal.14

branch.normal.14:
  %74 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %75 = getelementptr inbounds [22 x i8], [22 x i8]* @.str.7, i32 0, i32 0
  %76 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %74, i8* %75)
  %77 = load i32, i32* %x.addr, align 4
  %78 = sub nsw i32 0, %77
  %79 = getelementptr inbounds %class.SimpleExprTests, %class.SimpleExprTests* %this,  i32 0, i32 1
  store i32 %78, i32* %79, align 4
  %80 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %80, label %static.void, label %branch.normal.15

branch.normal.15:
  %81 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %82 = getelementptr inbounds %class.SimpleExprTests, %class.SimpleExprTests* %this,  i32 0, i32 1
  %83 = load i32, i32* %82, align 4
  %84 = call %class.IO* @_CIO2_Fout_int7_(%class.IO* %81, i32 %83)
  %85 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %85, label %static.void, label %branch.normal.16

branch.normal.16:
  %86 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %87 = getelementptr inbounds [31 x i8], [31 x i8]* @.str.8, i32 0, i32 0
  %88 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %86, i8* %87)
  %89 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %89, label %static.void, label %branch.normal.17

branch.normal.17:
  %90 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %91 = getelementptr inbounds [13 x i8], [13 x i8]* @.str.9, i32 0, i32 0
  %92 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %90, i8* %91)
  %93 = alloca i32, align 8
  %94 = load i32, i32* %x.addr, align 4
  %95 = load i32, i32* %y.addr, align 4
  %96 = icmp slt i32 %94, %95
  %97 = zext i1 %96 to i8
  %98 = trunc i8 %97 to i1
  br i1 %98, label %cond.true, label %cond.false

cond.true:
  %99 = load i32, i32* %x.addr, align 4
  store i32 %99, i32* %93, align 4
  br label %branch.normal.18

cond.false:
  %100 = load i32, i32* %y.addr, align 4
  store i32 %100, i32* %93, align 4
  br label %branch.normal.18

branch.normal.18:
  %101 = load i32, i32* %93, align 4
  %102 = getelementptr inbounds %class.SimpleExprTests, %class.SimpleExprTests* %this,  i32 0, i32 1
  store i32 %101, i32* %102, align 4
  %103 = alloca %class.IO, align 8
  %104 = getelementptr inbounds %class.SimpleExprTests, %class.SimpleExprTests* %this,  i32 0, i32 1
  %105 = load i32, i32* %104, align 4
  %106 = load i32, i32* %x.addr, align 4
  %107 = icmp slt i32 %105, %106
  %108 = zext i1 %107 to i8
  %109 = trunc i8 %108 to i1
  br i1 %109, label %cond.true.1, label %cond.false.1

cond.true.1:
  %110 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %110, label %static.void, label %branch.normal.20

branch.normal.20:
  %111 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %112 = getelementptr inbounds [26 x i8], [26 x i8]* @.str.10, i32 0, i32 0
  %113 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %111, i8* %112)
  %114 = load %class.IO, %class.IO* %113, align 4
  store %class.IO %114, %class.IO* %103, align 4
  br label %branch.normal.19

cond.false.1:
  %115 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %115, label %static.void, label %branch.normal.21

branch.normal.21:
  %116 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %117 = getelementptr inbounds [27 x i8], [27 x i8]* @.str.11, i32 0, i32 0
  %118 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %116, i8* %117)
  %119 = load %class.IO, %class.IO* %118, align 4
  store %class.IO %119, %class.IO* %103, align 4
  br label %branch.normal.19

branch.normal.19:
  %120 = alloca %class.IO, align 8
  %121 = load i32, i32* %x.addr, align 4
  %122 = load i32, i32* %y.addr, align 4
  %123 = icmp slt i32 %121, %122
  %124 = zext i1 %123 to i8
  %125 = trunc i8 %124 to i1
  br i1 %125, label %cond.true.2, label %cond.false.2

cond.true.2:
  %126 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %126, label %static.void, label %branch.normal.23

branch.normal.23:
  %127 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %128 = getelementptr inbounds [26 x i8], [26 x i8]* @.str.10, i32 0, i32 0
  %129 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %127, i8* %128)
  %130 = load %class.IO, %class.IO* %129, align 4
  store %class.IO %130, %class.IO* %120, align 4
  br label %branch.normal.22

cond.false.2:
  %131 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %131, label %static.void, label %branch.normal.24

branch.normal.24:
  %132 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %133 = getelementptr inbounds [18 x i8], [18 x i8]* @.str.12, i32 0, i32 0
  %134 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %132, i8* %133)
  %135 = load %class.IO, %class.IO* %134, align 4
  store %class.IO %135, %class.IO* %120, align 4
  br label %branch.normal.22

branch.normal.22:
  %136 = alloca %class.IO, align 8
  %137 = load i32, i32* %x.addr, align 4
  %138 = load i32, i32* %y.addr, align 4
  %139 = icmp slt i32 %137, %138
  %140 = zext i1 %139 to i8
  %141 = trunc i8 %140 to i1
  br i1 %141, label %cond.true.3, label %cond.false.3

cond.true.3:
  %142 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %142, label %static.void, label %branch.normal.26

branch.normal.26:
  %143 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %144 = getelementptr inbounds [16 x i8], [16 x i8]* @.str.13, i32 0, i32 0
  %145 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %143, i8* %144)
  %146 = load %class.IO, %class.IO* %145, align 4
  store %class.IO %146, %class.IO* %136, align 4
  br label %branch.normal.25

cond.false.3:
  %147 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %147, label %static.void, label %branch.normal.27

branch.normal.27:
  %148 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %149 = getelementptr inbounds [20 x i8], [20 x i8]* @.str.14, i32 0, i32 0
  %150 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %148, i8* %149)
  %151 = load %class.IO, %class.IO* %150, align 4
  store %class.IO %151, %class.IO* %136, align 4
  br label %branch.normal.25

branch.normal.25:
  %152 = getelementptr inbounds %class.SimpleExprTests, %class.SimpleExprTests* %this,  i32 0, i32 2
  store i8 1, i8* %152, align 4
  %153 = alloca %class.IO, align 8
  %154 = getelementptr inbounds %class.SimpleExprTests, %class.SimpleExprTests* %this,  i32 0, i32 2
  %155 = load i8, i8* %154, align 4
  %156 = trunc i8 %155 to i1
  br i1 %156, label %cond.true.4, label %cond.false.4

cond.true.4:
  %157 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %157, label %static.void, label %branch.normal.29

branch.normal.29:
  %158 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %159 = getelementptr inbounds [20 x i8], [20 x i8]* @.str.15, i32 0, i32 0
  %160 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %158, i8* %159)
  %161 = load %class.IO, %class.IO* %160, align 4
  store %class.IO %161, %class.IO* %153, align 4
  br label %branch.normal.28

cond.false.4:
  %162 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %162, label %static.void, label %branch.normal.30

branch.normal.30:
  %163 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %164 = getelementptr inbounds [21 x i8], [21 x i8]* @.str.16, i32 0, i32 0
  %165 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %163, i8* %164)
  %166 = load %class.IO, %class.IO* %165, align 4
  store %class.IO %166, %class.IO* %153, align 4
  br label %branch.normal.28

branch.normal.28:
  %167 = alloca %class.IO, align 8
  %168 = getelementptr inbounds %class.SimpleExprTests, %class.SimpleExprTests* %this,  i32 0, i32 2
  %169 = load i8, i8* %168, align 4
  %170 = xor i8 %169, 1
  %171 = trunc i8 %170 to i1
  br i1 %171, label %cond.true.5, label %cond.false.5

cond.true.5:
  %172 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %172, label %static.void, label %branch.normal.32

branch.normal.32:
  %173 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %174 = getelementptr inbounds [25 x i8], [25 x i8]* @.str.17, i32 0, i32 0
  %175 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %173, i8* %174)
  %176 = load %class.IO, %class.IO* %175, align 4
  store %class.IO %176, %class.IO* %167, align 4
  br label %branch.normal.31

cond.false.5:
  %177 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %177, label %static.void, label %branch.normal.33

branch.normal.33:
  %178 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %179 = getelementptr inbounds [26 x i8], [26 x i8]* @.str.18, i32 0, i32 0
  %180 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %178, i8* %179)
  %181 = load %class.IO, %class.IO* %180, align 4
  store %class.IO %181, %class.IO* %167, align 4
  br label %branch.normal.31

branch.normal.31:
  %182 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %182, label %static.void, label %branch.normal.34

branch.normal.34:
  %183 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %184 = getelementptr inbounds [12 x i8], [12 x i8]* @.str.19, i32 0, i32 0
  %185 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %183, i8* %184)
  ret i32 0
}

; Class: SimpleExprTests, Method: ifElseTest
define i32 @_CSimpleExprTests15_FifElseTest10_(%class.SimpleExprTests* %this, i32 %x, i32 %y, i32 %z) {

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
  %0 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %0, label %static.void, label %branch.normal.35

branch.normal.35:
  %1 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %2 = getelementptr inbounds [58 x i8], [58 x i8]* @.str.20, i32 0, i32 0
  %3 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %1, i8* %2)
  %4 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %4, label %static.void, label %branch.normal.36

branch.normal.36:
  %5 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %6 = getelementptr inbounds [20 x i8], [20 x i8]* @.str.21, i32 0, i32 0
  %7 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %5, i8* %6)
  %8 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %8, label %static.void, label %branch.normal.37

branch.normal.37:
  %9 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %10 = load i32, i32* %x.addr, align 4
  %11 = call %class.IO* @_CIO2_Fout_int7_(%class.IO* %9, i32 %10)
  %12 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %12, label %static.void, label %branch.normal.38

branch.normal.38:
  %13 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %14 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.2, i32 0, i32 0
  %15 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %13, i8* %14)
  %16 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %16, label %static.void, label %branch.normal.39

branch.normal.39:
  %17 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %18 = load i32, i32* %y.addr, align 4
  %19 = call %class.IO* @_CIO2_Fout_int7_(%class.IO* %17, i32 %18)
  %20 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %20, label %static.void, label %branch.normal.40

branch.normal.40:
  %21 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %22 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.2, i32 0, i32 0
  %23 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %21, i8* %22)
  %24 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %24, label %static.void, label %branch.normal.41

branch.normal.41:
  %25 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %26 = load i32, i32* %z.addr, align 4
  %27 = call %class.IO* @_CIO2_Fout_int7_(%class.IO* %25, i32 %26)
  %28 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %28, label %static.void, label %branch.normal.42

branch.normal.42:
  %29 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %30 = getelementptr inbounds [31 x i8], [31 x i8]* @.str.22, i32 0, i32 0
  %31 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %29, i8* %30)
  %32 = alloca i32, align 8
  %33 = load i32, i32* %x.addr, align 4
  %34 = load i32, i32* %y.addr, align 4
  %35 = icmp slt i32 %33, %34
  %36 = zext i1 %35 to i8
  %37 = trunc i8 %36 to i1
  br i1 %37, label %cond.true.6, label %cond.false.6

cond.true.6:
  %38 = alloca i32, align 8
  %39 = load i32, i32* %x.addr, align 4
  %40 = load i32, i32* %z.addr, align 4
  %41 = icmp slt i32 %39, %40
  %42 = zext i1 %41 to i8
  %43 = trunc i8 %42 to i1
  br i1 %43, label %cond.true.7, label %cond.false.7

cond.true.7:
  %44 = load i32, i32* %x.addr, align 4
  store i32 %44, i32* %38, align 4
  br label %branch.normal.44

cond.false.7:
  %45 = load i32, i32* %z.addr, align 4
  store i32 %45, i32* %38, align 4
  br label %branch.normal.44

branch.normal.44:
  %46 = load i32, i32* %38, align 4
  store i32 %46, i32* %32, align 4
  br label %branch.normal.43

cond.false.6:
  %47 = alloca i32, align 8
  %48 = load i32, i32* %y.addr, align 4
  %49 = load i32, i32* %z.addr, align 4
  %50 = icmp slt i32 %48, %49
  %51 = zext i1 %50 to i8
  %52 = trunc i8 %51 to i1
  br i1 %52, label %cond.true.8, label %cond.false.8

cond.true.8:
  %53 = load i32, i32* %y.addr, align 4
  store i32 %53, i32* %47, align 4
  br label %branch.normal.45

cond.false.8:
  %54 = load i32, i32* %z.addr, align 4
  store i32 %54, i32* %47, align 4
  br label %branch.normal.45

branch.normal.45:
  %55 = load i32, i32* %47, align 4
  store i32 %55, i32* %32, align 4
  br label %branch.normal.43

branch.normal.43:
  %56 = load i32, i32* %32, align 4
  %57 = getelementptr inbounds %class.SimpleExprTests, %class.SimpleExprTests* %this,  i32 0, i32 1
  store i32 %56, i32* %57, align 4
  %58 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %58, label %static.void, label %branch.normal.46

branch.normal.46:
  %59 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %60 = getelementptr inbounds %class.SimpleExprTests, %class.SimpleExprTests* %this,  i32 0, i32 1
  %61 = load i32, i32* %60, align 4
  %62 = call %class.IO* @_CIO2_Fout_int7_(%class.IO* %59, i32 %61)
  %63 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %63, label %static.void, label %branch.normal.47

branch.normal.47:
  %64 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %65 = getelementptr inbounds [13 x i8], [13 x i8]* @.str.23, i32 0, i32 0
  %66 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %64, i8* %65)
  ret i32 0
}

; Class: SimpleExprTests, Method: loopTest1
define i32 @_CSimpleExprTests15_FloopTest19_(%class.SimpleExprTests* %this, i32 %x) {

entry:
  %x.addr = alloca i32, align 8
  store i32 %x, i32* %x.addr, align 4
  br label %method.body

static.void:
  call void @print_dispatch_on_void_error()
  br label %method.body

division.0:
  call void @print_div_by_zero_err_msg()
  br label %method.body

method.body:
  %0 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %0, label %static.void, label %branch.normal.48

branch.normal.48:
  %1 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %2 = getelementptr inbounds [41 x i8], [41 x i8]* @.str.24, i32 0, i32 0
  %3 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %1, i8* %2)
  %4 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %4, label %static.void, label %branch.normal.49

branch.normal.49:
  %5 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %6 = getelementptr inbounds [5 x i8], [5 x i8]* @.str.25, i32 0, i32 0
  %7 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %5, i8* %6)
  %8 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %8, label %static.void, label %branch.normal.50

branch.normal.50:
  %9 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %10 = load i32, i32* %x.addr, align 4
  %11 = call %class.IO* @_CIO2_Fout_int7_(%class.IO* %9, i32 %10)
  %12 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %12, label %static.void, label %branch.normal.51

branch.normal.51:
  %13 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %14 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.26, i32 0, i32 0
  %15 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %13, i8* %14)
  %16 = getelementptr inbounds %class.SimpleExprTests, %class.SimpleExprTests* %this,  i32 0, i32 1
  store i32 1, i32* %16, align 4
  br label %loop.cond

loop.cond:
  %17 = getelementptr inbounds %class.SimpleExprTests, %class.SimpleExprTests* %this,  i32 0, i32 1
  %18 = load i32, i32* %17, align 4
  %19 = load i32, i32* %x.addr, align 4
  %20 = icmp slt i32 %18, %19
  %21 = zext i1 %20 to i8
  %22 = trunc i8 %21 to i1
  br i1 %22, label %loop.body, label %loop.exit

loop.body:
  %23 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %23, label %static.void, label %branch.normal.52

branch.normal.52:
  %24 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %25 = getelementptr inbounds %class.SimpleExprTests, %class.SimpleExprTests* %this,  i32 0, i32 1
  %26 = load i32, i32* %25, align 4
  %27 = call %class.IO* @_CIO2_Fout_int7_(%class.IO* %24, i32 %26)
  %28 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %28, label %static.void, label %branch.normal.53

branch.normal.53:
  %29 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %30 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.2, i32 0, i32 0
  %31 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %29, i8* %30)
  %32 = getelementptr inbounds %class.SimpleExprTests, %class.SimpleExprTests* %this,  i32 0, i32 1
  %33 = load i32, i32* %32, align 4
  %34 = add nsw i32 %33, 1
  %35 = getelementptr inbounds %class.SimpleExprTests, %class.SimpleExprTests* %this,  i32 0, i32 1
  store i32 %34, i32* %35, align 4
  br label %loop.cond

loop.exit:
  %36 = getelementptr inbounds %class.SimpleExprTests, %class.SimpleExprTests* %this,  i32 0, i32 3
  store %class.Object* null, %class.Object** %36, align 8
  %37 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %37, label %static.void, label %branch.normal.54

branch.normal.54:
  %38 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %39 = getelementptr inbounds [34 x i8], [34 x i8]* @.str.27, i32 0, i32 0
  %40 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %38, i8* %39)
  %41 = alloca %class.IO, align 8
  %42 = getelementptr inbounds %class.SimpleExprTests, %class.SimpleExprTests* %this,  i32 0, i32 3
  %43 = load %class.Object*, %class.Object** %42, align 8
  %44 = icmp eq %class.Object* %43, null
  %45 = zext i1 %44 to i8
  %46 = trunc i8 %45 to i1
  br i1 %46, label %cond.true.9, label %cond.false.9

cond.true.9:
  %47 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %47, label %static.void, label %branch.normal.56

branch.normal.56:
  %48 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %49 = getelementptr inbounds [24 x i8], [24 x i8]* @.str.28, i32 0, i32 0
  %50 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %48, i8* %49)
  %51 = load %class.IO, %class.IO* %50, align 4
  store %class.IO %51, %class.IO* %41, align 4
  br label %branch.normal.55

cond.false.9:
  %52 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %52, label %static.void, label %branch.normal.57

branch.normal.57:
  %53 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %54 = getelementptr inbounds [28 x i8], [28 x i8]* @.str.29, i32 0, i32 0
  %55 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %53, i8* %54)
  %56 = load %class.IO, %class.IO* %55, align 4
  store %class.IO %56, %class.IO* %41, align 4
  br label %branch.normal.55

branch.normal.55:
  %57 = getelementptr inbounds %class.SimpleExprTests, %class.SimpleExprTests* %this,  i32 0, i32 1
  %58 = load i32, i32* %57, align 4
  %59 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %59, label %static.void, label %branch.normal.58

branch.normal.58:
  %60 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %61 = getelementptr inbounds [12 x i8], [12 x i8]* @.str.19, i32 0, i32 0
  %62 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %60, i8* %61)
  ret i32 0
}

; Class: SimpleExprTests, Method: loopTest2
define i32 @_CSimpleExprTests15_FloopTest29_(%class.SimpleExprTests* %this, i32 %x) {

entry:
  %x.addr = alloca i32, align 8
  store i32 %x, i32* %x.addr, align 4
  br label %method.body

static.void:
  call void @print_dispatch_on_void_error()
  br label %method.body

division.0:
  call void @print_div_by_zero_err_msg()
  br label %method.body

method.body:
  %0 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %0, label %static.void, label %branch.normal.59

branch.normal.59:
  %1 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %2 = getelementptr inbounds [70 x i8], [70 x i8]* @.str.30, i32 0, i32 0
  %3 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %1, i8* %2)
  %4 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %4, label %static.void, label %branch.normal.60

branch.normal.60:
  %5 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %6 = getelementptr inbounds [5 x i8], [5 x i8]* @.str.25, i32 0, i32 0
  %7 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %5, i8* %6)
  %8 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %8, label %static.void, label %branch.normal.61

branch.normal.61:
  %9 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %10 = load i32, i32* %x.addr, align 4
  %11 = call %class.IO* @_CIO2_Fout_int7_(%class.IO* %9, i32 %10)
  %12 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %12, label %static.void, label %branch.normal.62

branch.normal.62:
  %13 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %14 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.26, i32 0, i32 0
  %15 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %13, i8* %14)
  %16 = getelementptr inbounds %class.SimpleExprTests, %class.SimpleExprTests* %this,  i32 0, i32 1
  store i32 0, i32* %16, align 4
  br label %loop.cond.1

loop.cond.1:
  %17 = getelementptr inbounds %class.SimpleExprTests, %class.SimpleExprTests* %this,  i32 0, i32 1
  %18 = load i32, i32* %17, align 4
  %19 = load i32, i32* %x.addr, align 4
  %20 = icmp slt i32 %18, %19
  %21 = zext i1 %20 to i8
  %22 = trunc i8 %21 to i1
  br i1 %22, label %loop.body.1, label %loop.exit.1

loop.body.1:
  %23 = getelementptr inbounds %class.SimpleExprTests, %class.SimpleExprTests* %this,  i32 0, i32 4
  store i32 0, i32* %23, align 4
  br label %loop.cond.2

loop.cond.2:
  %24 = getelementptr inbounds %class.SimpleExprTests, %class.SimpleExprTests* %this,  i32 0, i32 4
  %25 = load i32, i32* %24, align 4
  %26 = getelementptr inbounds %class.SimpleExprTests, %class.SimpleExprTests* %this,  i32 0, i32 1
  %27 = load i32, i32* %26, align 4
  %28 = icmp slt i32 %25, %27
  %29 = zext i1 %28 to i8
  %30 = trunc i8 %29 to i1
  br i1 %30, label %loop.body.2, label %loop.exit.2

loop.body.2:
  %31 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %31, label %static.void, label %branch.normal.63

branch.normal.63:
  %32 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %33 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.31, i32 0, i32 0
  %34 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %32, i8* %33)
  %35 = getelementptr inbounds %class.SimpleExprTests, %class.SimpleExprTests* %this,  i32 0, i32 4
  %36 = load i32, i32* %35, align 4
  %37 = add nsw i32 %36, 1
  %38 = getelementptr inbounds %class.SimpleExprTests, %class.SimpleExprTests* %this,  i32 0, i32 4
  store i32 %37, i32* %38, align 4
  br label %loop.cond.2

loop.exit.2:
  %39 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %39, label %static.void, label %branch.normal.64

branch.normal.64:
  %40 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %41 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.26, i32 0, i32 0
  %42 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %40, i8* %41)
  %43 = getelementptr inbounds %class.SimpleExprTests, %class.SimpleExprTests* %this,  i32 0, i32 1
  %44 = load i32, i32* %43, align 4
  %45 = add nsw i32 %44, 1
  %46 = getelementptr inbounds %class.SimpleExprTests, %class.SimpleExprTests* %this,  i32 0, i32 1
  store i32 %45, i32* %46, align 4
  br label %loop.cond.1

loop.exit.1:
  %47 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %47, label %static.void, label %branch.normal.65

branch.normal.65:
  %48 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %49 = getelementptr inbounds [12 x i8], [12 x i8]* @.str.19, i32 0, i32 0
  %50 = call %class.IO* @_CIO2_Fout_string10_(%class.IO* %48, i8* %49)
  ret i32 0
}

; Class: Main, Method: main
define i32 @_CMain4_Fmain4_(%class.Main* %this) {

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
  %1 = load %class.SimpleExprTests*, %class.SimpleExprTests** %0, align 8
  %2 = icmp eq %class.SimpleExprTests* %1, null
  br i1 %2, label %static.void, label %branch.normal.66

branch.normal.66:
  %3 = call i32 @_CSimpleExprTests15_FbinOpTest9_(%class.SimpleExprTests* %1, i32 3, i32 4)
  %4 = getelementptr inbounds %class.Main, %class.Main* %this,  i32 0, i32 1
  %5 = load %class.SimpleExprTests*, %class.SimpleExprTests** %4, align 8
  %6 = icmp eq %class.SimpleExprTests* %5, null
  br i1 %6, label %static.void, label %branch.normal.67

branch.normal.67:
  %7 = call i32 @_CSimpleExprTests15_FbinOpTest9_(%class.SimpleExprTests* %5, i32 2, i32 2)
  %8 = getelementptr inbounds %class.Main, %class.Main* %this,  i32 0, i32 1
  %9 = load %class.SimpleExprTests*, %class.SimpleExprTests** %8, align 8
  %10 = icmp eq %class.SimpleExprTests* %9, null
  br i1 %10, label %static.void, label %branch.normal.68

branch.normal.68:
  %11 = call i32 @_CSimpleExprTests15_FifElseTest10_(%class.SimpleExprTests* %9, i32 6, i32 3, i32 8)
  %12 = getelementptr inbounds %class.Main, %class.Main* %this,  i32 0, i32 1
  %13 = load %class.SimpleExprTests*, %class.SimpleExprTests** %12, align 8
  %14 = icmp eq %class.SimpleExprTests* %13, null
  br i1 %14, label %static.void, label %branch.normal.69

branch.normal.69:
  %15 = call i32 @_CSimpleExprTests15_FloopTest19_(%class.SimpleExprTests* %13, i32 10)
  %16 = getelementptr inbounds %class.Main, %class.Main* %this,  i32 0, i32 1
  %17 = load %class.SimpleExprTests*, %class.SimpleExprTests** %16, align 8
  %18 = icmp eq %class.SimpleExprTests* %17, null
  br i1 %18, label %static.void, label %branch.normal.70

branch.normal.70:
  %19 = call i32 @_CSimpleExprTests15_FloopTest29_(%class.SimpleExprTests* %17, i32 10)
  %20 = getelementptr inbounds %class.Main, %class.Main* %this,  i32 0, i32 1
  %21 = load %class.SimpleExprTests*, %class.SimpleExprTests** %20, align 8
  %22 = icmp eq %class.SimpleExprTests* %21, null
  br i1 %22, label %static.void, label %branch.normal.71

branch.normal.71:
  %23 = call i32 @_CSimpleExprTests15_FbinOpTest9_(%class.SimpleExprTests* %21, i32 4, i32 0)
  ret i32 %23
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

; Constructor of class 'SimpleExprTests'
define void @_CSimpleExprTests15_FSimpleExprTests15_(%class.SimpleExprTests* %this) {

entry:
  %0 = bitcast %class.SimpleExprTests* %this to %class.IO*
  call void @_CIO2_FIO2_(%class.IO* %0)
  %1 = getelementptr inbounds %class.SimpleExprTests, %class.SimpleExprTests* %this,  i32 0, i32 1
  store i32 0, i32* %1, align 4
  %2 = getelementptr inbounds %class.SimpleExprTests, %class.SimpleExprTests* %this,  i32 0, i32 2
  store i8 0, i8* %2, align 4
  %3 = getelementptr inbounds %class.SimpleExprTests, %class.SimpleExprTests* %this,  i32 0, i32 3
  store %class.Object* null, %class.Object** %3, align 4
  %4 = getelementptr inbounds %class.SimpleExprTests, %class.SimpleExprTests* %this,  i32 0, i32 4
  store i32 0, i32* %4, align 4
  %5 = getelementptr inbounds %class.SimpleExprTests, %class.SimpleExprTests* %this,  i32 0, i32 5
  store %class.Object* null, %class.Object** %5, align 4
  ret void
}

; Constructor of class 'Main'
define void @_CMain4_FMain4_(%class.Main* %this) {

entry:
  %0 = bitcast %class.Main* %this to %class.Object*
  call void @_CObject6_FObject6_(%class.Object* %0)
  %1 = getelementptr inbounds %class.Main, %class.Main* %this,  i32 0, i32 1
  %2 = call noalias i8* @malloc(i64 41)
  %3 = bitcast i8* %2 to %class.SimpleExprTests*
  call void @_CSimpleExprTests15_FSimpleExprTests15_(%class.SimpleExprTests* %3)
  %4 = bitcast %class.SimpleExprTests* %3 to %class.Object*
  %5 = getelementptr inbounds %class.Object, %class.Object* %4, i32 0, i32 0
  store i8* null, i8** %5, align 8
  store %class.SimpleExprTests* %3, %class.SimpleExprTests** %1, align 4
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
  %2 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.35, i32 0, i32 0
  %3 = getelementptr inbounds [33 x i8], [33 x i8]* @.str.39, i32 0, i32 0
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
  %0 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.33, i32 0, i32 0
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
  %1 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.33, i32 0, i32 0
  %call = call i32 (i8*, ...) @scanf(i8* %1, i32* %0)
  %2 = load i32, i32* %0, align 4
  ret i32 %2
}

; Class: IO, Method: out_string
define %class.IO* @_CIO2_Fout_string10_(%class.IO* %this, i8* %s) {
entry:
  %0 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.35, i32 0, i32 0
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
  %2 = getelementptr inbounds [10 x i8], [10 x i8]* @.str.36, i32 0, i32 0
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

define void @print_dispatch_on_void_error() {
entry:
  %0 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.35, i32 0, i32 0
  %1 = getelementptr inbounds [32 x i8], [32 x i8]* @.str.38, i32 0, i32 0
 %2 = call i32 (i8*, ...) @printf(i8* %0, i8* %1)
  %3 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.26, i32 0, i32 0
 %4 = call i32 (i8*, ...) @printf(i8* %0, i8* %3)
  call void @exit(i32 1)
 ret void
}

define void @print_div_by_zero_err_msg() {
entry:
  %0 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.35, i32 0, i32 0
  %1 = getelementptr inbounds [42 x i8], [42 x i8]* @.str.37, i32 0, i32 0
 %2 = call i32 (i8*, ...) @printf(i8* %0, i8* %1)
  %3 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.26, i32 0, i32 0
 %4 = call i32 (i8*, ...) @printf(i8* %0, i8* %3)
  call void @exit(i32 1)
 ret void
}
