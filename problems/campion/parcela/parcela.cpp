#include <fstream>
using namespace std;
ifstream fin("parcela.in");
ofstream fout("parcela.out");
bool l[251][251];
int t[1000000],tt[1000000],s,m,n,ll=0,r=0,minim,maxim;
struct nodl{
   int lin,col;
   nodl *next;
}*a,*x,*z,*xx;

void readdata()
{
   fin>>m>>n>>s;
   for(int i=1;i<=m;i++)
      for(int j=1;j<=n;j++)
         fin>>l[i][j];
}

void addnod(int i,int j)
{
   t[ll]++;
   l[i][j]=0;
   xx=new nodl;
   xx->lin=i;
   xx->col=j;
   xx->next=NULL;
   z->next=xx;
   z=xx;
}

void sterge(int i,int j)
{
   a=new nodl;
   a->lin=i;
   a->col=j;
   a->next=NULL;
   z=a;
   x=a;
   t[ll]=1;
   l[x->lin][x->col]=0;
   int xx,yy;
   while(x!=NULL)
   {
      xx=x->lin;
      yy=x->col;
      if(l[xx-1][yy]==1) addnod(xx-1,yy);
      if(l[xx-1][yy+1]==1) addnod(xx-1,yy+1);
      if(l[xx][yy+1]==1) addnod(xx,yy+1);
      if(l[xx+1][yy+1]==1) addnod(xx+1,yy+1);
      if(l[xx+1][yy]==1) addnod(xx+1,yy);
      if(l[xx+1][yy-1]==1) addnod(xx+1,yy-1);
      if(l[xx][yy-1]==1) addnod(xx,yy-1);
      if(l[xx-1][yy-1]==1) addnod(xx-1,yy-1);
      x=x->next;
   }
}

void run()
{
   for(int i=1;i<=m;i++)
      for(int j=1;j<=n;j++)
         if(l[i][j]==1)
            ll++, sterge(i,j);
}

void result()
{
   int j,i;
   tt[t[1]]=1;
   minim=t[1];
   maxim=t[1];
   for(i=2;i<=ll;i++)
   {
      j=maxim;
      if(maxim>s) j=s;
      while(j<=maxim&&j>=minim)
      {
         if(tt[j]==1) tt[j+t[i]]=1;
         j--;
      }
      maxim=maxim+t[i];
      if(t[i]<minim) minim=t[i];
      tt[t[i]]=1;
      tt[minim]=1;
      tt[maxim]=1;
   }
   i=s;
   while(tt[i]!=1)
      i--;
   fout<<i;
}

void qsort(int stg,int dre)
{
   int m=(stg+dre)/2,i=stg,j=dre;
   while(i<=j)
   {
      while(t[i]<t[m])
         i++;
      while(t[j]>t[m])
         j--;
      if(i<=j)
      {
         int aux=t[i];
         t[i]=t[j];
         t[j]=aux;
         i++;
         j--;
      }
   }
   if(j>stg) qsort(stg,j);
   if(i<dre) qsort(i,dre);
}

int main()
{
   readdata();
   run();
   qsort(1,ll);
   result();
   return 0;
}