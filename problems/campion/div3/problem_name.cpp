#include <fstream>
using namespace std;
ifstream fin("div3.in");
ofstream fout("div3.out");
int N,K,r3[3],sol;

void readdata(){
    fin>>N>>K;
    int x;
    for(int i=1;i<=N;i++)
        fin>>x, r3[x%3]++;
}

void recurenta(){
    int x0vechi=r3[0],x1vechi=r3[1],x2vechi=r3[2],x0,x1,x2;
    while(K-1){
        x0=(r3[0]*x0vechi + r3[1]*x2vechi + r3[2]*x1vechi)%4001;
        x1=(r3[0]*x1vechi + r3[1]*x0vechi + r3[2]*x2vechi)%4001;
        x2=(r3[0]*x2vechi + r3[1]*x1vechi + r3[2]*x0vechi)%4001;
        x0vechi=x0;
        x1vechi=x1;
        x2vechi=x2;
        K--;
    }
    sol=x0vechi;
}

int main() {
    readdata();
    recurenta();
    fout<<sol;
    return 0;
}