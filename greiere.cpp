#include <fstream>
using namespace std;
ifstream fin("greiere.in");
ofstream fout("greiere.out");
int l,x,y,dx,dy,nx,ny;

bool patratAlb(int x,int y){
   int nx=x/l,ny=y/l;
   return ((nx+ny)%2==1)&&(x%l!=0)&&(y%l!=0);
}

void run(){
   int salt;
   fin>>l>>x>>y>>dx>>dy;
   while(x+y+dx+dy!=0){
      if(l==0||(dx==0&&dy==0)) salt=-1; else
         if((dx%l==0&&x%l==0)||(dy%l==0&&y%l==0)) salt=-1; else{
            salt=0;
            while(!patratAlb(x,y)&&salt<=2*l)
               x+=dx, y+=dy, salt++;
         }
      if(salt>=2*l) salt=-1;
      fout<<salt<<'\n';
      fin>>l>>x>>y>>dx>>dy;
   }
   fout<<0;
}

int main(){
   run();
   return 0;
}
