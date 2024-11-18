#include<stdio.h>
#include<stdlib.h>

extern unsigned int fattoriale(unsigned int n);

int main(int argc, char const *argv[]) {
  unsigned int n = atoi(argv[1]);
  unsigned ris = fattoriale(n);
  printf("fattoriale di %d = %d\n", n, ris);
  return 0;
}

