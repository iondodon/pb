#include <fstream>
using namespace std;
ifstream fin("arbsum.in");
ofstream fout("arbsum.out");
int N,v[100001],a[100001][2];
struct nodL
{
   int fiu;
   nodL *next;
}*xx;
struct nodT
{
   nodL *a,*z;
}t[100001];

void readdata()
{
   fin>>N;
   int tata;
   for(int i=1;i<=N;i++)
   {
      fin>>tata;
      xx=new nodL;
      xx->fiu=i;
      xx->next=NULL;
      if(t[tata].a==NULL) t[tata].a=xx, t[tata].z=t[tata].a; else
         t[tata].z->next=xx, t[tata].z=t[tata].z->next;
   }
   for(int i=1;i<=N;i++)
      fin>>v[i], a[i][0]=0, a[i][1]=v[i];
}

int suma_fii_lui(int i)
{
   int suma=0;
   xx=t[i].a;
   while(xx!=NULL)
      suma+=a[xx->fiu][0], xx=xx->next;
   return suma;
}

int suma_de_maximi(int i)
{
   int suma=0;
   xx=t[i].a;
   while(xx!=NULL)
      suma+=max(a[xx->fiu][0],a[xx->fiu][1]), xx=xx->next;
   return suma;
}

void run()
{
   for(int i=N;i>=1;i--)
      a[i][1]=v[i]+suma_fii_lui(i),
      a[i][0]=suma_de_maximi(i);
}

int main()
{
   readdata();
   run();
   fout<<max(a[1][0],a[1][1]);
   return 0;
}