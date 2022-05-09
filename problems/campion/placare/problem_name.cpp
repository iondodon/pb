#include <fstream>
using namespace std;
ifstream fin("placare.in");
ofstream fout("placare.out");
int n,m,r[301],v[301],A[301];
char a[100000];

void prelucrare(int lgA)
{
   int i,j,k;
   if(A[1]==0)
   {
      for(j=1;j<=m;j++)
         r[j]--, fout<<v[j]<<' ';
      fout<<'\n';
   } else
      {
         j=1;
         for(i=1;i<=lgA;i++)
         {
            while(r[j]>0) j++;
            if(A[i]<0)
            {
               v[j]=A[i]*(-1);
               r[j]=v[j];
               j++;
            } else if(A[i]>0)
               {
                  for(k=j;k<=j+A[i]-1;k++)
                     v[k]=A[i], r[k]=1;
                  j=k;
               }
         }
         for(k=1;k<=m;k++)
            fout<<v[k]<<' ', r[k]--;
         fout<<'\n';
      }
}

void run()
{
   int nr;
   unsigned j,k;
   bool p;
   fin.getline(a,100000);
   for(int i=1;i<=n;i++)
   {
      fin.getline(a,100000);
      p=false;
      j=0, k=0, nr=0;
      while(j<=string(a).size())
      {
         if(a[j]=='-') p=true; else
            if(a[j]>='0'&&a[j]<='9') nr=nr*10+(a[j]-'0'); else
               if(a[j]==' '||a[j]=='\0')
               {
                  if(p==true) nr=nr*(-1);
                  k++, A[k]=nr, nr=0, p=false;
               }
         j++;
      }
      /**
      for(j=1;j<=k;j++)
         fout<<A[j]<<' ';
      fout<<'\n';
      */
      prelucrare(k);
   }
}

int main()
{
   fin>>n>>m;
   run();
   return 0;
}