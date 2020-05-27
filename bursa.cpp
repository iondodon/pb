#include <fstream>
using namespace std;
ifstream fin("bursa.in");
ofstream fout("bursa.out");
int n,s,c[501],v[501],d1=-1,d2=-1,saux;

void readdata()
{
   fin>>n>>s;
   for(int i=1;i<=n;i++)
      fin>>c[i];
   for(int i=1;i<=n;i++)
      fin>>v[i];
   saux=s;
}

void run()
{
   for(int i=1;i<=n-1;i++)
      for(int j=i+1;j<=n;j++)
         if(s-(s/c[i])*c[i]+(s/c[i])*v[j]>saux)
            saux=s-(s/c[i])*c[i]+(s/c[i])*v[j], d1=i, d2=j;
   fout<<saux<<'\n'<<d1<<' '<<d2;
}

int main()
{
   readdata();
   run();
   return 0;
}
