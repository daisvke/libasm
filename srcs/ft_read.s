bits 64

; read - read from a file descriptor
; ssize_t read(
;	int fd <rdi>, void *buf <rsi>, size_t count <rdx>
; )

SYS_READ	equ 0			; The syscall code for read

global ft_read

ft_read:
	mov		rax, SYS_READ	; Set rax with read syscall
	syscall					; Call read
	cmp		rax, 0			; Compare read's return value to 0
	jl		_exitOnError	; If < 0, there's an error => exit

	ret						; If no error, return rax that keeps
							; the nbr of chars printed by write

_exitOnError:
	mov		rax, -1			; If an error occured, return -1
	ret						; Return rax = -1
