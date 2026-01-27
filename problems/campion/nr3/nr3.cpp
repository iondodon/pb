#include <fstream>
#include <cstring>
using namespace std;
ifstream fin("nr3.in");
ofstream fout("nr3.out");
char ch[1001];
unsigned int c,x,y;

void cautaindici()
{
   unsigned int i=0;
   x=strlen(ch);
   while((int)ch[i]-'0'>=c&&i<strlen(ch)) i++;
   x=i;
   if(c==0) y=1; else
   {
      i=0;
      y=strlen(ch);
      while((int)ch[i]-'0'<=c&&i<strlen(ch)) i++;
      y=i;
   }
}

void result()
{
   unsigned int i;
   for(i=0;i<x;i++)
      fout<<ch[i];
   fout<<c;
   for(;i<=strlen(ch)-1;i++)
      fout<<ch[i];
   fout<<'\n';
   for(i=0;i<y;i++)
      fout<<ch[i];
   fout<<c;
   for(;i<=strlen(ch)-1;i++)
      fout<<ch[i];
}

int main()
{
   fin>>ch>>c;
   cautaindici();
   result();
   return 0;
}