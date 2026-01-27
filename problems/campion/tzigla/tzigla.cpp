#include <fstream>
using namespace std;
ifstream fin("tzigla.in");
ofstream fout("tzigla.out");
int X,Y,K,L=0;

void run()
{
   for(int i=X;i>=K&&L==0;i--)
      if((Y-i)%(i-K)==0&&X%i==0)
         L=i;
}

int main()
{
   fin>>X>>Y>>K;
   if(X%Y==0)
      L=Y; else
         run();
   fout<<L;
   return 0;
}