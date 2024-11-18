#include<stdio.h>
#include<stdlib.h>

extern void to_upper(char *stringa);

int main(int argc, char **argv)
{
    printf("Stringa originale: %s\n", argv[1]);

    to_upper(argv[1]);

    printf("Stringa convertita: %s\n", argv[1]);
    return 0;
}
