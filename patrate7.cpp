#include <fstream>
#include <cmath>
using namespace std;
ifstream fin("patrate7.in");
ofstream fout("patrate7.out");
int n,m,bin[29],nr=0,lin,col;

void run()
{
   int patrat,p,dim,x,cat;
   for(int i=1;i<=m;i++)
   {
      fin>>patrat, bin[patrat]=1;
      if(i==1) p=patrat;
   }
   for(int i=n;i>=1;i--)
      nr=nr*2+bin[i];
   fout<<nr<<'\n';
   p--;
   x=1<<(n-1);
   dim=1;
   while(dim*dim<x) dim++;
   cat=(nr>>(p+1)<<p)+(nr&((1<<p)-1));
   col=cat/dim+1;
   lin=cat%dim+1;
   fout<<lin<<' '<<col;
}

int main()
{
   fin>>n>>m;
   run();
   return 0;
}
