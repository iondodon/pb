#include <fstream>
using namespace std;
ifstream fin("sotron.in");
ofstream fout("sotron.out");
int l[241][241],n,t[500],lg=0,smaxim=0;

void readdata()
{
   fin>>n;
   for(int i=1;i<=n;i++)
      for(int j=1;j<=n;j++)
         fin>>l[i][j];
}

int summax(int lg)
{
   int st=t[1],dr=t[1];
   for(int i=2;i<=lg;i++)
      st=max(t[i],st+t[i]),
      dr=max(dr,st);
   return dr;
}

void run()
{
   int x=1,y=1,i,j,a;
   while(x<=n)
   {
      lg=0;
      i=x, j=y;
      a=0;
      while(i>=1&&j<=n)
      {
         a++;
         lg++, t[lg]=l[i][j];
         if(a%2==1) i--; else j++;
      }
      if(summax(lg)>smaxim) smaxim=summax(lg);
      x=x+2;
   }
   if(n%2==0)
      x--; else x=x-2, y++;
   while(y<=n)
   {
      lg=0;
      i=x, j=y;
      a=0;
      while(i>=1&&j<=n)
      {
         a++;
         lg++, t[lg]=l[i][j];
         if(a%2==1) j++; else i--;
      }
      if(summax(lg)>smaxim) smaxim=summax(lg);
      y=y+2;
   }
}

int main()
{
   readdata();
   run();
   fout<<smaxim;
   return 0;
}