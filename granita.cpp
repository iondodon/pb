#include <fstream>
using namespace std;
ifstream fin("granita.in");
ofstream fout("granita.out");
int n,nr=0,maxim=-9,z=-1;
struct nod
{
   int x,y;
}t[16002];

void readdata()
{
   fin>>n;
   for(int i=1;i<=n;i++)
      fin>>t[i].x>>t[i].y;
}

void qsort(int st,int dr)
{
   int i=st,j=dr;
   int pivot=t[(st+dr)/2].x;
   while(i<=j)
   {
      while(t[i].x<pivot) i++;
      while(t[j].x>pivot) j--;
      if(i<=j)
         swap(t[i],t[j]),i++,j--;
   }
   if(j>st) qsort(st,j);
   if(i<dr) qsort(i,dr);
}

void run()
{
   for(int i=1;i<=n;i++)
   {
      if(t[i].y<maxim&&z!=t[i].x) nr++;
      if(t[i].y>maxim) maxim=t[i].y, z=t[i].x;
   }


   //for(int i=1;i<=n;i++)
      //fout<<t[i].x<<' '<<t[i].y<<'\n';
}

int main()
{
   readdata();
   qsort(1,n);
   run();
   fout<<nr;
   return 0;
}
