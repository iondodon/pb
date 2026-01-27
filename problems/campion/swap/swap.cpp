#include <fstream>
using namespace std;
ifstream fin("swap.in");
ofstream fout("swap.out");
int N,nrcost1=0,Ctot=0,Cmin=-1;

struct nod_stiva{
   int loc;
   nod_stiva *next;
   nod_stiva *pred;
}*a,*x,*z;

void readdata()
{
   fin>>N;
}

void run()
{
   char ch;
   for(int i=1;i<=N;i++)
   {
      fin>>ch;
      if(ch=='(')
      {
         x=new nod_stiva;
         x->loc=i;
         x->next=NULL;
         x->pred=z;
         z->next=x;
         z=x;
      } else
         {
            Ctot=Ctot+(i-z->loc);
            if(i-z->loc==1&&x->pred->loc!=-1) nrcost1++;
            z=z->pred;
         }
   }
   if(nrcost1>0) Cmin=Ctot-2;
   fout<<Ctot<<'\n'<<Cmin<<'\n'<<nrcost1;
}

void init_stiva()
{
   a=new nod_stiva;
   a->loc=-1;
   a->pred=NULL;
   a->next=NULL;
   z=a;
}

int main()
{
   readdata();
   init_stiva();
   run();
   return 0;
}