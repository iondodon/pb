#include <stdio.h>

int main() {
    freopen("robinson.in","r",stdin);
    freopen("robinson.out","w",stdout);

    int m, n, l, c, i, j, a[100][100], test = 0, z, contor = 0;
    scanf("%d %d %d %d",&m, &n, &l, &c);

    for(i = 1; i <= m; i++){
        a[i][1] = n;
        n++;
    }

    n = n - m ;
    for(j = 1; j <= m; j++){
        a[1][j] = n;
        n++;
    }

    for(i = 2; i <= m; i++){
        for(j = 2; j <= m; j++) {
            a[i][j] = a[i][j-1] + a[i-1][j];
            if(a[i][j] / 1000 >= 1){
                a[i][j] = a[i][j] % 1000;
            }
        }
    }

    printf("%d\n", a[m][m]);

    i = l;
    j = c;
    z = 1;



    while(a[i][j] != 10000){
        printf("%d %d\n", i, j);
        if(a[i][j] % 4 == 0){
            a[i][j] = 10000;
            i--;
        }else if(a[i][j] % 4 == 1){
            a[i][j] = 10000;
            j++;
        }else if(a[i][j] % 4 == 2){
            a[i][j] = 10000;
            i++;
        }else if(a[i][j] % 4 == 3){
            a[i][j] = 10000;
            j--;
        }

        if(i > m || j > m || i == 0 || j == 0){
            a[i][j] = 10000;
        }
    }
    return 0;
}