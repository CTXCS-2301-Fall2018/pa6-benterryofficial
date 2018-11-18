	@   Adrian Revuelta & Ben Terry
		@	Programming Assignment 6, Problem 2
        @   11/14
		@	This program will preferom integer division. In addition to
		@   taking two values which are a and be and use them as perameters.
		@--------------------
		@	You are to write a function that performs integer division
		@	Your function must be called div.  It takes two values, a and b passed as parameters,
		@	and should return a/b.  Code is given for you that tests
		@	your program.  Upon successful completion the following values should print
		@	0
		@	1
		@	11
		@	4
		@	5
	.extern printf
        .global main
        .func main
main:		@	DO NOT TOUCH! (i touched it)
		PUSH	{LR}
		MOV	R0, #5
		MOV	R1, #9
		BL	div
		MOV	R1, R0
		LDR	R0, =out
		BL 	printf
		MOV	R0, #9
		MOV	R1, #5
		BL	div
		MOV	R1, R0
		LDR	R0, =out
		BL 	printf
		MOV	R0, #80
		MOV	R1, #7
		BL	div
		MOV	R1, R0
		LDR	R0, =out
		BL 	printf
		MOV	R0, #19
		MOV	R1, #4
		BL	div
		MOV	R1, R0
		LDR	R0, =out
		BL 	printf
		MOV	R0, #60
		MOV	R1, #12
		BL	div
		MOV	R1, R0
		LDR	R0, =out
		BL 	printf
		POP	{PC}

div:    PUSH    {LR}	@ Leave this here

        @ Your code here

        MOV R2, R1
        MOV R1, R0
        MOV R4, R2              @ MOVES R1 INTO R4
        CMP R4, R1, LSR #1      @ CMP COMMAND WILL LOOP UNTIL R4 IS 2X > DIVISOR

div1:
        MOVLS R4, R4, LSL #1    @ MOVES R4 2X UNTIL < R4
        CMP R4, R1, LSR #1      @ CMP R0 TO R4
        BLS div1                @ BRANCHES DIV1 IF ITS LESS THAN
        MOV R3, #0              @ MOVES 0 INTO R3

div2:
        CMP R1, R4              @ CMP R4 WITH R0
        SUBCS R1, R1, R4        @ SUBS R4 WITH R0 WHICH WILL BE PASSED DOWN
        ADC R3, R3, R3          @ ADD CARRY R3 AND R3 AND STORES IN R3 WHICH WILL ADD A NEW BIT
        MOV R4, R4, LSR #1      @ MOVES R4 AND R4 (R4/2)
        CMP R4, R2              @ LOOP UNTIL DONE
        BLS div2                @ BRANCHES DIV2 IF LESS THAN
        MOV R0, #3              @ MOVES 0 INTO R3

        POP	{PC} 	@ return statement
.data
out:	.asciz "%d\n"	@ String for printf

