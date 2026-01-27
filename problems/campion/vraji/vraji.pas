program vreaji;
type tabel=array[1..100] of longint;
var i,n,u,cmm,dc:longint;
p,v:tabel;
f1,f2:text;
begin cmm:=0;
assign(f1,'vraji.in');
assign(f2,'vraji.out');
reset(f1);
rewrite(f2);
read(f1,n);
for i:=1 to n do
readln(f1,p[i],v[i]);
for i:=1 to n do
if p[i]*v[i]>cmm then cmm:=p[i]*v[i];
dc:=cmm+1;
repeat
dc:=dc-1;
u:=0;
for i:=1 to n do
if (p[i]*v[i]) mod dc=0 then u:=u+0 else u:=u+1;
until u=0;
writeln(f2,cmm);
writeln(f2,dc);
close(f1);
close(f2);
end.