bits 64

; An implementation of strcpy - copy a string
; int strcmp(
;	const char *s1 <rdi>, const char *s2 <rsi>
; )

global ft_strcpy:

ft_strcpy:
	mov		rax, rdi		; Copying the pointer from rdi (dest) to rax
	jmp		_cpyLoop		; Jump to loop subroutine
	
_cpyLoop:
	cmp		byte [rsi], 0	; Compare 0 to the first byte in rsi (contains 2nd arg)
	jz		_exit
	movsb					; Mov 1 byte from RSI to RDI and inc both
	jmp		_cpyLoop

_exit:
	mov		byte [rdi], 0	; Put '\0' at the end of the string
	ret						; Return rax
