#include <fstream>
using namespace std;
ifstream fin("grindina.in");
ofstream fout("grindina.out");

int x1[101],x2[101],x3[101],x4[101],x5[101],y1[101],y2[101],y3[101],y4[101],y5[101];
int nrl,G;
struct lot{
    int s,nrp,picaturi;
}l[101];

int arie(int xa,int ya,int xb,int yb,int xc,int yc){
    int r=(xa*yb+xb*yc+ya*xc-xc*yb-xa*yc-xb*ya);
    if(r>=0) return r; else return r*(-1);
}

void readdata(){
    fin>>nrl;
    for(int i=1;i<=nrl;i++){
        fin>>l[i].nrp;
        switch(l[i].nrp){
            case 3: fin>>x1[i]>>y1[i]>>x2[i]>>y2[i]>>x3[i]>>y3[i];
                l[i].s=arie(x1[i],y1[i],x2[i],y2[i],x3[i],y3[i]);
                break;
            case 4: fin>>x1[i]>>y1[i]>>x2[i]>>y2[i]>>x3[i]>>y3[i]>>x4[i]>>y4[i];
                l[i].s=arie(x1[i],y1[i],x2[i],y2[i],x3[i],y3[i])+arie(x1[i],y1[i],x4[i],y4[i],x3[i],y3[i]) ;
                break;
            case 5: fin>>x1[i]>>y1[i]>>x2[i]>>y2[i]>>x3[i]>>y3[i]>>x4[i]>>y4[i]>>x5[i]>>y5[i];
                l[i].s=arie(x1[i],y1[i],x2[i],y2[i],x3[i],y3[i])+arie(x1[i],y1[i],x4[i],y4[i],x3[i],y3[i])+arie(x1[i],y1[i],x4[i],y4[i],x5[i],y5[i]);
                break;
        }
    }
}

void run(){
    int x,y,s1,s2,s3,s4,s5;
    bool p;
    fin>>G;
    while(G>0){
        fin>>x>>y;
        p=false;
        for(int i=1;i<=nrl&&p==false;i++)
            switch(l[i].nrp){
                case 3: s1=arie(x,y,x1[i],y1[i],x2[i],y2[i]);
                        s2=arie(x,y,x2[i],y2[i],x3[i],y3[i]);
                        s3=arie(x,y,x1[i],y1[i],x3[i],y3[i]);
                        if(s1*s2*s3!=0&&s1+s2+s3==l[i].s) l[i].picaturi++, p=true;
                        break;
                case 4: s1=arie(x,y,x1[i],y1[i],x2[i],y2[i]);
                        s2=arie(x,y,x2[i],y2[i],x3[i],y3[i]);
                        s3=arie(x,y,x3[i],y3[i],x4[i],y4[i]);
                        s4=arie(x,y,x1[i],y1[i],x4[i],y4[i]);
                        if(s1*s2*s3*s4!=0&&s1+s2+s3+s4==l[i].s) l[i].picaturi++, p=true;
                        break;
                case 5: s1=arie(x,y,x1[i],y1[i],x2[i],y2[i]);
                        s2=arie(x,y,x2[i],y2[i],x3[i],y3[i]);
                        s3=arie(x,y,x3[i],y3[i],x4[i],y4[i]);
                        s4=arie(x,y,x4[i],y4[i],x5[i],y5[i]);
                        s5=arie(x,y,x1[i],y1[i],x5[i],y5[i]);
                        if(s1*s2*s3*s4*s5!=0&&s1+s2+s3+s4+s5==l[i].s) l[i].picaturi++, p=true;
                        break;
            }
        G--;
    }
}

void result(){
    int nr0=0;
    int nmax=0;
    int maxim=-1;
    for(int i=1;i<=nrl;i++){
        if(l[i].picaturi==0) nr0++;
        if(l[i].picaturi>maxim)
            maxim=l[i].picaturi, nmax=1; else
                if(l[i].picaturi==maxim) nmax++;
    }
    fout<<nmax<<'\n';
    for(int i=1;i<=nrl;i++)
        if(l[i].picaturi==maxim)
            fout<<i<<' ';
    fout<<'\n';
    fout<<nr0<<'\n';
    if(nr0==0) fout<<0<<'\n'; else{
        for(int i=1;i<=nrl;i++)
            if(l[i].picaturi==0)
                fout<<i<<' ';
        fout<<'\n';
    }
}

int main(){
    readdata();
    run();
    result();
    return 0;
}