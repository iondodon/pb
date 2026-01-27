#include <fstream>
using namespace std;
ifstream fin("pav.in");
ofstream fout("pav.out");
int n,k=1,x,y,l[550][550],h=0;

void pavare(int cs,int cd,int ls, int lj,int x,int y)
{
   if(lj>ls)
   {
      int mc=(cs+cd)/2,ml=(ls+lj)/2;
      if(x<=ml&&y<=mc)
      {
         h++;
         l[ml][mc+1]=h; l[ml+1][mc+1]=h; l[ml+1][mc]=h;
         pavare(cs,mc,ls,ml,x,y);
         pavare(mc+1,cd,ls,ml,ml,mc+1);
         pavare(cs,mc,ml+1,lj,ml+1,mc);
         pavare(mc+1,cd,ml+1,lj,ml+1,mc+1);
      }
      else
      if(x<=ml&&y>mc)
      {
         h++;
         l[ml][mc]=h; l[ml+1][mc]=h; l[ml+1][mc+1]=h;
         pavare(cs,mc,ls,ml,ml,mc);
         pavare(mc+1,cd,ls,ml,x,y);
         pavare(cs,mc,ml+1,lj,ml+1,mc);
         pavare(mc+1,cd,ml+1,lj,ml+1,mc+1);
      }
      else
      if(x>ml&&y<=mc)
      {
         h++;
         l[ml][mc]=h; l[ml][mc+1]=h; l[ml+1][mc+1]=h;
         pavare(cs,mc,ls,ml,ml,mc);
         pavare(mc+1,cd,ls,ml,ml,mc+1);
         pavare(cs,mc,ml+1,lj,x,y);
         pavare(mc+1,cd,ml+1,lj,ml+1,mc+1);
      }
      else
      if(x>ml&&y>mc)
      {
         h++;
         l[ml][mc]=h; l[ml][mc+1]=h; l[ml+1][mc]=h;
         pavare(cs,mc,ls,ml,ml,mc);
         pavare(mc+1,cd,ls,ml,ml,mc+1);
         pavare(cs,mc,ml+1,lj,ml+1,mc);
         pavare(mc+1,cd,ml+1,lj,x,y);
      }
   }
}

int main()
{
   fin>>n;
   fin>>x>>y;
   for(int i=1;i<=n;i++) k*=2;
   pavare(1,k,1,k,x,y);
   for(int i=1;i<=k;i++)
   {
      for(int j=1;j<=k;j++)
         fout<<l[i][j]<<' ';
      fout<<'\n';
   }
   return 0;
}