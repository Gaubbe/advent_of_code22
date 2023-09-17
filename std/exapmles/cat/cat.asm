global _start

extern read_file_to_str
extern print

section .rodata
	usage: db "Usage: cat filepath", 0xA, 0x0
	file_error: db "Something went wrong with the specified file", 0xA, 0x0

section .text

print_usage_and_exit:
	push usage
	call print
	add esp, 4

	mov eax, 1
	mov ebx, 1
	int 80h

print_file_error_and_exit:
	push file_error
	call print
	add esp, 4

	mov eax, 1
	mov ebx, 1
	int 80h

_start:
	pop eax				; argc
	cmp eax, 2
	jne print_usage_and_exit

	pop eax				; argv[0]
	pop eax				; argv[1]
	push eax
	call read_file_to_str
	add esp, 4
	test eax, eax
	jz print_file_error_and_exit

	push eax
	call print
	add esp, 4

	mov eax, 1
	mov ebx, 0
	int 80h

