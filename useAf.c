#include <stdio.h>
extern int f(void); // Adjust the return type and parameters as needed

int main(int argc, char const *argv[])
{
  printf("%d", f());
  return 0;
}
