global _start

extern print

section .data
	msg: db "Hello, World!", 0xA, 0

section .text
_start:
	push msg
	call print
	add esp, 4

	mov eax, 1
	mov ebx, 0
	int 80h
