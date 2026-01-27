#include <fstream>
using namespace std;
ifstream fin("sortari.in");
ofstream fout("sortari.out");
const int  nr=19573;
int n,a[201];

void pd()
{
   a[0]=1, a[1]=1, a[2]=2, a[3]=6;
   int i,j,k,s,l;
   for(i=4;i<=n;i++)
   {
      s=0, l=1;
      for(j=1;j<=i-1;j++)
         for(k=j+1;k<=i;k++)
         {
            l=(a[j-1]*a[k-1-j])%nr*a[i-k];
            l=l%nr;
            s=s+l;
            s=s%nr;
         }
      a[i]=(2*s)%nr;
   }
}

int main()
{
   fin>>n;
   pd();
   fout<<a[n];
   return 0;
}