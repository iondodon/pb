#include <fstream>
#include <climits>
using namespace std;
ifstream fin("razboi.in");
ofstream fout("razboi.out");
long long int n,m,ox,gf[703][703],s[703],oras=0;

void readdata()
{
   int i,j,o1,o2,t;
   fin>>n>>m;
   for(i=1;i<=n;i++)
      for(j=1;j<=n;j++)
         (i==j) ? gf[i][j]=0 : gf[i][j]=32000;
   for(i=1;i<=m;i++)
   {
      fin>>o1>>o2>>t;
      gf[o1][o2]=t;
   }
}

void drumminim()
{
   for(int k=1;k<=n;k++)
      for(int i=1;i<=n;i++)
         for(int j=1;j<=n;j++)
               if(gf[i][j]>gf[i][k]+gf[k][j])
                  gf[i][j]=gf[i][k]+gf[k][j];
}

void result()
{
   int i,j,maxim,minim,m;
   fin>>ox;
   maxim=0;
   for(i=1;i<=n;i++)
      if(gf[i][ox]>maxim) maxim=gf[i][ox];
   (maxim==32000) ? fout<<0<<'\n' : fout<<maxim<<'\n';
   minim=32000, m=0;
   for(i=1;i<=n;i++)
   {
      m=0;
      for(j=1;j<=n;j++)
         if(gf[j][i]>m) m=gf[j][i];
      if(m<32000&&m<minim)
      {
         minim=m;
         oras=i;
      }
   }
   (minim<32000) ? fout<<oras<<' '<<minim : fout<<0;
}

int main()
{
   readdata();
   drumminim();
   result();
   return 0;
}
