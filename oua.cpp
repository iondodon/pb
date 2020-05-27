#include <fstream>
#include <vector>
using namespace std;
ifstream fin("oua.in");
ofstream fout("oua.out");
int L,P,N,l[51][51],culese=0,durata=0;

struct nod
{
   int x,y,s,d;
}t[101];

void readdata()
{
   int x,y,v;
   fin>>L>>P;
   for(int i=1;i<=P;i++)
      fin>>x>>y>>v, l[x][y]=v;
   fin>>N;
   for(int i=1;i<=N;i++)
   {
      fin>>t[i].x>>t[i].y;
      t[i].s=0;
      if(t[i].x==1) t[i].d=1; else
      if(t[i].y==L) t[i].d=2; else
      if(t[i].x==L) t[i].d=3; else
      if(t[i].y==1) t[i].d=4;
   }
}

void run()
{
   bool p;
   do
   {
      durata++;
      p=false;
      for(int i=1;i<=N;i++)
      if(t[i].x>=1&&t[i].x<=L&&t[i].y>=1&&t[i].y<=L)
      {
         if(l[t[i].x][t[i].y]>0)
         {
            t[i].s+=l[t[i].x][t[i].y];
            l[t[i].x][t[i].y]=0;
            culese++;
            switch(t[i].d)
            {
               case 1: t[i].d=2; break;
               case 2: t[i].d=3; break;
               case 3: t[i].d=4; break;
               case 4: t[i].d=1; break;
            }
         }
         p=true;
         switch(t[i].d)
         {
            case 1: t[i].x++; break;
            case 2: t[i].y--; break;
            case 3: t[i].x--; break;
            case 4: t[i].y++; break;
         }
      }
   }while(p);
}

void result()
{
   int smax=0;
   for(int i=1;i<=N;i++)
      if(t[i].s>smax) smax=t[i].s;
   fout<<culese<<' '<<smax<<' '<<durata-1;
}

int main()
{
   readdata();
   run();
   result();
   return 0;
}
