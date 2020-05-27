#include <fstream>
using namespace std;
ifstream fin("carti1.in");
ofstream fout("carti1.out");
int n,l=0,batai=0,poz[100002];

void readdata()
{
   int x;
   fin>>n;
   for(int i=1;i<=n;i++)
   {
      l++;
      fin>>x;
      poz[x]=l;
   }
}

void run()
{
   for(int i=1;i<=n;i++)
      if(poz[i]>poz[i+1]) batai++;
   fout<<batai-1;
}

int main()
{
   readdata();
   run();
   return 0;
}
