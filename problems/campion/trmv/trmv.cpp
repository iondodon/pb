#include <fstream>
using namespace std;
ifstream fin("trmv.in");
ofstream fout("trmv.out");
#define Nmax 1000000
#define IntMax 500000000
int N,T,S,P,k=0;
long int D[Nmax+10];
int poz[Nmax+10];
bool p[Nmax+10];
struct nodL{
   int vecin;
   long int t;
   nodL *next;
}*gf[Nmax+10];
struct nodA{
   int i;
   long int val;
}arb[Nmax+10];

void addNodL(int a,int t,int b){
   nodL *x=new nodL;
   x->vecin=b;
   x->t=t;
   x->next=gf[a];
   gf[a]=x;
}

void readdata(){
   int L,a,b,t;
   fin>>N>>T>>S>>P;
   for(int i=1;i<=T;i++){
      fin>>L;
      fin>>a;
      for(int j=1;j<=L-1;j++)
         fin>>t>>b, addNodL(a,t,b), addNodL(b,t,a), a=b;
   }
}

void upHeap(int w){
   while(w/2>=1 && arb[w].val<arb[w/2].val)
      poz[arb[w].i]=w/2, poz[arb[w/2].i]=w, swap(arb[w],arb[w/2]), w/=2;
}

void downHeap(int v){
   int w=v*2;
   while(w<=k){
      if(w+1<=k && arb[w+1].val<arb[w].val) w=w+1;
      if(arb[w].val<=arb[v].val)
         poz[arb[w].i]=v, poz[arb[v].i]=w, swap(arb[w],arb[v]); else break;
      v=w;
      w=w*2;
   }
}

void addHeap(int i,int val){
   k++;
   arb[k].i=i;
   arb[k].val=val;
   poz[i]=k;
   upHeap(k);
}

void delHeap(int poz){
   p[arb[1].i]=true;
   D[arb[1].i]=arb[1].val;
   arb[1]=arb[k];
   k--;
   downHeap(1);
}


void balanceHeap(int poz){
   if(poz/2>=1 && arb[poz].val<arb[poz/2].val)
      upHeap(poz); else
         downHeap(poz);
}

void Dijkstra(){
   int current;
   while(k>0){
      current=arb[1].i;
      delHeap(1);
      for(nodL *xx=gf[current];xx!=NULL;xx=xx->next){
         if(p[xx->vecin]==false)
            if(D[current]+(xx->t)<arb[poz[xx->vecin]].val){
               arb[poz[xx->vecin]].val=D[current]+(xx->t);
               balanceHeap(poz[xx->vecin]);
            }
      }
   }
}

void initiereArbore(){
   for(int i=1;i<=N;i++)
      if(i!=S) addHeap(i,IntMax); else addHeap(i,0);
}

void result(){
   int x;
   for(int i=1;i<=P;i++){
      fin>>x;
      if(D[x]!=IntMax) fout<<D[x]<<' '; else fout<<-1<<' ';
   }
}

int main(){
   readdata();
   initiereArbore();
   Dijkstra();
   result();
   return 0;
}