#include <fstream>
using namespace std;
ifstream fin("prodnr.in");
ofstream fout("prodnr.out");
#define Maxx 100005
int pr[Maxx],N;
short tt[Maxx];
bool t[Maxx];

void descompuneFP(int nr){
   int i=0;
   while(nr>1){
      i=i+1;
      while(nr%pr[i]==0) tt[i]++, nr/=pr[i];
   }
}

void run(){
   char c,ci;
   int nr;
   fin>>c;
   do{
      nr=0;
      for(int i='1';i<=c;i++)
         fin>>ci, nr=nr*10+(ci-48);
      N++, descompuneFP(nr);
      fin>>c;
   }while(!fin.eof());
}

void Erastostene(){
   int x,k,i,h;
   pr[1]=2;
   k=1;
   i=1;
   while(i<99999){
      i=i+2;
      while(t[i]==true&&i<99999) i=i+2;
      k=k+1;
      pr[k]=i;
      if(i<315){
        x=i*i;
        h=2*i;
        while(x<99999) t[x]=true, x=x+h;
      }
   }
}

void result(){
   fout<<N<<'\n';
   for(int i=1;i<=99999;i++)
      if(tt[i]!=0&&pr[i]!=0) fout<<pr[i]<<' '<<tt[i]<<'\n';
}

int main(){
   Erastostene();
   run();
   result();
   return 0;
}
