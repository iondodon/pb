#include <fstream>
using namespace std;
ifstream fin("imprimanta.in");
ofstream fout("imprimanta.out");
int k,l=0;
char c;
string s;

void readdata()
{
   getline(fin,s,' ');
   fin>>k;
}

int nrpuncte(int cifra)
{
   int r=0;
   switch(cifra)
   {
      case 1: r=5; break;
      case 7: r=7; break;
      case 4: r=9; break;
      case 2: case 3: case 5: r=11; break;
      case 0: case 6: case 9: r=12; break;
      case 8: r=13; break;
   }
   return r;
};

void ciframax()
{
   int nrp=20,cmax=0,c;
   for(unsigned int i=0;i<=s.size()-1;i++)
   {
      c=(int)s.at(i)-'0';
      if(nrpuncte(c)<nrp)
         cmax=c, nrp=nrpuncte(c); else
            if(nrpuncte(c)==nrp)
               if(cmax<c) cmax=c;
   }
   fout<<cmax<<'\n';
}

void nrmax()
{
   int nmc=k/5,pr=k%5,i;
   switch(pr)
   {
      case 0: for(i=1;i<=nmc;i++) fout<<1; break;
      case 1: if(k==16) fout<<74; else {fout<<777; for(i=1;i<=nmc-4;i++) fout<<1;} break;
      case 2: {fout<<7; for(i=1;i<=nmc-1;i++) fout<<1;} break;
      case 3: {fout<<8; for(i=1;i<=nmc-2;i++) fout<<1;} break;
      case 4: {fout<<77; for(i=1;i<=nmc-2;i++) fout<<1;} break;
   }
}

int main()
{
   readdata();
   ciframax();
   nrmax();
   return 0;
}