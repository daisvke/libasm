bits 64

; An implementation of write - write to a file descriptor

; ssize_t write(int fd, const void *buf, size_t count)
;				<rdi>		<rsi>			<rdx>

SYS_WRITE	equ 1			; The syscall code for write

global ft_write
extern __errno_location

ft_write:
	; Prologue: save caller's stack pointers
	push	rbp
	mov		rbp, rsp

	mov		rax, SYS_WRITE	; Set rax with write syscall
	syscall					; write syscall => sets rax to printed char
							; nbr or to -1 in case of error
	cmp		rax, 0			; Compare write's return value to 0
	jl		fail_return		; If < 0, there's an error => return

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
	leave						; Restore saved stack pointers
    ret
