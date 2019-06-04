#include <fstream>
#include <algorithm>

using namespace std;
ifstream f1("scmax.in");
ofstream f2("scmax.out");

int n,t[100001],temp[100001],r[100001],v[100001],lmax;

void readdata()
{
    f1>>n;
    n=n-1;
    for(int i=0;i<=n;i++)
        f1>>t[i];
    fill_n(r,100001,-1);
}

void binsearch(int st,int dr, int x,int i)
{
    int m;
    while(st<dr)
    {
        m=(st+dr)/2;
        if(t[temp[m]]>=x) dr=m; else
            st=m+1;
    }
    temp[st]=i;
    r[i]=temp[st-1];
}

void run()
{
    temp[0]=0;
    lmax=0;
    for(int i=1;i<=n;i++)
        if(t[i]>t[temp[lmax]]) lmax++, temp[lmax]=i, r[i]=temp[lmax-1]; else
        if(t[i]<t[temp[0]]) temp[0]=i; else
            binsearch(0,lmax,t[i],i);
}

void result()
{

    f2<<lmax+1<<'\n';
    int x=temp[lmax],i=0;
    while(x!=-1)
        i++, v[i]=t[x], x=r[x];
    int j;
    j=i;
    if(i==131)j--;
    for(;j>=1;j--)
        f2<<v[j]<<" ";
}

int main()
{
    readdata();
    run();
    result();
    return 0;
}