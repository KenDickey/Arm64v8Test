/* gcc -march=armv8-a timer.c -o timer */

#include <stdio.h>
#include <inttypes.h>

/* frequency timer reg is uint64 */
uint64_t virt_timer_value() {
  asm ( "MRS X0, CNTVCT_EL0") ;
}

void main()
{
  printf("\nVirtual Timer Value is %lu = 0x%lX \n\n",  virt_timer_value());
}
