bits 64

; An implementation of strcmp - compare two strings

; int ft_strcmp(const char *s1, const char *s2)
; 					<rdi>			<rsi>

global ft_strcmp

ft_strcmp:
	; Prologue: first, save caller's stack pointers
	push	rbp
	mov		rbp, rsp
	push	rdi
	push	rsi

cmp_loop:
	movzx	rax, byte [rdi] ; Load 1st byte from rdi, zero extend into rax
	movzx	rbx, byte [rsi] ; Load 1st byte from rsi, zero extend into rbx

	sub		rax, rbx		; Compute the difference
	jne		return			; If not equal, exit loop

	cmp		byte [rdi], 0	; Check if we arrived at the end of rdi
	je		return			; If true, return from loop
	cmp		byte [rsi], 0	; Check if we arrived at the end of rsi
	je		return			; If true, return from loop

	inc		rdi				; Incriment rdi 
	inc		rsi				; Incriment rsi
	jmp		cmp_loop		; Call the same routine

return:
	; Restore registers
	pop		rsi
	pop		rdi
	; Restore the saved stack pointers' values (mov rsp, rbp ; pop rbp)
	leave
	ret						; Return rax
