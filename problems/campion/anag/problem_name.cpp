#include <fstream>
#include <algorithm>
#include <cstring>
using namespace std;
ifstream fin("anag.in");
ofstream fout("anag.out");
char t[11];

void run()
{
   int lg=strlen(t);
   sort(t,t+lg);
   do
   {
      fout<<t<<'\n';
   } while(next_permutation(t,t+lg));
}

int main()
{
   fin>>t;
   run();
   return 0;
}