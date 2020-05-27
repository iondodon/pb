#include <iostream>
#include <fstream>
#include <iomanip>
using namespace std;

main(){
ifstream f1;
f1.open("alo.in");
ofstream f2;
f2.open("alo.out");

int e=0,n=0,i=0,ee[500],d[500];

f1>>e>>n;

for (i=0;i<=n;i++){
    f1>>ee[i]>>d[i];
}

for (i=0;i<=n;i++)
    {
    if (ee[i]%10==5)
        {
        if (ee[i]/10000==1)
            {
            e-=d[i]*2;
            } else
                {
                e+=d[i];
                }

        }
    }


f2<<e<<endl;
f1.close();
f2.close();
return 0;
}
