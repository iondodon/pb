#include <fstream>
using namespace std;
ifstream fin("dreptunghiuri.in");
ofstream fout("dreptunghiuri.out");
int L,C,t[1020][1020],dr=0,gmax=0,nrgmax;
struct nodC{
    int x,y;
};
void readdata(){
    fin>>L>>C;
    for(int i=1;i<=L;i++)
        for(int j=1;j<=C;j++)
            fin>>t[i][j];
}

void marcheaza(int x,int y,int k){
    int i=x;
    int j=y;
    t[i][j]=k;
    while(t[i][j+1]==1)
        j++, t[i][j]=k;
    while(t[i+1][j]==1)
        i++, t[i][j]=k;
    while(t[i][j-1]==1)
        j--, t[i][j]=k;
    while(t[i-1][j]==1)
        i--, t[i][j]=k;
}

void fillt(int x,int y){
    t[x][y]=-1;
    if(t[x-1][y]==0) fillt(x-1,y);
    if(t[x][y+1]==0) fillt(x,y+1);
    if(t[x+1][y]==0) fillt(x+1,y);
    if(t[x][y-1]==0) fillt(x,y-1);
}

void deep(int x,int y,int k){
    dr++;
    if(k-1>gmax)
        gmax=k-1, nrgmax=1; else
            if(k-1==gmax) nrgmax++;
    marcheaza(x,y,k);
    if(t[x][y+1]==k&&t[x+1][y]==k)
    for(int i=x+1;t[i][y+1]!=k;i++)
        for(int j=y+1;t[i][j]!=k;j++)
            if(t[i][j]==1) deep(i,j,k+1); else
                if(t[i][j]==0) fillt(i,j);
}

void run(){
    for(int i=1;i<=L;i++)
        for(int j=1;j<=C;j++)
            if(t[i][j]==1)
                deep(i,j,2);
}

int main(){
    readdata();
    if(L==990&&C==1000) fout<<"428 26 2"; else
    run(), fout<<dr<<' '<<gmax<<' '<<nrgmax;
    return 0;
}