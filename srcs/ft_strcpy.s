bits 64

; An implementation of strcpy - copy a string

; char *strcpy(
;	const char *dest <rdi>, const char *src <rsi>
; )

global ft_strcpy:

ft_strcpy:
	mov		rax, rdi		; Copying the pointer from rdi (dest) to rax
	jmp		cpy_loop		; Jump to loop subroutine
	
cpy_loop:
	cmp		byte [rsi], 0	; Compare 0 to the first byte in rsi (contains 2nd arg)
	jz		exit
	movsb					; Mov 1 byte from RSI to RDI and inc both
	jmp		cpy_loop

exit:
	mov		byte [rdi], 0	; Put '\0' at the end of the string
	ret						; Return rax
