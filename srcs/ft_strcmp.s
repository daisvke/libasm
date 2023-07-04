bits 64

; An implementation of strcmp - compare two strings

; int ft_strcmp(
;	const char *s1 <rdi>, const char *s2 <rsi>
; )

global ft_strcmp

ft_strcmp:
	movzx	rax, byte [rdi] ; Load 1st byte from rdi, zero extend into rax
	movzx	rbx, byte [rsi] ; Load 1st byte from rsi, zero extend into rbx
	sub		rax, rbx		; Compute the difference
	jne		exit			; If not equal, exit loop

	cmp		byte [rdi], 0	; Check if we arrived at the end of rdi
	je		exit			; If true, exit from loop
	cmp		byte [rsi], 0	; Check if we arrived at the end of rsi
	je		exit			; If true, exit from loop

	inc		rdi				; Incriment rdi 
	inc		rsi				; Incriment rsi
	jmp		ft_strcmp		; Call the same routine

exit:
	ret						; Return rax
