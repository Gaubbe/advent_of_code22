global print
global read_file_to_str

extern strlen
extern alloc

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

;	read_file_to_str(
;		file_path: char* [ebp + 8]
;	) -> str: char*
;
;	Reads file and puts result in heap allocated string
;	file_path must be null-terminated
; 	Retruns 0 if error occured
read_file_to_str:
	push ebp
	mov ebp, esp
	push ebx

	; Open the file
	;-------------------------------------------------------------------------------------
	mov eax, 5
	mov ebx, [ebp + 8]
	xor ecx, ecx ; O_RDONLY
	xor edx, edx
	int 80h
	test eax, eax
	js fts_error_end

	; Seek the end of the file 
	;-------------------------------------------------------------------------------------
	mov ebx, eax
	mov eax, 19
	xor ecx, ecx
	mov edx, 2 ; SEEK_END
	int 80h
	
	; Allocate buffer
	;-------------------------------------------------------------------------------------
	inc eax
	push eax
	call alloc
	mov esi, eax

	; Seek back to the beginning
	;-------------------------------------------------------------------------------------
	mov eax, 19
	xor ecx, ecx
	xor edx, edx ; SEEK_SET
	int 80h
	
	; Read file into buffer
	;-------------------------------------------------------------------------------------
	mov eax, 3
	mov ecx, esi
	pop edx
	dec edx
	int 80h
	
	; Close file
	;-------------------------------------------------------------------------------------
	mov eax, 6
	int 80h

	mov eax, esi
	pop ebx
	mov esp, ebp
	pop ebp
	ret

	fts_error_end:
	pop ebx
	mov esp, ebp
	pop ebp
	xor eax, eax
	ret
