bits 64

; An implementation of strlen - calculate the length of a string

; int strcmp(
;	const char *s1 <rdi>, const char *s2 <rsi>
; )

global ft_strlen

ft_strlen:
	xor		rax, rax				; Init rax to 0 by comparing bits
	jmp		count_loop				; Jump to loop subroutine

count_loop:
	cmp		byte [rdi + rax], 0		; Compare 0 to one byte at current arg ptr pos
	jz		_exit					; If comparison true, jump to exit subroutine
	inc		rax						; Increment rax by one
	jmp		count_loop				; Recursively call the same subroutine

_exit:
	ret								; Return rax
