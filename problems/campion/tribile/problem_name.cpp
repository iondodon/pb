#include <fstream>
#include <math.h>
#include <cmath>
using namespace std;
ifstream fin("tribile.in");
ofstream fout("tribile.out");
int n,tr_echilaterale=0,lg;
char s[70];
struct nodT
{
   int nrl;
   float lin1,col1,lin2,col2,lin3,col3;
}t[200];

void readdata()
{
   fin>>n;
   int lg=n*(n+1)/2;
   for(int i=1;i<=lg;i++) fin>>s[i];
   float x=0, y=0;
   char c;
   t[(int)s[1]].nrl=1;
   t[(int)s[1]].lin1=0;
   t[(int)s[1]].col1=0;
   int i=0,j=1;
   do
   {
      i=i+1;
      y=y-sqrt(3);
      x=-i;
      do
      {
         j=j+1;
         c=s[j];
         t[(int)c].nrl++;
         switch(t[(int)c].nrl)
         {
            case 1: { t[(int)c].lin1=x; t[(int)c].col1=y; } break;
            case 2: { t[(int)c].lin2=x; t[(int)c].col2=y; } break;
            case 3: { t[(int)c].lin3=x; t[(int)c].col3=y; } break;
         }
         x=x+2;
      }while(x<=i);
   }while(i<n-1);
}


bool bun(float lin1,float col1,float lin2,float col2,float lin3,float col3)
{
   bool p;
   float l1=(lin2-lin3)*(lin2-lin3)+(col2-col3)*(col2-col3);
   float l2=(lin1-lin3)*(lin1-lin3)+(col1-col3)*(col1-col3);
   float l3=(lin2-lin1)*(lin2-lin1)+(col2-col1)*(col2-col1);
   float e=0.001;
   ((std::abs(l1-l2)<=e)&&(std::abs(l1-l3)<=e)) ? p=true : p=false;
   return p;
}

void run()
{
   for(int i=1;i<=200;i++)
   if(t[i].nrl==3)
      if(bun(t[i].lin1,t[i].col1,t[i].lin2,t[i].col2,t[i].lin3,t[i].col3))
         tr_echilaterale++;
}

void afisare()
{
   fout<<tr_echilaterale;
}

int main()
{
   readdata();
   run();
   afisare();
   return 0;
}