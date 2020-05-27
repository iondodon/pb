#include <fstream>
using namespace std;
ifstream fin("cub2.in");
ofstream fout("cub2.out");
struct fata{
   int t[51][51];
};
struct celula{
   int fa,lin,col;
};
fata f[7];
celula tr[15001],coada[15001];
int N,K,F,L,C,a=0,b=0;

void readdata(){
   fin>>N>>K;
   fin>>F>>L>>C;
   for(int i=1;i<=K;i++)
      fin>>tr[i].fa, fin>>tr[i].lin, fin>>tr[i].col;
   for(int k=1;k<=6;k++)
      for(int i=1;i<=N;i++)
         for(int j=1;j<=N;j++)
            fin>>f[k].t[i][j];
}

void addInCoada(int fa,int lin, int col,int pred){
   b++;
   f[fa].t[lin][col]=pred+1;
   coada[b].fa=fa, coada[b].lin=lin, coada[b].col=col;
}

void lee(){
   int fa,l,c,v;
   addInCoada(F,L,C,0);
   a=b;
   while(a<=b){
      fa=coada[a].fa, l=coada[a].lin, c=coada[a].col, v=f[fa].t[l][c];
      if(l-1>0){
         if(f[fa].t[l-1][c]==0||v+1<f[fa].t[l-1][c]) addInCoada(fa,l-1,c,v);
      } else switch(fa){
         case 1: if(f[4].t[1][N-c+1]==0||v+1<f[4].t[1][N-c+1]) addInCoada(4,1,N-c+1,v) ; break;
         case 2: if(f[1].t[N][c]==0||v+1<f[1].t[N][c]) addInCoada(1,N,c,v); break;
         case 3: if(f[4].t[N][c]==0||v+1<f[4].t[N][c]) addInCoada(4,N,c,v); break;
         case 4: if(f[1].t[1][N-c+1]==0||v+1<f[1].t[1][N-c+1]) addInCoada(1,1,N-c+1,v); break;
         case 5: if(f[1].t[N-c+1][N]==0||v+1<f[1].t[N-c+1][N]) addInCoada(1,N-c+1,N,v); break;
         case 6: if(f[1].t[c][1]==0||v+1<f[1].t[c][1]) addInCoada(1,c,1,v); break;
         }

      if(c+1<=N){
         if(f[fa].t[l][c+1]==0||v+1<f[fa].t[l][c+1]) addInCoada(fa,l,c+1,v);
      } else switch(fa){
         case 1: if(f[5].t[1][N-l+1]==0||v+1<f[5].t[1][N-l+1]) addInCoada(5,1,N-l+1,v); break;
         case 2: if(f[5].t[l][1]==0||v+1<f[5].t[l][1]) addInCoada(5,l,1,v); break;
         case 3: if(f[6].t[N][l]==0||v+1<f[6].t[N][l]) addInCoada(6,N,l,v); break;
         case 4: if(f[6].t[l][1]==0||v+1<f[6].t[l][1]) addInCoada(6,l,1,v); break;
         case 5: if(f[4].t[l][1]==0||v+1<f[4].t[l][1]) addInCoada(4,l,1,v); break;
         case 6: if(f[2].t[l][1]==0||v+1<f[2].t[l][1]) addInCoada(2,l,1,v); break;
         }

      if(l+1<=N){
         if(f[fa].t[l+1][c]==0||v+1<f[fa].t[l+1][c]) addInCoada(fa,l+1,c,v);
      } else switch(fa){
         case 1: if(f[2].t[1][c]==0||v+1<f[2].t[1][c]) addInCoada(2,1,c,v); break;
         case 2: if(f[3].t[N][N-c+1]==0||v+1<f[3].t[N][N-c+1]) addInCoada(3,N,N-c+1,v); break;
         case 3: if(f[2].t[N][N-c+1]==0||v+1<f[2].t[N][N-c+1]) addInCoada(2,N,N-c+1,v); break;
         case 4: if(f[3].t[1][c]==0||v+1<f[3].t[1][c]) addInCoada(3,1,c,v); break;
         case 5: if(f[3].t[N-c+1][1]==0||v+1<f[3].t[N-c+1][1]) addInCoada(3,N-c+1,1,v); break;
         case 6: if(f[3].t[c][N]==0||v+1<f[3].t[c][N]) addInCoada(3,c,N,v); break;
         }

      if(c-1>0){
         if(f[fa].t[l][c-1]==0||v+1<f[fa].t[l][c-1]) addInCoada(fa,l,c-1,v);
      } else switch(fa){
         case 1: if(f[6].t[1][l]==0||v+1<f[6].t[1][l]) addInCoada(6,1,l,v); break;
         case 2: if(f[6].t[l][N]==0||v+1<f[6].t[l][N]) addInCoada(6,l,N,v); break;
         case 3: if(f[5].t[N][N-l+1]==0||v+1<f[5].t[N][N-l+1]) addInCoada(5,N,N-l+1,v); break;
         case 4: if(f[5].t[l][N]==0||v+1<f[5].t[l][N]) addInCoada(5,l,N,v); break;
         case 5: if(f[2].t[l][N]==0||v+1<f[2].t[l][N]) addInCoada(2,l,N,v); break;
         case 6: if(f[4].t[l][N]==0||v+1<f[4].t[l][N]) addInCoada(4,l,N,v); break;
         }
      a++;
   }
}

void cautSol(){
   int DrMin=2000000000,Cai;
   for(int i=1;i<=K;i++)
      if(f[tr[i].fa].t[tr[i].lin][tr[i].col]<DrMin&&f[tr[i].fa].t[tr[i].lin][tr[i].col]!=0)
         DrMin=f[tr[i].fa].t[tr[i].lin][tr[i].col], Cai=1; else
            if(f[tr[i].fa].t[tr[i].lin][tr[i].col]==DrMin) Cai++;
   if(DrMin==2000000000)
      fout<<0<<'\n'<<0; else
         fout<<DrMin<<'\n'<<Cai;
}

int main(){
   readdata();
   lee();
   cautSol();
   return 0;
}
