/* gcc -march=armv8-a bfm.c -g --save-temps -o bfm
   objdump -d -S bfm >bfm.asm
*/

#include <stdio.h>
#include <inttypes.h>

/* No AArch64 PC register */
uint64_t bitMove(uint64_t seed) {
/*  asm ( "BFI  W0, W0,  #9, #6" );
  asm ( "UBFX W1, W0, #18, #7" ); 
  asm ( "BFM  W0, WZR, #3, #4" ); 
  asm ( "MOV  W0, W1" ); */
/* 
NB: Little Endian
BFM  W1, WZR, #3, #4 Encodes as:
	ARM64 GDB/LLDB - 330313E1
But in memory shows as (bytes reversed!):
	ARM64 HEX - E1130333
*/
  asm ( "BFI  X0, XZR, #6, #8" ); /* #lsb, #width */
}

void main()
{ 
/* #xffffffffffff    281474976710655
   #x123456789ABCDEF 81985529216486895
*/
  uint64_t arg = 81985529216486895;
  uint64_t result = bitMove( arg ); /* 11292276 );*/
  printf( "\n   Arg is hex: %lx ", arg );
  printf( "\nBFI  X0, XZR, #6=startbit6, #8=width" );
  printf( "\nResult is hex: %lx \n", result );
}
