#include <fstream>
using namespace std;
ifstream fin("panouri.in");
ofstream fout("panouri.out");
int n,m,a[15001],b[1001],fr[1001];

void readdata()
{
   int i,x;
   fin>>n>>m;
   for(i=1;i<=n;i++)
      fin>>a[i];
   for(i=1;i<=m;i++)
      fin>>x, b[x]=1;
}

bool ok(int st)
{
   bool r=true;
   if(b[a[st]]==1&&fr[a[st]]-1==0)
      r=false;
   return r;
}

void run()
{
   int st=0,dr=0,sol=2000000000,nre=0;
   while(nre<m&&dr<n)
   {
      dr++;
      if(fr[a[dr]]==0&&b[a[dr]]==1) nre++;
      fr[a[dr]]++;
   }
   if(nre==m)
   while(dr<=n)
   {
      while(ok(st))
         fr[a[st]]--, st++;
      if(dr-st<sol) sol=dr-st;
      dr++;
      fr[a[dr]]++;
   }
   if(sol==2000000000) fout<<-1; else fout<<sol;
}

int main()
{
   readdata();
   run();
   return 0;
}