#include <fstream>
using namespace std;
ifstream fin("cifru.in");
ofstream fout("cifru.out");
long int n,l[101][101],tn[101],te[101],ts[101],tv[101];

void readdata()
{
   fin>>n;
   for(int i=1;i<=n;i++)
      for(int j=1;j<=n;j++)
         fin>>l[i][j];
}

long int nord(int lin)
{
   long int r=0;
   for(int j=lin;j<=n-lin+1;j++)
      r+=l[lin][j];
   return r;
}

long int est(int lin)
{
   long int r=0;
   for(int i=lin;i<=n-lin+1;i++)
      r+=l[i][n-lin+1];
   return r;
}

long int sud(int lin)
{
   long int r=0;
   for(int j=lin;j<=n-lin+1;j++)
      r+=l[n-lin+1][j];
   return r;
}

long int vest(int lin)
{
   long int r=0;
   for(int i=lin;i<=n-lin+1;i++)
      r+=l[i][lin];
   return r;
}

void copiere(int lin)
{
   for(int j=lin;j<=n-lin+1;j++)
      tn[j]=l[lin][j];
   for(int i=lin;i<=n-lin+1;i++)
      te[i]=l[i][n-lin+1];
   for(int j=lin;j<=n-lin+1;j++)
      ts[j]=l[n-lin+1][j];
   for(int i=lin;i<=n-lin+1;i++)
      tv[i]=l[i][lin];
}

void schimba(int x,int lin)
{
   switch(x)
   {
      case 2:{
         for(int i=1;i<=1;i++)
         {
         copiere(lin);
         for(int j=lin;j<=n-lin+1;j++)
            l[lin][j]=te[j];
         for(int i=lin;i<=n-lin+1;i++)
            l[i][n-lin+1]=ts[n-i+1];
         for(int j=lin;j<=n-lin+1;j++)
            l[n-lin+1][j]=tv[j];
         for(int i=lin;i<=n-lin+1;i++)
            l[i][lin]=tn[n-i+1];
         }
      }; break;
      case 3:{
         for(int i=1;i<=2;i++)
         {
         copiere(lin);
         for(int j=lin;j<=n-lin+1;j++)
            l[lin][j]=te[j];
         for(int i=lin;i<=n-lin+1;i++)
            l[i][n-lin+1]=ts[n-i+1];
         for(int j=lin;j<=n-lin+1;j++)
            l[n-lin+1][j]=tv[j];
         for(int i=lin;i<=n-lin+1;i++)
            l[i][lin]=tn[n-i+1];
         }
      }; break;
      case 4:{
         for(int i=1;i<=3;i++)
         {
         copiere(lin);
         for(int j=lin;j<=n-lin+1;j++)
            l[lin][j]=te[j];
         for(int i=lin;i<=n-lin+1;i++)
            l[i][n-lin+1]=ts[n-i+1];
         for(int j=lin;j<=n-lin+1;j++)
            l[n-lin+1][j]=tv[j];
         for(int i=lin;i<=n-lin+1;i++)
            l[i][lin]=tn[n-i+1];
         }
      }; break;
   }
}

void rotire(int cerc)
{
   long int x=0,smax=-1,suma;
   suma=nord(cerc);
   if(suma>smax) smax=suma, x=1;
   suma=est(cerc);
   if(suma>smax) smax=suma, x=2;
   suma=sud(cerc);
   if(suma>smax) smax=suma, x=3;
   suma=vest(cerc);
   if(suma>smax) smax=suma, x=4;
   schimba(x,cerc);
}

void run()
{
   for(int i=1;i<=n/2;i++)
      rotire(i);
}

void result()
{
   long int smax=0;
   for(int i=1;i<=n/2;i++)
      for(int j=i;j<=n-i+1;j++)
         smax+=l[i][j];
   //if(n%2==1) smax+=l[n/2+1][n/2+1];
   fout<<smax<<'\n';
   for(int i=1;i<=n;i++)
   {
      for(int j=1;j<=n;j++)
         fout<<l[i][j]<<' ';
      fout<<'\n';
   }
}

int main()
{
   readdata();
   run();
   result();
   return 0;
}
