.section .rodata
.balign 4
msg: .asciz "Hello world\n"
.equ LEN, .-msg

.text
.global _start
.type _start, %function

_start:
	mov x0, #1
	adrp x1, msg
	add x1,x1,:lo12:msg
	mov x2, #LEN
	mov x8, #64
	svc #0

	mov x0, #1
	mov x8, #93
	svc #0
