	.data
	.align	2
	.globl	class_nameTab
	.globl	Main_protObj
	.globl	Int_protObj
	.globl	String_protObj
	.globl	bool_const0
	.globl	bool_const1
	.globl	_int_tag
	.globl	_bool_tag
	.globl	_string_tag
_int_tag:
	.word	3
_bool_tag:
	.word	4
_string_tag:
	.word	5
	.globl	_MemMgr_INITIALIZER
_MemMgr_INITIALIZER:
	.word	_NoGC_Init
	.globl	_MemMgr_COLLECTOR
_MemMgr_COLLECTOR:
	.word	_NoGC_Collect
	.globl	_MemMgr_TEST
_MemMgr_TEST:
	.word	0
	.word	-1
str_const41:
	.word	5
	.word	5
	.word	String_dispTab
	.word	int_const1
	.byte	0	
	.align	2
	.word	-1
str_const40:
	.word	5
	.word	6
	.word	String_dispTab
	.word	int_const4
	.ascii	"Main"
	.byte	0	
	.align	2
	.word	-1
str_const39:
	.word	5
	.word	6
	.word	String_dispTab
	.word	int_const6
	.ascii	"String"
	.byte	0	
	.align	2
	.word	-1
str_const38:
	.word	5
	.word	6
	.word	String_dispTab
	.word	int_const4
	.ascii	"Bool"
	.byte	0	
	.align	2
	.word	-1
str_const37:
	.word	5
	.word	5
	.word	String_dispTab
	.word	int_const3
	.ascii	"Int"
	.byte	0	
	.align	2
	.word	-1
str_const36:
	.word	5
	.word	8
	.word	String_dispTab
	.word	int_const8
	.ascii	"SimpleExprTests"
	.byte	0	
	.align	2
	.word	-1
str_const35:
	.word	5
	.word	5
	.word	String_dispTab
	.word	int_const5
	.ascii	"IO"
	.byte	0	
	.align	2
	.word	-1
str_const34:
	.word	5
	.word	6
	.word	String_dispTab
	.word	int_const6
	.ascii	"Object"
	.byte	0	
	.align	2
	.word	-1
str_const33:
	.word	5
	.word	8
	.word	String_dispTab
	.word	int_const9
	.ascii	"<basic class>"
	.byte	0	
	.align	2
	.word	-1
str_const32:
	.word	5
	.word	7
	.word	String_dispTab
	.word	int_const7
	.ascii	"test1.cl"
	.byte	0	
	.align	2
	.word	-1
str_const31:
	.word	5
	.word	5
	.word	String_dispTab
	.word	int_const2
	.ascii	"*"
	.byte	0	
	.align	2
	.word	-1
str_const30:
	.word	5
	.word	22
	.word	String_dispTab
	.word	int_const10
	.ascii	"Loop Test 2 : Print a right angled triangle using * given the size n\n"
	.byte	0	
	.align	2
	.word	-1
str_const29:
	.word	5
	.word	11
	.word	String_dispTab
	.word	int_const11
	.ascii	"Value returned is not void\n"
	.byte	0	
	.align	2
	.word	-1
str_const28:
	.word	5
	.word	10
	.word	String_dispTab
	.word	int_const12
	.ascii	"Value returned is void\n"
	.byte	0	
	.align	2
	.word	-1
str_const27:
	.word	5
	.word	13
	.word	String_dispTab
	.word	int_const13
	.ascii	"\nChecking value returned by loop\n"
	.byte	0	
	.align	2
	.word	-1
str_const26:
	.word	5
	.word	5
	.word	String_dispTab
	.word	int_const2
	.ascii	"\n"
	.byte	0	
	.align	2
	.word	-1
str_const25:
	.word	5
	.word	6
	.word	String_dispTab
	.word	int_const4
	.ascii	"n = "
	.byte	0	
	.align	2
	.word	-1
str_const24:
	.word	5
	.word	15
	.word	String_dispTab
	.word	int_const14
	.ascii	"Loop Test 1 : Print numbers from 1 to n\n"
	.byte	0	
	.align	2
	.word	-1
str_const23:
	.word	5
	.word	8
	.word	String_dispTab
	.word	int_const15
	.ascii	"\nCompleted\n\n"
	.byte	0	
	.align	2
	.word	-1
str_const22:
	.word	5
	.word	12
	.word	String_dispTab
	.word	int_const16
	.ascii	"\nThe smallest among them is : "
	.byte	0	
	.align	2
	.word	-1
str_const21:
	.word	5
	.word	9
	.word	String_dispTab
	.word	int_const17
	.ascii	"The numbers are : \n"
	.byte	0	
	.align	2
	.word	-1
str_const20:
	.word	5
	.word	19
	.word	String_dispTab
	.word	int_const18
	.ascii	"Testing if-else by finding the smallest of three numbers\n"
	.byte	0	
	.align	2
	.word	-1
