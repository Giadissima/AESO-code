#define _GNU_SOURCE  // avverte che usiamo le estensioni GNU
#include <assert.h>  // permette di usare la funzione assert
#include <errno.h>   // necessaria per usare errno
#include <stdbool.h> // gestisce tipo bool (per variabili booleane)
#include <stdio.h>   // permette di usare scanf printf etc ...
#include <stdlib.h>  // conversioni stringa/numero exit() etc ...
#include <string.h>  // funzioni di confronto/copia/etc di stringhe

void termina(char *messaggio);
// questa funzione legge un file con all'interno dei numeri e li carica in un
// vettore dinamico
int *caricaIntDaFile(char *path, int *size) {
  *size = 0;
  int maxSize = 10;

  int *v = malloc(maxSize * sizeof(int));
  if (v == NULL)
    termina("Memoria insufficiente");
  FILE *f = fopen(path, "rt");
  if (f == NULL) {
    termina("Non è stato possibile aprire il file");
  }
  int e;
  do {
    int n;
    e = fscanf(f, "%d", &n);
    if (e != EOF) {
      if (e != 1)
        termina("contenuto illegale del file");
      // caso in cui ho preso correttamente un numero
      if (maxSize == *size) {
        maxSize *= 2;
        v = realloc(v, maxSize * sizeof(int));
        if (v == NULL)
          termina("Memoria insufficiente");
      }
      v[*size] = n;
      (*size)++;
    }
  } while (e != EOF);
  return v;
}
extern int ricerca_bin_rec(int *v, int size, int x);
int main(int argc, char const *argv[]) {
  int size = 10;

  int *v = malloc(size * sizeof(int));
  if (v == NULL)
    termina("Memoria insufficiente");
  for (int i = 0; i < size; i++) {
    v[i] = i;
  }
  int ris = ricerca_bin_rec(v,size, 2);
  if(ris==-1) printf("Numero non presente nel vettore\n");
  else printf("numero presente alla posizione %d\n", ris);
  for (int j = 0; j < size; j++) {
    printf("%d ", v[j]);
  }
    printf("\n");


  return 0;
}

void termina(char *messaggio) {
  if (errno != 0)
    perror(messaggio);
  else
    fprintf(stderr, "%s\n", messaggio);
  free(messaggio);
  exit(1);
}