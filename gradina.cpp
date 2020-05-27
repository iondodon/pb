#include <fstream>
using namespace std;
ifstream fin("gradina.in");
ofstream fout("gradina.out");
int n,m,l[22][22],t[22][22],ns=0,amax=0,v[402],aria=0,lmax=1,cmax=1,ariaunire=0;
char dmax=' ';

struct nodl{
   int x,y;
   nodl *next;
}*a,*xx,*z;

void readdata()
{
   fin>>n>>m;
   for(int i=1;i<=n;i++)
      for(int j=1;j<=m;j++)
         fin>>l[i][j];
}

void add(int i,int j)
{
   aria++;
   t[i][j]=ns;
   xx=new nodl;
   xx->x=i;
   xx->y=j;
   xx->next=NULL;
   z->next=xx;
   z=xx;
}

void umple(int i,int j)
{
   aria=1;
   t[i][j]=ns;
   a=new nodl;
   a->x=i;
   a->y=j;
   a->next=NULL;
   z=a;
   while(a!=NULL)
   {
      i=a->x; j=a->y;
      switch(l[i][j])
      {
      case 0:
            if(t[i+1][j]==0) add(i+1,j);
            if(t[i-1][j]==0) add(i-1,j);
            if(t[i][j-1]==0) add(i,j-1);
            if(t[i][j+1]==0) add(i,j+1);
          break;
      case 1:
            if(t[i-1][j]==0) add(i-1,j);
            if(t[i+1][j]==0) add(i+1,j);
            if(t[i][j+1]==0) add(i,j+1);
          break;
      case 2:
            if(t[i+1][j]==0) add(i+1,j);
            if(t[i][j-1]==0) add(i,j-1);
            if(t[i][j+1]==0) add(i,j+1);
         break;
      case 3:
            if(t[i+1][j]==0) add(i+1,j);
            if(t[i][j+1]==0) add(i,j+1);
         break;
      case 4:
            if(t[i+1][j]==0) add(i+1,j);
            if(t[i-1][j]==0) add(i-1,j);
            if(t[i][j-1]==0) add(i,j-1);
         break;
      case 5:
            if(t[i+1][j]==0) add(i+1,j);
            if(t[i-1][j]==0) add(i-1,j);
         break;
      case 6:
            if(t[i+1][j]==0) add(i+1,j);
            if(t[i][j-1]==0) add(i,j-1);
         break;
      case 7:
            if(t[i+1][j]==0) add(i+1,j);
         break;
      case 8:
            if(t[i-1][j]==0) add(i-1,j);
            if(t[i][j-1]==0) add(i,j-1);
            if(t[i][j+1]==0) add(i,j+1);
         break;
      case 9:
            if(t[i-1][j]==0) add(i-1,j);
            if(t[i][j+1]==0) add(i,j+1);
         break;
      case 10:
            if(t[i][j-1]==0) add(i,j-1);
            if(t[i][j+1]==0) add(i,j+1);
         break;
      case 11:
            if(t[i][j+1]==0) add(i,j+1);
         break;
      case 12:
            if(t[i-1][j]==0) add(i-1,j);
            if(t[i][j-1]==0) add(i,j-1);
         break;
      case 13:
            if(t[i-1][j]==0) add(i-1,j);
         break;
      case 14:
            if(t[i][j-1]==0) add(i,j-1);
         break;
      case 15:; break;
      }
      a=a->next;
   }
   v[ns]=aria;
   if(aria>amax) amax=aria;
}

void modfill()
{
   for(int i=1;i<=n;i++)
      for(int j=1;j<=m;j++)
         if(t[i][j]==0)
            ns++, umple(i,j);
}

void bordura()
{
   int i;
   for(i=1;i<=n;i++)
      t[i][0]=-1, t[i][m+1]=-1;
   for(i=1;i<=m;i++)
      t[0][i]=-1, t[n+1][i]=-1;
}

void legatura()
{
   int i,j;
   for(i=1;i<=n;i++)
      for(j=2;j<=m;j++)
         if(t[i][j]!=t[i][j-1])
               if(v[t[i][j]]+v[t[i][j-1]]>ariaunire) ariaunire=v[t[i][j]]+v[t[i][j-1]], lmax=i, cmax=j-1, dmax='E';
   for(i=2;i<=n;i++)
      for(j=1;j<=m;j++)
         if(t[i][j]!=t[i-1][j])
               if(v[t[i][j]]+v[t[i-1][j]]>ariaunire) ariaunire=v[t[i][j]]+v[t[i-1][j]], lmax=i-1, cmax=j, dmax='S';
}

int main()
{
   readdata();
   bordura();
   modfill();
   legatura();
   if(n==1&&m==1)
      fout<<1<<'\n'<<1<<'\n'<<"0 0 0 X"; else
         fout<<ns<<'\n'<<amax<<'\n'<<ariaunire<<' '<<lmax<<' '<<cmax<<' '<<dmax;
   return 0;
}
