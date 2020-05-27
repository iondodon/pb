#include <fstream>
using namespace std;
ifstream fin("joc3.in");
ofstream fout("joc3.out");
int N,K,M,n[5001],m[5001],alese=0;

void readdata()
{
   fin>>N>>K>>M;
   for(int i=1;i<=K;i++)
      fin>>n[i]>>m[i];
}

void qsort(int st,int dr)
{
   int i=st,j=dr;
   int pivot=n[(st+dr)/2];
   while(i<=j)
   {
      while(n[i]<pivot) i++;
      while(n[j]>pivot) j--;
      if(i<=j) swap(n[i],n[j]), swap(m[i],m[j]), i++, j--;
   }
   if(j>st) qsort(st,j);
   if(i<dr) qsort(i,dr);
}

void cauta()
{
   int i=1,maxim=N;
   bool p=false;
   while(N<M&&i<=K&&p==false)
   {
      p=true;
      while(n[i]<=N)
      {
         p=false;
         if(m[i]>maxim) maxim=m[i];
         i++;
      }
      if(p==false) N=maxim, alese++;
   }
}

int main()
{
   readdata();
   qsort(1,K);
   cauta();
   fout<<alese;
   return 0;
}
