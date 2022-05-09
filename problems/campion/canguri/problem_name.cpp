#include <fstream>
using namespace std;
ifstream fin("canguri.in");
ofstream fout("canguri.out");
int n;
typedef unsigned long long int ulli;

ulli divizorcomun(ulli a,ulli b)
{
   ulli r=a%b;
   while(r>0)
      a=b, b=r, r=a%b;
   return b;
}

int main()
{
   ulli x,cmmc=1,maxim=0;
   fin>>n;
   for(int i=1;i<=n;i++)
      {
         fin>>x;
         if(x>maxim) maxim=x;
         cmmc=cmmc*x/divizorcomun(x,cmmc);
      }
   if(cmmc>=3*maxim) fout<<cmmc; else
   {
      ulli cm=0;
      while(cm<3*maxim)
         cm=cm+cmmc;
      fout<<cm;
   }
   return 0;
}