#include <fstream>
using namespace std;
#define Vmax 50000
ifstream fin("rafturi.in");
ofstream fout("rafturi.out");
int C,N,Carti[Vmax+2],Inaltimi[Vmax+2];

void readdata(){
   int dulap,raft;
   fin>>C>>N;
   for(int i=1;i<=N;i++){
      fin>>dulap>>raft;
      if(raft>Carti[dulap]) Carti[dulap]=raft;
   }
}

void dp(){
   Inaltimi[-1]=0;
   Inaltimi[0]=0;
   for(int i=1;i<=C;i++){
      Inaltimi[i]=max(Carti[i],Carti[i-1])+Inaltimi[i-2];
      Inaltimi[i]=min(Inaltimi[i],Carti[i]+Inaltimi[i-1]);
      Inaltimi[i]=min(Inaltimi[i], max(max(Carti[i-2],Carti[i-1]),Carti[i])+Inaltimi[i-3]);
   }
}

int main(){
   readdata();
   dp();
   fout<<Inaltimi[C];
   return 0;
}