#include <stdio.h>

void swap(int *a, int *b) {
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
            swap(&vetor[i], &vetor[j]);
        }
    }

    swap(&vetor[i + 1], &vetor[alto]);
    return i + 1;
}

void quickSort(int vetor[], int baixo, int alto) {
    if (baixo < alto) {
        int p = particionar(vetor, baixo, alto);

        quickSort(vetor, baixo, p - 1);
        quickSort(vetor, p + 1, alto);
    }
}