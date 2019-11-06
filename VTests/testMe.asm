
testMe:     file format elf64-littleaarch64


Disassembly of section .init:

0000000000000690 <_init>:
 690:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 694:	910003fd 	mov	x29, sp
 698:	94000034 	bl	768 <call_weak_fn>
 69c:	a8c17bfd 	ldp	x29, x30, [sp], #16
 6a0:	d65f03c0 	ret

Disassembly of section .plt:

00000000000006b0 <.plt>:
 6b0:	a9bf7bf0 	stp	x16, x30, [sp, #-16]!
 6b4:	90000090 	adrp	x16, 10000 <__FRAME_END__+0xf614>
 6b8:	f947fe11 	ldr	x17, [x16, #4088]
 6bc:	913fe210 	add	x16, x16, #0xff8
 6c0:	d61f0220 	br	x17
 6c4:	d503201f 	nop
 6c8:	d503201f 	nop
 6cc:	d503201f 	nop

00000000000006d0 <__cxa_finalize@plt>:
 6d0:	b0000090 	adrp	x16, 11000 <__cxa_finalize@GLIBC_2.17>
 6d4:	f9400211 	ldr	x17, [x16]
 6d8:	91000210 	add	x16, x16, #0x0
 6dc:	d61f0220 	br	x17

00000000000006e0 <__libc_start_main@plt>:
 6e0:	b0000090 	adrp	x16, 11000 <__cxa_finalize@GLIBC_2.17>
 6e4:	f9400611 	ldr	x17, [x16, #8]
 6e8:	91002210 	add	x16, x16, #0x8
 6ec:	d61f0220 	br	x17

00000000000006f0 <__gmon_start__@plt>:
 6f0:	b0000090 	adrp	x16, 11000 <__cxa_finalize@GLIBC_2.17>
 6f4:	f9400a11 	ldr	x17, [x16, #16]
 6f8:	91004210 	add	x16, x16, #0x10
 6fc:	d61f0220 	br	x17

0000000000000700 <abort@plt>:
 700:	b0000090 	adrp	x16, 11000 <__cxa_finalize@GLIBC_2.17>
 704:	f9400e11 	ldr	x17, [x16, #24]
 708:	91006210 	add	x16, x16, #0x18
 70c:	d61f0220 	br	x17

0000000000000710 <puts@plt>:
 710:	b0000090 	adrp	x16, 11000 <__cxa_finalize@GLIBC_2.17>
 714:	f9401211 	ldr	x17, [x16, #32]
 718:	91008210 	add	x16, x16, #0x20
 71c:	d61f0220 	br	x17

0000000000000720 <printf@plt>:
 720:	b0000090 	adrp	x16, 11000 <__cxa_finalize@GLIBC_2.17>
 724:	f9401611 	ldr	x17, [x16, #40]
 728:	9100a210 	add	x16, x16, #0x28
 72c:	d61f0220 	br	x17

Disassembly of section .text:

0000000000000730 <_start>:
 730:	d280001d 	mov	x29, #0x0                   	// #0
 734:	d280001e 	mov	x30, #0x0                   	// #0
 738:	aa0003e5 	mov	x5, x0
 73c:	f94003e1 	ldr	x1, [sp]
 740:	910023e2 	add	x2, sp, #0x8
 744:	910003e6 	mov	x6, sp
 748:	90000080 	adrp	x0, 10000 <__FRAME_END__+0xf614>
 74c:	f947e800 	ldr	x0, [x0, #4048]
 750:	90000083 	adrp	x3, 10000 <__FRAME_END__+0xf614>
 754:	f947e463 	ldr	x3, [x3, #4040]
 758:	90000084 	adrp	x4, 10000 <__FRAME_END__+0xf614>
 75c:	f947d484 	ldr	x4, [x4, #4008]
 760:	97ffffe0 	bl	6e0 <__libc_start_main@plt>
 764:	97ffffe7 	bl	700 <abort@plt>

0000000000000768 <call_weak_fn>:
 768:	90000080 	adrp	x0, 10000 <__FRAME_END__+0xf614>
 76c:	f947e000 	ldr	x0, [x0, #4032]
 770:	b4000040 	cbz	x0, 778 <call_weak_fn+0x10>
 774:	17ffffdf 	b	6f0 <__gmon_start__@plt>
 778:	d65f03c0 	ret
 77c:	00000000 	.inst	0x00000000 ; undefined

0000000000000780 <deregister_tm_clones>:
 780:	b0000081 	adrp	x1, 11000 <__cxa_finalize@GLIBC_2.17>
 784:	b0000080 	adrp	x0, 11000 <__cxa_finalize@GLIBC_2.17>
 788:	91010021 	add	x1, x1, #0x40
 78c:	91010000 	add	x0, x0, #0x40
 790:	91001c21 	add	x1, x1, #0x7
 794:	cb000021 	sub	x1, x1, x0
 798:	f100383f 	cmp	x1, #0xe
 79c:	540000a9 	b.ls	7b0 <deregister_tm_clones+0x30>  // b.plast
 7a0:	90000081 	adrp	x1, 10000 <__FRAME_END__+0xf614>
 7a4:	f947d821 	ldr	x1, [x1, #4016]
 7a8:	b4000041 	cbz	x1, 7b0 <deregister_tm_clones+0x30>
 7ac:	d61f0020 	br	x1
 7b0:	d65f03c0 	ret
 7b4:	d503201f 	nop

00000000000007b8 <register_tm_clones>:
 7b8:	b0000081 	adrp	x1, 11000 <__cxa_finalize@GLIBC_2.17>
 7bc:	b0000080 	adrp	x0, 11000 <__cxa_finalize@GLIBC_2.17>
 7c0:	91010021 	add	x1, x1, #0x40
 7c4:	91010000 	add	x0, x0, #0x40
 7c8:	cb000021 	sub	x1, x1, x0
 7cc:	9343fc21 	asr	x1, x1, #3
 7d0:	8b41fc21 	add	x1, x1, x1, lsr #63
 7d4:	9341fc21 	asr	x1, x1, #1
 7d8:	b40000c1 	cbz	x1, 7f0 <register_tm_clones+0x38>
 7dc:	90000082 	adrp	x2, 10000 <__FRAME_END__+0xf614>
 7e0:	f947f042 	ldr	x2, [x2, #4064]
 7e4:	b4000062 	cbz	x2, 7f0 <register_tm_clones+0x38>
 7e8:	d61f0040 	br	x2
 7ec:	d503201f 	nop
 7f0:	d65f03c0 	ret
 7f4:	d503201f 	nop

00000000000007f8 <__do_global_dtors_aux>:
 7f8:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
 7fc:	910003fd 	mov	x29, sp
 800:	f9000bf3 	str	x19, [sp, #16]
 804:	b0000093 	adrp	x19, 11000 <__cxa_finalize@GLIBC_2.17>
 808:	39410260 	ldrb	w0, [x19, #64]
 80c:	35000140 	cbnz	w0, 834 <__do_global_dtors_aux+0x3c>
 810:	90000080 	adrp	x0, 10000 <__FRAME_END__+0xf614>
 814:	f947dc00 	ldr	x0, [x0, #4024]
 818:	b4000080 	cbz	x0, 828 <__do_global_dtors_aux+0x30>
 81c:	b0000080 	adrp	x0, 11000 <__cxa_finalize@GLIBC_2.17>
 820:	f9401c00 	ldr	x0, [x0, #56]
 824:	97ffffab 	bl	6d0 <__cxa_finalize@plt>
 828:	97ffffd6 	bl	780 <deregister_tm_clones>
 82c:	52800020 	mov	w0, #0x1                   	// #1
 830:	39010260 	strb	w0, [x19, #64]
 834:	f9400bf3 	ldr	x19, [sp, #16]
 838:	a8c27bfd 	ldp	x29, x30, [sp], #32
 83c:	d65f03c0 	ret

0000000000000840 <frame_dummy>:
 840:	90000080 	adrp	x0, 10000 <__FRAME_END__+0xf614>
 844:	9136e000 	add	x0, x0, #0xdb8
 848:	f9400001 	ldr	x1, [x0]
 84c:	b5000061 	cbnz	x1, 858 <frame_dummy+0x18>
 850:	17ffffda 	b	7b8 <register_tm_clones>
 854:	d503201f 	nop
 858:	90000081 	adrp	x1, 10000 <__FRAME_END__+0xf614>
 85c:	f947ec21 	ldr	x1, [x1, #4056]
 860:	b4ffff81 	cbz	x1, 850 <frame_dummy+0x10>
 864:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 868:	910003fd 	mov	x29, sp
 86c:	d63f0020 	blr	x1
 870:	a8c17bfd 	ldp	x29, x30, [sp], #16
 874:	17ffffd1 	b	7b8 <register_tm_clones>

0000000000000878 <stuffIt>:
#include "vicare-platform.h"
//include "vicare.h"

static struct ikpcb_t testPCB;
int stuffIt( struct ikpcb_t* pcb )
{
 878:	d10043ff 	sub	sp, sp, #0x10
 87c:	f90007e0 	str	x0, [sp, #8]
  pcb->allocation_pointer = (ikptr_t)  0;
 880:	f94007e0 	ldr	x0, [sp, #8]
 884:	f900001f 	str	xzr, [x0]
  pcb->allocation_redline = (ikptr_t)  8;
 888:	f94007e0 	ldr	x0, [sp, #8]
 88c:	d2800101 	mov	x1, #0x8                   	// #8
 890:	f9000401 	str	x1, [x0, #8]
  pcb->frame_pointer      = (ikptr_t) 16;
 894:	f94007e0 	ldr	x0, [sp, #8]
 898:	d2800201 	mov	x1, #0x10                  	// #16
 89c:	f9000801 	str	x1, [x0, #16]
  pcb->frame_base         = (ikptr_t) 24;
 8a0:	f94007e0 	ldr	x0, [sp, #8]
 8a4:	d2800301 	mov	x1, #0x18                  	// #24
 8a8:	f9000c01 	str	x1, [x0, #24]
  pcb->frame_redline      = (ikptr_t) 32;
 8ac:	f94007e0 	ldr	x0, [sp, #8]
 8b0:	d2800401 	mov	x1, #0x20                  	// #32
 8b4:	f9001001 	str	x1, [x0, #32]
  return( 0 );
 8b8:	52800000 	mov	w0, #0x0                   	// #0
}
 8bc:	910043ff 	add	sp, sp, #0x10
 8c0:	d65f03c0 	ret

00000000000008c4 <main>:

int main() {
 8c4:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 8c8:	910003fd 	mov	x29, sp
  stuffIt( &testPCB );
 8cc:	b0000080 	adrp	x0, 11000 <__cxa_finalize@GLIBC_2.17>
 8d0:	91012000 	add	x0, x0, #0x48
 8d4:	97ffffe9 	bl	878 <stuffIt>
  printf( "\n** redline    is %ld", (uint64_t)testPCB.allocation_redline );
 8d8:	b0000080 	adrp	x0, 11000 <__cxa_finalize@GLIBC_2.17>
 8dc:	91012000 	add	x0, x0, #0x48
 8e0:	f9400401 	ldr	x1, [x0, #8]
 8e4:	90000000 	adrp	x0, 0 <_init-0x690>
 8e8:	9126e000 	add	x0, x0, #0x9b8
 8ec:	97ffff8d 	bl	720 <printf@plt>
  printf( "\n** frame_base is %ld", (uint64_t)testPCB.frame_base );
 8f0:	b0000080 	adrp	x0, 11000 <__cxa_finalize@GLIBC_2.17>
 8f4:	91012000 	add	x0, x0, #0x48
 8f8:	f9400c01 	ldr	x1, [x0, #24]
 8fc:	90000000 	adrp	x0, 0 <_init-0x690>
 900:	91274000 	add	x0, x0, #0x9d0
 904:	97ffff87 	bl	720 <printf@plt>
  printf( "\n\n" );
 908:	90000000 	adrp	x0, 0 <_init-0x690>
 90c:	9127a000 	add	x0, x0, #0x9e8
 910:	97ffff80 	bl	710 <puts@plt>
  return( 0 );
 914:	52800000 	mov	w0, #0x0                   	// #0
}
 918:	a8c17bfd 	ldp	x29, x30, [sp], #16
 91c:	d65f03c0 	ret

0000000000000920 <__libc_csu_init>:
 920:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
 924:	910003fd 	mov	x29, sp
 928:	a9025bf5 	stp	x21, x22, [sp, #32]
 92c:	90000095 	adrp	x21, 10000 <__FRAME_END__+0xf614>
 930:	a90153f3 	stp	x19, x20, [sp, #16]
 934:	90000094 	adrp	x20, 10000 <__FRAME_END__+0xf614>
 938:	9136a2b5 	add	x21, x21, #0xda8
 93c:	9136c294 	add	x20, x20, #0xdb0
 940:	cb150294 	sub	x20, x20, x21
 944:	a90363f7 	stp	x23, x24, [sp, #48]
 948:	aa0203f6 	mov	x22, x2
 94c:	2a0003f8 	mov	w24, w0
 950:	aa0103f7 	mov	x23, x1
 954:	97ffff4f 	bl	690 <_init>
 958:	9343fe94 	asr	x20, x20, #3
 95c:	b4000154 	cbz	x20, 984 <__libc_csu_init+0x64>
 960:	d2800013 	mov	x19, #0x0                   	// #0
 964:	f8737aa3 	ldr	x3, [x21, x19, lsl #3]
 968:	aa1603e2 	mov	x2, x22
 96c:	aa1703e1 	mov	x1, x23
 970:	2a1803e0 	mov	w0, w24
 974:	91000673 	add	x19, x19, #0x1
 978:	d63f0060 	blr	x3
 97c:	eb13029f 	cmp	x20, x19
 980:	54ffff21 	b.ne	964 <__libc_csu_init+0x44>  // b.any
 984:	a94153f3 	ldp	x19, x20, [sp, #16]
 988:	a9425bf5 	ldp	x21, x22, [sp, #32]
 98c:	a94363f7 	ldp	x23, x24, [sp, #48]
 990:	a8c47bfd 	ldp	x29, x30, [sp], #64
 994:	d65f03c0 	ret

0000000000000998 <__libc_csu_fini>:
 998:	d65f03c0 	ret

Disassembly of section .fini:

000000000000099c <_fini>:
 99c:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 9a0:	910003fd 	mov	x29, sp
 9a4:	a8c17bfd 	ldp	x29, x30, [sp], #16
 9a8:	d65f03c0 	ret
