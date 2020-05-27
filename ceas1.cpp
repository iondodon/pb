#include <fstream>
#include <string>
using namespace std;
ifstream fin("ceas1.in");
ofstream fout("ceas1.out");
char l[6][16];
bool q=false;
void readdata()
{
   //for(int i=1;i<=5;i++)
      //for(int j=1;j<=12;j++)
       //  fin>>l[i][j];
   char ch;
   int i=0;
   while(!fin.eof())
   {
      fin>>ch;
      if(ch=='#'||ch=='.')
      {
         i++;
         l[i][1]=ch;
         for(int j=2;j<=12;j++)
            fin>>l[i][j];
      }
   }

   //for(int i=1;i<=5;i++)
   //{
      //for(int j=1;j<=12;j++)
         //fout<<l[i][j];
      //fout<<'\n';
   //}
}

bool potriveste(int c,int x)
{
   bool p=true;
   string s1,s2;
   s1="";
   switch(x)
   {
      case 0: s1="####.##.##.####"; break;
      case 1: s1=".#..#..#..#..#."; break;
      case 2: s1="###..#####..###"; break;
      case 3: s1="###..####..####"; break;
      case 4: s1="#.##.####..#..#"; break;
      case 5: s1="####..###..####"; break;
      case 6: s1="####..####.####"; break;
      case 7: s1="###..#..#..#..#"; break;
      case 8: s1="####.#####.####"; break;
      case 9: s1="####.####..####"; break;
   }
   s2="";
   for(int i=1;i<=5;i++)
      for(int j=c;j<=c+2;j++)
         s2.insert(s2.end(),l[i][j]);

   for(int i=0;i<=14;i++)
      if(s2.at(i)=='#'&&s1.at(i)=='.')
      {
         p=false;
         break;
      }

   return p;
}

void run()
{
   int ora,minut;
   for(ora=0;ora<=23;ora++)
      for(minut=0;minut<=59;minut++)
         if(potriveste(1,ora/10)&&potriveste(4,ora%10)&&potriveste(7,minut/10)&&potriveste(10,minut%10))
         {
            if(ora<10) fout<<0;
            fout<<ora<<':';
            if(minut<10) fout<<0;
            fout<<minut<<'\n';
            ora=24;
            minut=60;
            q=true;
         }
}

int main()
{
   readdata();
   run();
   if(q==false)
      fout<<"00:00";
   return 0;
}
