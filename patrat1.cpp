#include <fstream>
using namespace std;
ifstream fin("patrat1.in");
ofstream fout("patrat1.out");
int n,m,l[202][202],lmax=0,str=0,conste=0;
bool p[202][202];
void readdata()
{
   fin>>n>>m;
   for(int i=1;i<=n;i++)
      for(int j=1;j<=m;j++)
         fin>>l[i][j];
}

void stralucitoare()
{
   for(int i=1;i<=n;i++)
      for(int j=1;j<=m;j++)
      {
         int x=l[i][j];
         if(x>l[i-1][j]&&x>l[i-1][j+1]&&x>l[i][j+1]&&x>l[i+1][j+1]&&x>l[i+1][j]&&x>l[i+1][j-1]&&x>l[i][j-1]&&x>l[i-1][j-1])
            p[i][j]=true, str++;
      }
}

void constelatii()
{
   for(int i=1;i<=n-1;i++)
      for(int j=1;j<=m-1;j++)
         if(p[i][j]==true)
            for(int k=j+1;k<=m;k++)
               if(p[i][k]==true&&i+(k-j)<=n)
                  if(p[i+(k-j)][j]==true&&p[i+(k-j)][k]==true)
                  {
                     conste++;
                     if(k-j+1>lmax) lmax=k-j+1;
                  }
}

int main()
{
   readdata();
   stralucitoare();
   constelatii();
   fout<<str<<'\n'<<conste<<'\n'<<lmax;
   return 0;
}
