#include <fstream>
using namespace std;
ifstream fin("lipsa.in");
ofstream fout("lipsa.out");
unsigned long long int suma=0,smax=0,x;
int n;

int main()
{
   fin>>n;
   for(int i=1;i<=n-1;i++)
   {
      fin>>x;
      smax+=i;
      suma+=x;
   }
   smax+=n;
   fout<<smax-suma;
   return 0;
}
