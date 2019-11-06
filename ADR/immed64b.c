/* gcc -g -march=armv8-a immed64b.c --save-temps -o immed64b 
   objdump -d immed64b > immed64b.asm
*/

#include <stdio.h>
#include <inttypes.h>

/* No AArch64 PC register */
uint64_t da_test() {
  asm ( "b 12" ) ; /* br ahead: */
  asm ( "orn  x0, x8,  x2, lsl #4" )   ; /* AA221100 */
  asm ( "orn x29, x6, x27, asr #51 " ) ; /* AABBCCDD */
  /* ahead: */
  asm ( "ldr x0, #-8" ) ; /* load 64 bit literal -> x0 */
  /* and return */
}

void main()
{ 
  uint64_t pc_val = da_test();
  printf( "\nImmediate inline 64 is %lu = 0x%lX \n\n",  pc_val, pc_val );
}

/*
0000000000000838 <da_test>:
 838:	14000003 	b	844 <da_test+0xc>
 83c:	aa221100 	orn	x0, x8, x2, lsl #4
 840:	aabbccdd 	orn	x29, x6, x27, asr #51
 844:	58ffffc0 	ldr	x0, 83c <da_test+0x4>
 848:	d503201f 	nop
 84c:	d65f03c0 	ret
 >>> ./immed64 

 Immediate inline 64 is 12302652059506839808 = 0xAABBCCDDAA221100 

 */
