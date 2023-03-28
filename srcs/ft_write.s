bits 64

; write - write to a file descriptor
; ssize_t write(
;	int fd <rdi>, const void *buf <rsi>, size_t count <rdx>
; )

SYS_WRITE	equ 1			; The syscall code for write

global ft_write

ft_write:
	mov		rax, SYS_WRITE	; Set rax with write syscall
	syscall					; Call write 
	cmp		rax, 0			; Compare write's return value to 0
	jl		_exitOnError	; If < 0, there's an error => exit

	ret						; If no error, return rax that keeps
							; the nbr of chars printed by write
	
_exitOnError:
	mov		rax, -1			; If an error occured, return -1
	ret						; Return rax = -1
