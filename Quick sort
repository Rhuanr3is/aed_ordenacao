#include <stdio.h>

void trocar(int *a, int *b) {
    int temp = *a;
    *a = *b;
    *b = temp;
}

int particionar(int vetor[], int baixo, int alto) {
    int pivo = vetor[alto];
    int i = baixo - 1;

    for (int j = baixo; j < alto; j++) {
        if (vetor[j] <= pivo) {
            i++;
            trocar(&vetor[i], &vetor[j]);
        }
    }

    trocar(&vetor[i + 1], &vetor[alto]);
    return i + 1;
}

void quickSort(int vetor[], int baixo, int alto) {
    if (baixo < alto) {
        int p = particionar(vetor, baixo, alto);

        quickSort(vetor, baixo, p - 1);
        quickSort(vetor, p + 1, alto);
    }
}

int main() {
    int vetor[] = {12, 11, 13, 5, 6, 7};
    int n = sizeof(vetor) / sizeof(vetor[0]);

    printf("Vetor original:\n");
    for (int i = 0; i < n; i++)
        printf("%d ", vetor[i]);

    quickSort(vetor, 0, n - 1);

    printf("\n\nVetor ordenado:\n");
    for (int i = 0; i < n; i++)
        printf("%d ", vetor[i]);

    printf("\n");

    return 0;
}
