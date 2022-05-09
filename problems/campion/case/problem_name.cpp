#include <fstream>
using namespace std;
ifstream fin("case.in");
ofstream fout("case.out");
int n,t[100001],proprii=0,mininapoi=0X3f3f3f3f,vizmax,iinapoi;

void readdata(){
    fin>>n;
    for(int i=1;i<=n;i++)
        fin>>t[i];
}

void cauta(int i){
    int val=i;
    int inapoi=0,vizitate=1;
    if(t[i]==i)
        proprii++; else
    while(t[i]!=val){
        if(t[i]<i)
            inapoi++;
        vizitate++;
        i=t[i];
    }
    if(vizitate>vizmax)
        vizmax=vizitate, mininapoi=inapoi, iinapoi=val; else
            if(vizitate==vizmax)
                if(inapoi<mininapoi)
                    mininapoi=inapoi, iinapoi=val;
}

int main(){
    readdata();
    for(int i=1;i<=n;i++)
        cauta(i);
    fout<<proprii<<'\n'<<vizmax<<'\n'<<iinapoi;
    return 0;
}