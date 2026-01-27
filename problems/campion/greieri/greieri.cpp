#include <fstream>
using namespace std;
ifstream fin("greieri.in");
ofstream fout("greieri.out");
long long int n,m,nr,c,r,k,p,i,s;

void run()
{
   m=m%nr;
   c=m/(n-1);
   r=m%(n-1);
   k=n-r;
   p=n-c;
   for(i=n-c+1;i<=n;i++)
   {
      s++;
      if(s==k) fout<<p<<' ';
      fout<<i<<' ';
   }
   for(i=1;i<n-c;i++)
   {
      s++;
      if(s==k) fout<<p<<' ';
      fout<<i<<' ';
   }
   if(!r) fout<<p<<'\n';
}

void readdata()
{
   fin>>n>>m;
   nr=n*(n-1);
   fout<<nr<<'\n';
}

int main()
{
   readdata();
   run();
   return 0;
}