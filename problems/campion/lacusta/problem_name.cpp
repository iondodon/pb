#include <fstream>
#include <climits>
using namespace std;
ifstream fin("lacusta.in");
ofstream fout("lacusta.out");

int m,n,a[101][101],b[101][101];

void readdata()
{
   fin>>m>>n;
   for(int i=1;i<=m;i++)
      for(int j=1;j<=n;j++)
         fin>>a[i][j];
}

int minim(int lin,int col,int lg)
{
   int r=INT_MAX;
   for(int j=1;j<=lg;j++)
      if(j!=col&&b[lin][j]<r)
         r=b[lin][j];
   return r;
}

void run()
{
   int i,j;
   b[2][1]=INT_MAX;
   for(j=2;j<=n;j++)
      b[2][j]=a[1][1]+a[1][j]+a[2][j];
   for(i=3;i<=m;i++)
      for(j=1;j<=n;j++)
         b[i][j]=a[i][j]+a[i-1][j]+minim(i-1,j,n);
   fout<<a[m][n]+minim(m,0,n-1);
}

int main()
{
   readdata();
   run();
   return 0;
}