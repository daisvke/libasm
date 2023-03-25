bits 64

global ft_strlen

ft_strlen:
	xor		rax, rax
	jmp		_countLoop

_countLoop:
	cmp		byte [rdi + rax], 0
	jz		_exit
	inc		rax
	jmp		_countLoop

_exit:
	ret
