#include <fstream>
using namespace std;
ifstream fin("aranjare.in");
ofstream fout("aranjare.out");
int N,t[10010],s1=0,s2=0;

void readdata(){
    fin>>N;
    char c;
    for(int i=1;i<=2*N+2;i++){
        fin>>c;
        if(c=='F') t[i]=1; else
                if(c=='B') t[i]=2; else
                    if(c=='S'){
                        if(s1==0) s1=i; else s2=i;
                    }
    }
}

void run(){
    for(int i=1;i<=N;i++)
        if(t[i]!=1){
            if(t[i]==2){
                if(t[i+1]==0)
                        swap(t[2*N+1],t[s1]), swap(t[2*N+2],t[s2]), s1=2*N+1, s2=2*N+2, fout<<2*N+1<<'\n';
                swap(t[i],t[s1]), swap(t[i+1],t[s2]), s1=i, s2=i+1, fout<<i<<'\n';
            }
            for(int j=i+2;j<=2*N+1&&t[i]==0;j++)
                if(t[j]==1) swap(t[j],t[i]), swap(t[j+1],t[i+1]), s1=j, s2=j+1, fout<<j<<'\n';
            if(t[i]==0){
                swap(t[i],t[2*N+1]), swap(t[i+1],t[2*N+2]), s1=2*N+1, s2=2*N+2, fout<<2*N+1<<'\n';
                swap(t[i+2],t[s1]), swap(t[i+3],t[s2]), s1=i+2, s2=i+3, fout<<i+2<<'\n';
                swap(t[i-1],t[s1]), swap(t[i],t[s2]), s1=i-1, s2=i, fout<<i-1<<'\n';
                swap(t[i+1],t[s1]), swap(t[i+2],t[s2]), s1=i+1, s2=i+2, fout<<i+1<<'\n';
            }
        }
    if(t[N+1]!=0)
        swap(t[N+1],t[s1]), swap(t[N+2],t[s2]), s1=N+1, s2=N+2, fout<<N+1<<'\n';
    //for(int i=1;i<=2*N+2;i++)
        //fout<<t[i];
}

int main(){
    readdata();
    run();
    return 0;
}