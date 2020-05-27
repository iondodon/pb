#include <fstream>
using namespace std;
ifstream fin("exp.in");
ofstream fout("exp.out");
char s[64002];
int n,e=0;

void readdata()
{
   fin>>n;
   fin>>s;
}

int minim(int x)
{
   int r=10;
   do
   {
      if(x%10<r) r=x%10;
      x=x/10;
   }while(x!=0);
   return r;
}

int maxim(int x)
{
   int r=-1;
   do
   {
      if(x%10>r) r=x%10;
      x=x/10;
   }while(x!=0);
   return r;
}

void run()
{
   int x,y;
   for(int i=1;i<=n;i++)
   {
      fin>>x>>y;
      if(s[i-1]=='-') e=e-minim(x)*minim(y); else
         e=e+maxim(x)*maxim(y);
   }
}

int main()
{
   readdata();
   run();
   fout<<e;
   return 0;
}
