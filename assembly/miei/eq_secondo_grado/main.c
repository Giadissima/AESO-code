#define _GNU_SOURCE   // avverte che usiamo le estensioni GNU 
#include <stdio.h>    // permette di usare scanf printf etc ...
#include <math.h>
#include <stdlib.h>
#include <errno.h>

extern int calcolo_eq_secondo_grado(int a, int b, int c, int x);

void termina(char *messaggio){
  if(errno!=0) perror(messaggio);
  else fprintf(stderr,"%s\n", messaggio);
  free(messaggio);
  exit(1);
}

int main(int argc, char const *argv[]) {
  int a,b,c,x;
  if(argc != 5){
    char * mess;
    asprintf(&mess, "uso: qemu-arm %s <a> <b> <c> <x>", argv[0]);
    termina(mess);
  }
  a = atoi(argv[1]);
  b = atoi(argv[2]);
  c = atoi(argv[3]);
  x = atoi(argv[4]);
  printf("x = %d\n%d*x^2 + %d*x + %d = %d\n", x, a, b, c, calcolo_eq_secondo_grado(a,b,c,x));
  return 0;
}