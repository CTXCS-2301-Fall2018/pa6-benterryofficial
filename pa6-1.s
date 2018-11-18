		@	Adrian Revuelta & Ben Terry
		@   Programming Assignment 6, Problem 1
		@   11/14
		@	This program will use a function that computes a^b
		@   where a and b are integer values. We will use the pow function,
		@   and other instructions, to compute a^b – 3*a.
		@---------------------
		@ In those you will use the provided function pow to comput
		@ a^b - 3a
		@ You must set up the arguments to pow and call it using BL
		@ The result should be in R4 after the program completes

	.extern printf
	.global	main
	.func main
main:	PUSH {LR}
	@	Your code goes here

    LDR R0, =a      @ LOADS A (3) TO R0
    LDR R0, [R0]    @ LOADS CONTENTS OF R0(A) INTO R0
    LDR R1, =b      @ LOADS B (4) IN R1
    LDR R1, [R1]    @ LOADS CONTENTS OF R1(B) INTO R1
    MOV R5, #3      @ MOVES 3 INTO R5

    BL pow          @ BRANCH FUNCTION POW (A^B)

    LDR R7, =a      @ LOADS A (4) INTO R7
    LDR R7, [R7]    @ LOADS CONTENTS OF R7 (A) INTO R7

    MUL R3, R7, R5  @ MULTIPLIES R5(3) x R7 (A) (3^a)
    SUB R4, R0, R3  @ DOES THE SUB COMMAND = a^b-3-a AND STORES IT IN R4

	@ Code to print your answer.  DO NOT CHANGE!
	LDR	R0, =out
	MOV	R1, R4
	BL 	printf
	POP	{PC}

	@---------------------
	@  pow function.  DO NOT CHANGE!
	@---------------------
pow:	PUSH		{LR}
	PUSH		{R4-R6}
	MOV		R4, R1
	MOV		R5, #1
loop:	CMP		R4, #0
	BEQ		exit
	MUL		R5, R0, R5
	SUB		R4, R4, #1
	BAL		loop
exit:	MOV		R0, R5
	POP		{R4-R6}
	POP		{PC}

.data
a:	.word	3
b:	.word	4
out:	.asciz "Answer: %d\n"
