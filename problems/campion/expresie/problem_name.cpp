#include <fstream>
using namespace std;
ifstream fin("expresie.in");
ofstream fout("expresie.out");
typedef unsigned long long int ulli;
int n;
ulli t[1001],suma=0,smax=0;

void readdata()
{
   fin>>n;
   int i;
   for(i=1;i<=n;i++)
      fin>>t[i], suma+=t[i];
}

void caut()
{
   int i,j;
   for(i=1;i<=n-2;i++)
      if(suma-t[i]-t[i+1]-t[i+2]+t[i]*t[i+1]*t[i+2]>smax)
         smax=suma-t[i]-t[i+1]-t[i+2]+t[i]*t[i+1]*t[i+2];
   for(i=1;i<=n-3;i++)
      for(j=i+2;j<=n-1;j++)
         if(suma-t[i]-t[i+1]-t[j]-t[j+1]+t[i]*t[i+1]+t[j]*t[j+1]>smax)
            smax=suma-t[i]-t[i+1]-t[j]-t[j+1]+t[i]*t[i+1]+t[j]*t[j+1];
}

int main()
{
   readdata();
   caut();
   fout<<smax;
   return 0;
}