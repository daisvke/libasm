bits 64

; An implementation of strdup - duplicate a string

; char *strdup(const char *s <rdi>)

extern malloc
extern ft_strlen
extern ft_strcpy

global ft_strdup

ft_strdup:
	call	ft_strlen
	add		rax, 1
	push	rdi
	mov		rdi, rax
	call	malloc wrt ..plt
	test	rax, rax
	jz		fail_exit
	pop		rbx
	mov		rdi, rax
	mov		rsi, rbx
	call	ft_strcpy
	ret

fail_exit:
	ret
