#include <fstream>
using namespace std;
ifstream fin("pereti.in");
ofstream fout("pereti.out");
int m,n,lg=0;
struct nod_directii
{
   bool N,E,S,V;
   bool p;
}t[102][102];

void descompun_binar(int x,int lin,int col)
{
   int i=0;
   while(x>0)
   {
      i++;
      if(x%2==1)
      {
         if(i==1) t[lin][col].V=true, t[lin][col-1].E=true; else
         if(i==2) t[lin][col].S=true, t[lin+1][col].N=true; else
         if(i==3) t[lin][col].E=true, t[lin][col+1].V=true; else
         if(i==4) t[lin][col].N=true, t[lin-1][col].S=true;
      }
      x=x/2;
   }
}

void readdata()
{
   int x;
   fin>>m>>n;
   for(int i=1;i<=m;i++)
      for(int j=1;j<=n;j++)
         fin>>x, descompun_binar(x,i,j);
}

void deplasare(int i,int j)
{
   t[i][j].p=true;
   if(t[i][j].N==true) lg++;
   if(t[i][j].E==true) lg++;
   if(t[i][j].S==true) lg++;
   if(t[i][j].V==true) lg++;
   if(i-1>=0&&t[i][j].N==false&&t[i-1][j].p==false) deplasare(i-1,j);
   if(j+1<=n+1&&t[i][j].E==false&&t[i][j+1].p==false) deplasare(i,j+1);
   if(i+1<=m+1&&t[i][j].S==false&&t[i+1][j].p==false) deplasare(i+1,j);
   if(j-1>=0&&t[i][j].V==false&&t[i][j-1].p==false) deplasare(i,j-1);
}

int main()
{
   readdata();
   deplasare(0,0);
   fout<<lg;
   return 0;
}
