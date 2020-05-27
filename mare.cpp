#include <fstream>
#include <string>
using namespace std;
ifstream fin("mare.in");
ofstream fout("mare.out");
int n,t[101];
string s,maxim="";

void readdata()
{
   fin>>n;
   for(int i=1;i<=n;i++)
      fin>>t[i];
}

bool palindrom(string str)
{
   if (str.empty())
        return false;

    int i = 0;                // first characters
    int j = str.length() - 1; // last character

    while (i < j)
    {
        if (str[i] != str[j])
        {
            return false;
        }
        i++;
        j--;
    }
    return true;
}

void aleg()
{
   if(palindrom(s))
      if(s.size()>maxim.size()) maxim=s; else
      {
         if(s.size()==maxim.size())
            if(s>maxim) maxim=s;
      }
}

string in_string(int nr)
{
   string r="";
   while(nr!=0)
      r=((char)(nr%10+48))+r, nr=nr/10;
   return r;
}

void run()
{
   string convertat;
   int i,j;
   for(i=1;i<=n;i++)
   {
      j=i;
      s="";
      while(j<=n)
         convertat=in_string(t[j]), s=s+convertat, aleg(), j++;// fout<<s<<'\n';
   }
}

int main()
{
   readdata();
   run();
   fout<<maxim;
   return 0;
}

