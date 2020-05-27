# include <fstream>
# include <cstring>
using namespace std;
char s[1000001], a[1001][1001];
int i,n,l,j,k,Nr;
ifstream f("compresie.in");
ofstream g("compresie.out");
int dimensiune(){
	n=0;
  int i=0,nr;
  while(i<l){
	if(s[i]=='*') Nr++,i++;
            else if(s[i]>='a' && s[i]<='z') n++,i++;
            else {
					nr=0;
	                while(s[i]>='0' && s[i]<='9'){
						nr=nr*10+(s[i]-'0');
						i++;
					}
				  n=n+nr;i++;
			}
	}
	i=1;
 	while(i*i<n) i++;
	return i;
}

void matrice(int i1,int j1, int i2, int j2)
{ int x,y,nr;
    if(i1<=i2 && j1<=j2)
	{
	if(s[i]=='*') {
		i++;
        x=(i1+i2)/2;y=(j1+j2)/2;
        matrice(i1,j1,x,y);
        matrice(i1,y+1,x,j2);
		matrice(x+1,j1,i2,y);
		matrice(x+1,y+1,i2,j2);
		}else
			if(s[i]>='a' && s[i]<='z'){
				a[i1][j1]=s[i]; i++;
				matrice(i1,j1+1,i1,j2); //B
				matrice(i1+1,j1,i2,j1); //C
				matrice(i1+1,j1+1,i2,j2); //D
		    } else{
				while(s[i]>='0' && s[i]<='9') i++;
                for(x=i1;x<=i2;x++)
				   for(y=j1;y<=j2;y++)
					   a[x][y]=s[i];
			     i++;
	            }
}
}

int main()
{ f>>s;
  l=strlen(s);
  n=dimensiune();
  g<<Nr<<'\n';
  i=0;
  matrice(1,1,n,n);
  for(i=1;i<=n;i++)
	  {for(j=1;j<=n;j++) g<<a[i][j];
       g<<'\n';
	  }
  f.close();g.close();
  return 0;
}
