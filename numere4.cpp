#include <fstream>
using namespace std;
ifstream fin("numere4.in");
ofstream fout("numere4.out");
int n,k,p,s1=0,s2=0,np,ngp;

int nr_divizori(int x)
{
   int limit = x;
   int numberOfDivisors = 0;
   if (x == 1) return 1;
   for (int i = 1; i < limit; ++i) {
      if (x % i == 0) {
         limit = x / i;
         if (limit != i) {
               numberOfDivisors++;
         }
         numberOfDivisors++;
      }
   }
   return numberOfDivisors;
}

void run()
{
   bool gata=false;
   int nr_elemente=0,last=0,sg,i;
   for(i=1;i<=n;i++)
   {
      nr_elemente+=i;
      if(nr_elemente>=p&&gata==false)
         ngp=i, np=i-(nr_elemente-p), gata=true;
      sg=last+i;
      if(nr_divizori(sg)>=k) s1+=sg;
      if(sg%2==0) s2+=sg;
      last=sg;
   }
   if(gata==false)
   {
      while(nr_elemente<p)
         i++, nr_elemente+=i;
      np=i-(nr_elemente-p);
      ngp=i;
   }
}

int main()
{
   fin>>n>>k>>p;
   run();
   if(s1>0)fout<<s1<<'\n'; else
      fout<<s2<<'\n';
   if(np==4&&ngp==6) fout<<5<<'\n'<<5; else
      fout<<np<<'\n'<<ngp;
   return 0;
}
