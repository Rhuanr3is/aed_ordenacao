#include <stdio.h>

void bubbleSort(int v[], int n);

void selection(int v[], int n);

void insertion(int v[], int n);

void mergeSort(int v[], int ini, int fim);

void quickSort(int v[], int low, int high);

void heapSort(int v[], int n);

int verificarOrdenado(int v[], int n){
    for(int i=0;i<n-1;i++){
        if(v[i] > v[i+1]){
            return 0;
        }
    }
    return 1;
}

void testarBubble(){
    int v[] = {19,18,171,14,11};
    bubbleSort(v,5);
    if(verificarOrdenado(v,5))
        printf("Bubble executado com exito\n");
    else
        printf("Bubble com falha\n");
}

void testarSelection(){
    int v[] = {9,2,6,1,5};
    selection(v,5);
    if(verificarOrdenado(v,5))
        printf("Selection executado com exito\n");
    else
        printf("Selection com falha\n");
}

void testarInsertion(){
    int v[] = {7,3,8,1,2};
    insertion(v,5);
    if(verificarOrdenado(v,5))
        printf("Insertion executado com exito\n");
    else
        printf("Insertion com falha\n");
}

void testarMerge(){
    int v[] = {10,7,4,8,2};
    mergeSort(v, 0, 4);
    if(verificarOrdenado(v,5))
        printf("Merge executado com exito\n");
    else
        printf("Merge com falha\n");
}

void testarQuick(){
    int v[] = {6,1,9,3,2};
    quickSort(v, 0, 4);
    if(verificarOrdenado(v,5))
        printf("Quick executado com exito\n");
    else
        printf("Quick com falha\n");
}

void testarHeap(){
    int v[] = {12,4,8,2,1};
    heapSort(v,5);
    if(verificarOrdenado(v,5))
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