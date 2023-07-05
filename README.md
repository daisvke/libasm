# libasm

## Description

This project is about creating an asm library called libasm.a.<br />
It contains implementations of the following functions in asm with Intel syntax:
<br /><br />
◦ ft_strlen (man 3 strlen)<br />
◦ ft_strcpy (man 3 strcpy)<br />
◦ ft_strcmp (man 3 strcmp)<br />
◦ ft_write (man 2 write)<br />
◦ ft_read (man 2 read)<br />
◦ ft_strdup (man 3 strdup)

Caller-saved (volatile) registers

According to the Intel ABI to which the vast majority of compilers conform, the EAX, EDX, and ECX are to be free for use within a procedure or function, and need not be preserved[citation needed].

As the name implies, these general-purpose registers usually hold temporary (volatile) information, that can be overwritten by any subroutine.

Therefore, it is the caller's responsibility to push each of these registers onto the stack, if it would like to restore their values after a subroutine call.
Callee-saved (non-volatile) registers

The other registers are used to hold long-lived values (non-volatile), that should be preserved across calls.

In other words, when the caller makes a procedure call, it can expect that those registers will hold the same value after the callee returns.

Thus, making it the callee's responsibility to both save (push at the beginning) and restore (pop accordingly) them before returning to the caller. As in the previous case, this practice should only be done on registers that the callee changes. 

Register preservation
Another part of a calling convention is which registers are guaranteed to retain their values after a subroutine call. 
The registers RAX, RCX, RDX, R8, R9, R10, R11 are considered volatile (caller-saved).[25]

The registers RBX, RBP, RDI, RSI, RSP, R12, R13, R14, and R15 are considered nonvolatile (callee-saved)
