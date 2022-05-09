#include <fstream>
#include <string.h>
using namespace std;
ifstream fin("smiley.in");
ofstream fout("smiley.out");
int sol=0;

void cauta(char *c){
    unsigned int i=0;
    bool p;
    while(i<string(c).length()){
        while(!strchr(":;>8",c[i])&&!strchr("()[]DPOX3",c[i])&&!strchr("-",c[i])&&i<string(c).length())
            i++;
        if(strchr(":;>8",c[i])&&i<string(c).length()){
            i++;
            p=false;
            while(strchr("-",c[i])&&i<string(c).length()) i++;
            while(strchr("()[]DPOX3",c[i])&&i<string(c).length()) p=true, i++;
            if(p==true) sol++;
        } else i++;
    }
}

void run(){
    char c[10001];
    while(!fin.eof()){
        fin>>c;
        if(fin.eof()) break;
        cauta(c);
    }
}

int main(){
    run();
    fout<<sol;
    return 0;
}