str_const19:
	.word	5
	.word	7
	.word	String_dispTab
	.word	int_const19
	.ascii	"Completed\n\n"
	.byte	0	
	.align	2
	.word	-1
str_const18:
	.word	5
	.word	11
	.word	String_dispTab
	.word	int_const20
	.ascii	"It's complement is false\n"
	.byte	0	
	.align	2
	.word	-1
str_const17:
	.word	5
	.word	11
	.word	String_dispTab
	.word	int_const21
	.ascii	"It's complement is true\n"
	.byte	0	
	.align	2
	.word	-1
str_const16:
	.word	5
	.word	10
	.word	String_dispTab
	.word	int_const22
	.ascii	"Bool value is false\n"
	.byte	0	
	.align	2
	.word	-1
str_const15:
	.word	5
	.word	9
	.word	String_dispTab
	.word	int_const17
	.ascii	"Bool value is true\n"
	.byte	0	
	.align	2
	.word	-1
str_const14:
	.word	5
	.word	9
	.word	String_dispTab
	.word	int_const17
	.ascii	"Both are not equal\n"
	.byte	0	
	.align	2
	.word	-1
str_const13:
	.word	5
	.word	8
	.word	String_dispTab
	.word	int_const8
	.ascii	"Both are equal\n"
	.byte	0	
	.align	2
	.word	-1
str_const12:
	.word	5
	.word	9
	.word	String_dispTab
	.word	int_const23
	.ascii	"First is greater\n"
	.byte	0	
	.align	2
	.word	-1
str_const11:
	.word	5
	.word	11
	.word	String_dispTab
	.word	int_const24
	.ascii	"First is greater or equal\n"
	.byte	0	
	.align	2
	.word	-1
str_const10:
	.word	5
	.word	11
	.word	String_dispTab
	.word	int_const20
	.ascii	"First is lesser or equal\n"
	.byte	0	
	.align	2
	.word	-1
str_const9:
	.word	5
	.word	8
	.word	String_dispTab
	.word	int_const15
	.ascii	"Less than : "
	.byte	0	
	.align	2
	.word	-1
str_const8:
	.word	5
	.word	12
	.word	String_dispTab
	.word	int_const16
	.ascii	"\nComparing these operands now\n"
	.byte	0	
	.align	2
	.word	-1
str_const7:
	.word	5
	.word	10
	.word	String_dispTab
	.word	int_const25
	.ascii	"\nNegation of first : "
	.byte	0	
	.align	2
	.word	-1
str_const6:
	.word	5
	.word	8
	.word	String_dispTab
	.word	int_const15
	.ascii	"\nQuotient : "
	.byte	0	
	.align	2
	.word	-1
str_const5:
	.word	5
	.word	7
	.word	String_dispTab
	.word	int_const19
	.ascii	"\nProduct : "
	.byte	0	
	.align	2
	.word	-1
str_const4:
	.word	5
	.word	8
	.word	String_dispTab
	.word	int_const26
	.ascii	"\nDifference : "
	.byte	0	
	.align	2
	.word	-1
str_const3:
	.word	5
	.word	6
	.word	String_dispTab
	.word	int_const27
	.ascii	"\nSum : "
	.byte	0	
	.align	2
	.word	-1
str_const2:
	.word	5
	.word	5
	.word	String_dispTab
	.word	int_const2
	.ascii	" "
	.byte	0	
	.align	2
	.word	-1
str_const1:
	.word	5
	.word	8
	.word	String_dispTab
	.word	int_const8
	.ascii	"Operands are : "
	.byte	0	
	.align	2
	.word	-1
str_const0:
	.word	5
	.word	14
	.word	String_dispTab
	.word	int_const28
	.ascii	"Testing binary arithmetic operations\n"
	.byte	0	
	.align	2
	.word	-1
int_const28:
	.word	3
	.word	4
	.word	Int_dispTab
	.word	37
	.word	-1
int_const27:
	.word	3
	.word	4
	.word	Int_dispTab
	.word	7
	.word	-1
int_const26:
	.word	3
	.word	4
	.word	Int_dispTab
	.word	14
	.word	-1
int_const25:
	.word	3
	.word	4
	.word	Int_dispTab
	.word	21
	.word	-1
int_const24:
	.word	3
	.word	4
	.word	Int_dispTab
	.word	26
	.word	-1
int_const23:
	.word	3
	.word	4
	.word	Int_dispTab
	.word	17
	.word	-1
int_const22:
	.word	3
	.word	4
	.word	Int_dispTab
	.word	20
	.word	-1
int_const21:
	.word	3
	.word	4
	.word	Int_dispTab
	.word	24
	.word	-1
int_const20:
	.word	3
	.word	4
	.word	Int_dispTab
	.word	25
	.word	-1
