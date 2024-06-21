bits 64

; An implementation of strdup - duplicate a string

; char *strdup(const char *s)
;					<rdi>

extern malloc
extern ft_strlen
extern ft_strcpy
extern __errno_location

global ft_strdup

ft_strdup:
	; Prologue: save caller's stack pointers
	push	rbp
	mov		rbp, rsp
	; Callee-saved non-volatile register
	push	rdi
	push	rdi					; Save rdi again for later use

	call	ft_strlen			; Get size of src string, res goes to rax
	add		rax, 1				; Add 1 to the size for the final \0
	mov		rdi, rax			; Assign size arg for malloc to rdi
	call	malloc wrt ..plt	; Call malloc with rdi = size as 1st arg
	test	rax, rax			; Result is 0 only if rax = 0 (rax AND rax)
	jz		fail_return				; If res = 0, allocation failed => return

	pop		rsi					; Load pushed rdi (src string) into rbx
	mov		rdi, rax			; Load address of allocated memory into rdi
	call	ft_strcpy			; Call strcpy with rdi & rsi as arguments

return:
	pop		rdi					; Restore rdi
	leave						; Restore saved stack pointers
	ret							; Return rax = copyied allocated string (or if err

fail_return:
	neg		rax					; Convert negative error value from rax into a positive value.
								; This is necessary because the __errno_location function
								; Expects a positive error number to correctly set the errno variable.
	mov		r8, rax				; Save positive errno value into r8
	call	__errno_location	; This call stores into rax the address where errno is stored
    mov		[rax], r8			; Move the value of r8 to the memory location pointed to by rax
	call	return
