#include <fstream>
using namespace std;
ifstream fin("poli.in");
ofstream fout("poli.out");
#define Nmax 1000
typedef unsigned long long int ulli;
int n,la,la1,la2,la3,lb,lc,ld;
ulli a[Nmax],a1[Nmax],a2[Nmax],a3[Nmax],b[Nmax],c[Nmax],d[Nmax];

void initiere(){
   lb=2, lc=1, ld=1;
   b[1]=9, b[2]=1;
   c[1]=6, d[1]=2;
   la=2;
}

void imultiri(){
   int r=0;
   la1=lb, la2=lc, la3=ld;
   for(int i=1;i<=lb;i++)
      a1[i]=b[i]*5+r, r=a1[i]/10, a1[i]=a1[i]%10;
   if(r>0) la1++, a1[la1]=r, r=0;
   for(int i=1;i<=lc;i++)
      a2[i]=c[i]*7+r, r=a2[i]/10, a2[i]=a2[i]%10;
   if(r>0) la2++, a2[la2]=r, r=0;
   for(int i=1;i<=ld;i++)
      a3[i]=d[i]*4+r, r=a3[i]/10, a3[i]=a3[i]%10;
   if(r>0) la3++, a3[la3]=r;
}

void schimbari(){
   for(int i=1;i<=lc;i++) d[i]=c[i]; ld=lc;
   for(int i=1;i<=lb;i++) c[i]=b[i]; lc=lb;
   for(int i=1;i<=la;i++) b[i]=a[i]; lb=la;
}

void calcul(){
   imultiri();
   int r=0,j;
   for(int i=1;i<=la1;i++)
      if(a1[i]>=a2[i]) a[i]=a1[i]-a2[i]; else {
         j=i+1;
         while(a1[j]==0) a1[j]=9, j++;
         a1[j]--;
         if(j==la1&&a1[j]==0) la1--;
         a[i]=a1[i]+10-a2[i];
      }
   la=la1;
   for(int i=1;i<=la;i++)
      a[i]=a[i]+a3[i]+r, r=a[i]/10, a[i]=a[i]%10;
   while(r>0) la++, a[la]=r%10, r=r/10;
   schimbari();
}

void result(){
   for(int i=la;i>=1;i--)
      fout<<a[i];
}

int main(){
   fin>>n;
   initiere();
   for(int i=5;i<=n;i++)
      calcul();
   result();
   return 0;
}