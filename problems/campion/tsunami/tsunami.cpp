#include <fstream>
using namespace std;
ifstream fin("tsunami.in");
ofstream fout("tsunami.out");
int n,m,h,l[1002][1002],afectate=0,lg=0;
bool p[1002][1002];

struct nod_lista
{
   int x,y;
}t[1000002];

void readdata()
{
   fin>>n>>m>>h;
   for(int i=1;i<=n;i++)
      for(int j=1;j<=m;j++)
         fin>>l[i][j];
}

void add(int x,int y)
{
   afectate++;
   p[x][y]=true;
   lg++;
   t[lg].x=x;
   t[lg].y=y;
}

void filll(int x,int y)
{
   int it=1,i,j;
   lg=0;
   add(x,y);
   while(it<=lg)
   {
      i=t[it].x, j=t[it].y;
      if(l[i-1][j]<h&&l[i-1][j]>0&&p[i-1][j]==false&&i-1>=1) add(i-1,j);
      if(l[i][j+1]<h&&l[i][j+1]>0&&p[i][j+1]==false&&j+1<=m) add(i,j+1);
      if(l[i+1][j]<h&&l[i+1][j]>0&&p[i+1][j]==false&&i+1<=n) add(i+1,j);
      if(l[i][j-1]<h&&l[i][j-1]>0&&p[i][j-1]==false&&j-1>=1) add(i,j-1);
      it++;
   }
}

void run()
{

   for(int i=1;i<=n;i++)
      for(int j=1;j<=m;j++)
         if(l[i][j]>0&&l[i][j]<h&&p[i][j]==false&&(l[i-1][j]==0||l[i][j+1]==0||l[i+1][j]==0||l[i][j-1]==0))
            filll(i,j);
}

void limite()
{
   for(int i=1;i<=n;i++)
      l[i][0]=-1, l[i][m+1]=-1;
   for(int j=1;j<=m;j++)
      l[0][j]=-1, l[n+1][j]=-1;
}

int main()
{
   readdata();
   limite();
   run();
   fout<<afectate;
   return 0;
}