#include <fstream>
#include <math.h>
using namespace std;
ifstream fin("patru.in");
ofstream fout("patru.out");
long long N,K,t[20001],sol1,sol2;

void verifica(long long nr)
{
   long long j,aux=0,r=0;

   for (j=1; j*j*j*j<nr; ++j){
      aux = nr - j*j*j*j;
      r = int ( sqrt(sqrt(1.0 * aux)) );
      if (aux == r*r*r*r){
         ++sol1;
         break;
      }
   }
}

void run()
{
   long long  nr,suma=0,i;
   for(i=1;i<=N;i++)
   {
      fin>>nr;
      verifica(nr);
      t[i]=nr%10;
   }
   for(i=1;i<=K;i++)
      suma+=t[i]*t[i]*t[i]*t[i];
   if(suma%10==4) sol2++;
   for(;i<=N;i++)
   {
      suma-=t[i-K]*t[i-K]*t[i-K]*t[i-K];
      suma+=t[i]*t[i]*t[i]*t[i];
      if(suma%10==4) sol2++;
   }
}

int main()
{
   fin>>N>>K;
   run();
   fout<<sol1<<'\n'<<sol2;
   return 0;
}
