#include <fstream>
#define N_MAX 100000

int N, M;
FILE *fin, *fout;

class BinaryIndexTree{
private:
    int bit_prefix_sum[N_MAX+1];

    inline int getNextNode(int previous) {
        return previous + (previous & -previous);
    }

    inline int getParent(int child) {
        return child - (child & -child);
    }

public:
    inline void update(int i, int val_to_add) {
        while(i <= N){
            bit_prefix_sum[i] += val_to_add;
            i = getNextNode(i);
        }
    }

    inline int getSumUpTo(int i) {
        int sum = 0;
        while(i > 0){
            sum = sum + bit_prefix_sum[i];
            i = getParent(i);
        }
        return sum;
    }

    //a way to find if there is a specific sum
    //????
    inline int getMinIndexOfSum(int sum_to_find){
        int i, step;
        for(step = 1; step < N; step = getNextNode(step));

        for(i = 0; step; step = step >> 1){
            if(i + step <= N){
                if(sum_to_find >= bit_prefix_sum[i + step]){
                    i = i + step;
                    sum_to_find = sum_to_find - bit_prefix_sum[i];
                    if(!sum_to_find) return i;
                }
            }
        }

        return -1;
    }

} BITree;

void constructBITree(){
    fscanf(fin, "%d%d", &N, &M);
    for(int i = 1, new_value; i <= N; i++){
        fscanf(fin, "%d", &new_value);
        BITree.update(i, new_value);
    }
}

void solve(){
    int operation, a, b, sum;
    for(;M;M--){
        fscanf(fin, "%d", &operation);

        switch(operation){
            case 0:
                fscanf(fin, "%d%d", &a, &b);
                BITree.update(a, b);
                break;
            case 1:
                fscanf(fin, "%d%d", &a, &b);
                fprintf(fout, "%d\n", BITree.getSumUpTo(b) - BITree.getSumUpTo(a-1));
                break;
            case 2:
                fscanf(fin, "%d", &sum);
                fprintf(fout, "%d\n", BITree.getMinIndexOfSum(sum));
                break;
            default:
                fprintf(fout, "Invalid operation!\n");
        }
    }
}

int main(){
    fin = fopen("aib.in", "r");
    fout = fopen("aib.out", "w");
    constructBITree();
    solve();
    fclose(fin);
    fclose(fout);
    return 0;
}