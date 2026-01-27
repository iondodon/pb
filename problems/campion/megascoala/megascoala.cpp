#include <fstream>
using namespace std;
ifstream fin("megascoala.in");
ofstream fout("megascoala.out");
int N,a[101][101],x,y,sol=0x3f3f3f;

void readdata(){
    fin>>N;
    for(int i=1;i<=N;i++)
        for(int j=1;j<=N;j++)
            fin>>a[i][j];
}

void floydWarshall(){
    for(int k=1;k<=N;k++)
        for(int i=1;i<=N;i++)
            for(int j=1;j<=N;j++)
                if(a[i][k]&&a[k][j]&&i!=j&&(a[i][j]>a[i][k]+a[k][j]||!a[i][j]))
                    a[i][j]=a[i][k]+a[k][j];
}

void findsol(){
    int aux;
    for(int i=1;i<=N;i++)
        for(int j=i+1;j<=N;j++){
            aux=0;
            for(int k=1;k<=N;k++)
                aux=max(aux,min(a[k][i],a[k][j]));
            if(aux<sol)
                sol=aux, x=i, y=j;
        }
}

int main(){
    readdata();
    floydWarshall();
    findsol();
    fout<<x<<' '<<y<<' '<<sol;
    return 0;
}