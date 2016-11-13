/* File: semihost.S
 * Purpose: implements writing a character in the semihosting debug channel */

	.syntax	unified
	.arch	armv7-m

	.text
	.thumb
	.thumb_func
	.align	2
	.globl	SemiHost
	.type	SemiHost, %function

SemiHost:
	mov		r1,r0
	mov		r0,0x03	// SYS_WRITEC
	bkpt	0xab
	bx		lr

	.end
