#include <fstream>
using namespace std;
ifstream fin("bileprime.in");
ofstream fout("bileprime.out");
typedef unsigned long long int ulli;
int n;
ulli a,b;
const int maxim=1000000;
bool p[maxim+1];

void run()
{
   int x;
   for(int i=1;i<=n;i++)
   {
      fin>>x;
      if(a>=x&&p[x]==false)
         a=a-x, b=b+x; else
            if(b>=x&&p[x]==true)
               b=b-x, a=a+x;
   }
}

void prime()
{
   p[1]=true;
   for(int i=2;i<=maxim;i++)
      if(p[i]==false)
         for(int j=i+i;j<=maxim;j=j+i)
            p[j]=true;
}

int main()
{
   fin>>n>>a>>b;
   prime();
   run();
   fout<<a;
   return 0;
}
