#include <fstream>
using namespace std;
ifstream fin("prieten.in");
ofstream fout("prieten.out");
unsigned long long int n,k,S,i,prieten;
//const long long int nmax=500000000000;

void run()
{
   for(i=1;i<=k;i++)
      prieten=prieten+(n+1), fout<<prieten<<' ';
   bool p=false;
   i=1;
   S=S*2;
   do
   {
      i++;
      if(i*i*i-i==S) p=true;
   }while(p==false);
   //for(i=2;(i-1)*i*(i+1)<2*S;i++);
   fout<<'\n'<<i;
}

int main()
{
   fin>>n>>k;
   fin>>S;
   run();
   return 0;
}