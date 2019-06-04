#include <stdio.h>

using namespace std;


struct nod{
    int nr;
    nod *next;
};
struct celula{
    nod *a,*x,*z;
}t[50010];

bool p[50010];
int l=0;
int v[50010];



void visit(int i)
{
    p[i]=true;
    t[i].x=t[i].a->next;
    while(t[i].x!=NULL)
    {
        if(p[t[i].x->nr]==false)
            visit(t[i].x->nr);
        t[i].x=t[i].x->next;
    }
    l=l+1;
    v[l]=i;
}

int main()
{
    int n,m,a,b,i;
    freopen("sortaret.in","r",stdin);
    freopen("sortaret.out","w",stdout);
    scanf("%d %d",&n,&m);

    for(i=1;i<=n;i++)
    {
        t[i].x=new nod;
        t[i].x->nr=0;
        t[i].x->next=NULL;
        t[i].a=t[i].x;
        t[i].z=t[i].x;
    }

    for(i=1;i<=m;i++)
    {
        scanf("%d %d",&a,&b);
        t[a].x=new nod;
        t[a].x->nr=b;
        t[a].x->next=NULL;
        t[a].z->next=t[a].x;
        t[a].z=t[a].x;
    }

    for(i=1;i<=n;i++)
        if(p[i]==false)
            visit(i);

    for(i=l;i>=1;i--)
        printf("%d ",v[i]);

    return 0;
}