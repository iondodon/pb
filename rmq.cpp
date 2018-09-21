#include <stdio.h>
#include <tgmath.h>
#define N_MAX 100000

int N, M;


class RMQSparseTable{
private:
    int sparse[N_MAX][17];

    void constructSparseTable(){

        for(int i = 1; i <= N; i++){
            scanf("%d", &sparse[i][0]);
        }

        for(int j = 1; (1<<j) <= N; j++){
            for(int i = 1; i + (1 << j) - 1 <= N; i++){
                if(sparse[i][j-1] < sparse[i + (1 << (j - 1))][j - 1]){
                    sparse[i][j] = sparse[i][j-1];
                } else {
                    sparse[i][j] = sparse[i + (1 << (j - 1))][j - 1];
                }
            }
        }
    }

public:
    RMQSparseTable(){
        constructSparseTable();
    }

    int rmq(int left, int right){
        int l = right - left + 1;
        int k = (int)floor(log2(l));
        if (sparse[left][k] <= sparse[left + l - (1 << k)][k]) {
            return sparse[left][k];
        } else {
            return sparse[left + l - (1 << k)][k];
        }
    }
};

class Master{
private:
    RMQSparseTable *rmqSparseTable;

public:
    Master(){
        freopen("rmq.in", "r", stdin);
        freopen("rmq.out", "w", stdout);
        scanf("%d%d", &N, &M);
        rmqSparseTable = new RMQSparseTable;
        for (int i = 1, left, right; i <= M; i++) {
            scanf("%d%d", &left, &right);
            printf("%d\n", rmqSparseTable->rmq(left, right));
        }
    }

    ~Master(){
        delete rmqSparseTable;
    }
};

int main(){
    Master *master = new Master;
    delete master;
    return 0;
}