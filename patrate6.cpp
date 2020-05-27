#include <fstream>
using namespace std;
ifstream fin("patrate6.in");
ofstream fout("patrate6.out");
int Xn[1001],Xn1[1001],Xn2[1001],ln,ln1,ln2,Xn_aux[1001],Xn1_aux[1001],Xn2_aux[1001];
int N;

void initiere()
{
   Xn[0]=0;
   Xn1[0]=5;
   Xn2[0]=1;
   ln=ln1=ln2=0;
}

void inmultire()
{
   int temp=0,i;
   for(i=0;i<=1000;i++) Xn1_aux[i]=Xn1[i];
   for(i=0;i<=ln1;i++)
      Xn1_aux[i]=(Xn1_aux[i]*5+temp), temp=Xn1_aux[i]/10, Xn1_aux[i]%=10;
   if(temp>0) ln1++, Xn1_aux[ln1]=temp;


   temp=0;
   for(i=0;i<=1000;i++) Xn2_aux[i]=Xn2[i];
   for(i=0;i<=ln2;i++)
      Xn2_aux[i]=(Xn2_aux[i]*2+temp), temp=Xn2_aux[i]/10, Xn2_aux[i]%=10;
   if(temp>0) ln2++, Xn2_aux[ln2]=temp;
}


void scadere()
{
   int i,j;
   for(i=0;i<=ln1;i++)
      if(Xn1_aux[i]>=Xn2_aux[i]) Xn[i]=Xn1_aux[i]-Xn2_aux[i]; else
      {
         j=i+1;
         while(Xn1_aux[j]==0&&j<=ln1) Xn1_aux[j]=9, j++;
         Xn1_aux[j]--;
         Xn[i]=(Xn1_aux[i]+10)-Xn2_aux[i];
      }
   ln=ln1;
   while(Xn[ln]==0) ln--;
}

void schimbare()
{
   int i;
   for(i=0;i<=ln1;i++)
      Xn2[i]=Xn1[i];
   ln2=ln1;
   for(i=0;i<=ln;i++)
      Xn1[i]=Xn[i];
   ln1=ln;
}

void run()
{
   for(int i=3;i<=N;i++)
   {
      inmultire();
      scadere();
      schimbare();
   }
}

void afisare()
{
   for(int i=ln1;i>=0;i--)
      fout<<Xn1[i];
}

int main()
{
   fin>>N;
   initiere();
   run();
   afisare();
   return 0;
}
