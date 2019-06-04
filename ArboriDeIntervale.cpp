#include <stdio.h>
#include <climits>

FILE *fin, *fout;
int N, M, solution;
int intervalTreeMaxValue[300001];

inline int maxim(int a, int b){
    return (a >= b) ? a : b;
}

inline void fixTree(int node){
    for(node = node / 2; node; node /= 2){
        intervalTreeMaxValue[node] = maxim(intervalTreeMaxValue[node * 2], intervalTreeMaxValue[node * 2 + 1]);
    }
}

inline void actualizeTree(int new_value, int position, int left, int right, int node){
    if(position >= left && position <= right){
        if(intervalTreeMaxValue[node] < new_value || left == right){
            intervalTreeMaxValue[node] = new_value;
        }
    }

    if(left != right) {
        int middle = (left + right) / 2;
        if (position <= middle) {
            actualizeTree(new_value, position, left, middle, node * 2);
        } else if (position > middle) {
            actualizeTree(new_value, position, middle + 1, right, node * 2 + 1);
        }
    } else fixTree(node);
}

inline void findMax(int node, int left, int right, int a, int b){
    if(left >= a && right <= b){
        if(intervalTreeMaxValue[node] > solution)
            solution = intervalTreeMaxValue[node];
    } else {
        int middle = (left + right) / 2;
        if(a <= middle){
            findMax(node * 2, left, middle, a, b);
        }
        if(b > middle){
            findMax(node * 2 + 1, middle + 1, right, a, b);
        }
    }
}

inline void processTree(){
    for(int i = 1, operation, a, b; i <= M; i++){
        fscanf(fin, "%d%d%d", &operation, &a, &b);
        if(operation == 0){
            solution = INT_MIN;
            findMax(1, 1, N, a, b);
            fprintf(fout, "%d\n", solution);
        } else {
            actualizeTree(b, a, 1, N, 1);
        }
    }
}

inline void constructInitialTree(){
    fscanf(fin, "%d%d", &N, &M);
    for(int i = 1, new_value; i <= N; i++){
        fscanf(fin, "%d", &new_value);
        actualizeTree(new_value, i, 1, N, 1);
    }
}

int main() {
    fin  = fopen("arbint.in",  "r");
    fout = fopen("arbint.out", "w");

    constructInitialTree();
    processTree();

    fclose(fin);
    fclose(fout);
    return 0;
}