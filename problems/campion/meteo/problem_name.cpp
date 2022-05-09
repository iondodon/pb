#include <fstream>
using namespace std;
ifstream fin("meteo.in");
ofstream fout("meteo.out");
int n,p,nr,t[100001],mn=0,mp=0;

void readdata()
{
   fin>>n>>p;
   fin>>nr;
   for(int i=1;i<=nr;i++)
      fin>>t[i];
}

void qsort(int st, int dr) {
   int i=st,j=dr;
   int pivot=t[(i+j)/2];
   while(i<=j)
   {
      while(t[i]<pivot) i++;
      while(t[j]>pivot) j--;
      if(i<=j)
         swap(t[i],t[j]), i++, j--;
   }
   if(j>st) qsort(st,j);
   if(i<dr) qsort(i,dr);
}

void run()
{
   int i=1,aux=n;
   while(aux&&i<=nr)
   {
      if(i==1||t[i]!=t[i-1])
         mn=mn+t[i], aux--;
      i++;
   }
   i=nr, aux=p;
   while(aux&&i>=1)
   {
      if(i==nr||t[i]!=t[i+1])
         mp=mp+t[i], aux--;
      i--;
   }
   fout<<mn/n<<' '<<mp/p;
}

int main()
{
   readdata();
   qsort(1,nr);
   run();
   return 0;
}