void trocar(int *a, int *b) {
    int temp = *a;
    *a = *b;
    *b = temp;
}

void heapify(int vetor[], int n, int i) {
    int maior = i;
    int esquerda = 2 * i + 1;
    int direita = 2 * i + 2;

    if (esquerda < n && vetor[esquerda] > vetor[maior])
        maior = esquerda;

    if (direita < n && vetor[direita] > vetor[maior])
        maior = direita;

    if (maior != i) {
        trocar(&vetor[i], &vetor[maior]);
        heapify(vetor, n, maior);
    }
}

void heapSort(int vetor[], int n) {
    for (int i = n / 2 - 1; i >= 0; i--)
        heapify(vetor, n, i);

    for (int i = n - 1; i > 0; i--) {
        trocar(&vetor[0], &vetor[i]);
        heapify(vetor, i, 0);
    }
}