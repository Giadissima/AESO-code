#include<stdio.h>
#include<stdlib.h>
#include <errno.h>    // necessaria per usare errno

extern unsigned int fattoriale(unsigned int n);
extern unsigned int fatt_rec(unsigned int n);

void termina(char *messaggio){
  if(errno!=0) perror(messaggio);
  else fprintf(stderr,"%s\n", messaggio);
  free(messaggio);
  exit(1);
}

int main(int argc, char const *argv[]) {
  if(argc == 1){
    char * mess;
    asprintf(&mess, "uso: qemu-arm %s <num>", argv[0]);
  termina(mess);
  }
  unsigned int n = atoi(argv[1]);
  unsigned ris = fatt_rec(n);
  if(ris==0) printf("error: overflow\n");
  else printf("fattoriale di %d = %d\n", n, ris);
  return 0;
}

