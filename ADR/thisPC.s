	.arch armv8-a
	.file	"thisPC.c"
	.text
	.align	2
	.global	pc_here
	.type	pc_here, %function
pc_here:
#APP
// 10 "thisPC.c" 1
	ADR X0, .
// 0 "" 2
#NO_APP
	nop
	ret
	.size	pc_here, .-pc_here
	.section	.rodata
	.align	3
.LC0:
	.string	"\nPC relative address (ADR) delta zero is %lu = 0x%lX \n\n"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	bl	pc_here
	str	x0, [x29, 24]
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	ldr	x2, [x29, 24]
	ldr	x1, [x29, 24]
	bl	printf
	nop
	ldp	x29, x30, [sp], 32
	ret
	.size	main, .-main
	.ident	"GCC: (Debian 6.3.0-18+deb9u1) 6.3.0 20170516"
	.section	.note.GNU-stack,"",@progbits
