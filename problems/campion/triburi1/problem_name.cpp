#include <fstream>
using namespace std;
ifstream fin("triburi1.in");
ofstream fout("triburi1.out");
int n,k,p;
bool a[30000];
int v[30000];

void readdata()
{
   fin>>n>>k>>p;
   for(int i=1,x;i<=n;i++)
   {
      fin>>x;
      a[x]=true;
   }
}

void run()
{
   int i=k,x=p-1;
   while(i>0)
   {
      v[i]=x%k;
      x=x/k;
      i=i-1;
   }
}

void result()
{
   int x=1;
   while(x<=100)
   {
      if(a[x]==true)
      {
         for(int i=1;i<=k;i++)
            fout<<(char)(64+x+v[i]);
         fout<<'\n';
      }
      x=x+1;
   }
}

int main()
{
   readdata();
   run();
   result();
   return 0;
}