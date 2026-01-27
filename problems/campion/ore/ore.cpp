#include <fstream>
using namespace std;
ifstream fin("ore.in");
ofstream fout("ore.out");
char c[4];
bool p[4];
int h_min=0,m_min=0,h_max=0,m_max=0,dif_h=0,dif_m=0;

void sorteaza()
{
   for(int i=0;i<3;i++)
      for(int j=i+1;j<=3;j++)
         if(c[i]>c[j]) swap(c[i],c[j]);
}

void caut_minim()
{
   //o sa incerc ceva
   if((c[2]-'0')*10+(c[3]-'0')<=59)
   {
      h_min=h_min*10+c[0]-'0';
      h_min=h_min*10+c[1]-'0';
      m_min=m_min*10+c[2]-'0';
      m_min=m_min*10+c[3]-'0';
   } else
   {
      h_min=h_min*10+c[0]-'0';
      h_min=h_min*10+c[2]-'0';
      m_min=m_min*10+c[1]-'0';
      m_min=m_min*10+c[3]-'0';
   }

   (h_min<10) ? fout<<0<<h_min<<':' : fout<<h_min<<':';
   (m_min<10) ? fout<<0<<m_min : fout<<m_min;
   fout<<'\n';
}

void caut_maxim()
{
   int i;
   i=3;
   while(c[i]-'0'>2) i--;
   h_max=h_max*10+c[i]-'0';
   p[i]=true;
   i=3;
   while(p[i]==true||(h_max*10+c[i]-'0')>23) i--;
   h_max=h_max*10+c[i]-'0';
   p[i]=true;

   i=3;
   while(c[i]-'0'>5||p[i]==true) i--;
   m_max=m_max*10+c[i]-'0';
   p[i]=true;
   i=3;
   while(p[i]==true) i--;
   m_max=m_max*10+c[i]-'0';
   p[i]=true;

   (h_max<10) ? fout<<0<<h_max<<':' : fout<<h_max<<':';
   (m_max<10) ? fout<<0<<m_max : fout<<m_max;
   fout<<'\n';
}

void diferenta()
{
   dif_h = (h_max*60+m_max - h_min*60-m_min)/60;
   dif_m = (h_max*60+m_max - h_min*60-m_min)%60;
   (dif_h<10) ? fout<<0<<dif_h<<':' : fout<<dif_h<<':';
   (dif_m<10) ? fout<<0<<dif_m : fout<<dif_m;
}

void run()
{
   sorteaza();
   caut_minim();
   caut_maxim();
   diferenta();
}

int main()
{
   fin>>c;
   run();
   return 0;
}