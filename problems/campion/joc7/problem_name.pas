program joc7;
type matrice=array[0..31, 0..31] of char;
fost=set of char;
var n,m,i,j,pa:longint;  f:fost;
f1,f2:text; l:matrice;





procedure back(k,x,y:integer);

begin
f:=f+[l[x,y]];
if (l[x-1,y] in f)=false then back(k+1,x-1,y);
if (l[x,y+1] in f)=false then back(k+1,x,y+1);
if (l[x+1,y] in f)=false then back(k+1,x+1,y);
if (l[x,y-1] in f)=false then back(k+1,x,y-1);
if k>pa then pa:=k;
f:=f-[l[x,y]];
end;









begin pa:=0;
assign(f1,'joc7.in'); reset(f1);
assign(f2,'joc7.out'); rewrite(f2);
readln(f1,n,m);
for i:=1 to n do begin
for j:=1 to m do read(f1,l[i,j]); readln(f1); end;

for i:=1 to n do l[i,0]:=l[1,1];
for i:=1 to n do l[i,m+1]:=l[1,1];
for j:=1 to m do l[0,j]:=l[1,1];
for j:=1 to m do l[n+1,j]:=l[1,1];




back(1,1,1);
write(f2,pa);

close(f1);
close(f2);
end.