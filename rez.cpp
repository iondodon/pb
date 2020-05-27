#include <fstream>
using namespace std;
ifstream fin("rez.in");
ofstream fout("rez.out");
char ch,R;
int nr;

int serie();

int paralel()
{
   int produs=1,suma=0;
   do{
      nr=serie(), produs*=nr, suma+=nr;
   }while(ch==',');
   return produs/suma;
}

int serie()
{
   int suma=0;
   fin>>ch;
   if(ch=='R'&&!fin.eof()) fin>>nr, suma+=nr, suma+=serie(); else
      if(ch=='('&&!fin.eof()) suma+=paralel(), suma+=serie();
   return suma;
}

int main()
{
   fout<<serie();
   return 0;
}
