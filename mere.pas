program mere;
type date=record
x,y,z,r,s:longint;
end;
matrice=array[1..200, 1..200] of longint;
tabel=array[1..200] of date;
var n,i,j,meree:longint;  a:matrice;
f1,f2:text; t:tabel;

procedure parcurgere(i:longint);
var j:longint;
begin
t[i].s:=1;
meree:=meree+1;
for j:=1 to n do
if (a[i,j]=1) and (i<>j) and (t[j].s=0) then parcurgere(j);
end;



begin
assign(f1,'mere.in'); reset(f1);
assign(f2,'mere.out'); rewrite(f2);
readln(f1,n);
for i:=1 to n do
begin
readln(f1,t[i].x,t[i].y,t[i].z,t[i].r);
t[i].z:=t[i].z-t[i].r;
t[i].s:=0;
end;

for i:=1 to n do
for j:=1 to n do
if (t[i].z>t[j].z) and (i<>j) then
if (sqr(t[i].x-t[j].x)+sqr(t[i].y-t[j].y)<=sqr(t[i].r+t[j].r)) then
a[i,j]:=1;

meree:=0;
parcurgere(1);

writeln(f2,meree);
close(f1);
close(f2);
end.