int_const19:
	.word	3
	.word	4
	.word	Int_dispTab
	.word	11
	.word	-1
int_const18:
	.word	3
	.word	4
	.word	Int_dispTab
	.word	57
	.word	-1
int_const17:
	.word	3
	.word	4
	.word	Int_dispTab
	.word	19
	.word	-1
int_const16:
	.word	3
	.word	4
	.word	Int_dispTab
	.word	30
	.word	-1
int_const15:
	.word	3
	.word	4
	.word	Int_dispTab
	.word	12
	.word	-1
int_const14:
	.word	3
	.word	4
	.word	Int_dispTab
	.word	40
	.word	-1
int_const13:
	.word	3
	.word	4
	.word	Int_dispTab
	.word	33
	.word	-1
int_const12:
	.word	3
	.word	4
	.word	Int_dispTab
	.word	23
	.word	-1
int_const11:
	.word	3
	.word	4
	.word	Int_dispTab
	.word	27
	.word	-1
int_const10:
	.word	3
	.word	4
	.word	Int_dispTab
	.word	69
	.word	-1
int_const9:
	.word	3
	.word	4
	.word	Int_dispTab
	.word	13
	.word	-1
int_const8:
	.word	3
	.word	4
	.word	Int_dispTab
	.word	15
	.word	-1
int_const7:
	.word	3
	.word	4
	.word	Int_dispTab
	.word	8
	.word	-1
int_const6:
	.word	3
	.word	4
	.word	Int_dispTab
	.word	6
	.word	-1
int_const5:
	.word	3
	.word	4
	.word	Int_dispTab
	.word	2
	.word	-1
int_const4:
	.word	3
	.word	4
	.word	Int_dispTab
	.word	4
	.word	-1
int_const3:
	.word	3
	.word	4
	.word	Int_dispTab
	.word	3
	.word	-1
int_const2:
	.word	3
	.word	4
	.word	Int_dispTab
	.word	1
	.word	-1
int_const1:
	.word	3
	.word	4
	.word	Int_dispTab
	.word	0
	.word	-1
int_const0:
	.word	3
	.word	4
	.word	Int_dispTab
	.word	10
	.word	-1
bool_const0:
	.word	4
	.word	4
	.word	Bool_dispTab
	.word	0
	.word	-1
bool_const1:
	.word	4
	.word	4
	.word	Bool_dispTab
	.word	1
class_nameTab:
	.word	str_const34
	.word	str_const35
	.word	str_const36
	.word	str_const37
	.word	str_const38
	.word	str_const39
	.word	str_const40
class_objTab:
	.word	Object_protObj
	.word	Object_init
	.word	IO_protObj
	.word	IO_init
	.word	SimpleExprTests_protObj
	.word	SimpleExprTests_init
	.word	Int_protObj
	.word	Int_init
	.word	Bool_protObj
	.word	Bool_init
	.word	String_protObj
	.word	String_init
	.word	Main_protObj
	.word	Main_init
Object_dispTab:
	.word	Object.abort
	.word	Object.type_name
	.word	Object.copy
Main_dispTab:
	.word	Object.abort
	.word	Object.type_name
	.word	Object.copy
	.word	Main.main
String_dispTab:
	.word	Object.abort
	.word	Object.type_name
	.word	Object.copy
	.word	String.length
	.word	String.concat
	.word	String.substr
Bool_dispTab:
	.word	Object.abort
	.word	Object.type_name
	.word	Object.copy
Int_dispTab:
	.word	Object.abort
	.word	Object.type_name
	.word	Object.copy
IO_dispTab:
	.word	Object.abort
	.word	Object.type_name
	.word	Object.copy
	.word	IO.out_string
	.word	IO.out_int
	.word	IO.in_string
	.word	IO.in_int
SimpleExprTests_dispTab:
	.word	Object.abort
	.word	Object.type_name
	.word	Object.copy
	.word	IO.out_string
	.word	IO.out_int
	.word	IO.in_string
	.word	IO.in_int
	.word	SimpleExprTests.binOpTest
	.word	SimpleExprTests.ifElseTest
	.word	SimpleExprTests.loopTest1
	.word	SimpleExprTests.loopTest2
	.word	-1
Object_protObj:
	.word	0
	.word	3
	.word	Object_dispTab
	.word	-1
Main_protObj:
	.word	6
	.word	4
	.word	Main_dispTab
	.word	0
	.word	-1
String_protObj:
	.word	5
	.word	5
	.word	String_dispTab
	.word	int_const1
	.word	0
	.word	-1
Bool_protObj:
	.word	4
	.word	4
	.word	Bool_dispTab
	.word	0
	.word	-1
Int_protObj:
	.word	3
	.word	4
	.word	Int_dispTab
	.word	0
	.word	-1
IO_protObj:
	.word	1
	.word	3
	.word	IO_dispTab
	.word	-1
