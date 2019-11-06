/* gcc -march=armv8-a thisPC.c --save-temps -o thisPC 
   objdump -d thisPC
*/

#include <stdio.h>
#include <inttypes.h>

/* No AArch64 PC register */
uint64_t pc_here() {
  asm ( "ADR X0, .") ;
}

void main()
{ 
  uint64_t pc_val = pc_here();
  printf( "\nPC relative address (ADR) delta zero is %lu = 0x%lX \n\n",  pc_val, pc_val );
}
