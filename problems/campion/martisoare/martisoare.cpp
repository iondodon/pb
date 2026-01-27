#include <fstream>
using namespace std;
ifstream fin("martisoare.in");
ofstream fout("martisoare.out");
int n,c1=0,c2=0,nmax;

bool verifica(int n1,int n2)
{
   while(n1>0)
   {
      if(n1%10!=n2%10) {c1=n1%10, c2=n2%10; return false;}
      n1/=10; n2/=10;
   }
   return true;
}

void run()
{
   int n1,n2,n3,n4,i,nr;
   bool p;
   fin>>n1>>n2;
   if(n1==n2-1)
   {
      nmax=n1+n-1;
      p=true;
      for(i=3;i<=n&&p==true;i++)
         fin>>nr, n2++, p=verifica(nr,n2);
   } else
   {
      fin>>n3>>n4;
      if(n3==n2+1) verifica(n1,n2-1), n1=n2-1; else
      if(n4==n3+1) verifica(n2,n3-1), n1=n3-2; else
      if(n4==n2+2) verifica(n2-1,n1), n1=n2-1; else
      if(n4==n1+3) verifica(n1+1,n2); else
      if(n3==n1+2) verifica(n1+1,n2);
      nmax=n1+n-1;
   }
}

int main()
{
   fin>>n;
   run();
   if(c1<=c2) fout<<c1<<' '<<c2<<'\n'; else fout<<c2<<' '<<c1<<'\n';
   fout<<nmax;
   return 0;
}