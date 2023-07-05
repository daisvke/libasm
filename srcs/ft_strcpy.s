bits 64

; An implementation of strcpy - copy a string

; char *strcpy(const char *dest, const char *src)
;					<rdi>			<rsi>

global ft_strcpy:

ft_strcpy:
	mov		rax, rdi		; Copy the address of rdi (dest) to rax (return value)
	jmp		cpy_loop		; Jump to loop subroutine
	
cpy_loop:
	cmp		byte [rsi], 0	; Compare 0 to the first byte in rsi (contains 2nd arg)
	je		return
	movsb					; Move 1 byte from RSI to RDI and increment both
	jmp		cpy_loop

return:
	mov		byte [rdi], 0	; Put '\0' at the end of the string
	ret						; Return rax
