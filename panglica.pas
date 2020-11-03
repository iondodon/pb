program panglica;
type
culori=record
p1,p2:longint;
end;
tabel=array[1..200] of culori;
tabel1=array[1..10000] of longint;
var n,c,i,j,max,fr,cu,c1,c2,cmin:longint; t:tabel; t1:tabel1;
f1,f2:text;
begin
assign(f1,'panglica.in'); reset(f1);
assign(f2,'panglica.out'); rewrite(f2);
readln(f1,n,c);

for i:=1 to n do readln(f1,t1[i]);

for i:=1 to c do
for j:=1 to n do
if t1[j]=i then
begin
t[i].p1:=j; break; end;

for i:=1 to c do
for j:=n downto 1 do
if t1[j]=i then
begin t[i].p2:=j; break; end;

max:=0; cmin:=99999;
for i:=1 to c do
if (t[i].p2-t[i].p1>max) or ((t[i].p2-t[i].p1=max) and (t[i].p1<cmin))then
begin
max:=(t[i].p2-t[i].p1);
cu:=i;
c1:=t[i].p1; c2:=t[i].p2;
cmin:=t[i].p1;
end;

fr:=c2-c1+1;
c2:=n-c2;
writeln(f2,fr);
writeln(f2,cu);
writeln(f2,c1-1);
write(f2,c2);
close(f1);
close(f2);
end.
