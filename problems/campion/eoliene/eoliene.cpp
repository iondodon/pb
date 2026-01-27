#include <fstream>
using namespace std;
ifstream fin("eoliene.in");
ofstream fout("eoliene.out");
int N,d[1001],df[1001],alese;

void readdata()
{
   int D,L;
   fin>>N;
   for(int i=1;i<=N;i++)
   {
      fin>>D;
      d[i]=D;
   }
   for(int i=1;i<=N;i++)
   {
      fin>>L;
      df[i]=d[i]+L;
      d[i]=d[i]-L;
   }
}

void qsort(int st,int dr)
{
   int i=st,j=dr;
   int pivot=df[(st+dr)/2];
   while(i<=j)
   {
      while(df[i]<pivot) i++;
      while(df[j]>pivot) j--;
      if(i<=j)
         swap(df[i],df[j]), swap(d[i],d[j]), i++, j--;
   }
   if(j>st) qsort(st,j);
   if(i<dr) qsort(i,dr);
}

void cauta()
{
   alese=1;
   int k=1;
   for(int i=2;i<=N;i++)
      if(df[k]<d[i]) alese++, k=i;
}

int main()
{
   readdata();
   qsort(1,N);
   cauta();
   fout<<N-alese;
   return 0;
}