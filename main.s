bits 64

SYS_WRITE	equ 1
STDOUT		equ 1
SYS_EXIT	equ 60

extern ft_strlen

section .data
	txt1	db "abc", 10, 0

section .bss
	len		resb 1

section .text
	global	_start

%macro exit 0
	mov	rax, SYS_EXIT
	mov	rdi, 0
	syscall
	ret
%endmacro

_start:
	mov		rdi, txt1
	call	ft_strlen
	call	_printDigit

	exit

_printDigit:
	add		rax, 48
	mov		[len], rax

	mov		rax, SYS_WRITE
	mov		rdi, STDOUT
	mov		rsi, len
	mov		rdx, 1

	syscall
	ret
