#include <stdio.h>

void bubbleSort(int v[], int n);
void selection(int v[], int n);
void insertion(int v[], int n);
void mergeSort(int v[], int n);
void quickSort(int v[], int n);
void heapSort(int v[], int n);

void imprimir(int v[], int n){

    for(int i = 0; i < n; i++){
        printf("%d ", v[i]);
    }

    printf("\n");
}

int main(){

    int vetor[] = {5,3,1,4,2};
    int n = 5;
    int opcao;

    printf("=== Algoritmos de Ordenacao ===\n");
    printf("1 - Bubble Sort\n");
    printf("2 - Selection Sort\n");
    printf("3 - Insertion Sort\n");
    printf("4 - Merge Sort\n");
    printf("5 - Quick Sort\n");
    printf("6 - Heap Sort\n");

    printf("Escolha: ");
    scanf("%d",&opcao);

    switch(opcao){

        case 1:
            bubbleSort(vetor,n);
            break;

        case 2:
            selection(vetor,n);
            break;

        case 3:
            insertion(vetor,n);
            break;

        case 4:
            mergeSort(vetor,n);
            break;

        case 5:
            quickSort(vetor,n);
            break;

        case 6:
            heapSort(vetor,n);
            break;

        default:
            printf("Opcao invalida\n");
            return 1;
    }

    printf("Vetor ordenado:\n");
    imprimir(vetor,n);

    return 0;
}
