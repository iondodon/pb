#include <fstream>
#include <cstdlib>
using namespace std;
ifstream fin("drept.in");
ofstream fout("drept.out");
int n,l[1001][1001],maxim=0;

void run()
{
   int x1,x2,y1,y2,l1,l2;
   for(int i=1;i<=n;i++)
   {
      fin>>x1>>y1>>x2>>y2;
      l1=abs(x2-x1);
      l2=abs(y2-y1);
      l[l1][l2]++;
      if(l1!=l2) l[l2][l1]++;
      if(l[l1][l2]>maxim) maxim=l[l1][l2];
   }
}

int main()
{
   fin>>n;
   run();
   fout<<maxim;
   return 0;
}
