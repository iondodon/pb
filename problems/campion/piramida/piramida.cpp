#include <fstream>
#include <cctype>
#include <cstring>
using namespace std;
ifstream fin("piramida.in");
ofstream fout("piramida.out");
char c[81];
short t[81],l=0,lg;

int main()
{
   int i,suma,spatii=0;
   fin>>c;
   lg=strlen(c);
   for(i=0;i<lg;i++)
      c[i]=tolower(c[i]);
   fout<<c<<'\n';
   for(i=0;i<=lg;i++)
      t[i+1]=(toupper(c[i])-'A')%9+1;
   for(i=1;i<=lg;i++)
      fout<<t[i]<<' ';
      fout<<'\n';
   while(lg>1)
   {
      for(i=1;i<lg;i++)
      {
         suma=t[i]+t[i+1];
         if(suma>9) suma=suma%10+suma/10;
         t[i]=suma;
      }
      lg--;
      spatii++;
      for(i=1;i<=spatii;i++)
         fout<<' ';
      for(i=1;i<=lg;i++)
         fout<<t[i]<<' ';
      fout<<'\n';
   }
   return 0;
}