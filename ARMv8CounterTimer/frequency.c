/* gcc -march=armv8-a frequency.c -o frequency */

#include <stdio.h>

/* frequency timer reg is uint32 */
long timer_frequency() {
  asm ( "MRS X0, CNTFRQ_EL0") ;
}

void main()
{
  printf("\nTimer Frequency is %u Hz \n\n", timer_frequency());
}
