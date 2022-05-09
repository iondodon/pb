#include <fstream>
using namespace std;
int m,n,l[14][14],tb[14],ln,lm,locl,locc,maxim=0,incercare=0;
ifstream fin("tablou.in");
ofstream fout("tablou.out");

int convert(int baza)
{
   int sol=0;
   for(int j=1;j<=ln;j++)
      sol=sol*baza+tb[j];
   return sol;
}

void sterge(int lin,int col)
{
   for(int j=col;j<=ln-1;j++)
      for(int i=1;i<=lm;i++)
         l[i][j]=l[i][j+1];
   ln--;
   for(int i=lin;i<=lm-1;i++)
      for(int j=1;j<=ln;j++)
         l[i][j]=l[i+1][j];
   lm--;
}

void run()
{
   lm=m, ln=n;
   int baza=0;
   locc=-1;
   while(ln>1&&lm>1&&locc!=0)
   {
      maxim=0;
      incercare++;
      for(int i=1;i<=lm;i++)
      {
         baza=0;
         for(int j=1;j<=ln;j++)
         {
            tb[j]=l[i][j];
            if(tb[j]>baza) baza=tb[j];
         }
         if(baza==0) baza=2; else baza++;
         if(incercare==1) fout<<baza<<' ';
         if(convert(baza)>maxim)
            maxim=convert(baza), locl=i;
      }
      if(incercare==1) fout<<'\n'<<maxim<<'\n';
      locc=0;
      int j=1;
      while(j<=ln&&locc==0)
      {
         if(l[locl][j]%2==0)
            locc=j;
         j++;
      }
      if(locc!=0)
         sterge(locl,locc);
   }
}

void readdata()
{
   fin>>m>>n;
   for(int i=1;i<=m;i++)
      for(int j=1;j<=n;j++)
         fin>>l[i][j];
}

void result()
{
   fout<<lm<<' '<<ln<<'\n';
   for(int i=1;i<=lm;i++)
   {
      for(int j=1;j<=ln;j++)
         fout<<l[i][j]<<' ';
      fout<<'\n';
   }
}

int main()
{
   readdata();
   run();
   result();
   return 0;
}