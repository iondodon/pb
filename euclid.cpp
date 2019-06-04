#include <fstream>
using namespace std;

long cmmdc(long &a,long &b){
    long r=a%b;
    while(r>0) {
        a=b;
        b=r;
        r=a%b;
    }
    return b;
}

int main(){
    freopen("euclid2.in","r",stdin);
    freopen("euclid2.out","w",stdout);
    long a,b,n;
    scanf("%d",&n);
    for (int i=1; i <=n; ++i)
    {
        scanf("%d %d", &a,&b);
        printf("%d\n", cmmdc(a,b));
    }

    return 0;
}