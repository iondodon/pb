#include <fstream>
using namespace std;
ifstream fin("teatru.in");
ofstream fout("teatru.out");
#define Zmax 55000

int Z,C,Pmax,Umax,Dmax=-1,fr[300];
char c[Zmax+1];

void readdata(){
   fin>>Z>>C;
   fin>>c;
}

void cauta(){
   int p=0,u=0,nr=0;
   fr[(int)c[u]]++; nr++;
   while(p<Z&&u<Z&&p<=u){
      while(nr<=C){
         u++;
         if(fr[(int)c[u]]==0) nr++;
         fr[(int)c[u]]++;
      }
      if(u-p>Dmax) Dmax=u-p, Pmax=p, Umax=u-1;
      while(nr>C){
         fr[(int)c[p]]--;
         if(fr[(int)c[p]]==0) nr--;
         p++;
      }
   }
}

void result(){
   fout<<Dmax<<'\n';
   for(int i=Pmax;i<=Umax;i++)
      fout<<c[i];
}

int main(){
   readdata();
   cauta();
   result();
   return 0;
}