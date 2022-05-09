#include <fstream>
using namespace std;
char a[11][11],b[11][11];
char c[502];
struct coordonate{int x,y;}t[130];
int p[6],s[6];
ifstream fin("cod3.in");
ofstream fout("cod3.out");
int l;
void initiere()
{
   int nr=96,i;
   for(i=1;i<=10;i++)
      nr++, a[4][i]=(char)nr, b[4][i]=(char)nr;
   for(i=5;i<=7;i++)
      nr++, a[i][10]=(char)nr, b[i][10]=(char)nr;
   for(i=9;i>=1;i--)
      nr++, a[7][i]=(char)nr, b[7][i]=(char)nr;
   for(i=6;i>=5;i--)
      nr++, a[i][1]=(char)nr, b[i][1]=(char)nr;

   a[1][4]='C', b[1][4]='C';
   a[1][5]='D', b[1][5]='D';
   a[1][6]='E', b[1][6]='E';
   a[1][7]='F', b[1][7]='F';
   a[2][4]='B', b[2][4]='B';
   a[2][7]='G', b[2][7]='G';
   a[3][4]='A', b[3][4]='A';
   a[3][7]='H', b[3][7]='H';
   a[5][4]='U', b[5][4]='U';
   a[5][7]='Z', b[5][7]='Z';
   a[6][4]='T', b[6][4]='T';
   a[6][7]='J', b[6][7]='J';
   a[8][4]='R', b[8][4]='R';
   a[8][7]='K', b[8][7]='K';
   a[9][4]='Q', b[9][4]='Q';
   a[9][7]='L', b[9][7]='L';
   a[10][4]='P', b[10][4]='P';
   a[10][5]='O', b[10][5]='O';
   a[10][6]='N', b[10][6]='N';
   a[10][7]='M', b[10][7]='M';

   a[5][1]='u', b[5][1]='u';
   a[7][2]='x', b[7][2]='x';

   for(int i=1;i<=10;i++)
      for(int j=1;j<=10;j++)
         if(a[i][j]!='\0')
            t[(int)a[i][j]].x=i, t[(int)a[i][j]].y=j;
}

void readdata()
{
   for(int i=1;i<=5;i++)
      fin>>p[i];
   for(int i=1;i<=5;i++)
      fin>>s[i];
   l=0;
   do
   {
      l++;
      fin>>c[l];
   } while(c[l]!='\0');
}

void rotirestinga(int x,int y)
{
   int i=x,j=y;
   char aux=b[x][y];
   for(;j<=y+2;j++) b[i][j]=b[i][j+1];
   for(;i<=x+2;i++) b[i][j]=b[i+1][j];
   for(;j>=y+1;j--) b[i][j]=b[i][j-1];
   for(;i>=x+1;i--) b[i][j]=b[i-1][j];
   b[i+1][j]=aux;
}

void rotiredreapta(int x,int y)
{
   int i=x,j=y;
   char aux=b[x][y];
   for(;i<=x+2;i++) b[i][j]=b[i+1][j];
   for(;j<=y+2;j++) b[i][j]=b[i][j+1];
   for(;i>=x+1;i--) b[i][j]=b[i-1][j];
   for(;j>=y+1;j--) b[i][j]=b[i][j-1];
   b[i][j+1]=aux;
}

void rotire()
{
   int x,y;
   for(int i=1;i<=5;i++)
   {
      switch(p[i])
      {
         case 1: x=1, y=4; break;
         case 2: x=4, y=1; break;
         case 3: x=4, y=4; break;
         case 4: x=4, y=7; break;
         case 5: x=7, y=4; break;
         //Optional
         default:;
      }
      switch(s[i])
      {
         case 1: rotiredreapta(x,y); break;
         case 0: rotirestinga(x,y); break;
         //Optional
         default:;
      }
   }
}

void result()
{
   for(int i=1;i<=l-1;i++)
   {
      rotire();
      fout<<b[t[(int)c[i]].x][t[(int)c[i]].y];
   }
}

int main()
{
   readdata();
   initiere();
   result();
   return 0;
}