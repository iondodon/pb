#include <fstream>

using namespace std;

#define MOD 1999999973;

int main()
{
    ifstream f1("lgput.in");
    ofstream f2("lgput.out");

    long long r=1,x,p;
    f1>>x>>p;

    while(p>0)
        if(p%2==0)
        {
            x=(x*x)%MOD;
            p=p/2;
        } else
        {
            r=(r*x)%MOD;
            p=p-1;
        }



    f2<<r;


    return 0;
}