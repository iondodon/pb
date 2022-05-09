#include <fstream>
using namespace std;
ifstream fin("betasah.in");
ofstream fout("betasah.out");
int n,d,k,l[1001][1001],nr=0,albe=0,accesibile=0;
struct nod
{
   int x,y;
}t[101];

void readdata()
{
   int x,y;
   fin>>n>>d>>k;
   for(int i=1;i<=d;i++)
      fin>>x>>y, l[x][y]=1, nr++, t[nr].x=x, t[nr].y=y;
   for(int i=1;i<=k;i++)
      fin>>x>>y, l[x][y]=2;
}

void marchez(int x,int y)
{
   int i,j;
   i=x-1, j=y;
   while(x>=1&&j<=i&&l[i][j]!=1&&l[i][j]!=2)
      l[i][j]=3, i--;
   i=x-1, j=y+1;
   while(i>=1&&j<=i&&l[i][j]!=1&&l[i][j]!=2)
      l[i][j]=3, i--, j++;
   i=x, j=y+1;
   while(j<=i&&j<=n&&l[i][j]!=1&&l[i][j]!=2)
      l[i][j]=3, j++;
   i=x+1, j=y+1;
   while(i<=n&&j<=i&&l[i][j]!=1&&l[i][j]!=2)
      l[i][j]=3, i++, j++;
   i=x+1, j=y;
   while(i<=n&&j<=i&&l[i][j]!=1&&l[i][j]!=2)
      l[i][j]=3, i++;
   i=x+1, j=y-1;
   while(i<=n&&j>=1&&j<=i&&l[i][j]!=1&&l[i][j]!=2)
      l[i][j]=3, i++, j--;
   i=x, j=y-1;
   while(j>=1&&j<=i&&l[i][j]!=1&&l[i][j]!=2)
      l[i][j]=3, j--;
   i=x-1, j=y-1;
   while(i>=1&&j>=1&&j<=i&&l[i][j]!=1&&l[i][j]!=2)
      l[i][j]=3, i--, j--;
}

void run()
{
   for(int i=1;i<=d;i++)
      marchez(t[i].x,t[i].y);
}

void patratealbe()
{
   int aux;
   for(int i=1;i<=n;i++)
   {
      aux=0;
      for(int j=1;j<=i;j++)
         if(l[i][j]==0||l[i][j]==1) aux++;
      if(aux>albe) albe=aux;
   }
}

void nraccesibile()
{
   for(int i=1;i<=n;i++)
      for(int j=1;j<=i;j++)
         if(l[i][j]==3) accesibile++;
}

int main()
{
   readdata();
   patratealbe();
   run();
   nraccesibile();
   fout<<albe<<'\n'<<accesibile;
   return 0;
}