#include <fstream>

using namespace std;
ifstream fin("pc.in");
ofstream fout("pc.out");

int main() {
    unsigned long long int DP[42][42];
    int G, V, i, j;

    fin >> G >> V;

    for(i = 0; i <= G; i++){
        for(j = 0; j <= V; j++){
            DP[i][j] = 0;
        }
    }

    for(i = 0; i <= G; i++){
        DP[i][0] = (unsigned long long int)i;
    }

    for(i = 1; i <= G; i++){
        for(j = 1; j <= V; j++){
            DP[i][j] = DP[i-1][j-1] + 1 + DP[i-1][j];
        }
    }

    fout << DP[G][V];

    return 0;
}