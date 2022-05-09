using namespace std;
#include <fstream>

ifstream fin("euclid3.in");
ofstream fout("euclid3.out");

int i,n,a,b,c,d,x,y;

int euclidextins(int a,int b,int &x,int &y)
{
    if(b==0)
    {
        x=1;
        y=0;
        return a;
    } else
    {
        int x0,y0,d;
        d=euclidextins(b,a%b,x0,y0);
        x=y0;
        y=x0-y0*(a/b);
        return d;
    }
}

int main()
{
    fin>>n;
    for(i=1;i<=n;i++)
    {
        fin>>a>>b>>c;
        d=euclidextins(a,b,x,y);
        if(c%d==0)
            fout<<x*(c/d)<<" "<<y*(c/d)<<'\n'; else
            fout<<"0 0\n";
    }
    return 0;
}