#include "libhello.h"
#include <stdio.h>

int
main()
{
  init("libhello.core");
  printf("From hello: %s\n", hello_hello());
  return 0;
}
