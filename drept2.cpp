#include <fstream>
using namespace std;
ifstream fin("drept2.in");
ofstream fout("drept2.out");
int N,s=0,suprapunere_max=-1,imin=12000,imax=-1,jmin=12000,jmax=-1;
int t[1000][1000];

void readdataAndMakeTable(){
    int d,x,y;
    fin>>N;
    for(int i=1;i<=N;i++){
        fin>>x>>y>>d;
        for(int j=x;j<=x+d-1;j++)
            t[j][y]+=1, t[j][y+d]-=1;
        if(x<imin) imin=x;
        if(x+d>imax) imax=x+d;
        if(y<jmin) jmin=y;
        if(y+d>jmax) jmax=y+d;
    }
}

void run(){
    for(int i=imin;i<=imax;i++)
        for(int j=jmin;j<=jmax;j++){
            t[i][j]+=t[i][j-1];
            if(t[i][j]>0) s++;
            if(t[i][j]>suprapunere_max)
                suprapunere_max=t[i][j];
        }
}

int main(){
    readdataAndMakeTable();
    run();
    fout<<s<<'\n'<<suprapunere_max;
    return 0;
}
