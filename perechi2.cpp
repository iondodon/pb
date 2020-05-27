#include <fstream>
using namespace std;
int n,m,a[1001],b[1001],raspuns=0;
bool s[1000001];
ifstream fin("perechi2.in");
ofstream fout("perechi2.out");

void readdata()
{
   fin>>n>>m;
   int i;
   for(i=1;i<=n;i++)
      fin>>a[i];
   for(i=1;i<=m;i++)
      fin>>b[i];
}

void run()
{
   int i,j;
   for(i=2;i<=n;i++)
      for(j=1;j<i;j++)
         s[a[i]+a[j]]=true;
   for(i=2;i<=m;i++)
      for(j=1;j<i;j++)
         if(s[b[i]+b[j]]==true) raspuns++;
   fout<<raspuns;
}

int main()
{
   readdata();
   run();
   return 0;
}
