#include <fstream>
#include <string>
using namespace std;
ifstream fin("ceas2.in");
ofstream fout("ceas2.out");
int t,h,m,s,ss,ora_start=0,ora_final=0,c[5][9];
char ch,r[5][9];

void readdata()
{
   int i,j;
   string str;
   for(i=1;i<=4;i++)
      {
         getline(fin,str);
         str=str+' ';
         for(j=8;j>=1;j--)
            str.at(j)=str.at(j-1);
         for(j=1;j<=8;j++)
            if(str.at(j)=='o') c[i][j]=1;
      }
   fin>>t;
   t=t%8640000;
}

void convert()
{
   int i,x;
   h=0;
   for(i=1;i<=4;i++)
      h=h*2+c[i][1];
   x=0;
   for(i=1;i<=4;i++)
      x=x*2+c[i][2];
   h=h*10+x;
   m=0;
   for(i=1;i<=4;i++)
      m=m*2+c[i][3];
   x=0;
   for(i=1;i<=4;i++)
      x=x*2+c[i][4];
   m=m*10+x;
   s=0;
   for(i=1;i<=4;i++)
      s=s*2+c[i][5];
   x=0;
   for(i=1;i<=4;i++)
      x=x*2+c[i][6];
   s=s*10+x;
   ss=0;
   for(i=1;i<=4;i++)
      ss=ss*2+c[i][7];
   x=0;
   for(i=1;i<=4;i++)
      x=x*2+c[i][8];
   ss=ss*10+x;
}

void transformaritimp()
{
   ora_start=h*360000+m*6000+s*100+ss;
   ora_final=ora_start+t;
   ora_final=ora_final%8640000;
   h=ora_final/360000;
   ora_final=ora_final%360000;
   m=ora_final/6000;
   ora_final=ora_final%6000;
   s=ora_final/100;
   ss=ora_final%100;
}

void result()
{
   int i,j,x;
   for(j=1;j<=8;j++)
   {
      switch(j)
      {
         case 1: x=h/10; break;
         case 2: x=h%10; break;
         case 3: x=m/10; break;
         case 4: x=m%10; break;
         case 5: x=s/10; break;
         case 6: x=s%10; break;
         case 7: x=ss/10; break;
         case 8: x=ss%10; break;
      }
      for(i=4;i>=1;i--)
      {
         if(x%2==0) r[i][j]='x'; else r[i][j]='o';
         x=x/2;
      }
   }
   r[1][1]=' '; r[2][1]=' ';
   r[1][3]=' '; r[1][5]=' ';
   for(i=1;i<=4;i++)
   {
      for(j=1;j<=8;j++)
         fout<<r[i][j];
      fout<<'\n';
   }
}

int main()
{
   readdata();
   convert();
   transformaritimp();
   result();
   return 0;
}
