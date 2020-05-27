#include <fstream>
using namespace std;
ifstream fin("punctfix.in");
ofstream fout("punctfix.out");
int z,n,k,a[100001],fr[100001];

void readdata()
{
   fin>>n;
   for(int i=1;i<=n;i++)
      fin>>a[i];
   fin>>k;
}

void run()
{
   int v;
   z=n-a[n];
   for(int i=1;i<=n;i++)
      a[i]=i-a[i]-z;
   for(int i=1;i<=n;i++)
      fr[a[i]]++;
   for(int i=1;i<=k;i++)
   {
      fin>>v;
      if(v-z<0) fout<<0<<'\n'; else
         fout<<fr[v-z]<<'\n';
   }
}

int main()
{
   readdata();
   run();
   return 0;
}
