#include <fstream>
using namespace std;
ifstream fin("gramada.in");
ofstream fout("gramada.out");
int N,f[51];

void run()
{
   int i=2,nr=0;
   f[1]=f[2]=1;
   while(f[i]<=2000000000-f[i-1])
      i++, f[i]=f[i-1]+f[i-2];
   while(N!=0)
   {
      nr++;
      i=1;
      while(f[i]<=N) i++;
      N-=f[i-1];
   }
   (nr==1) ? fout<<0 : fout<<f[i-1];
}

int main()
{
   fin>>N;
   run();
   return 0;
}
