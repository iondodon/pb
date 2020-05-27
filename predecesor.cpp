#include <fstream>
using namespace std;
int n,marcare=0;
bool viz[500002];
struct nodl
{
   int m,l;
   nodl *pred;
}*a,*z,*x;

inline void initiere()
{
   a=new nodl;
   a->m=-1;
   a->l=0;
   a->pred=NULL;
   z=a;
}

inline void addnodl(int val,int l)
{
   if(viz[z->l]==false)
      viz[z->l]=true, marcare++;
   x=new nodl;
   x->m=val;
   x->l=l;
   x->pred=z;
   z=x;
}

inline void sterge(int val)
{
   while(x->m!=-1&&z->m>val)
      z=z->pred;
}

inline void run()
{
   int val,l=0;
   scanf("%d\n",&n);
   for(int i=1;i<=n;i++)
   {
      l++;
      scanf("%d ",&val);
      if(z->m<val)
         addnodl(val,l); else
            {
               sterge(val);
               addnodl(val,l);
            }
   }
}

inline void result()
{
   printf("%d",n-marcare+1);
}

int main()
{
   freopen("predecesor.in","r",stdin);
   freopen("predecesor.out","w",stdout);
   initiere();
   run();
   result();
   return 0;
}
