#include <fstream>
using namespace std;
ifstream fin("palma.in");
ofstream fout("palma.out");
int n,h,s,k[501],r=0;
long v[64001];

void readdata()
{
   fin>>n>>h>>s;
   for(int i=1;i<=n;i++)
      fin>>k[i];
}

void qsort(int st,int dr)
{
   int m=(st+dr)/2,i=st,j=dr;
   while(i<=j)
   {
      while(v[i]<v[m])
         i++;
      while(v[j]>v[m])
         j--;
      if(i<=j)
      {
         int aux=v[i];
         v[i]=v[j];
         v[j]=aux;
         i++;
         j--;
      }
   }
   if(j>st) qsort(st,j);
   if(i<dr) qsort(i,dr);
}

void run()
{
   int x,i,j;
   for(i=1;i<=n;i++)
      for(j=1;j<=h;j++)
      {
         fin>>x;
         if(x<k[i])
            v[x]++;
      }
   r=0; i=1;
   while(s>0&&i<=64000)
   {
      j=1;
      while(s>0&&j<=v[i])
         s=s-i, j++, r++;
      i++;
   }
   if(s<0) r--;
   fout<<r;
}

int main()
{
   readdata();
   run();
   //qsort(1,l);
   return 0;
}