global strlen
global strcopy

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

	len_loop:
	mov dl, byte [ecx + eax] ; edx <- current_char: char = *(current_char_ptr + counter)
	test dl, dl
	jz len_end
	inc eax
	jmp len_loop

	len_end:
	mov esp, ebp
	pop ebp
	ret

;	strcopy(
;		orig: char* [ebp+8],
;		dest: char* [ebp+12]
;	) void
;	Copies string form orig to dest. orig must be null terminated
strcopy:
	push ebp
	mov ebp, esp

	mov eax, [ebp + 8] ; eax <- current_char_ptr: char* = orig
	mov ecx, [ebp + 12] ; ecx <- dest_char_ptr: char* = dest

	cpy_loop:
	mov dl, byte [eax]
	mov byte [ecx], dl
	test dl, dl
	jz cpy_end
	inc eax
	inc ecx
	jmp cpy_loop

	cpy_end:
	mov esp, ebp
	pop ebp
	ret

