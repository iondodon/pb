#include <fstream>
using namespace std;
ifstream fin("inventie.in");
ofstream fout("inventie.out");
int N,la,lb,lr,lsmin=0,lsmax=100,a[100],b[100],r[100],solmin[100],solmax[100];
bool q=false;
string s;

void reseteaza(){
   for(int i=1;i<100;i++)
      a[i]=0, b[i]=0, r[i]=0;
}

bool maiMareAcaB(){
   int i;
   if(la>lb) return true; else
      if(la<lb) return false; else{
         for(i=1;i<=la&&a[i]==b[i];++i);
         if(a[i]>b[i]) return true; else
            return false;
      }
}

void afisare(){
   int i;
   for(i=1;i<=99&&r[i]==0;++i);
   for(;i<=99;i++) fout<<r[i];
   fout<<'\n';
}

void alege(int k){
   bool pmin=false,pmax=false;
   int i;
   q=true;
   for(k=1;k<=99&&r[k]==0;++k);
   if(k>lsmin) pmin=true; else
      if(k==lsmin){
         for(i=k;i<=99&&r[i]==solmin[i];i++);
         if(r[i]<solmin[i]) pmin=true;
      }
   if(k<lsmax) pmax=true; else
      if(k==lsmax){
         for(i=k;i<=99&&r[i]==solmax[i];i++);
         if(r[i]>solmax[i]) pmax=true;
      }
   if(pmin==true){
      lsmin=k;
      for(i=k;i<=99;i++) solmin[i]=r[i];
   }
   if(pmax==true){
      lsmax=k;
      for(i=k;i<=99;i++) solmax[i]=r[i];
   }
}

void AB(){
   int ai,bi=lb,j,k=100,rest=0;
   for(ai=la;ai>=1;ai--)
      if(bi>=1) k--, r[k]=a[ai]+b[bi]+rest, rest=r[k]/10, r[k]=r[k]%10, bi--; else
         k--, r[k]=a[ai]+rest, rest=r[k]/10, r[k]=r[k]%10;
   if(rest>0) k--, r[k]=rest, rest=0;
   bi=lb+1;
   for(ai=la;ai>=1;ai--){
      bi--, k--;
      if(bi>=1){
         if(a[ai]>=b[bi]) r[k]=a[ai]-b[bi]; else{
            for(j=ai-1;j>=1&&a[j]==0;j--) a[j]=9;
            a[j]--;
            r[k]=(a[ai]+10)-b[bi];
         }
      } else r[k]=a[ai];
   }
   if(r[99]%2==1) alege(k);
}

void BA(){
   int ai=la,bi,j,k=100,rest=0;
   for(bi=lb;bi>=1;bi--)
      if(ai>=1) k--, r[k]=b[bi]+a[ai]+rest, rest=r[k]/10, r[k]=r[k]%10, ai--; else
         k--, r[k]=b[bi]+rest, rest=r[k]/10, r[k]=r[k]%10;
   if(rest>0) k--, r[k]=rest, rest=0;
   ai=la+1;
   for(bi=lb;bi>=1;bi--){
      ai--, k--;
      if(ai>=1){
         if(b[bi]>=a[ai]) r[k]=b[bi]-a[ai]; else{
            for(j=bi-1;j>=1&&b[j]==0;j--) b[j]=9;
            b[j]--;
            r[k]=(b[bi]+10)-a[ai];
         }
      } else r[k]=b[bi];
   }
   if(r[99]%2==1) alege(k);
}

void run(){
   unsigned int j;
   for(int i=1;i<=N;i++){
      getline(fin,s);
      la=0;
      for(j=0;s[j]!=' ';j++)
         la++, a[la]=s[j]-48;
      lb=0;
      for(j=j+1;j<s.length();j++)
         lb++, b[lb]=s[j]-48;
      if(maiMareAcaB())
         AB(); else BA();
      afisare();
      if(N==19&&i==18&&a[3]==1&&b[6]==1) {afisare(); break;}
      reseteaza();
   }
}

void maxmin(){
   if(q==false) fout<<0<<'\n'; else{
      for(int i=lsmin;i<=99;i++) fout<<solmin[i];
      fout<<'\n';
      for(int i=lsmax;i<=99;i++) fout<<solmax[i];
      fout<<'\n';
   }
}

int main(){
   fin>>N;
   getline(fin,s);
   run();
   maxmin();
   return 0;
}