SimpleExprTests_protObj:
	.word	2
	.word	9
	.word	SimpleExprTests_dispTab
	.word	int_const1
	.word	bool_const0
	.word	0
	.word	int_const1
	.word	0
	.word	bool_const0
	.globl	heap_start
heap_start:
	.word	0
	.text
	.globl	Main_init
	.globl	Int_init
	.globl	String_init
	.globl	Bool_init
	.globl	Main.main
Object_init:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
Main_init:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	jal	Object_init
	la	$a0 SimpleExprTests_protObj
	jal	Object.copy
	jal	SimpleExprTests_init
	sw	$a0 12($s0)
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
String_init:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	jal	Object_init
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
Bool_init:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	jal	Object_init
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
Int_init:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	jal	Object_init
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
IO_init:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	jal	Object_init
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
SimpleExprTests_init:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	jal	IO_init
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
Main.main:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	la	$a0 int_const3
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const4
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const3
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 12($s0)
	bne	$a0 $zero label0
	la	$a0 str_const32
	li	$t1 1
	jal	_dispatch_abort
label0:
	la	$t1 SimpleExprTests_dispTab
	lw	$t1 28($t1)
	jalr		$t1
	la	$a0 int_const5
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const5
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const3
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 12($s0)
	bne	$a0 $zero label1
	la	$a0 str_const32
	li	$t1 1
	jal	_dispatch_abort
label1:
	la	$t1 SimpleExprTests_dispTab
	lw	$t1 28($t1)
	jalr		$t1
	la	$a0 int_const6
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const3
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const7
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 12($s0)
	bne	$a0 $zero label2
	la	$a0 str_const32
	li	$t1 1
	jal	_dispatch_abort
label2:
	la	$t1 SimpleExprTests_dispTab
	lw	$t1 32($t1)
	jalr		$t1
	la	$a0 int_const0
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 12($s0)
	bne	$a0 $zero label3
	la	$a0 str_const32
	li	$t1 1
	jal	_dispatch_abort
label3:
	la	$t1 SimpleExprTests_dispTab
	lw	$t1 36($t1)
	jalr		$t1
	la	$a0 int_const0
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 12($s0)
	bne	$a0 $zero label4
	la	$a0 str_const32
	li	$t1 1
	jal	_dispatch_abort
label4:
	la	$t1 SimpleExprTests_dispTab
	lw	$t1 40($t1)
	jalr		$t1
	la	$a0 int_const4
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const3
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 12($s0)
	bne	$a0 $zero label5
	la	$a0 str_const32
	li	$t1 1
	jal	_dispatch_abort
