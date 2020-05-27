#include <stdio.h>
#define N_MAX 1000000
#define VAL_MAX 500000

int N, L;

class BinaryIndexTree{
private:
    int value[N_MAX+1];
    int sum[N_MAX+1];
    int maxValueFound;

    int getParent(int child){
        return child - (child & -child);
    }

    int getNext(int previous){
        return previous + (previous & -previous);
    }

    int countEqualGreater(int value){
        int count = 0;
        for(int node = value; node <= maxValueFound; node = getNext(node)){
            count += sum[node];
        }
        return count;
    }

public:
    BinaryIndexTree(){
        maxValueFound = -1;
    }

    int getValue(int index){
        return value[index];
    }

    int getMaxValFound(){
        return maxValueFound;
    }

    void setMaxValFound(int new_max){
        maxValueFound = new_max;
    }

    void setValue(int index, int value){
        this->value[index] = value;
    }

    void updateSum(int value){
        for (int node = value; node; node = getParent(node))
            sum[node]++;
    }

    void addValue(int index, int value){
        setValue(index, value);
        updateSum(value);
    }

    void pullOutValue(int value){
        for(int node = value; node; node = getParent(node)) {
            sum[node]--;
        }
    }

    int sequenceIsBalanced(int middle){
        if(countEqualGreater(getValue(middle)) == L)
            return 1; else return 0;
    }
}BITree;

class Solver{
private:
    FILE *fin, *fout;
    int balances;

    void initializeTree(){
        for(int i = 0, new_value; i <= 2*L; i++) {
            fscanf(fin, "%d", &new_value);
            new_value += VAL_MAX;
            if(new_value > BITree.getMaxValFound())
                BITree.setMaxValFound(new_value);
            BITree.setValue(i, new_value);
            if(i != L){
                BITree.updateSum(new_value);
            }
        }
    }

    void openFiles(){
        fin = fopen("echilibru1.in", "r");
        fout = fopen("echilibru1.out","w");
    }

    void closeFiles(){
        fclose(fin);
        fclose(fout);
    }

public:
    Solver(){
        balances = 0;
    };

    void solve(){
        openFiles();
        fscanf(fin, "%d%d", &N, &L);
        initializeTree();

        for(int i = L,new_value; i < N-L; i++){
            balances += BITree.sequenceIsBalanced(i);

            if(i+L+1 < N) {                                             //prepare for the next sequence
                BITree.pullOutValue(BITree.getValue(i-L));              //pull out left value from sequence
                BITree.addValue(i, BITree.getValue(i));                 //add middle
                BITree.pullOutValue(BITree.getValue(i+1));              //pull out next middle
                fscanf(fin, "%d", &new_value);                          //read a new value
                new_value += VAL_MAX;
                if(new_value > BITree.getMaxValFound())
                    BITree.setMaxValFound(new_value);
                BITree.addValue(i+L+1, new_value);                      //add the new value in sequence
            }
        }

        fprintf(fout, "%d", balances);
        closeFiles();
    }
}ProblemSolver;

int main() {
    ProblemSolver.solve();
    return 0;
}