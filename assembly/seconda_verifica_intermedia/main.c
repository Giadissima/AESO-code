#include<stdio.h>
#include<stdlib.h>

int conta_strings(char **v, int size);

int conta(char *s);

int main()
{
    char s1[8] = "abdefhu";
    printf("Test conta con stringa di prova %s\n", s1);
    int res = conta(s1);
    if (res == 3) {
        printf("Risultato: %d == 3 -> OK!\n\n", res);
    }
    else {
        printf("Risultato: %d != 3 -> Error!\n\n", res);
    }

    char **v = (char **) malloc(sizeof(char *) * 3);
    char s2[6] = "HJdfg";
    char s3[9] = "aerdswxz";
    v[0] = s1; v[1] = s2; v[2] = s3, v[3]="-123a";
    printf("Test conta_strings con tre stringhe di prova {%s, %s, %s}\n", v[0], v[1], v[2]);
    res = conta_strings(v, 4);
    if (res == 5) {
        printf("Risultato: %d == 5 -> OK!\n\n", res);
    }
    else {
        printf("Risultato: %d != 5 -> Error!\n\n", res);
    }
    return 0;
}