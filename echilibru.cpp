#include <fstream>
using namespace std;
ifstream fin("echilibru.in");
ofstream fout("echilibru.out");
bool p1[50000],p2[50000];
int N,M,MINIM,MAXIM,sol=0;

void tabel1(){
   int x;
   fin>>x;
   p1[x]=true;
   int minim=x,maxim=x;
   for(int i=2;i<=N;i++){
      fin>>x;
      for(int j=maxim;j>=minim;j--)
         if(p1[j]==true) p1[j+x]=true;
      if(x<minim) minim=x;
      maxim+=x;
      p1[minim]=p1[maxim]=p1[x]=true;
   }
   MINIM=minim;
   MAXIM=maxim;
}

void tabel2(){
   int x;
   fin>>x;
   p2[x]=true;
   int minim=x,maxim=x;
   for(int i=2;i<=M;i++){
      fin>>x;
      for(int j=maxim;j>=minim;j--)
         if(p2[j]==true) p2[j+x]=true;
      if(x<minim) minim=x;
      maxim+=x;
      p2[minim]=p2[maxim]=p2[x]=true;
   }
   if(minim>MINIM) MINIM=minim;
   if(maxim<MAXIM) MAXIM=maxim;
}

void rezultat(){
   for(int i=MINIM;i<=MAXIM;i++)
      if(p1[i]==true&&p2[i]==true) sol++;
   fout<<sol;
}

int main(){
   fin>>N>>M;
   tabel1();
   tabel2();
   rezultat();
   return 0;
}
