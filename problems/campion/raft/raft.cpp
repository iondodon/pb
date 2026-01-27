#include <fstream>
using namespace std;
ifstream fin("raft.in");
ofstream fout("raft.out");
int C,R,N,h[103],efmin[103];

void readdata(){
    int col,inaltime;
    fin>>C>>R;
    fin>>N;
    for(int i=1;i<=N;i++){
        fin>>col>>inaltime;
        if(inaltime>h[col]) h[col]=inaltime;
    }
}

void run(){
    efmin[-1]=0;
    efmin[0]=0;
    for(int i=1;i<=C;i++){
        efmin[i]=max(h[i],h[i-1])+efmin[i-2];
        efmin[i]=min(efmin[i],h[i]+efmin[i-1]);
        efmin[i]=min(efmin[i], max(max(h[i-2],h[i-1]),h[i])+efmin[i-3]);
    }
}

int main(){
    readdata();
    run();
    fout<<efmin[C];
    return 0;
}