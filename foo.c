#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

void inputArray(int *arr, unsigned size) {
    int i;
    for (i = 0; i < size; i++) {
        scanf("%d", &arr[i]);
    }
}

void printArray(int *arr, unsigned size) {
    int i;
    for (i = 0; i < size; i++) {
        printf("%d ", arr[i]);
    }
}

int main()
{
    int n, i;
    scanf("%d", &n);
    int a[n];
    inputArray(a, n);
    int b[n];
    for (i = 0; i < n; i++) {
        if (a[i] > 0){
            b[i] = 2;
        }
        if(a[i] == 0){
            b[i] = 0;
        }
        if (a[i] < 0){
            b[i] = a[i] + 5;
        }
    }

    printArray(b, n);
    getchar();
    return 0;
}
