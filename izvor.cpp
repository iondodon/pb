#include <fstream>
using namespace std;
ifstream fin("izvor.in");
ofstream fout("izvor.out");
int N,P,M,l[21][21],t[8],e=0;
bool p[21];
unsigned long long int sol=0;

void readdata()
{
   int x,y,z;
   fin>>N>>P>>M;
   for(int i=1;i<=P;i++)
   {
      fin>>x>>y>>z;
      l[x][y]=z+1;
      l[y][x]=z+1;
   }
   for(int j=1;j<=N;j++) l[0][j]=1;
}

void bk(int lg)
{
   if(lg==M+1)
   {
      if(l[t[M]][t[1]]>0&&e>0) sol++;
   } else
      {
         for(int i=1;i<=N;i++)
            if(l[t[lg-1]][i]>0&&p[i]==false)
            {
               if(l[t[lg-1]][i]==2) e++;
               t[lg]=i;
               p[i]=true;
               bk(lg+1);
               if(l[t[lg-1]][i]==2) e--;
               p[i]=false;
            }
      }
}

int main()
{
   readdata();
   bk(1);
   fout<<sol;
   return 0;
}
