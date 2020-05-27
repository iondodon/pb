#include <fstream>
using namespace std;
ifstream fin("taburet.in");
ofstream fout("taburet.out");
int n,tip[16],bin[7];

void scan()
{
   int nr=0,nbu=0;
   for(int i=1;i<=6;i++)
   {
      nr=nr*2+bin[i];
      if(bin[i]==1) nbu=nbu+1;
   }
   switch(nr)
   {
      case 0: tip[1]++; break;
      case 63: tip[2]++; break;
      case 1: case 2:  case 4: case 8: case 16: case 32: tip[3]++; break;
      case 61: case 62: case 59: case 55: case 47: case 31: tip[4]++; break;
      case 10: case 20: case 33: tip[5]++; break;
      case 3:  case 5: case 6: case 9: case 12: case 17: case 18: case 24: case 34: case 36: case 40: case 48: tip[7]++; break;
      case 56: case 44: case 38: case 50: case 25: case 13: case 19: case 7: tip[8]++; break;
      case 49: case 41: case 37: case 35: case 11: case 14: case 21: case 22: case 26: case 28: case 42: case 52: tip[9]++; break;
      case 15: case 23: case 27: case 29: case 39: case 45: case 46: case 51: case 54: case 57: case 58: case 60: tip[10]++; break;
      case 30: case 43: case 53: tip[6]++; break;
   }
}

void run()
{
   for(int i=1;i<=n;i++)
      {
         for(int j=1;j<=6;j++)
            fin>>bin[j];
         scan();
      }
}

void result()
{
   int tipuri=0,egale=0;
   for(int i=1;i<=10;i++)
   {
      if(tip[i]!=0) tipuri++;
      if(tip[i]>egale) egale=tip[i];
   }
   fout<<tipuri<<'\n'<<egale;
}

int main()
{
   fin>>n;
   run();
   result();
   return 0;
}
