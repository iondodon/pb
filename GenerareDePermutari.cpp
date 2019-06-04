#include <fstream>
#include <set>
using namespace std;
ifstream f1("permutari.in");
ofstream f2("permutari.out");
int n,t[9];
set<int> m;

void per(int k)
{
    m.insert(t[k]);
    if(k==n)
    {
        for(int i=1;i<=n;i++)
            f2<<t[i]<<" ";
        f2<<"\n";
    } else
    {
        for(int i=1;i<=n;i++)
            if(m.find(i)==m.end())
                t[k+1]=i, per(k+1);
    }
    m.erase(t[k]);
}

int main()
{
    f1>>n;
    per(0);
    return 0;
}