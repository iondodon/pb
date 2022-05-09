#include <fstream>
#include <cstdlib>
using namespace std;
ifstream fin("sudoku.in");
ofstream fout("sudoku.out");
int l[10][10];

void readdata()
{
   char s[9];
   for(int i=1;i<=9;i++)
   {
      fin>>s;
      for(int j=0;j<=8;j++)
         l[i][j+1]=s[j]-'0';
   }
}

void afisare()
{
   for(int i=1;i<=9;i++)
   {
      for(int j=1;j<=9;j++)
         fout<<l[i][j];
      fout<<'\n';
   }
}

bool posibil(int k,int x,int y)
{
   int sti,stj,i,j;
   for(i=1;i<=9;i++) if(l[i][y]==k) return false;
   for(j=1;j<=9;j++) if(l[x][j]==k) return false;
   if(x<=3) sti=1; else
   if(x>3&&x<=6) sti=4; else
   if(x>6) sti=7;
   if(y<=3) stj=1; else
   if(y>3&&y<=6) stj=4; else
   if(y>6) stj=7;
   for(i=sti;i<=sti+2;i++)
      for(j=stj;j<=stj+2;j++)
         if(l[i][j]==k) return false;
   return true;
}

void bk(int x, int y)
{
   int i,j,k;
   for(i=x;i<=9;i++)
      for(j=1;j<=9;j++)
         if(l[i][j]==0)
         {
            for(k=1;k<=9;k++)
               if(posibil(k,i,j)) l[i][j]=k, bk(i,j);
            l[i][j]=0;
            return;
         }
   afisare();
   exit(0);
}

int main()
{
   readdata();
   bk(1,1);
   return 0;
}