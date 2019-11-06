	.arch armv8-a
	.file	"timer.c"
	.text
	.align	2
	.global	virt_timer_value
	.type	virt_timer_value, %function
virt_timer_value:
#APP
// 8 "timer.c" 1
	MRS X0, CNTVCT_EL0
// 0 "" 2
#NO_APP
	nop
	ret
	.size	virt_timer_value, .-virt_timer_value
	.section	.rodata
	.align	3
.LC0:
	.string	"\nVirtual Timer Value is %lu = 0x%lX \n\n"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	bl	virt_timer_value
	mov	x1, x0
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	bl	printf
	nop
	ldp	x29, x30, [sp], 16
	ret
	.size	main, .-main
	.ident	"GCC: (Debian 6.3.0-18+deb9u1) 6.3.0 20170516"
	.section	.note.GNU-stack,"",@progbits
