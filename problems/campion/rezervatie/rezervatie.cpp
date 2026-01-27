#include <fstream>
#include <cstring>
using namespace std;
ifstream fin("rezervatie.in");
ofstream fout("rezervatie.out");
int L,C,N,K,t[1001];
char c[10001],l[201][201];

void readdata()
{
   fin>>L>>C;
   fin>>c;
   fin>>N;
}

bool impar(int x,int y)
{
   bool r;
   int intersectii=0;
   for(int j=C;j>=y;j--)
      if(l[x][j]=='E') intersectii++;
   if(intersectii%2==1) r=true; else r=false;
   return r;
}

void run()
{
   int x,y;
   for(int i=1;i<=N;i++)
   {
      fin>>x>>y;
      if(impar(x,y)) K++, t[K]=i;
   }
}

void make()
{
   int i=0,j=0;
   for(unsigned h=0;h<strlen(c);h++)
      switch(c[h])
      {
         case 'N': if(j>=1) l[i][j]='E';
                     i--; break;
         case 'S': if(j>=1) l[i+1][j]='E';
                     i++; break;
         case 'E': j++; break;
         case 'V': j--; break;
      }
}

void result()
{
   fout<<K<<'\n';
   for(int i=1;i<=K;i++)
      fout<<t[i]<<' ';
}

int main()
{
   readdata();
   make();
   run();
   result();
   return 0;
}