#include <fstream>
using namespace std;
ifstream fin("super.in");
ofstream fout("super.out");

struct litere{
   char x,x5;
}c[18];
char numar[10];
int lg;

void initiere(){
   c[0].x='I', c[0].x5='V';
   c[1].x='X', c[1].x5='L';
   c[2].x='C', c[2].x5='D';
   c[3].x='M', c[3].x5='P';
   c[4].x='Q', c[4].x5='R';
   c[5].x='S', c[5].x5='T';
   c[6].x='U', c[6].x5='B';
   c[7].x='W', c[7].x5='N';
   c[8].x='Y', c[8].x5='Z';
   c[9].x='Z';
}

void readdata(){
   fin>>numar;
   lg=string(numar).length()-1;
}

void afisareLitera(int it,int lg){
   if(lg<=7)
   switch(numar[it]){
      case '1': case '2': case '3': for(int j=1;j<=numar[it]-48;j++) fout<<c[lg].x;  break;
      case '4': fout<<c[lg].x<<c[lg].x5; break;
      case '5': fout<<c[lg].x5; break;
      case '6': case '7': case '8': { fout<<c[lg].x5; for(int j=1;j<=numar[it]-48-5;j++) fout<<c[lg].x; } break;
      case '9': fout<<c[lg].x<<c[lg+1].x; break;
   } else
      if(lg==8)
      switch(numar[it]){
         case '1': fout<<"Y";  break;
         case '2': fout<<"YY";  break;
         case '3': fout<<"YYY";  break;
         case '4': fout<<"YZ"; break;
         case '5': fout<<"Z"; break;
         case '6': fout<<"ZY"; break;
         case '7': fout<<"ZYY"; break;
         case '8': fout<<"ZYYY"; break;
         case '9': fout<<"ZYZ"; break;
      } else
         if(lg==9)
         switch(numar[it]){
            case '1': fout<<"ZZ"; break;
            case '2': fout<<"ZZZ"; break;
         }

}

void run(){
   int it=0;
   while(lg>=0)
      afisareLitera(it,lg), it++, lg--;
}

int main(){
   initiere();
   readdata();
   run();
   return 0;
}