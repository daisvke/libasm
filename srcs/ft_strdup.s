bits 64

; An implementation of strdup - duplicate a string

; char *strdup(const char *s)
;					<rdi>

extern malloc
extern ft_strlen
extern ft_strcpy

global ft_strdup

ft_strdup:
	; Prologue: save registers
	push	rbp
	mov		rbp, rsp
	
	push	rdi					; Save rdi (src str) by pushing it to the stack

	call	ft_strlen			; Get size of src string, res goes to rax
	add		rax, 1				; Add 1 to the size for the final \0
	mov		rdi, rax			; Assign size arg for malloc to rdi
	call	malloc wrt ..plt	; Call malloc with rdi = size as 1st arg
	test	rax, rax			; Result is 0 only if rax = 0 (rax AND rax)
	jz		fail_ret			; If res = 0, allocation failed => return

	pop		rsi					; Load pushed rdi (src string) into rbx
	mov		rdi, rax			; Load address of allocated memory into rdi
	call	ft_strcpy			; Call strcpy with rdi & rsi as arguments

	leave						; Pop back saved registers
	ret							; Return rax = copyied allocated string

fail_ret:
	leave
	ret							; Return value is rax = 0
