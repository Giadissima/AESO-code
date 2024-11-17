#include<stdio.h>
#include<stdlib.h>

typedef int (*f)(int);

extern void higher_func(int *, int, f);

int doubling(int x)
{
    return 2*x;
}

int main()
{
    int array[9] = {1, 2, 3, 4, 5, 6, 7, 8, 9};

    printf("Vettore iniziale: [");
    for(int i=0; i<8; i++) {
        printf("%d ", array[i]);
    }
    printf("%d]\n", array[8]);

    higher_func(array, 9, doubling);

    printf("Vettore finale: [");
    for(int i=0; i<8; i++) {
        printf("%d ", array[i]);
    }
    printf("%d]\n", array[8]);

    return 0;
}
