bits 64

; strlen - calculate the length of a string

global ft_strlen

ft_strlen:
	xor		rax, rax				; Init rax to 0 by comparing bits
	jmp		_countLoop				; Jump to loop subroutine

_countLoop:
	cmp		byte [rdi + rax], 0		; Compare 0 to one byte at current arg ptr pos
	jz		_exit					; If comparison true, jump to exit subroutine
	inc		rax						; Increment rax by one
	jmp		_countLoop				; Recursively call the same subroutine

_exit:
	ret								; Return rax
