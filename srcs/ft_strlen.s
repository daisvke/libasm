bits 64

; An implementation of strlen - calculate the length of a string

; int strcmp(const char *s1 <rdi>, const char *s2)
;					rdi>				<rsi>

global ft_strlen

ft_strlen:
	; Prologue: save caller's stack pointers
	push	rbp
	mov		rbp, rsp

	xor		rax, rax				; Init rax to 0 by XORing bits
	jmp		count_loop				; Jump to loop subroutine

count_loop:
	cmp		byte [rdi + rax], 0		; Compare the current string position to 0
	jz		return					; If = 0, end of string => jump to return
	inc		rax						; Increment rax by one
	jmp		count_loop				; Continue loop

return:
	leave							; Restore saved stack pointers
	ret								; Return rax which contains the string length
