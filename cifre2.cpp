#include <fstream>
using namespace std;
ifstream fin("cifre2.in");
ofstream fout("cifre2.out");
int n,c,r=0;

void run()
{
   int z=0,j=1;
   while(n)
   {
      if(n%10>c) r+=(n/10+1)*j; else
      if(n%10<c) r+=(n/10)*j; else
         r+=(n/10)*j+z+1;
      z=z+(n%10)*j;
      n=n/10;
      j=j*10;
   }
}

int main()
{
   fin>>n>>c;
   run();
   fout<<r;
   return 0;
}
