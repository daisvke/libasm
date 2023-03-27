bits 64

; An implementation of strcmp - compare two strings
; int ft_strcmp(const char *s1, const char *s2)

global ft_strcmp

ft_strcmp:
	movzx	rax, byte [rdi] ; Load 1st byte from rdi, zero extend into rax
	movzx	rbx, byte [rsi] ; Load 1st byte from rsi, zero extend into rbx
	sub		rax, rbx		; Compute the difference
	jne		_exit			; If result is 0, exit loop

	cmp		byte [rdi], 0	; Check if we arrived at the end of rdi
	je		_exit			; If true, exit from loop
	cmp		byte [rsi], 0	; Check if we arrived at the end of rsi
	je		_exit			; If true, exit from loop

	inc		rdi				; Incriment rdi 
	inc		rsi				; Incriment rsi
	jmp		ft_strcmp		; Call the same subroutine

_exit:
	ret						; Return rax
