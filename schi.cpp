#include <fstream>
#include <algorithm>
using namespace std;
int n,m,ind[101];
double t[101];


void sortare(int st,int dr)
{
   bool p;
   do
   {
      p=true;
      for(int i=2;i<=dr;i++)
         if(t[i]<t[i-1]) swap(t[i],t[i-1]), swap(ind[i],ind[i-1]), p=false;
   }while(p==false);
}

void run()
{
   float diferenta,minim;
   scanf("%f",&minim), t[1]=minim, ind[1]=1;
   for(int i=2;i<=n;i++)
   {
      scanf("%f",&diferenta), t[i]=minim+diferenta, ind[i]=i;
      if(t[i]<minim) minim=t[i];
   }
   sortare(1,n);
   scanf("%f",&minim);
   t[m]=minim;
   for(int i=m-1;i>=1;i--)
   {
      scanf("%f",&diferenta), t[i]=minim+diferenta;
      if(t[i]<minim) minim=t[i];
   }
   sortare(1,m);
}

int main()
{
   freopen("schi.in","r",stdin);
   freopen("schi.out","w",stdout);
   scanf("%d %d",&n,&m);
   run();
   printf("%d\n%d\n%d",ind[1],ind[2],ind[3]);
   return 0;
}
