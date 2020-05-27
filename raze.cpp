#include <fstream>
using namespace std;
ifstream fin("raze.in");
ofstream fout("raze.out");
int T,N,M,t[140][140];

void readdata(){
   fin>>N>>M;
   for(int i=1;i<=N;i++)
      for(int j=1;j<=M;j++)
         fin>>t[i][j], t[i][j]*=-1;
}

void marcheaza(int x,int y){
   int i=x,j=y;
   while(i-1>0&&j-1>0&&t[i-1][j-1]!=-1) i--, j--, t[i][j]++;
   i=x, j=y;
   while(i-1>0&&j+1<=M&&t[i-1][j+1]!=-1) i--, j++, t[i][j]++;
   i=x, j=y;
   while(i+1<=N&&j+1<=M&&t[i+1][j+1]!=-1) i++, j++, t[i][j]++;
   i=x, j=y;
   while(i+1<=N&&j-1>0&&t[i+1][j-1]!=-1) i++, j--, t[i][j]++;
}

void cautaSol(){
   int K=0,P=0;
   for(int i=2;i<=N-1;i++)
      for(int j=2;j<=M-1;j++)
         if(t[i][j]>K)
            K=t[i][j], P=1; else
               if(t[i][j]==K) P++;
   fout<<K<<' '<<P<<'\n';
}

void run(){
   int i;
   readdata();
   for(i=1;i<=M;i++) marcheaza(1,i);
   for(i=2;i<=N-1;i++) marcheaza(i,M);
   for(i=M;i>=1;i--) marcheaza(N,i);
   for(i=N-1;i>=2;i--) marcheaza(i,1);
   cautaSol();
}

int main(){
   fin>>T;
   for(int i=1;i<=T;i++)
      run();
   return 0;
}
