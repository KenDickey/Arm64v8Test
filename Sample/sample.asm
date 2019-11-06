
sample:     file format elf64-littleaarch64


Disassembly of section .init:

0000000000000620 <_init>:
 620:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 624:	910003fd 	mov	x29, sp
 628:	9400002c 	bl	6d8 <call_weak_fn>
 62c:	a8c17bfd 	ldp	x29, x30, [sp], #16
 630:	d65f03c0 	ret

Disassembly of section .plt:

0000000000000640 <.plt>:
 640:	a9bf7bf0 	stp	x16, x30, [sp, #-16]!
 644:	90000090 	adrp	x16, 10000 <__FRAME_END__+0xf6f8>
 648:	f947fe11 	ldr	x17, [x16, #4088]
 64c:	913fe210 	add	x16, x16, #0xff8
 650:	d61f0220 	br	x17
 654:	d503201f 	nop
 658:	d503201f 	nop
 65c:	d503201f 	nop

0000000000000660 <__cxa_finalize@plt>:
 660:	b0000090 	adrp	x16, 11000 <__cxa_finalize@GLIBC_2.17>
 664:	f9400211 	ldr	x17, [x16]
 668:	91000210 	add	x16, x16, #0x0
 66c:	d61f0220 	br	x17

0000000000000670 <__libc_start_main@plt>:
 670:	b0000090 	adrp	x16, 11000 <__cxa_finalize@GLIBC_2.17>
 674:	f9400611 	ldr	x17, [x16, #8]
 678:	91002210 	add	x16, x16, #0x8
 67c:	d61f0220 	br	x17

0000000000000680 <__gmon_start__@plt>:
 680:	b0000090 	adrp	x16, 11000 <__cxa_finalize@GLIBC_2.17>
 684:	f9400a11 	ldr	x17, [x16, #16]
 688:	91004210 	add	x16, x16, #0x10
 68c:	d61f0220 	br	x17

0000000000000690 <abort@plt>:
 690:	b0000090 	adrp	x16, 11000 <__cxa_finalize@GLIBC_2.17>
 694:	f9400e11 	ldr	x17, [x16, #24]
 698:	91006210 	add	x16, x16, #0x18
 69c:	d61f0220 	br	x17

Disassembly of section .text:

00000000000006a0 <_start>:
 6a0:	d280001d 	mov	x29, #0x0                   	// #0
 6a4:	d280001e 	mov	x30, #0x0                   	// #0
 6a8:	aa0003e5 	mov	x5, x0
 6ac:	f94003e1 	ldr	x1, [sp]
 6b0:	910023e2 	add	x2, sp, #0x8
 6b4:	910003e6 	mov	x6, sp
 6b8:	90000080 	adrp	x0, 10000 <__FRAME_END__+0xf6f8>
 6bc:	f947e800 	ldr	x0, [x0, #4048]
 6c0:	90000083 	adrp	x3, 10000 <__FRAME_END__+0xf6f8>
 6c4:	f947e463 	ldr	x3, [x3, #4040]
 6c8:	90000084 	adrp	x4, 10000 <__FRAME_END__+0xf6f8>
 6cc:	f947d484 	ldr	x4, [x4, #4008]
 6d0:	97ffffe8 	bl	670 <__libc_start_main@plt>
 6d4:	97ffffef 	bl	690 <abort@plt>

00000000000006d8 <call_weak_fn>:
 6d8:	90000080 	adrp	x0, 10000 <__FRAME_END__+0xf6f8>
 6dc:	f947e000 	ldr	x0, [x0, #4032]
 6e0:	b4000040 	cbz	x0, 6e8 <call_weak_fn+0x10>
 6e4:	17ffffe7 	b	680 <__gmon_start__@plt>
 6e8:	d65f03c0 	ret
 6ec:	00000000 	.inst	0x00000000 ; undefined

00000000000006f0 <deregister_tm_clones>:
 6f0:	b0000081 	adrp	x1, 11000 <__cxa_finalize@GLIBC_2.17>
 6f4:	b0000080 	adrp	x0, 11000 <__cxa_finalize@GLIBC_2.17>
 6f8:	91016021 	add	x1, x1, #0x58
 6fc:	91016000 	add	x0, x0, #0x58
 700:	91001c21 	add	x1, x1, #0x7
 704:	cb000021 	sub	x1, x1, x0
 708:	f100383f 	cmp	x1, #0xe
 70c:	540000a9 	b.ls	720 <deregister_tm_clones+0x30>  // b.plast
 710:	90000081 	adrp	x1, 10000 <__FRAME_END__+0xf6f8>
 714:	f947d821 	ldr	x1, [x1, #4016]
 718:	b4000041 	cbz	x1, 720 <deregister_tm_clones+0x30>
 71c:	d61f0020 	br	x1
 720:	d65f03c0 	ret
 724:	d503201f 	nop

0000000000000728 <register_tm_clones>:
 728:	b0000081 	adrp	x1, 11000 <__cxa_finalize@GLIBC_2.17>
 72c:	b0000080 	adrp	x0, 11000 <__cxa_finalize@GLIBC_2.17>
 730:	91016021 	add	x1, x1, #0x58
 734:	91016000 	add	x0, x0, #0x58
 738:	cb000021 	sub	x1, x1, x0
 73c:	9343fc21 	asr	x1, x1, #3
 740:	8b41fc21 	add	x1, x1, x1, lsr #63
 744:	9341fc21 	asr	x1, x1, #1
 748:	b40000c1 	cbz	x1, 760 <register_tm_clones+0x38>
 74c:	90000082 	adrp	x2, 10000 <__FRAME_END__+0xf6f8>
 750:	f947f042 	ldr	x2, [x2, #4064]
 754:	b4000062 	cbz	x2, 760 <register_tm_clones+0x38>
 758:	d61f0040 	br	x2
 75c:	d503201f 	nop
 760:	d65f03c0 	ret
 764:	d503201f 	nop

0000000000000768 <__do_global_dtors_aux>:
 768:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
 76c:	910003fd 	mov	x29, sp
 770:	f9000bf3 	str	x19, [sp, #16]
 774:	b0000093 	adrp	x19, 11000 <__cxa_finalize@GLIBC_2.17>
 778:	39416260 	ldrb	w0, [x19, #88]
 77c:	35000140 	cbnz	w0, 7a4 <__do_global_dtors_aux+0x3c>
 780:	90000080 	adrp	x0, 10000 <__FRAME_END__+0xf6f8>
 784:	f947dc00 	ldr	x0, [x0, #4024]
 788:	b4000080 	cbz	x0, 798 <__do_global_dtors_aux+0x30>
 78c:	b0000080 	adrp	x0, 11000 <__cxa_finalize@GLIBC_2.17>
 790:	f9401400 	ldr	x0, [x0, #40]
 794:	97ffffb3 	bl	660 <__cxa_finalize@plt>
 798:	97ffffd6 	bl	6f0 <deregister_tm_clones>
 79c:	52800020 	mov	w0, #0x1                   	// #1
 7a0:	39016260 	strb	w0, [x19, #88]
 7a4:	f9400bf3 	ldr	x19, [sp, #16]
 7a8:	a8c27bfd 	ldp	x29, x30, [sp], #32
 7ac:	d65f03c0 	ret

00000000000007b0 <frame_dummy>:
 7b0:	90000080 	adrp	x0, 10000 <__FRAME_END__+0xf6f8>
 7b4:	9136e000 	add	x0, x0, #0xdb8
 7b8:	f9400001 	ldr	x1, [x0]
 7bc:	b5000061 	cbnz	x1, 7c8 <frame_dummy+0x18>
 7c0:	17ffffda 	b	728 <register_tm_clones>
 7c4:	d503201f 	nop
 7c8:	90000081 	adrp	x1, 10000 <__FRAME_END__+0xf6f8>
 7cc:	f947ec21 	ldr	x1, [x1, #4056]
 7d0:	b4ffff81 	cbz	x1, 7c0 <frame_dummy+0x10>
 7d4:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 7d8:	910003fd 	mov	x29, sp
 7dc:	d63f0020 	blr	x1
 7e0:	a8c17bfd 	ldp	x29, x30, [sp], #16
 7e4:	17ffffd1 	b	728 <register_tm_clones>

00000000000007e8 <main>:
#include "stdio.h"
static int v[] = {1,2,3,4,5,6,7,8,9,10};
void print(int i);
int add(int v, int t);
int main() {
 7e8:	a9bb7bfd 	stp	x29, x30, [sp, #-80]!
 7ec:	910003fd 	mov	x29, sp
 7f0:	f9000bf3 	str	x19, [sp, #16]
int i;
int array[10];
for(i=0; i < 10; i++)
 7f4:	b9004fbf 	str	wzr, [x29, #76]
 7f8:	14000010 	b	838 <main+0x50>
array[i] = v[i] * (add(i,5));
 7fc:	b0000080 	adrp	x0, 11000 <__cxa_finalize@GLIBC_2.17>
 800:	9100c000 	add	x0, x0, #0x30
 804:	b9804fa1 	ldrsw	x1, [x29, #76]
 808:	b8617813 	ldr	w19, [x0, x1, lsl #2]
 80c:	528000a1 	mov	w1, #0x5                   	// #5
 810:	b9404fa0 	ldr	w0, [x29, #76]
 814:	94000010 	bl	854 <add>
 818:	1b007e62 	mul	w2, w19, w0
 81c:	b9804fa0 	ldrsw	x0, [x29, #76]
 820:	d37ef400 	lsl	x0, x0, #2
 824:	910083a1 	add	x1, x29, #0x20
 828:	b8206822 	str	w2, [x1, x0]
for(i=0; i < 10; i++)
 82c:	b9404fa0 	ldr	w0, [x29, #76]
 830:	11000400 	add	w0, w0, #0x1
 834:	b9004fa0 	str	w0, [x29, #76]
 838:	b9404fa0 	ldr	w0, [x29, #76]
 83c:	7100241f 	cmp	w0, #0x9
 840:	54fffded 	b.le	7fc <main+0x14>
return 0;
 844:	52800000 	mov	w0, #0x0                   	// #0
}
 848:	f9400bf3 	ldr	x19, [sp, #16]
 84c:	a8c57bfd 	ldp	x29, x30, [sp], #80
 850:	d65f03c0 	ret

0000000000000854 <add>:
int add(int v, int t) {
 854:	d10043ff 	sub	sp, sp, #0x10
 858:	b9000fe0 	str	w0, [sp, #12]
 85c:	b9000be1 	str	w1, [sp, #8]
 return v + t;
 860:	b9400fe1 	ldr	w1, [sp, #12]
 864:	b9400be0 	ldr	w0, [sp, #8]
 868:	0b000020 	add	w0, w1, w0
}
 86c:	910043ff 	add	sp, sp, #0x10
 870:	d65f03c0 	ret
 874:	00000000 	.inst	0x00000000 ; undefined

0000000000000878 <__libc_csu_init>:
 878:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
 87c:	910003fd 	mov	x29, sp
 880:	a9025bf5 	stp	x21, x22, [sp, #32]
 884:	90000095 	adrp	x21, 10000 <__FRAME_END__+0xf6f8>
 888:	a90153f3 	stp	x19, x20, [sp, #16]
 88c:	90000094 	adrp	x20, 10000 <__FRAME_END__+0xf6f8>
 890:	9136a2b5 	add	x21, x21, #0xda8
 894:	9136c294 	add	x20, x20, #0xdb0
 898:	cb150294 	sub	x20, x20, x21
 89c:	a90363f7 	stp	x23, x24, [sp, #48]
 8a0:	aa0203f6 	mov	x22, x2
 8a4:	2a0003f8 	mov	w24, w0
 8a8:	aa0103f7 	mov	x23, x1
 8ac:	97ffff5d 	bl	620 <_init>
 8b0:	9343fe94 	asr	x20, x20, #3
 8b4:	b4000154 	cbz	x20, 8dc <__libc_csu_init+0x64>
 8b8:	d2800013 	mov	x19, #0x0                   	// #0
 8bc:	f8737aa3 	ldr	x3, [x21, x19, lsl #3]
 8c0:	aa1603e2 	mov	x2, x22
 8c4:	aa1703e1 	mov	x1, x23
 8c8:	2a1803e0 	mov	w0, w24
 8cc:	91000673 	add	x19, x19, #0x1
 8d0:	d63f0060 	blr	x3
 8d4:	eb13029f 	cmp	x20, x19
 8d8:	54ffff21 	b.ne	8bc <__libc_csu_init+0x44>  // b.any
 8dc:	a94153f3 	ldp	x19, x20, [sp, #16]
 8e0:	a9425bf5 	ldp	x21, x22, [sp, #32]
 8e4:	a94363f7 	ldp	x23, x24, [sp, #48]
 8e8:	a8c47bfd 	ldp	x29, x30, [sp], #64
 8ec:	d65f03c0 	ret

00000000000008f0 <__libc_csu_fini>:
 8f0:	d65f03c0 	ret

Disassembly of section .fini:

00000000000008f4 <_fini>:
 8f4:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 8f8:	910003fd 	mov	x29, sp
 8fc:	a8c17bfd 	ldp	x29, x30, [sp], #16
 900:	d65f03c0 	ret
