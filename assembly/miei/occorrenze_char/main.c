#define _GNU_SOURCE   // avverte che usiamo le estensioni GNU 
#include <stdio.h>    // permette di usare scanf printf etc ...
#include <stdlib.h>   // conversioni stringa/numero exit() etc ...
#include <stdbool.h>  // gestisce tipo bool (per variabili booleane)
#include <assert.h>   // permette di usare la funzione assert
#include <string.h>   // funzioni di confronto/copia/etc di stringhe
#include <errno.h>    // necessaria per usare errno

void termina(char *messaggio);

extern int count_char_in_string(char * s, char c);

int main(int argc, char const *argv[]) {
  char * s = "Dichiarazione letterale di una stringa";
  char c = 'o';
  printf("Il numero di occorrenze di %c e' %d\n", c, count_char_in_string(s, c));
  return 0;
}

void termina(char *messaggio){
  if(errno!=0) perror(messaggio);
  else fprintf(stderr,"%s\n", messaggio);
  free(messaggio);
  exit(1);
}