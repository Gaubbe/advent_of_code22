; For the sake of simplicity, this memory library will only be providing a way to
; allocate memory and not to deallocate, which is quite bad normally, but for the
; purposes of the Advent of Code challenges, which only require small programs, this
; should be fine. The OS will take care of freeing the memory once the program terminates.

global alloc

section .data
	current_break: dd 0x00000000

section .text
;	alloc(
;		num_bytes: dword [ebp + 8]
;	) -> void*
;
;	Allocates memory on the heap and returns pointer to it
alloc:
	push ebp
	mov ebp, esp

	push ebx ; ebx is callee-saved
	
	; Test if current_break is initialized
	;-------------------------------------------------------------------------------------
	mov eax, [current_break]
	test eax, eax
	jnz break_initialized

	; Initialize current_break
	;-------------------------------------------------------------------------------------
	mov eax, 45
	mov ebx, 0
	int 80h

	mov [current_break], eax

	break_initialized:
	; Allocate the memory
	;-------------------------------------------------------------------------------------
	; At this point, eax contains the current break
	mov ecx, eax ; Save current break in ecx. Will ultimately be returned
	mov eax, 45
	mov ebx, ecx
	add ebx, [ebp + 8]
	int 80h

	; Move the address back in eax
	;-------------------------------------------------------------------------------------
	mov eax, ecx

	pop ebx
	
	mov esp, ebp
	pop ebp
	ret
