#include <fstream>
using namespace std;
ifstream fin("reactii.in");
ofstream fout("reactii.out");

struct nod_stiva{
   int vmin,vmax;
   nod_stiva *next,*pred;
}*s,*xs;
int n,m;

void introdu(){
   if(xs->vmax==s->vmin-1)
      xs->vmax=s->vmax, s=s->next, delete s->pred, s->pred=NULL, introdu(); else
         if(xs->vmin==s->vmax+1)
            xs->vmin=s->vmin, s=s->next, delete s->pred, s->pred=NULL, introdu(); else
               s->pred=xs, xs->next=s, s=xs;
}

void prelucreazaSir(){
   int x;
   for(int i=1;i<=n;i++){
      fin>>x;
      xs=new nod_stiva;
      xs->vmin=xs->vmax=x, xs->pred=NULL, xs->next=NULL;
      introdu();
   }
}

void stergeStiva(){
   while(s->next!=NULL){
      s=s->next;
      delete s->pred;
   }
}

void run(){
   for(int i=1;i<=m;i++){
      s=new nod_stiva;
      s->vmin=-1, s->vmax=-1, s->pred=NULL, s->next=NULL;
      prelucreazaSir();
      (s->vmin==1&&s->vmax==n) ? fout<<1 : fout<<0;
      fout<<'\n';
      stergeStiva();
   }
}

int main(){
   fin>>n>>m;
   run();
   return 0;
}
