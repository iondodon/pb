#include <fstream>
using namespace std;
ifstream fin("factura.in");
ofstream fout("factura.out");
long int n,h,m,d,cost=0;
char c;

void run()
{
   for(int i=1;i<=n;i++)
      {
         h=0, m=0;
         fin>>c, h=h*10+(c-'0'), fin>>c, h=h*10+(c-'0');
         fin>>c;
         fin>>c, m=m*10+(c-'0'), fin>>c, m=m*10+(c-'0');
         fin>>d;

         h=h*60+m;
         for(int j=h;j<h+d;j++)
            if(j>=420&&j<=1139) cost+=10; else cost+=5;
      }
}

int main()
{
   fin>>n;
   run();
   fout<<cost;
   return 0;
}
