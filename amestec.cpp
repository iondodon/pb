// 100p

#include <fstream>
using namespace std;
ifstream fin("amestec.in");
ofstream fout("amestec.out");
int k,t[103][103];
string s;
typedef long long int lli;
lli n;
struct nod
{
   int l1,c1,l2,c2;
}v[100001];

void result()
{
   for(int i=1;i<=n;i++)
   {
      for(int j=1;j<=n;j++)
         fout<<t[i][j];
      fout<<'\n';
   }
}

void readdata()
{
   getline(fin,s);
   n=0, k=0;
   unsigned int j=0;
   while(s.at(j)>='0'&&s.at(j)<='9')
      n=n*10+(s.at(j)-'0'), j++;
   j++;
   while(j<=s.size()-1)
      k=k*10+(s.at(j)-'0'), j++;
   for(int i=1;i<=n;i++)
   {
      getline(fin,s);
      for(j=0;j<=s.size()-1;j++)
         t[i][j+1]=(int)s.at(j)-'0';
   }
}

void schimba(int lg)
{
   int aux;
   for(int i=1;i<=lg;i++)
      aux=t[v[i].l1][v[i].c1], t[v[i].l1][v[i].c1]=t[v[i].l2][v[i].c2], t[v[i].l2][v[i].c2]=aux;
}

void deplasare(lli d,char p, int m)
{
   int e=0,i,j,lg;
   if(d>=n) d=n-1;
   switch(p)
   {
      case 'N': while(e<d)
                  {
                     lg=0;
                     for(i=1;i<=n-1;i++)
                        for(j=1;j<=n;j++)
                           if(t[i][j]!=m&&t[i+1][j]==m) lg++, v[lg].l1=i, v[lg].c1=j, v[lg].l2=i+1, v[lg].c2=j;
                     schimba(lg);
                     e++;
                  }; break;
      case 'E': while(e<d)
                  {
                     lg=0;
                     for(j=n;j>=2;j--)
                        for(i=1;i<=n;i++)
                           if(t[i][j]!=m&&t[i][j-1]==m) lg++, v[lg].l1=i, v[lg].c1=j, v[lg].l2=i, v[lg].c2=j-1;
                     schimba(lg);
                     e++;
                  }; break;
      case 'S': while(e<d)
                  {
                     lg=0;
                     for(i=n;i>=2;i--)
                        for(j=1;j<=n;j++)
                           if(t[i][j]!=m&&t[i-1][j]==m) lg++, v[lg].l1=i, v[lg].c1=j, v[lg].l2=i-1, v[lg].c2=j;
                     schimba(lg);
                     e++;
                  }; break;
      case 'V': while(e<d)
                  {
                     lg=0;
                     for(j=1;j<=n-1;j++)
                        for(i=1;i<=n;i++)
                           if(t[i][j]!=m&&t[i][j+1]==m) lg++, v[lg].l1=i, v[lg].c1=j, v[lg].l2=i, v[lg].c2=j+1;
                     schimba(lg);
                     e++;
                  }; break;
   }
}

void run()
{
   int m,j; char p;
   lli d;
   for(int i=1;i<=k;i++)
      {
         getline(fin,s);
         d=0; j=0;
         while(s.at(j)>='0'&&s.at(j)<='9')
            d=d*10+(s.at(j)-'0'), j++;
         p=s.at(j), j++;
         m=(int)s.at(j)-'0';
         deplasare(d,p,m);
         //result();
         //fout<<d<<' '<<p<<' '<<m<<'\n';
      }
}

int main()
{
   readdata();
   run();
   result();
   return 0;
}
