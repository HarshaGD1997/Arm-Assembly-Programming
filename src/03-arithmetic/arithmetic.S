
	.syntax unified
	.global _start

_start:
	MOV R0, #2
	MOV R1, #4
	ADD R2, R0, R1
	SUB R2, R0, R1
	MUL R2, R0, R1
	MOV R7, #1
	SVC #0
