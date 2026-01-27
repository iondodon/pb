#include <fstream>
#include <cmath>
#include <vector>
#include <algorithm>
using namespace std;
ifstream fin("divider.in");
ofstream fout("divider.out");

int a,b,n,p,l=0;
vector<int> t;
int putere(int x,int n)
{
   int r=1;
   while(n>0)
      if(n%2==0)
         x=x*x, n=n/2; else
            r=r*x, n=n-1;
   return r;
}

void divizori()
{
   for(int i=1;i<=sqrt(p);i++)
      if(p%i==0)
   {
      l++; t.push_back(i);
      if(p/i!=i) l++, t.push_back(p/i);
   }
}

void result()
{
   for(vector<int>::iterator i=t.begin();i!=t.end();i++)
      fout<<*i<<' ';
   //fout<<'\n';
   //fout<<l<<'\n'<<p<<'\n'<<sqrt(p);
}

int main()
{
   fin>>a>>b>>n;
   p=putere(a*b,n);
   divizori();
   sort(t.begin(),t.end());
   result();
   return 0;
}