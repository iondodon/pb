#include <fstream>
using namespace std;
ifstream fin("harta2.in");
ofstream fout("harta2.out");
int n,m,p,k;
bool l[1504],c[1504];
struct cladire{
   int H,L;
}tc[1003];
short t[1504][1504];

void cautlmax()
{
   int lmax=0,smax=0,C=0,i1,j1,i2,j2;
   for(int i=1;i<=k;i++)
   {
      fin>>i1>>j1>>i2>>j2;
      tc[i].H=i2-i1+1, tc[i].L=j2-j1+1;
      if(tc[i].H==tc[i].L)
         if(tc[i].H*tc[i].L>smax) smax=tc[i].H*tc[i].L, lmax=tc[i].L;
   }
   for(int i=1;i<=k;i++)
      if(tc[i].H<lmax-1&&tc[i].L<lmax-1) C++;
   fout<<smax<<' '<<C;
}

void harta()
{
   int i1,j1,i2,j2,i,j,i2max=0,j2max=0;
   for(i=1;i<=k;i++)
   {
      fin>>i1>>j1>>i2>>j2;
      if(i2>i2max) i2max=i2;
      if(j2>j2max) j2max=j2;
      for(j=j1;j<=j2;j++) t[i1][j]=1, t[i2][j]=1, c[j]=true;
      for(j=i1;j<=i2;j++) t[j][j1]=1, t[j][j2]=1, l[j]=true;
   }
   l[i2max+1]=true, c[j2max+1]=true;
   for(i=1;i<=i2max+1;i++)
   {
      if((l[i]==true)||(l[i]==false&&l[i+1]==true))
      {
         for(j=1;j<=j2max+1;j++)
            if((c[j]==true)||(c[j]==false&&c[j+1]==true))
               fout<<t[i][j]<<' ';
         fout<<'\n';
      }
   }
}

void run()
{
   if(p==1) cautlmax(); else
      harta();
}

int main()
{
   fin>>p;
   fin>>n>>m>>k;
   run();
   return 0;
}
