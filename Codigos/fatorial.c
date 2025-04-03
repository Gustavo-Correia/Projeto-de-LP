#include <stdio.h>
#include <stdlib.h> // Para atoi

unsigned long long fatorial(int n) {
    if (n < 0) {
        printf("Erro: Fatorial de número negativo não definido.\n");
        exit(1);
    }
    if (n == 0) return 1;

    unsigned long long resultado = 1;
    for (int i = 1; i <= n; i++) {
        resultado *= i;
    }
    return resultado;
}

int main(int argc, char *argv[]) {
    if (argc < 2) {
        printf("Uso: %s <numero>\n", argv[0]);
        return 1;
    }

    int n = atoi(argv[1]);
    printf("Resultado: %llu\n", fatorial(n));
    return 0;
}