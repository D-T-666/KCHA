#include <stdio.h>

int main(){

    int n;

    int i = 0;
    int j = 1;
    while (i < n) {
        i += j;
        j += 2;
    }
    printf("%d", i);

}