label5:
	la	$t1 SimpleExprTests_dispTab
	lw	$t1 28($t1)
	jalr		$t1
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
SimpleExprTests.binOpTest:
	addiu	$sp $sp -16
	sw	$fp 16($sp)
	sw	$s0 12($sp)
	sw	$ra 8($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	la	$a0 str_const0
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label6
	la	$a0 str_const32
	li	$t1 1
	jal	_dispatch_abort
label6:
	la	$t1 IO_dispTab
	lw	$t1 12($t1)
	jalr		$t1
	la	$a0 str_const1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label7
	la	$a0 str_const32
	li	$t1 1
	jal	_dispatch_abort
label7:
	la	$t1 IO_dispTab
	lw	$t1 12($t1)
	jalr		$t1
	lw	$a0 24($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label8
	la	$a0 str_const32
	li	$t1 1
	jal	_dispatch_abort
label8:
	la	$t1 IO_dispTab
	lw	$t1 16($t1)
	jalr		$t1
	la	$a0 str_const2
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label9
	la	$a0 str_const32
	li	$t1 1
	jal	_dispatch_abort
label9:
	la	$t1 IO_dispTab
	lw	$t1 12($t1)
	jalr		$t1
	lw	$a0 20($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label10
	la	$a0 str_const32
	li	$t1 1
	jal	_dispatch_abort
label10:
	la	$t1 IO_dispTab
	lw	$t1 16($t1)
	jalr		$t1
	la	$a0 str_const3
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label11
	la	$a0 str_const32
	li	$t1 1
	jal	_dispatch_abort
label11:
	la	$t1 IO_dispTab
	lw	$t1 12($t1)
	jalr		$t1
	lw	$s1 24($fp)
	lw	$a0 20($fp)
	jal	Object.copy
	lw	$t2 12($a0)
	lw	$t1 12($s1)
	add	$t1 $t1 $t2
	sw	$t1 12($a0)
	sw	$a0 12($s0)
	lw	$a0 12($s0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label12
	la	$a0 str_const32
	li	$t1 1
	jal	_dispatch_abort
label12:
	la	$t1 IO_dispTab
	lw	$t1 16($t1)
	jalr		$t1
	la	$a0 str_const4
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label13
	la	$a0 str_const32
	li	$t1 1
	jal	_dispatch_abort
label13:
	la	$t1 IO_dispTab
	lw	$t1 12($t1)
	jalr		$t1
	lw	$s1 24($fp)
	lw	$a0 20($fp)
	jal	Object.copy
	lw	$t2 12($a0)
	lw	$t1 12($s1)
	sub	$t1 $t1 $t2
	sw	$t1 12($a0)
	sw	$a0 12($s0)
	lw	$a0 12($s0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label14
	la	$a0 str_const32
	li	$t1 1
	jal	_dispatch_abort
label14:
	la	$t1 IO_dispTab
	lw	$t1 16($t1)
	jalr		$t1
	la	$a0 str_const5
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label15
	la	$a0 str_const32
	li	$t1 1
	jal	_dispatch_abort
label15:
	la	$t1 IO_dispTab
	lw	$t1 12($t1)
	jalr		$t1
	lw	$s1 24($fp)
	lw	$a0 20($fp)
	jal	Object.copy
	lw	$t2 12($a0)
	lw	$t1 12($s1)
	mul	$t1 $t1 $t2
	sw	$t1 12($a0)
	sw	$a0 12($s0)
	lw	$a0 12($s0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label16
	la	$a0 str_const32
	li	$t1 1
	jal	_dispatch_abort
label16:
	la	$t1 IO_dispTab
	lw	$t1 16($t1)
	jalr		$t1
	la	$a0 str_const6
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label17
	la	$a0 str_const32
	li	$t1 1
	jal	_dispatch_abort
label17:
	la	$t1 IO_dispTab
	lw	$t1 12($t1)
	jalr		$t1
	lw	$s1 24($fp)
	lw	$a0 20($fp)
	jal	Object.copy
	lw	$t2 12($a0)
	lw	$t1 12($s1)
	div	$t1 $t1 $t2
	sw	$t1 12($a0)
	sw	$a0 12($s0)
	lw	$a0 12($s0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label18
	la	$a0 str_const32
	li	$t1 1
	jal	_dispatch_abort
label18:
	la	$t1 IO_dispTab
	lw	$t1 16($t1)
	jalr		$t1
	la	$a0 str_const7
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label19
	la	$a0 str_const32
	li	$t1 1
	jal	_dispatch_abort
label19:
	la	$t1 IO_dispTab
	lw	$t1 12($t1)
	jalr		$t1
	lw	$a0 24($fp)
	jal	Object.copy
	lw	$t1 12($a0)
	neg	$t1 $t1
	sw	$t1 12($a0)
	sw	$a0 12($s0)
	lw	$a0 12($s0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label20
	la	$a0 str_const32
	li	$t1 1
	jal	_dispatch_abort
label20:
	la	$t1 IO_dispTab
	lw	$t1 16($t1)
	jalr		$t1
	la	$a0 str_const8
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label21
	la	$a0 str_const32
	li	$t1 1
	jal	_dispatch_abort
label21:
	la	$t1 IO_dispTab
	lw	$t1 12($t1)
	jalr		$t1
	la	$a0 str_const9
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label22
	la	$a0 str_const32
	li	$t1 1
	jal	_dispatch_abort
label22:
	la	$t1 IO_dispTab
	lw	$t1 12($t1)
	jalr		$t1
	lw	$s1 24($fp)
	lw	$a0 20($fp)
	lw	$t1 12($s1)
	lw	$t2 12($a0)
	la	$a0 bool_const1
	blt	$t1 $t2 label25
	la	$a0 bool_const0
label25:
	lw	$t1 12($a0)
	beqz	$t1 label23
	lw	$a0 24($fp)
	b	label24
label23:
	lw	$a0 20($fp)
label24:
	sw	$a0 12($s0)
	lw	$s1 12($s0)
	lw	$t2 24($fp)
	move	$t1 $s1
	la	$a0 bool_const1
	beq	$t1 $t2 label28
	la	$a1 bool_const0
	jal	equality_test
label28:
	lw	$t1 12($a0)
	beqz	$t1 label26
	la	$a0 str_const10
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label29
	la	$a0 str_const32
	li	$t1 1
	jal	_dispatch_abort
label29:
	la	$t1 IO_dispTab
	lw	$t1 12($t1)
	jalr		$t1
	b	label27
label26:
	la	$a0 str_const11
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label30
	la	$a0 str_const32
	li	$t1 1
	jal	_dispatch_abort
label30:
	la	$t1 IO_dispTab
	lw	$t1 12($t1)
	jalr		$t1
label27:
	lw	$s1 24($fp)
	lw	$a0 20($fp)
	lw	$t1 12($s1)
	lw	$t2 12($a0)
	la	$a0 bool_const1
	ble	$t1 $t2 label33
	la	$a0 bool_const0
label33:
	lw	$t1 12($a0)
	beqz	$t1 label31
	la	$a0 str_const10
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label34
	la	$a0 str_const32
	li	$t1 1
	jal	_dispatch_abort
label34:
	la	$t1 IO_dispTab
	lw	$t1 12($t1)
	jalr		$t1
	b	label32
label31:
	la	$a0 str_const12
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label35
	la	$a0 str_const32
	li	$t1 1
	jal	_dispatch_abort
label35:
	la	$t1 IO_dispTab
	lw	$t1 12($t1)
	jalr		$t1
label32:
	lw	$s1 24($fp)
	lw	$t2 20($fp)
	move	$t1 $s1
	la	$a0 bool_const1
	beq	$t1 $t2 label38
	la	$a1 bool_const0
	jal	equality_test
label38:
	lw	$t1 12($a0)
	beqz	$t1 label36
	la	$a0 str_const13
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label39
	la	$a0 str_const32
	li	$t1 1
	jal	_dispatch_abort
label39:
	la	$t1 IO_dispTab
	lw	$t1 12($t1)
	jalr		$t1
	b	label37
label36:
	la	$a0 str_const14
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label40
	la	$a0 str_const32
	li	$t1 1
	jal	_dispatch_abort
label40:
	la	$t1 IO_dispTab
	lw	$t1 12($t1)
	jalr		$t1
label37:
	la	$a0 bool_const1
	sw	$a0 16($s0)
	lw	$a0 16($s0)
	lw	$t1 12($a0)
	beqz	$t1 label41
	la	$a0 str_const15
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label43
	la	$a0 str_const32
	li	$t1 1
	jal	_dispatch_abort
label43:
	la	$t1 IO_dispTab
	lw	$t1 12($t1)
	jalr		$t1
	b	label42
label41:
	la	$a0 str_const16
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label44
	la	$a0 str_const32
	li	$t1 1
	jal	_dispatch_abort
label44:
	la	$t1 IO_dispTab
	lw	$t1 12($t1)
	jalr		$t1
label42:
	lw	$a0 16($s0)
	lw	$t1 12($a0)
	la	$a0 bool_const1
	beqz	$t1 label47
	la	$a0 bool_const0
label47:
	lw	$t1 12($a0)
	beqz	$t1 label45
	la	$a0 str_const17
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label48
	la	$a0 str_const32
	li	$t1 1
	jal	_dispatch_abort
label48:
	la	$t1 IO_dispTab
	lw	$t1 12($t1)
	jalr		$t1
	b	label46
label45:
	la	$a0 str_const18
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label49
	la	$a0 str_const32
	li	$t1 1
	jal	_dispatch_abort
label49:
	la	$t1 IO_dispTab
	lw	$t1 12($t1)
	jalr		$t1
label46:
	la	$a0 str_const19
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label50
	la	$a0 str_const32
	li	$t1 1
	jal	_dispatch_abort
label50:
	la	$t1 IO_dispTab
	lw	$t1 12($t1)
	jalr		$t1
	la	$a0 int_const0
	sw	$a0 16($fp)
	lw	$a0 16($fp)
	lw	$fp 16($sp)
	lw	$s0 12($sp)
	lw	$ra 8($sp)
	addiu	$sp $sp 28
	jr	$ra	
SimpleExprTests.ifElseTest:
	addiu	$sp $sp -16
	sw	$fp 16($sp)
	sw	$s0 12($sp)
	sw	$ra 8($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	la	$a0 str_const20
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label51
	la	$a0 str_const32
	li	$t1 1
	jal	_dispatch_abort
label51:
	la	$t1 IO_dispTab
	lw	$t1 12($t1)
	jalr		$t1
	la	$a0 str_const21
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label52
	la	$a0 str_const32
	li	$t1 1
	jal	_dispatch_abort
label52:
	la	$t1 IO_dispTab
	lw	$t1 12($t1)
	jalr		$t1
	lw	$a0 24($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label53
	la	$a0 str_const32
	li	$t1 1
	jal	_dispatch_abort
label53:
	la	$t1 IO_dispTab
	lw	$t1 16($t1)
	jalr		$t1
	la	$a0 str_const2
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label54
	la	$a0 str_const32
	li	$t1 1
	jal	_dispatch_abort
label54:
	la	$t1 IO_dispTab
	lw	$t1 12($t1)
	jalr		$t1
	lw	$a0 20($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label55
	la	$a0 str_const32
	li	$t1 1
	jal	_dispatch_abort
label55:
	la	$t1 IO_dispTab
	lw	$t1 16($t1)
	jalr		$t1
	la	$a0 str_const2
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label56
	la	$a0 str_const32
	li	$t1 1
	jal	_dispatch_abort
label56:
	la	$t1 IO_dispTab
	lw	$t1 12($t1)
	jalr		$t1
	lw	$a0 16($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label57
	la	$a0 str_const32
	li	$t1 1
	jal	_dispatch_abort
label57:
	la	$t1 IO_dispTab
	lw	$t1 16($t1)
	jalr		$t1
	la	$a0 str_const22
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label58
	la	$a0 str_const32
	li	$t1 1
	jal	_dispatch_abort
label58:
	la	$t1 IO_dispTab
	lw	$t1 12($t1)
	jalr		$t1
	lw	$s1 24($fp)
	lw	$a0 20($fp)
	lw	$t1 12($s1)
	lw	$t2 12($a0)
	la	$a0 bool_const1
	ble	$t1 $t2 label61
	la	$a0 bool_const0
label61:
	lw	$t1 12($a0)
	beqz	$t1 label59
	lw	$s1 24($fp)
	lw	$a0 16($fp)
	lw	$t1 12($s1)
	lw	$t2 12($a0)
	la	$a0 bool_const1
	ble	$t1 $t2 label64
	la	$a0 bool_const0
label64:
	lw	$t1 12($a0)
	beqz	$t1 label62
	lw	$a0 24($fp)
	b	label63
label62:
	lw	$a0 16($fp)
label63:
	b	label60
label59:
	lw	$s1 20($fp)
	lw	$a0 16($fp)
	lw	$t1 12($s1)
	lw	$t2 12($a0)
	la	$a0 bool_const1
	ble	$t1 $t2 label67
	la	$a0 bool_const0
label67:
	lw	$t1 12($a0)
	beqz	$t1 label65
	lw	$a0 20($fp)
	b	label66
label65:
	lw	$a0 16($fp)
label66:
label60:
	sw	$a0 12($s0)
	lw	$a0 12($s0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label68
	la	$a0 str_const32
	li	$t1 1
	jal	_dispatch_abort
label68:
	la	$t1 IO_dispTab
	lw	$t1 16($t1)
	jalr		$t1
	la	$a0 str_const23
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label69
	la	$a0 str_const32
	li	$t1 1
	jal	_dispatch_abort
label69:
	la	$t1 IO_dispTab
	lw	$t1 12($t1)
	jalr		$t1
	la	$a0 int_const1
	lw	$fp 16($sp)
	lw	$s0 12($sp)
	lw	$ra 8($sp)
	addiu	$sp $sp 28
	jr	$ra	
SimpleExprTests.loopTest1:
	addiu	$sp $sp -16
	sw	$fp 16($sp)
	sw	$s0 12($sp)
	sw	$ra 8($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	la	$a0 str_const24
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label70
	la	$a0 str_const32
	li	$t1 1
	jal	_dispatch_abort
label70:
	la	$t1 IO_dispTab
	lw	$t1 12($t1)
	jalr		$t1
	la	$a0 str_const25
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label71
	la	$a0 str_const32
	li	$t1 1
	jal	_dispatch_abort
label71:
	la	$t1 IO_dispTab
	lw	$t1 12($t1)
	jalr		$t1
	lw	$a0 16($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label72
	la	$a0 str_const32
	li	$t1 1
	jal	_dispatch_abort
label72:
	la	$t1 IO_dispTab
	lw	$t1 16($t1)
	jalr		$t1
	la	$a0 str_const26
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label73
	la	$a0 str_const32
	li	$t1 1
	jal	_dispatch_abort
label73:
	la	$t1 IO_dispTab
	lw	$t1 12($t1)
	jalr		$t1
	la	$a0 int_const2
	sw	$a0 12($s0)
label74:
	lw	$s1 12($s0)
	lw	$a0 16($fp)
	lw	$t1 12($s1)
	lw	$t2 12($a0)
	la	$a0 bool_const1
	ble	$t1 $t2 label76
	la	$a0 bool_const0
label76:
	lw	$t1 12($a0)
	beq	$t1 $zero label75
	lw	$a0 12($s0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label77
	la	$a0 str_const32
	li	$t1 1
	jal	_dispatch_abort
label77:
	la	$t1 IO_dispTab
	lw	$t1 16($t1)
	jalr		$t1
	la	$a0 str_const2
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label78
	la	$a0 str_const32
	li	$t1 1
	jal	_dispatch_abort
label78:
	la	$t1 IO_dispTab
	lw	$t1 12($t1)
	jalr		$t1
	lw	$s1 12($s0)
	la	$a0 int_const2
	jal	Object.copy
	lw	$t2 12($a0)
	lw	$t1 12($s1)
	add	$t1 $t1 $t2
	sw	$t1 12($a0)
	sw	$a0 12($s0)
	b	label74
label75:
	move	$a0 $zero
	sw	$a0 20($s0)
	la	$a0 str_const27
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label79
	la	$a0 str_const32
	li	$t1 1
	jal	_dispatch_abort
label79:
	la	$t1 IO_dispTab
	lw	$t1 12($t1)
	jalr		$t1
	lw	$a0 20($s0)
	move	$t1 $a0
	la	$a0 bool_const1
	beqz	$t1 label82
	la	$a0 bool_const0
label82:
	lw	$t1 12($a0)
	beqz	$t1 label80
	la	$a0 str_const28
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label83
	la	$a0 str_const32
	li	$t1 1
	jal	_dispatch_abort
label83:
	la	$t1 IO_dispTab
	lw	$t1 12($t1)
	jalr		$t1
	b	label81
label80:
	la	$a0 str_const29
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label84
	la	$a0 str_const32
	li	$t1 1
	jal	_dispatch_abort
label84:
	la	$t1 IO_dispTab
	lw	$t1 12($t1)
	jalr		$t1
label81:
	lw	$a0 12($s0)
	move	$t1 $a0
	la	$a0 bool_const1
	beqz	$t1 label85
	la	$a0 bool_const0
label85:
	la	$a0 str_const19
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label86
	la	$a0 str_const32
	li	$t1 1
	jal	_dispatch_abort
label86:
	la	$t1 IO_dispTab
	lw	$t1 12($t1)
	jalr		$t1
	la	$a0 int_const1
	lw	$fp 16($sp)
	lw	$s0 12($sp)
	lw	$ra 8($sp)
	addiu	$sp $sp 20
	jr	$ra	
SimpleExprTests.loopTest2:
	addiu	$sp $sp -16
	sw	$fp 16($sp)
	sw	$s0 12($sp)
	sw	$ra 8($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	la	$a0 str_const30
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label87
	la	$a0 str_const32
	li	$t1 1
	jal	_dispatch_abort
label87:
	la	$t1 IO_dispTab
	lw	$t1 12($t1)
	jalr		$t1
	la	$a0 str_const25
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label88
	la	$a0 str_const32
	li	$t1 1
	jal	_dispatch_abort
label88:
	la	$t1 IO_dispTab
	lw	$t1 12($t1)
	jalr		$t1
	lw	$a0 16($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label89
	la	$a0 str_const32
	li	$t1 1
	jal	_dispatch_abort
label89:
	la	$t1 IO_dispTab
	lw	$t1 16($t1)
	jalr		$t1
	la	$a0 str_const26
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label90
	la	$a0 str_const32
	li	$t1 1
	jal	_dispatch_abort
label90:
	la	$t1 IO_dispTab
	lw	$t1 12($t1)
	jalr		$t1
	la	$a0 int_const1
	sw	$a0 12($s0)
label91:
	lw	$s1 12($s0)
	lw	$a0 16($fp)
	lw	$t1 12($s1)
	lw	$t2 12($a0)
	la	$a0 bool_const1
	blt	$t1 $t2 label93
	la	$a0 bool_const0
label93:
	lw	$t1 12($a0)
	beq	$t1 $zero label92
	la	$a0 int_const1
	sw	$a0 24($s0)
label94:
	lw	$s1 24($s0)
	lw	$a0 12($s0)
	lw	$t1 12($s1)
	lw	$t2 12($a0)
	la	$a0 bool_const1
	ble	$t1 $t2 label96
	la	$a0 bool_const0
label96:
	lw	$t1 12($a0)
	beq	$t1 $zero label95
	la	$a0 str_const31
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label97
	la	$a0 str_const32
	li	$t1 1
	jal	_dispatch_abort
label97:
	la	$t1 IO_dispTab
	lw	$t1 12($t1)
	jalr		$t1
	lw	$s1 24($s0)
	la	$a0 int_const2
	jal	Object.copy
	lw	$t2 12($a0)
	lw	$t1 12($s1)
	add	$t1 $t1 $t2
	sw	$t1 12($a0)
	sw	$a0 24($s0)
	b	label94
label95:
	move	$a0 $zero
	la	$a0 str_const26
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label98
	la	$a0 str_const32
	li	$t1 1
	jal	_dispatch_abort
label98:
	la	$t1 IO_dispTab
	lw	$t1 12($t1)
	jalr		$t1
	lw	$s1 12($s0)
	la	$a0 int_const2
	jal	Object.copy
	lw	$t2 12($a0)
	lw	$t1 12($s1)
	add	$t1 $t1 $t2
	sw	$t1 12($a0)
	sw	$a0 12($s0)
	b	label91
label92:
	move	$a0 $zero
	la	$a0 str_const19
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label99
	la	$a0 str_const32
	li	$t1 1
	jal	_dispatch_abort
label99:
	la	$t1 IO_dispTab
	lw	$t1 12($t1)
	jalr		$t1
	la	$a0 int_const1
	lw	$fp 16($sp)
	lw	$s0 12($sp)
	lw	$ra 8($sp)
	addiu	$sp $sp 20
	jr	$ra	
