#include <stdio.h>
#define N_MAX 18
int N, K, t[N_MAX+1];

void print(){
    for(int i = 1; i <= K; i++){
        printf("%d ", t[i]);
    }
    printf("\n");
}

void bk(int initVal, int pos){
    if(pos > K){
        print();
    } else {
        for(int i = initVal+1; i <= N; i++){
            t[pos] = i;
            bk(i, pos+1);
        }
    }
}

int main(){
    freopen("combinari.in", "r", stdin);
    freopen("combinari.out", "w", stdout);
    scanf("%d%d", &N, &K);

    bk(0,1);

    return 0;
}