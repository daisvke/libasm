bits 64

; An implementation of read - read from a file descriptor

; ssize_t read(int fd, void *buf, size_t count)
;				<rdi>	  <rsi>		<rdx>

SYS_READ	equ 0			; The syscall code for read

global ft_read

ft_read:
	; Prologue: save caller's stack pointers
	push	rbp
	mov		rbp, rsp

	mov		rax, SYS_READ	; Set rax with read syscall
	syscall					; Call read
	cmp		rax, 0			; Compare read's return value to 0
	jl		fail_ret		; If < 0, there's an error => return

	leave					; Restore saved stack pointers
	ret						; If no error, return rax that keeps
							; the nbr of chars read by read

fail_ret:
	mov		rax, -1			; If an error occured, return -1
	leave					; Restore saved stack pointers
	ret						; Return rax = -1
