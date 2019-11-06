/*
gcc -march=armv8-a -DHAVE_CONFIG_H -I.  -I/home/kendi3he/Scheme/VicareScheme/src -I/usr/local/lib64/libffi-3.2.1/include -Wall -D__ARM_ARCH_ISA_A64 -DARM64 -D__arm__ -D__arm64__ -D__aarch64__ testMe.c -g --save-temps -o testMe
objdump -d -S testMe >testMe.asm
*/
#include "stdio.h"
#include "config.h" /* local */
#include "internals.h"
#include "vicare-platform.h"
//include "vicare.h"

static struct ikpcb_t testPCB;
int stuffIt( struct ikpcb_t* pcb )
{
  pcb->allocation_pointer = (ikptr_t)  0;
  pcb->allocation_redline = (ikptr_t)  8;
  pcb->frame_pointer      = (ikptr_t) 16;
  pcb->frame_base         = (ikptr_t) 24;
  pcb->frame_redline      = (ikptr_t) 32;
  return( 0 );
}

int main() {
  stuffIt( &testPCB );
  printf( "\n** redline    is %ld", (uint64_t)testPCB.allocation_redline );
  printf( "\n** frame_base is %ld", (uint64_t)testPCB.frame_base );
  printf( "\n\n" );
  return( 0 );
}

