#include <fstream>
using namespace std;
ifstream fin("prefix1.in");
ofstream fout("prefix1.out");
int K,R[102],r,nr=-1;

void readdata()
{
   fin>>K;
}

void run()
{
   int rest=0;
   char c;
   while(!fin.eof())
   {
      fin>>c;
      rest=(rest*10+(c-'0'))%K;
      R[rest]++;
   }
   R[rest]--;
}

void result()
{
   for(int i=0;i<K;i++)
      if(R[i]>nr) nr=R[i], r=i;
   fout<<r<<' '<<nr;
}

int main()
{
   readdata();
   run();
   result();
   return 0;
}
