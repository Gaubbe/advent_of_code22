global print

extern strlen

section .text
;	print(
;		str: char* [ebp + 8]
;	) -> void
;
;	Prints null terminated string to STDOUT
print:
	push ebp
	mov ebp, esp

	push dword [ebp+8] ; re-push str to pass it to strlen
	call strlen
	add esp, 4

	push ebx ; ebx is callee saved

	mov edx, eax
	mov eax, 4
	mov ebx, 1
	mov ecx, [ebp + 8]
	int 80h

	pop ebx

	mov esp, ebp
	pop ebp
	ret
