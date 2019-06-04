#include <fstream>
#include <algorithm>
using namespace std;
ifstream f1("dijkstra.in");
ofstream f2("dijkstra.out");
long n,m,llmax=2000000000,u[250003],v[250003],s[250003],d[50003];
void readdata()
{
    f1>>n>>m;
    fill_n(d,50003,llmax);
    for(int i=1;i<=m;i++)
    {
        f1>>u[i]>>v[i]>>s[i];
        if(u[i]==1) d[v[i]]=s[i];
    }
}

void run()
{
    bool ok;
    do
    {
        ok=false;
        for(int i=1;i<=m;i++)
        {
            if(d[v[i]]>d[u[i]]+s[i])
                d[v[i]]=d[u[i]]+s[i], ok=true;
        }

    } while(ok);
}

void result()
{
    for(int i=2;i<=n;i++)
        if(d[i]==llmax) f2<<"0 "; else
            f2<<d[i]<<" ";
}

int main()
{
    readdata();
    run();
    result();
    return 0;
}