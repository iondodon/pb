#include <fstream>
using namespace std;
ifstream fin("pluricex.in");
ofstream fout("pluricex.out");
int n,k,D,t[9];
struct elev
{
   int nr;
   int d[11];
}e[23];
bool p[11];

void readdata()
{
   fin>>n>>k>>D;
   for(int i=1;i<=n;i++)
   {
      fin>>e[i].nr;
      for(int j=1;j<=e[i].nr;j++)
         fin>>e[i].d[j];
   }
}

void verifica()
{
   if(t[1]!=t[2])
   {
      int i,j,r=0;
      for(i=1;i<=D;i++) p[i]=false;
      for(i=1;i<=k;i++)
         for(j=1;j<=e[t[i]].nr;j++)
            if(p[e[t[i]].d[j]]==false)
            p[e[t[i]].d[j]]=true, r++;
      if(r==D)
         {
            for(i=1;i<=k;i++)
               fout<<t[i]<<' ';
            fout<<'\n';
         }
   }
}

void generare()
{
   int i,j;
   for(i=1;i<=k;i++) t[i]=1;
   verifica();
   bool ok=true;
   while(ok)
   {
      i=k;
      while(t[i]==n-k+i&&i>0) i--;
      if(i==0) ok=false; else
      {
         t[i]++;
         for(j=i+1;j<=k;j++) t[j]=t[j-1]+1;
         verifica();
      }
   }
}

int main()
{
   readdata();
   generare();
   return 0;
}