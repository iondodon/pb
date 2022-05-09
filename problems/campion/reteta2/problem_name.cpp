#include <fstream>
#include <iomanip>
using namespace std;
ifstream fin("reteta2.in");
ofstream fout("reteta2.out");
int n,m,st[22],fr[22];
float p[22],pret_min=999999999;
struct reteta
{
   int tip,q,l,t[22];
}r[16];

void readdata()
{
   fin>>n>>m;
   int i,j;
   for(i=1;i<=m;i++)
   {
      fin>>r[i].tip>>r[i].q;
      for(j=1;j<=r[i].q;j++)
         r[i].l++, fin>>r[i].t[r[i].l];
   }
   for(i=1;i<=n;i++)
      fin>>p[i];
}

float cost(int k)
{
   float raspuns=0,pret_reteta;
   int i,j;
   for(i=1;i<=k;i++)
   {
      pret_reteta=0;
      for(j=1;j<=r[st[i]].l;j++)
         pret_reteta+=p[r[st[i]].t[j]];
      if(r[st[i]].tip==1)
         raspuns+=pret_reteta; else raspuns+=pret_reteta/2;
   }
   return raspuns;
}

void verifica(int k)
{
   int i,j;
   float pret;
   bool ok=true;
   for(i=1;i<=21;i++) fr[i]=0;
   for(i=1;i<=k&&ok;i++)
   {
      for(j=1;j<=r[st[i]].l&&ok;j++)
      {
         fr[r[st[i]].t[j]]++;
         if(fr[r[st[i]].t[j]]>1) ok=false;
      }
   }
   if(ok==true)
      for(i=1;i<=n&&ok;i++)
         if(fr[i]==0) ok=false;
   if(ok==true)
   {
      pret=cost(st[0]);
      if(pret<pret_min) pret_min=pret;
   }
}

void bk()
{
   int i;
   if(st[0]>0) verifica(st[0]);
   for(i=st[st[0]]+1;i<=m;i++)
   {
      st[++st[0]]=i;
      bk();
      st[st[0]]=0;
      st[0]--;
   }
}

int main()
{
   readdata();
   bk();
   fout<< std::fixed << std::setprecision(1) << pret_min;
   return 0;
}