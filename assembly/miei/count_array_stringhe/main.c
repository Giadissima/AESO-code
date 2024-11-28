#include <stdio.h>

// Dichiarazione della funzione ARMv7
extern int longest_string_index(char *strings[], int count);

int main() {
    // Array di stringhe
    char *strings[] = {
        "casa",
        "programmazione",
        "esame",
        "universita",
        "computer"
    };

    // Numero di stringhe nell'array
    int count = sizeof(strings) / sizeof(strings[0]);

    // Chiamata alla funzione ARMv7
    int index = longest_string_index(strings, count);

    // Output del risultato
    printf("L'indice della stringa più lunga è: %d\n", index);
    printf("La stringa più lunga è: %s\n", strings[index]);

    return 0;
}
