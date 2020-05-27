#include <fstream>
using namespace std;
int p,n,nt,k,T,p10,M,s,x;
ifstream fin("culegere.in");
ofstream fout("culegere.out");
int main()
{
   fin>>p>>n;
      nt=p*(p+1)/2;
   x=nt;
   k=0;
   while(x>0)
      k++, x/=10;
   T=0; p10=1;
   for(int i=1;i<=k-1;i++)
      T=T+i*p10, p10*=10;
   T=T*9+(nt-p10+1)*k;
   M=0; s=0;
   while(s<n)
      M++, s+=M;
   fout<<T<<'\n'<<M;
   return 0;
}
