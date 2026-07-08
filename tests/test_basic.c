#include <stdio.h>

void bubbleSort(int v[], int n);
void selection(int v[], int n);
void insertion(int v[], int n);
void mergeSort(int v[], int ini, int fim);
void quickSort(int v[], int low, int high);
void heapSort(int v[], int n);

int verificarOrdenado(int v[], int n){
    for(int i = 0; i < n - 1; i++){
        if(v[i] > v[i+1]){
            return 0;
        }
    }
    return 1;
}

void gerarFibonacciInvertido(int v[], int n) {
    int a = 0, b = 1, proximo;
    for (int i = 0; i < n; i++) {
        v[n - 1 - i] = a;
        proximo = a + b;
        a = b;
        b = proximo;
    }
}

void testarBubble(){
    int n = 30000 ;
    int v[30000];
    gerarFibonacciInvertido(v, n);
    bubbleSort(v, n);
    if(verificarOrdenado(v, n))
        printf("Bubble executado com exito\n");
    else
        printf("Bubble com falha\n");
}

void testarSelection(){
    int n = 30000 ;
    int v[30000];
    gerarFibonacciInvertido(v, n);
    selection(v, n);
    if(verificarOrdenado(v, n))
        printf("Selection executado com exito\n");
    else
        printf("Selection com falha\n");
}

void testarInsertion(){
    int n = 30000 ;
    int v[30000];
    gerarFibonacciInvertido(v, n);
    insertion(v, n);
    if(verificarOrdenado(v, n))
        printf("Insertion executado com exito\n");
    else
        printf("Insertion com falha\n");
}

void testarMerge(){
    int n = 30000 ;
    int v[30000];
    gerarFibonacciInvertido(v, n);
    mergeSort(v, 0, n - 1);
    if(verificarOrdenado(v, n))
        printf("Merge executado com exito\n");
    else
        printf("Merge com falha\n");
}

void testarQuick(){
    int n = 30000 ;
    int v[30000];
    gerarFibonacciInvertido(v, n);
    quickSort(v, 0, n - 1);
    if(verificarOrdenado(v, n))
        printf("Quick executado com exito\n");
    else
        printf("Quick com falha\n");
}

void testarHeap(){
    int n = 30000 ;
    int v[30000];
    gerarFibonacciInvertido(v, n);
    heapSort(v, n);
    if(verificarOrdenado(v, n))
        printf("Heap executado com exito\n");
    else
        printf("Heap com falha\n");
}

int main(){
    testarBubble();
    testarSelection();
    testarInsertion();
    testarMerge();
    testarQuick();
    testarHeap();
    return 0;
}
