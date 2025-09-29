
	.syntax unified
	.text
	.global _start

_start:
	MOV R0, #42
	MOV R7, #1
	SVC #0


