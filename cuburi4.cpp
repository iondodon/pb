#include <fstream>
using namespace std;
ifstream fin("cuburi4.in");
ofstream fout("cuburi4.out");
int n,k,cf[10];

int stransform(int x)
{
   fill_n(cf,10,0);
   int k=0,kk=x,minim=1000,i,j,nr=0,l;
   while(kk>0) kk/=10, k++;
   for(i=k;i>=1;i--) cf[i]=x%10, x/=10;
   for(i=1;i<=4;i++)
      if(cf[i]<minim&&cf[i]!=0) minim=cf[i],j=i;
   nr=minim, l=5;
   while(l<=k)
   {
      minim=cf[j+1], j++;
      for(kk=j+1;kk<=l;kk++)
         if(cf[kk]<minim) minim=cf[kk], j=kk;
      nr=nr*10+minim;
      l++;
   }
   return nr;
}

void run()
{
   int piramide=0,l=1,i,x;
   while(piramide+l*l*6<n)
      piramide+=l*l*6, l++;
   l--;
   fout<<l<<'\n';
   for(i=1;i<=k*(k+1)*(2*k+1);i++)
   {
      fin>>x;
      fout<<stransform(x)<<' ';
   }
}

int main()
{
   fin>>n>>k;
   run();
   return 0;
}
