## objdump -d hello

hello:     file format elf64-littleaarch64


Disassembly of section .text:

00000000004000b0 <_start>:
  4000b0:	d2800000 	mov	x0, #0x0                   	// #0
  4000b4:	580000e1 	ldr	x1, 4000d0 <_start+0x20>
  4000b8:	d2800182 	mov	x2, #0xc                   	// #12
  4000bc:	d2800808 	mov	x8, #0x40                  	// #64
  4000c0:	d4000001 	svc	#0x0
  4000c4:	d2800f60 	mov	x0, #0x7b                  	// #123
  4000c8:	d2800ba8 	mov	x8, #0x5d                  	// #93
  4000cc:	d4000001 	svc	#0x0
  4000d0:	004100d8 	.word	0x004100d8
  4000d4:	00000000 	.word	0x00000000
