#include <stdio.h>
#include <stddef.h>
#include <time.h>

int main(void) {
  printf("sizeof(ptr) = %d\n", sizeof(void*));
  printf("sizeof(int) = %d\n", sizeof(int));
  printf("sizeof(short) = %d\n", sizeof(short));
  printf("sizeof(long) = %d\n", sizeof(long));
  printf("sizeof(long long) = %d\n", sizeof(long long));
  printf("sizeof(size_t) = %d\n", sizeof(size_t));
  printf("sizeof(ptrdiff_t) = %d\n", sizeof(ptrdiff_t));
  printf("sizeof(wchar_t) = %d\n", sizeof(wchar_t));
  printf("sizeof(time_t) = %d\n", sizeof(time_t));
  return 0;
}
