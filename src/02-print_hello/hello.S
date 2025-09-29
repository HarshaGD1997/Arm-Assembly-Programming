
	.syntax unified
	.global _start
	
	
	.section .rodata
msg:	.asciz "Hello world\n"
	.equ 	len, . - msg	
	
	
	.text

_start:
	MOV R0, #1	
	LDR  R1, =msg	
	LDR R2, =len
	MOV R7, #4
	SVC #0

	MOV R0, #0
	MOV R7, #1
	SVC #0
