#include <fstream>
using namespace std;
ifstream fin("nivfractie.in");
ofstream fout("nivfractie.out");
int n,m,val=0;
void cmmdc(int x,int y)
{
   int r;
   while(y>0)
      val=val+x/y, r=y, y=x%y, x=r;
}
int main()
{
   fin>>n>>m;
   cmmdc(n,m);
   fout<<val;
   return 0;
}
