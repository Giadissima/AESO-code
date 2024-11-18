#include<stdio.h>
#include<stdlib.h>

extern unsigned int fattoriale(unsigned int n);

int main(int argc, char const *argv[]) {
  unsigned int n=5;
  printf("fattoriale di %d = %d\n", n, fattoriale(n));
  return 0;
}

