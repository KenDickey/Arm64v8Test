## from objdump timer -d -S >timer.asm

timer:     file format elf64-littleaarch64


Disassembly of section .init:

0000000000000660 <_init>:
 660:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 664:	910003fd 	mov	x29, sp
 668:	94000030 	bl	728 <call_weak_fn>
 66c:	a8c17bfd 	ldp	x29, x30, [sp], #16
 670:	d65f03c0 	ret

Disassembly of section .plt:

0000000000000680 <.plt>:
 680:	a9bf7bf0 	stp	x16, x30, [sp, #-16]!
 684:	90000090 	adrp	x16, 10000 <__FRAME_END__+0xf6d0>
 688:	f947fe11 	ldr	x17, [x16, #4088]
 68c:	913fe210 	add	x16, x16, #0xff8
 690:	d61f0220 	br	x17
 694:	d503201f 	nop
 698:	d503201f 	nop
 69c:	d503201f 	nop

00000000000006a0 <__cxa_finalize@plt>:
 6a0:	b0000090 	adrp	x16, 11000 <__cxa_finalize@GLIBC_2.17>
 6a4:	f9400211 	ldr	x17, [x16]
 6a8:	91000210 	add	x16, x16, #0x0
 6ac:	d61f0220 	br	x17

00000000000006b0 <__libc_start_main@plt>:
 6b0:	b0000090 	adrp	x16, 11000 <__cxa_finalize@GLIBC_2.17>
 6b4:	f9400611 	ldr	x17, [x16, #8]
 6b8:	91002210 	add	x16, x16, #0x8
 6bc:	d61f0220 	br	x17

00000000000006c0 <__gmon_start__@plt>:
 6c0:	b0000090 	adrp	x16, 11000 <__cxa_finalize@GLIBC_2.17>
 6c4:	f9400a11 	ldr	x17, [x16, #16]
 6c8:	91004210 	add	x16, x16, #0x10
 6cc:	d61f0220 	br	x17

00000000000006d0 <abort@plt>:
 6d0:	b0000090 	adrp	x16, 11000 <__cxa_finalize@GLIBC_2.17>
 6d4:	f9400e11 	ldr	x17, [x16, #24]
 6d8:	91006210 	add	x16, x16, #0x18
 6dc:	d61f0220 	br	x17

00000000000006e0 <printf@plt>:
 6e0:	b0000090 	adrp	x16, 11000 <__cxa_finalize@GLIBC_2.17>
 6e4:	f9401211 	ldr	x17, [x16, #32]
 6e8:	91008210 	add	x16, x16, #0x20
 6ec:	d61f0220 	br	x17

Disassembly of section .text:

00000000000006f0 <_start>:
 6f0:	d280001d 	mov	x29, #0x0                   	// #0
 6f4:	d280001e 	mov	x30, #0x0                   	// #0
 6f8:	aa0003e5 	mov	x5, x0
 6fc:	f94003e1 	ldr	x1, [sp]
 700:	910023e2 	add	x2, sp, #0x8
 704:	910003e6 	mov	x6, sp
 708:	90000080 	adrp	x0, 10000 <__FRAME_END__+0xf6d0>
 70c:	f947e800 	ldr	x0, [x0, #4048]
 710:	90000083 	adrp	x3, 10000 <__FRAME_END__+0xf6d0>
 714:	f947e463 	ldr	x3, [x3, #4040]
 718:	90000084 	adrp	x4, 10000 <__FRAME_END__+0xf6d0>
 71c:	f947d484 	ldr	x4, [x4, #4008]
 720:	97ffffe4 	bl	6b0 <__libc_start_main@plt>
 724:	97ffffeb 	bl	6d0 <abort@plt>

0000000000000728 <call_weak_fn>:
 728:	90000080 	adrp	x0, 10000 <__FRAME_END__+0xf6d0>
 72c:	f947e000 	ldr	x0, [x0, #4032]
 730:	b4000040 	cbz	x0, 738 <call_weak_fn+0x10>
 734:	17ffffe3 	b	6c0 <__gmon_start__@plt>
 738:	d65f03c0 	ret
 73c:	00000000 	.inst	0x00000000 ; undefined

0000000000000740 <deregister_tm_clones>:
 740:	b0000081 	adrp	x1, 11000 <__cxa_finalize@GLIBC_2.17>
 744:	b0000080 	adrp	x0, 11000 <__cxa_finalize@GLIBC_2.17>
 748:	9100e021 	add	x1, x1, #0x38
 74c:	9100e000 	add	x0, x0, #0x38
 750:	91001c21 	add	x1, x1, #0x7
 754:	cb000021 	sub	x1, x1, x0
 758:	f100383f 	cmp	x1, #0xe
 75c:	540000a9 	b.ls	770 <deregister_tm_clones+0x30>  // b.plast
 760:	90000081 	adrp	x1, 10000 <__FRAME_END__+0xf6d0>
 764:	f947d821 	ldr	x1, [x1, #4016]
 768:	b4000041 	cbz	x1, 770 <deregister_tm_clones+0x30>
 76c:	d61f0020 	br	x1
 770:	d65f03c0 	ret
 774:	d503201f 	nop

0000000000000778 <register_tm_clones>:
 778:	b0000081 	adrp	x1, 11000 <__cxa_finalize@GLIBC_2.17>
 77c:	b0000080 	adrp	x0, 11000 <__cxa_finalize@GLIBC_2.17>
 780:	9100e021 	add	x1, x1, #0x38
 784:	9100e000 	add	x0, x0, #0x38
 788:	cb000021 	sub	x1, x1, x0
 78c:	9343fc21 	asr	x1, x1, #3
 790:	8b41fc21 	add	x1, x1, x1, lsr #63
 794:	9341fc21 	asr	x1, x1, #1
 798:	b40000c1 	cbz	x1, 7b0 <register_tm_clones+0x38>
 79c:	90000082 	adrp	x2, 10000 <__FRAME_END__+0xf6d0>
 7a0:	f947f042 	ldr	x2, [x2, #4064]
 7a4:	b4000062 	cbz	x2, 7b0 <register_tm_clones+0x38>
 7a8:	d61f0040 	br	x2
 7ac:	d503201f 	nop
 7b0:	d65f03c0 	ret
 7b4:	d503201f 	nop

00000000000007b8 <__do_global_dtors_aux>:
 7b8:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
 7bc:	910003fd 	mov	x29, sp
 7c0:	f9000bf3 	str	x19, [sp, #16]
 7c4:	b0000093 	adrp	x19, 11000 <__cxa_finalize@GLIBC_2.17>
 7c8:	3940e260 	ldrb	w0, [x19, #56]
 7cc:	35000140 	cbnz	w0, 7f4 <__do_global_dtors_aux+0x3c>
 7d0:	90000080 	adrp	x0, 10000 <__FRAME_END__+0xf6d0>
 7d4:	f947dc00 	ldr	x0, [x0, #4024]
 7d8:	b4000080 	cbz	x0, 7e8 <__do_global_dtors_aux+0x30>
 7dc:	b0000080 	adrp	x0, 11000 <__cxa_finalize@GLIBC_2.17>
 7e0:	f9401800 	ldr	x0, [x0, #48]
 7e4:	97ffffaf 	bl	6a0 <__cxa_finalize@plt>
 7e8:	97ffffd6 	bl	740 <deregister_tm_clones>
 7ec:	52800020 	mov	w0, #0x1                   	// #1
 7f0:	3900e260 	strb	w0, [x19, #56]
 7f4:	f9400bf3 	ldr	x19, [sp, #16]
 7f8:	a8c27bfd 	ldp	x29, x30, [sp], #32
 7fc:	d65f03c0 	ret

0000000000000800 <frame_dummy>:
 800:	90000080 	adrp	x0, 10000 <__FRAME_END__+0xf6d0>
 804:	9136e000 	add	x0, x0, #0xdb8
 808:	f9400001 	ldr	x1, [x0]
 80c:	b5000061 	cbnz	x1, 818 <frame_dummy+0x18>
 810:	17ffffda 	b	778 <register_tm_clones>
 814:	d503201f 	nop
 818:	90000081 	adrp	x1, 10000 <__FRAME_END__+0xf6d0>
 81c:	f947ec21 	ldr	x1, [x1, #4056]
 820:	b4ffff81 	cbz	x1, 810 <frame_dummy+0x10>
 824:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 828:	910003fd 	mov	x29, sp
 82c:	d63f0020 	blr	x1
 830:	a8c17bfd 	ldp	x29, x30, [sp], #16
 834:	17ffffd1 	b	778 <register_tm_clones>

0000000000000838 <virt_timer_value>:
 838:	d53be040 	mrs	x0, cntvct_el0
###(number->string #xd53be040 2)
### "11010101001110111110000001000000"
#;;; 1101010100L1OOp1CRn-CRm-Op2Rtttt
#;; ;10987654321098765432109876543210


 83c:	d503201f 	nop
 840:	d65f03c0 	ret

0000000000000844 <main>:
 844:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 848:	910003fd 	mov	x29, sp
 84c:	97fffffb 	bl	838 <virt_timer_value>
 850:	aa0003e1 	mov	x1, x0
 854:	90000000 	adrp	x0, 0 <_init-0x660>
 858:	91242000 	add	x0, x0, #0x908
 85c:	97ffffa1 	bl	6e0 <printf@plt>
 860:	d503201f 	nop
 864:	a8c17bfd 	ldp	x29, x30, [sp], #16
 868:	d65f03c0 	ret
 86c:	00000000 	.inst	0x00000000 ; undefined

0000000000000870 <__libc_csu_init>:
 870:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
 874:	910003fd 	mov	x29, sp
 878:	a9025bf5 	stp	x21, x22, [sp, #32]
 87c:	90000095 	adrp	x21, 10000 <__FRAME_END__+0xf6d0>
 880:	a90153f3 	stp	x19, x20, [sp, #16]
 884:	90000094 	adrp	x20, 10000 <__FRAME_END__+0xf6d0>
 888:	9136a2b5 	add	x21, x21, #0xda8
 88c:	9136c294 	add	x20, x20, #0xdb0
 890:	cb150294 	sub	x20, x20, x21
 894:	a90363f7 	stp	x23, x24, [sp, #48]
 898:	aa0203f6 	mov	x22, x2
 89c:	2a0003f8 	mov	w24, w0
 8a0:	aa0103f7 	mov	x23, x1
 8a4:	97ffff6f 	bl	660 <_init>
 8a8:	9343fe94 	asr	x20, x20, #3
 8ac:	b4000154 	cbz	x20, 8d4 <__libc_csu_init+0x64>
 8b0:	d2800013 	mov	x19, #0x0                   	// #0
 8b4:	f8737aa3 	ldr	x3, [x21, x19, lsl #3]
 8b8:	aa1603e2 	mov	x2, x22
 8bc:	aa1703e1 	mov	x1, x23
 8c0:	2a1803e0 	mov	w0, w24
 8c4:	91000673 	add	x19, x19, #0x1
 8c8:	d63f0060 	blr	x3
 8cc:	eb13029f 	cmp	x20, x19
 8d0:	54ffff21 	b.ne	8b4 <__libc_csu_init+0x44>  // b.any
 8d4:	a94153f3 	ldp	x19, x20, [sp, #16]
 8d8:	a9425bf5 	ldp	x21, x22, [sp, #32]
 8dc:	a94363f7 	ldp	x23, x24, [sp, #48]
 8e0:	a8c47bfd 	ldp	x29, x30, [sp], #64
 8e4:	d65f03c0 	ret

00000000000008e8 <__libc_csu_fini>:
 8e8:	d65f03c0 	ret

Disassembly of section .fini:

00000000000008ec <_fini>:
 8ec:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 8f0:	910003fd 	mov	x29, sp
 8f4:	a8c17bfd 	ldp	x29, x30, [sp], #16
 8f8:	d65f03c0 	ret
