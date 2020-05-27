#include <fstream>
#include <string.h>
using namespace std;
ifstream fin("secvsir.in");
ofstream fout("secvsir.out");
int n,k;
bool is[10000];
char c[1000];

void prelucreaza(int x){
   char s[4]="",saux[4]="";
   int nr;
   while(x>0) saux[string(saux).length()]=(char)(x%10+48), x=x/10;
   for(int i=string(saux).length()-1;i>=0;i--)
      s[string(s).length()]=saux[i];
   strcat(c,s);

   for(unsigned i=k+1;i<string(c).length();i++){
      nr=0;
      nr=nr*10+(c[i-2])-48;
      nr=nr*10+(c[i-1])-48;
      nr=nr*10+(c[i])-48;
      is[nr]=true;

      nr=0;
      nr=nr*10+(c[i-1])-48;
      nr=nr*10+(c[i])-48;
      is[nr]=true;

      is[(c[i])-48]=true;
   }

   k=string(c).length()-1;
}

void run(int n){
   strcat(c,"00");
   for(int i=1;i<=n;i++)
      if(is[i]==false)
         prelucreaza(i);
}

int main(){
   fin>>n;
   k=1;
   run(n);
   for(unsigned i=2;i<string(c).length();i++) fout<<c[i];
   return 0;
}
