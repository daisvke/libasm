bits 64

; An implementation of read - read from a file descriptor

; ssize_t read(int fd, void *buf, size_t count)
;				<rdi>	  <rsi>		<rdx>

SYS_READ	equ 0			; The syscall code for read

global ft_read
extern __errno_location

ft_read:
	; Prologue: save caller's stack pointers
	push	rbp
	mov		rbp, rsp
	; Callee-saved non-volatile registers
	push	rdi
	push	rsi
	push	rdx

	mov		rax, SYS_READ	; Set rax with read syscall
	syscall					; Call read
	cmp		rax, 0			; Compare read's return value to 0
	jl		fail_return		; If < 0, there's an error => return

return:
	; Epilogue: first, restore the non-volatile registers
	pop		rdx
	pop		rsi
	pop		rdi
	leave					; Restore saved stack pointers
	ret						; If no error, return rax that keeps
							; The nbr of chars printed by write

fail_return:
	neg		rax					; Convert negative error value from rax into a positive value.
								; This is necessary because the __errno_location function
								; Expects a positive error number to correctly set the errno variable.
	mov		r8, rax				; Save positive errno value into r8
	call	__errno_location	; This call stores into rax the address where errno is stored
    mov		[rax], r8			; Move the value of r8 to the memory location pointed to by rax
    mov		rax, -1				; Set the return value
	call	return
