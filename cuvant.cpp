#include <fstream>
#include <string>
using namespace std;
ifstream fin("cuvant.in");
ofstream fout("cuvant.out");
int n,l=0,alc=0,prim=0;
struct nodl{
   int ord;
   string c;
   nodl *next;
}*a,*x,*z;

void readdata()
{
   string s;
   do
   {
      l++;
      fin>>s;
      x=new nodl;
      x->ord=l;
      x->c=s;
      x->next=NULL;
      z->next=x;
      z=x;
   }while(s[s.length()-1]!='!');
   z->c.erase(z->c.end()-1);
}

void initierel()
{
   a=new nodl;
   a->ord=-1;
   a->next=NULL;
   z=a;
}

void result()
{
   fout<<prim<<'\n';
   x=a->next;
   while(x!=NULL)
   {
      fout<<x->ord<<' ';
      x=x->next;
   }
}

void sterge(nodl* &x)
{
   x->next=x->next->next;
   if(x->next==NULL) z=x;
}

void run()
{
   bool p;
   do
   {
      p=false;
      x=a->next;
      while(x!=NULL&&x->next!=NULL&&p==false)
      {
         string aux,auxx;
         aux=x->c;
         auxx=x->next->c;
         unsigned int i=1;
         while(i<=(aux.length()-1)&&p==false)
         {
            aux.insert(aux.end(),aux[0]);
            aux.erase(aux.begin());
            if(aux==auxx)
               {
                  p=true;
                  alc++;
                  if(alc==1) prim=x->next->ord;
                  sterge(x);
               }
            i++;
         }
         x=x->next;
      }
   }while(p==true);
}

int main()
{
   initierel();
   readdata();
   run();
   result();
   return 0;
}

