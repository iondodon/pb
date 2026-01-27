#include <fstream>
#include <cmath>
using namespace std;
ifstream fin("medalion.in");
ofstream fout("medalion.out");
long long k,n,p,l[310][310];

void matricelinmax()
{
   long long nr=1,x=150,y=150,i,j;
   long long  s,maxim=0;
   l[x][y]=nr;
   y++; nr++;
   l[x][y]=(nr-1)%k+1;
   do
   {
      while(l[x][y-1]!=0)
         x++, nr++, l[x][y]=(nr-1)%k+1;
      while(l[x-1][y]!=0)
         y--, nr++, l[x][y]=(nr-1)%k+1;
      while(l[x][y+1]!=0)
         x--, nr++, l[x][y]=(nr-1)%k+1;
      while(l[x+1][y]!=0)
         y++, nr++, l[x][y]=(nr-1)%k+1;
   }while(nr<n*n);

   for(i=150-n/2;i<=150+n/2;i++)
   {
      s=0;
      for(j=150-n/2;j<=150+n/2;j++)
         s=s+l[i][j];
      if(s>maxim) maxim=s;
   }
   fout<<maxim<<'\n';
}

void up()
{
   long long val=(1+4*p*p+3*p)%k;
   if (val==0) fout<<k;
  else fout<<val;
}

int main()
{
   fin>>k>>n>>p;
   matricelinmax();
   up();
   //for(int i=1;i<=300;i++)
   //
      //for(int j=1;j<=300;j++)
         //fout<<l[i][j];
      //fout<<'\n';
   //}
   return 0;
}