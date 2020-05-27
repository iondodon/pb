#include <fstream>
#include <cmath>
using namespace std;
ifstream fin("diferenta.in");
ofstream fout("diferenta.out");
int n,m;

int perechi(int x)
{
   int raspuns=0;
   for(int i=1;i<=(int)sqrt(x);i++)
      if(x%i==0)
         if((i+x/i)%2==0) raspuns++;
   return raspuns;
}

void run()
{
   int x;
   fin>>n>>m;
   for(int i=1;i<=n;i++)
   {
      for(int j=1;j<=m;j++)
         fin>>x, fout<<perechi(x)<<' ';
      fout<<'\n';
   }
}

int main()
{
   run();
   return 0;
}
