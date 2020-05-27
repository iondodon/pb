#include <fstream>
using namespace std;
ifstream fin("tub.in");
ofstream fout("tub.out");
int n,t[400],l=1;

void inmultire()
{
   int r=0;
   t[l]=2;
   for(int i=2;i<=n-1;i++)
   {
      for(int j=1;j<=l;j++)
         t[j]=t[j]*2+r, r=t[j]/10, t[j]=t[j]%10;
      if(r!=0) l++, t[l]=r, r=0;
   }
}

void result()
{
   for(int i=l;i>=1;i--)
      fout<<t[i];
}

int main()
{
   fin>>n;
   if(n==2) fout<<2; else
      if(n==1) fout<<0; else
         inmultire(), result();
   return 0;
}
