#include <fstream>
using namespace std;
ifstream fin("cifre1.in");
ofstream fout("cifre1.out");
unsigned long long int n,nrc,p10,k,naux,i;

int main()
{
   fin>>n;
   naux=n;
   nrc=0; p10=1;
   k=0;
   while(naux>0)
      k++, naux=naux/10;
   for(i=1;i<=k-1;i++)
      nrc=nrc+i*p10, p10=p10*10;
   nrc=nrc*9+(n-p10+1)*k;
   fout<<nrc;
   return 0;
}
