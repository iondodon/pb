#include <fstream>
using namespace std;
ifstream fin("culmi.in");
ofstream fout("culmi.out");
int s[10002],n,l;

void run()
{
   bool p;
   for(int i=1,x;i<=n;i++)
   {
      fin>>x;
      p=false;
      int j=1;
      while(j<=l&&p==false)
      {
         if(s[j]<x)
            s[j]=x, p=true;
         j++;
      }
      if(p==false)
         l++, s[j]=x;
   }
}

int main()
{
   fin>>n;
   run();
   fout<<l;
   return 0;
}