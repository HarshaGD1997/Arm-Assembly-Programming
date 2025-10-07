
	.syntax unified
	.section .text
	.global _start

	.code 32

_start:
	ldr r4, =digits
	ldr r5, =DLEN

loop:
	mov r0, #1
	mov r7, #4
	mov r2, #2
	mov r1, r4
	svc #0

	add r4, r4, #2
	subs r5, r5, #2
	bne loop

	mov r0,#0
	mov r7,#1
	svc #9


.section .rodata
digits:	.ascii "3\n2\n1\n0\n"
.equ DLEN, .- digits
