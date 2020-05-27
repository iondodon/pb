#include <fstream>
using namespace std;
ifstream fin("secv9.in");
ofstream fout("secv9.out");
int n,r;

int main()
{
   fin>>n;
   if(n==8) fout<<0; else
      if(n==9) fout<<8; else
   {
      fout<<8*9;
      for(int i=1;i<=n-10;i++)
         fout<<0;
   }
   return 0;
}
