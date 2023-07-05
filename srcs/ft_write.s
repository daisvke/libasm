bits 64

; An implementation of write - write to a file descriptor

; ssize_t write(int fd, const void *buf, size_t count)
;				<rdi>		<rsi>			<rdx>

SYS_WRITE	equ 1			; The syscall code for write

global ft_write

ft_write:
	mov		rax, SYS_WRITE	; Set rax with write syscall
	syscall					; write syscall => sets rax to printed char
							; nbr or to -1 in case of error
	cmp		rax, 0			; Compare write's return value to 0
	jl		fail_ret		; If < 0, there's an error => return

	ret						; If no error, return rax that keeps
							; the nbr of chars printed by write
	
fail_ret:
	mov		rax, -1			; If an error occured, set rax to -1
	ret						; Return rax = -1
