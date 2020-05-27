#include <fstream>
using namespace std;
ifstream fin("adun.in");
ofstream fout("adun.out");

void run()
{
   char ch;
   unsigned long long int termen1,termen2,termen3;
   bool pt1,pt2,pt3;
   while(!fin.eof())
   {
      termen1=termen2=termen3=0;
      pt1=pt2=pt3=false;
      fin>>ch;
      while(ch!='+'&&!fin.eof())
         termen1=termen1*10+((int)ch-'0'), pt1=true, fin>>ch;
      fin>>ch;
      while(ch!='='&&!fin.eof())
         termen2=termen2*10+((int)ch-'0'), pt2=true, fin>>ch;
      fin>>ch;
      while(ch!=';'&&!fin.eof())
         termen3=termen3*10+((int)ch-'0'), pt3=true, fin>>ch;
      if(pt1==false) termen1=termen3-termen2; else
         if(pt2==false) termen2=termen3-termen1; else
            if(pt3==false) termen3=termen1+termen2;
      if(!fin.eof())
      fout<<termen1<<'+'<<termen2<<'='<<termen3<<';'<<'\n';
   }
}

int main()
{
   run();
   return 0;
}
