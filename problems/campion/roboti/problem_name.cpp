#include <fstream>
using namespace std;
ifstream fin("roboti.in");
ofstream fout("roboti.out");
int n,k;
char a[21][21],b[21][21];
bool p[21][21];

void readdata()
{
   fin>>n>>k;
   for(int i=1;i<=n;i++)
      for(int j=1;j<=n;j++)
         fin>>a[i][j];
}

void resetare()
{
   for(int i=1;i<=n;i++)
      for(int j=1;j<=n;j++)
         a[i][j]=b[i][j], b[i][j]='.', p[i][j]=false;
}

void deplasare()
{
   for(int i=1;i<=n;i++)
      for(int j=1;j<=n;j++)
         if(a[i][j]!='.')
         {
            if(a[i][j]=='U'&&i-1<1) a[i][j]='D';
            if(a[i][j]=='R'&&j+1>n) a[i][j]='L';
            if(a[i][j]=='D'&&i+1>n) a[i][j]='U';
            if(a[i][j]=='L'&&j-1<1) a[i][j]='R';
            switch(a[i][j])
            {
               case 'U':
                  if(p[i-1][j]==true) b[i-1][j]='.'; else b[i-1][j]=a[i][j], p[i-1][j]=true;
                  break;
               case 'R':
                  if(p[i][j+1]==true) b[i][j+1]='.'; else b[i][j+1]=a[i][j], p[i][j+1]=true;
                  break;
               case 'D':
                  if(p[i+1][j]==true) b[i+1][j]='.'; else b[i+1][j]=a[i][j], p[i+1][j]=true;
                  break;
               case 'L':
                  if(p[i][j-1]==true) b[i][j-1]='.'; else b[i][j-1]=a[i][j], p[i][j-1]=true;
                  break;
            }
         }
}

void run()
{
   while(k)
   {
      deplasare();
      resetare();
      k--;
   }
}

int ramasi()
{
   int ramasi=0;
   for(int i=1;i<=n;i++)
      for(int j=1;j<=n;j++)
         if(a[i][j]!='.') ramasi++;
   return ramasi;
}

void afisare()
{
   fout<<ramasi()<<'\n';
   for(int i=1;i<=n;i++)
   {
      for(int j=1;j<=n;j++)
         fout<<a[i][j];
      fout<<'\n';
   }
}

int main()
{
   readdata();
   run();
   afisare();
   return 0;
}