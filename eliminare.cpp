#include <fstream>
using namespace std;
ifstream fin("eliminare.in");
ofstream fout("eliminare.out");
int N,Q,t[100002];

void readdata(){
    fin>>N>>Q;
    for(int i=1;i<=N;i++)
        fin>>t[i];
}

void cauta(int st,int dr,int x){
    int m=(st+dr)/2;
    if(st==dr){
        if(t[m]<x) fout<<x-m<<'\n'; else
            if(t[m]>x) fout<<x<<'\n'; else
                if(t[m]==x) fout<<0<<'\n';
    } else
    if(st+1==dr){
        if(t[st]==x) fout<<0<<'\n'; else
            if(t[st+1]==x) fout<<0<<'\n'; else
                if(t[st+1]<x) fout<<x-(st+1)<<'\n'; else
                    if(t[st+1]>x) fout<<x-st<<'\n';
    } else
    if(x>t[m]) cauta(m,dr,x); else
        if(x<t[m]) cauta(st,m,x); else
            if(t[m]==x) fout<<0<<'\n';
}

void run(){
    int x;
    for(int i=1;i<=Q;i++){
        fin>>x;
        cauta(1,N,x);
    }
}

int main(){
    readdata();
    run();
    return 0;
}
