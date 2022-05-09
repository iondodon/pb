#include <fstream>
using namespace std;
ifstream fin("windows.in");
ofstream fout("windows.out");
int N,R1,S1,R2,S2,click=0;
struct window
{
   int R1,S1,R2,S2;
   bool inchis;
}w[101];

void inchide(int x,int y,int it)
{
   click++;
   w[it].inchis=true;
   for(int i=it+1;i<=N;i++)
      if(x>=w[i].R1 && x<=w[i].R2 && y>=w[i].S1 && y<=w[i].S2 && !w[i].inchis)
         inchide(w[i].R1,w[i].S2,i);
}

void readdata()
{
   fin>>N;
   for(int i=1;i<=N;i++)
      fin>>w[i].R1>>w[i].S1>>w[i].R2>>w[i].S2;
}

int main()
{
   readdata();
   inchide(w[1].R1,w[1].S2,1);
   fout<<click;
   return 0;
}