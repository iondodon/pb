#include <stdio.h>
#include <tgmath.h>

namespace common{
    #define N_MAX 100000
    int N, M, collums;
};

class RMQSparseTable{
private:
    //log2(N_MAX) + 1 = 6
    int sparse[N_MAX][6];
    int input[N_MAX];

    void constructSparseTable(){
        common::collums = (int)floor(log2((double)common::N)) + 1;

        for(int i = 0; i < common::N; i++){
            scanf("%d", &input[i]);
            sparse[i][0] = i;
        }

        for(int j = 1; j <= common::collums; j++){
            for(int i = 0; i + (1 << j) - 1 < common::N; i++){
                if(input[sparse[i][j-1]] < input[sparse[i + (1 << (j - 1))][j - 1]]){
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
        if (input[sparse[left][k]] <= input[sparse[left + l - (1 << k)][k]]) {
            return input[sparse[left][k]];
        } else {
            return input[sparse[left - (1 << k) + 1][k]];
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
        scanf("%d%d", &(common::N), &(common::M));
        rmqSparseTable = new RMQSparseTable;
        for (int i = 0, left, right; i < common::M; ++i) {
            scanf("%d%d", &left, &right);
            printf("%d\n", rmqSparseTable->rmq(left-1, right-1));
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

