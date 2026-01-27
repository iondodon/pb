#include <fstream>
using namespace std;
ifstream fin("comoara1.in");
ofstream fout("comoara1.out");
int n,m,t[1002];

void readdata()
{
   fin>>n>>m;
   for(int i=1;i<=n;i++)
      fin>>t[i];
}

void run()
{
   int i,j,k;
   for(i=1;i<=m;i++)
   {
      for(j=1;j<=n&&t[j]>=t[j+1];j++);
      for(k=j;k<n;t[k]=t[k+1],k++);
      n--;
   }
   for(i=1;i<=n;i++)
      fout<<t[i];
}

int main()
{
   readdata();
   run();
   return 0;
}