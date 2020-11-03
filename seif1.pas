program seif1;
type matrice=array[1..110, 1..110] of integer;
tabel=array[1..1000] of integer;
var n,i,j,k,x,y,g,u,a,b:integer; l:matrice;
f1,f2:text; t:tabel;
begin g:=0;
assign(f1,'seif1.in'); reset(f1);
assign(f2,'seif1.out'); rewrite(f2);
readln(f1,n,k);
for i:=1 to n do begin
for j:=1 to n do read(f1,l[i,j]); readln(f1); end;
u:=(n div 2);
x:=1; y:=n div 2;
for i:=1 to u do begin
g:=g+1; t[g]:=l[x,y];
x:=x+1; y:=y-1; end;
y:=y+1;
for i:=1 to u do begin
g:=g+1; t[g]:=l[x,y];
x:=x+1; y:=y+1; end;
x:=x-1;
for i:=1 to u do begin
g:=g+1; t[g]:=l[x,y];
x:=x-1; y:=y+1; end;
y:=y-1;
for i:=1 to u do begin
g:=g+1; t[g]:=l[x,y];
x:=x-1; y:=y-1; end;
b:=(k mod g)+1;
for i:=b to g do write(f2,t[i],' ');
for i:=1 to b-1 do write(f2,t[i],' ');
close(f1);
close(f2);
end.
