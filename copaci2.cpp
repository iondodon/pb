#include <fstream>
using namespace std;
ifstream fin("copaci2.in");
ofstream fout("copaci2.out");
#define Nmax 200000
#define MaxInt 2147483647
int n,t[Nmax+1],st[Nmax+1],dr[Nmax+1],sol=0;
struct nodS{
   int v,l;
   nodS *next,*pred;
}*stiva;

void readdata(){
   fin>>n;
   for(int i=1;i<=n;i++)
      fin>>t[i];
}

void vectori(){
   nodS *x;

   stiva=new nodS;
   stiva->l=-1;
   stiva->v=MaxInt;

   for(int i=1;i<=n;i++){
      x=new nodS;
      x->l=i;
      x->v=t[i];
      st[i]=i;
      while((stiva->v)<t[i]){
         stiva->next=NULL;
         stiva=stiva->pred;
      }
      if(stiva->l!=-1) st[i]=stiva->l+1; else st[i]=1;
      x->next=NULL;
      x->pred=stiva;
      stiva->next=x;
      stiva=x;
   }

   stiva=new nodS;
   stiva->l=-1;
   stiva->v=MaxInt;

   for(int i=n;i>=1;i--){
      x=new nodS;
      x->l=i;
      x->v=t[i];
      dr[i]=i;
      while((stiva->v)<t[i]){
         stiva->next=NULL;
         stiva=stiva->pred;
      }
      if(stiva->l!=-1) dr[i]=stiva->l-1; else dr[i]=n;
      x->next=NULL;
      x->pred=stiva;
      stiva->next=x;
      stiva=x;
   }
}

void cautare(){
   for(int i=1;i<=n;i++)
      if(t[st[i]-1]>t[i] && t[dr[i]+1]>t[i])
         sol++;
   //for(int i=1;i<=n;i++) fout<<st[i]<<' ';
   //fout<<'\n';
   //for(int i=1;i<=n;i++) fout<<dr[i]<<' ';
   //fout<<'\n';
}

int main(){
   readdata();
   vectori();
   cautare();
   fout<<sol;
   return 0;
}
