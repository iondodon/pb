#include <fstream>
using namespace std;
ifstream fin("domino1.in");
ofstream fout("domino1.out");
int n,maxim_rasturnat=0,impingeri=0;

void run()
{
   int p,h,max_poz=0,rasturnat=0;
   for(int i=1;i<=n;i++)
   {
      fin>>p>>h;
      if(p<=max_poz)
      {
         rasturnat++;
         if(p+h>max_poz) max_poz=p+h;
      } else
         {
            impingeri++;
            rasturnat=1;
            max_poz=p+h;
         }
      if(rasturnat>maxim_rasturnat) maxim_rasturnat=rasturnat;
   }
}

int main()
{
   fin>>n;
   run();
   fout<<impingeri<<' '<<maxim_rasturnat;
   return 0;
}
