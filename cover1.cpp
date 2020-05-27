#include <fstream>
using namespace std;
typedef long long int lli;

lli putere(lli L)
{
   lli a,D;
   D=1;
   a=3;
   while (L>0)
      if(L%2==0)
         {
            a=(a*a)%10003;
            L=L/2;
         } else
            {
               D=(D*a)%10003;
               L=L-1;
            }
   return D;
}

int main()
{
   ifstream f1("cover1.in");
   ofstream f2("cover1.out");

   lli L;
   f1>>L;
   f2<<2*putere(L-1)%10003<<"\n";

   return 0;
}
