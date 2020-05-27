#include <fstream>
#include <cmath>
using namespace std;
ifstream fin("cifru5.in");
ofstream fout("cifru5.out");
int Apar[10],c_max=0,mutari_minim=0,cif=-1,cate=0;

void readdata()
{
   int n,x;
   fin>>n;
   for(int i=1;i<=n;i++)
   {
      fin>>x, Apar[x]++;
      if(x>c_max) c_max=x;
   }
   mutari_minim=10*n+1;
}

void run()
{
   int mutari;
   for(int i=0;i<=9;i++)
   {
      mutari=0;
      for(int j=0;j<=9;j++)
         if(Apar[j]>0&&j!=i)
            mutari+=abs((double)(j-i))<=10-abs((double)(j-i)) ? Apar[j]*abs((double)(j-i)) : Apar[j]*(10-abs((double)(j-i)));
      if(mutari<mutari_minim) mutari_minim=mutari, cif=i, cate=1; else
         if(mutari==mutari_minim) cate++;
   }
}

int main()
{
   readdata();
   run();
   fout<<c_max<<'\n'<<mutari_minim<<'\n'<<cif<<'\n'<<cate;
   return 0;
}
