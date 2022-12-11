global strlen

section .text

;	strlen(
;		str: char* [ebp + 8]
;	) -> length: int [eax]
;
;	Counts number of characters until it reaches a null byte
strlen:
	push ebp
	mov ebp, esp

	xor eax, eax ; eax <- couter: int = 0
	mov ecx, [ebp + 8] ; ecx <- current_char_ptr: char* = str

	loop:
	mov dl, byte [ecx + eax] ; edx <- current_char: char = *(current_char_ptr + counter)
	test dl, dl
	jz end
	inc eax
	jmp loop

	end:
	mov esp, ebp
	pop ebp
	ret

