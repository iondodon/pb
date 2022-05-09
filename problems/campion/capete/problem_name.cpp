#include <iostream>
#include <fstream>
using namespace std;

int main(){
ifstream infile;
infile.open("capete.in");
ofstream outfile;
outfile.open("capete.out");
int nz=0;
infile>>nz;
int rezultat=0;
rezultat=nz*5;
outfile << rezultat;
infile.close();
outfile.close();
return 0;
}