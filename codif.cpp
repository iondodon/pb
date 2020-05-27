#include <fstream>
#include <cstring>
#include <string>
using namespace std;
ifstream fin("codif.in");
ofstream fout("codif.out");
string x[10000],v[10]={"1","2","4","8","16","32","64","128","256","512"};
char c[90],ch[10]={' ','a','e','i','o','u','m','n','r','s'};
int n,l=0;;

void readdata()
{
   fin>>n;
   fin>>c;
   c[n+1]='.';
   c[n+2]='.';
}

int pozitie(string s)
{
   int r=-1;
   for(int i=0;i<=9&&r==-1;i++)
      if(s==v[i]) r=i;
   return r;
}

void bk(int p,string text)
{
   string s="";
   if(p>n-1)
   {
      l++;
      x[l]=text;
   } else
   {
      int ind=pozitie(s+c[p]);
      if(ind!=-1) bk(p+1,text+ch[ind]);
      ind=pozitie(s+c[p]+c[p+1]);
      if(ind!=-1) bk(p+2,text+ch[ind]);
      ind=pozitie(s+c[p]+c[p+1]+c[p+2]);
      if(ind!=-1) bk(p+3,text+ch[ind]);
   }
}

void sortare()
{
   for(int i=1;i<=l-1;i++)
      for(int j=i+1;j<=l;j++)
         if(std::string(x[i])>x[j]||std::string(x[i]).size()>std::string(x[j]).size())
            swap(x[i],x[j]);
}

void afisare()
{
   fout<<l<<'\n';
   for(int i=1;i<=l;i++)
      fout<<x[i]<<'\n';
}

int main()
{
   readdata();
   bk(0,"");
   sortare();
   afisare();
   return 0;
}
