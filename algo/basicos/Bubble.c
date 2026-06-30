#include <stdio.h>

void bubbleSort(int v[], int n){

    int i, j, temp;

        for(i = 0; i < n - 1; i++){

                for(j = 0; j < n - i - 1; j++){

                            if(v[j] > v[j+1]){

                                            temp = v[j];
                                                            v[j] = v[j+1];
                                                                            v[j+1] = temp;

                                                                                        }

                                                                                                }

                                                                                                    }

                                                                                                    }