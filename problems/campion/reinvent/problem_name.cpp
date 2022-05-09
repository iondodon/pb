#include <fstream>
using namespace std;
ifstream fin("reinvent.in");
ofstream fout("reinvent.out");
#define Nmax 100010

int N,M,X,Q[Nmax],sf,tati[Nmax],dist[Nmax],Dmin=Nmax;
struct nodL{
   int inf;
   nodL *next;
}*graf[Nmax];

void baga(int a,int b)
{
   nodL *q=new nodL;
   q->inf=a;
   q->next=graf[b];
   graf[b]=q;
}

void citire()
{
   int a,b,x;
   fin>>N>>M>>X;
   for(int i=1;i<=M;i++)
   {
      fin>>a>>b;
      baga(a,b);
      baga(b,a);
   }
   for(int i=1;i<=X;i++)
   {
      fin>>x;
      Q[++sf]=x;
      tati[x]=x;
   }
}

void df()
{
   int D,T;
   for(int i=1;i<=sf;i++)
   {
      D=dist[Q[i]];
      T=tati[Q[i]];
      for(nodL *q=graf[Q[i]];q!=NULL;q=q->next)
         if(tati[q->inf]==0)
         {
            tati[q->inf]=T;
            dist[q->inf]=D+1;
            Q[++sf]=q->inf;
         } else
            if(tati[q->inf]!=tati[Q[i]])
               if(D+dist[q->inf]+1<Dmin) Dmin=D+dist[q->inf]+1;
   }
}

int main()
{
   citire();
   df();
   fout<<Dmin;
   return 0;
}