#include <fstream>
using namespace std;
ifstream fin("bloc.in");
ofstream fout("bloc.out");
int n,maxim,ultim;
short int  t[20001];

void readdata()
{
   char ch;
   fin>>n;
   for(int i=1;i<=n;i++)
   {
      fin>>ch;
      if(ch=='B') t[i]=1; else
         t[i]=-1;
   }
}

void run()
{
   int maxim1,maxim,ultim,prim,prim1;
   maxim=maxim1=0; prim=prim1=ultim=1;
   for(int i=1;i<=n;i++)
      if(maxim1+t[i]>maxim)
         maxim1=maxim1+t[i], maxim=maxim1, prim=prim1, ultim=i; else
            if(maxim1+t[i]==maxim)
            {
               maxim1=maxim;
               if(prim1==prim) ultim=i;
            } else if(maxim1+t[i]>=0)
               maxim1=maxim1+t[i]; else
                  maxim1=0, prim1=i+1;

   fout<<prim<<' '<<ultim;
}

int main()
{
   readdata();
   run();
   return 0;
}
