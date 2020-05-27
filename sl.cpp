#include <fstream>
#include <string>
using namespace std;
ifstream fin("sl.in");
ofstream fout("sl.out");
int n,i,reg;
char c[6];

struct nod_tabel
{
   char c[7];
   long int x;
}t[1002];

struct nod
{
   long int x;
   nod *pred;
}*stiva_a,*stiva_z,*xx;

void push()
{
   xx=new nod;
   xx->x=t[i].x;
   xx->pred=stiva_a;
   stiva_a=xx;
}

void store()
{
   reg=stiva_a->x;
   stiva_a=stiva_a->pred;
}

void load()
{
   xx=new nod;
   xx->x=reg;
   xx->pred=stiva_a;
   stiva_a=xx;
}

void plius()
{
   stiva_a->pred->x+=stiva_a->x;
   stiva_a=stiva_a->pred;
}

void times()
{
   stiva_a->pred->x*=stiva_a->x;
   stiva_a=stiva_a->pred;
}

void ifzero()
{
   if(stiva_a->x==0)
      i=t[i].x-1;
}

void run()
{
   i=0;
   while(string(t[i].c)!="DONE")
   {
      if(string(t[i].c)=="PUSH")
         push(); else
      if(string(t[i].c)=="STORE")
         store(); else
      if(string(t[i].c)=="LOAD")
         load(); else
      if(string(t[i].c)=="PLUS")
         plius(); else
      if(string(t[i].c)=="TIMES")
       times(); else
      if(string(t[i].c)=="IFZERO")
         ifzero();
      i++;
   }
}

void initiere_stive()
{
   stiva_a=new nod;
   stiva_a->x=-1;
   stiva_a->pred=NULL;
   stiva_z=stiva_a;
}

void readdata()
{
   fin>>n;
   for(int i=0;i<=n-1;i++)
   {
      fin>>t[i].c;
      if(string(t[i].c)=="PUSH"||string(t[i].c)=="IFZERO")
         fin>>t[i].x;
   }
}

int main()
{
   readdata();
   initiere_stive();
   run();
   fout<<stiva_a->x;
   return 0;
}
