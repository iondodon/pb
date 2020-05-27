#include <fstream>
using namespace std;
ifstream fin("piramide.in");
ofstream fout("piramide.out");
int n,x,k,p=0,lalbemax=0;
void readdata()
{
   fin>>n>>x>>k;
}

void result(int p,int piramide,int rest,int lalbemax)
{
   fout<<p<<'\n'<<piramide<<'\n'<<rest<<'\n'<<lalbemax;
}

void run()
{
   int ultima=0,prima=1,piramide=0,baza=2,albe,cartonas,rest,albemax=0,l=1;
   fin>>cartonas;
   while(ultima+(baza*(baza+1)/2)<=n)
   {
      piramide++;
      ultima=prima+(baza*(baza+1)/2)-1;
      if(ultima>=x&&prima<=x) p=piramide;
      albe=0;
      while(cartonas>=prima&&cartonas<=ultima&&l<=k)
      {
         albe++;
         if(l<k) fin>>cartonas;
         l++;
      }
      if(albe>albemax) lalbemax=piramide, albemax=albe;
      baza++;
      prima=ultima+1;
   }
   rest=n-ultima;
   result(p,piramide,rest,lalbemax);
}

int main()
{
   readdata();
   run();
   return 0;
}
