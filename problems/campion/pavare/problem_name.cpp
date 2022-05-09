#include <fstream>
#include <utility>
using namespace std;
ifstream fin("pavare.in");
ofstream fout("pavare.out");
int n,m,l[153][153],s,u;
bool p,q;

void pavare(int x, int y)
{
   int a=u,b=u+1;
   for(int i=x;i<=x+3;i++)
   {
      l[i][y]=a, l[i][y+2]=b;
         if(i%2==1) l[i][y+1]=a; else
            l[i][y+1]=b;
   }
   u=u+2;
}

void zone()
{
   for(int i=1;i<=n-(n%4)-1;i+=2)
      for(int j=1;j<=m;j++)
         if(l[i][j]==0)
            u++, l[i][j]=u, l[i+1][j]=u;
   if(l[n][1]==0)
   if((n%4)%2==1)
   {
      for(int i=n-(n%4)+1;i<=n;i++)
         for(int j=1;j<=m-1;j+=2)
            if(l[i][j]==0)
               u++, l[i][j]=u, l[i][j+1]=u;
   } else
      {
         for(int i=n-(n%4)+1;i<=n;i+=2)
            for(int j=1;j<=m;j++)
               if(l[i][j]==0)
                  u++, l[i][j]=u, l[i+1][j]=u;
      }
}

void run()
{
   u=1;
   if(n<m)
      swap(n,m), p=true;
   for(int j=1;j<=m-(m%3)-2;j=j+3)
      for(int i=1;i<=n-(n%4)-3;i=i+4)
         if(s+12<=(n*m)/2)
            pavare(i,j), s=s+12, q=true;
   u=u-1;
   zone();
}

void result()
{
   if(p==false)
   {
      for(int i=1;i<=n;i++)
      {
         for(int j=1;j<=m;j++)
            fout<<l[i][j]<<' ';
         fout<<'\n';
      }
   } else
      for(int j=m;j>=1;j--)
      {
         for(int i=1;i<=n;i++)
            fout<<l[i][j]<<' ';
         fout<<'\n';
      }
}

int main()
{
   fin>>n>>m;
   run();
   result();
   return 0;
}