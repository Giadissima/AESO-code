#include<stdio.h>
#include<stdlib.h>

struct nodo
{
    int value;
    struct nodo *next;
};

typedef struct nodo node_t;

extern int count_nodes(node_t *testa);

int main()
{
    // creo la prima lista
    int i=0;
    node_t *testa = NULL;
    node_t *prec = NULL;
    for (i=0; i<5; i++) {
        node_t *elem = (node_t *) malloc(sizeof(node_t));
        if (elem == NULL) {
            printf("Errore malloc\n");
            exit(1);
        }
        elem->value = i;
        if (prec != NULL) {
            prec->next = elem;
            prec = elem;
        }
        else {
            testa = elem;
            prec = elem;
        }
        elem->next = NULL;
    }
    
    int ris = count_nodes(testa);
    // stampo la lista
    printf("[ ");
    while (testa != NULL) {
        printf("%d ", testa->value);
        testa = testa->next;
    }
    printf("]\n");
    printf("ci sono %d nodi nella lista\n", ris);
    return 0;
}
