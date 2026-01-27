program cd1;
type tabel=array[1..1000] of longint;
     tabely=array[1..1000] of longint;
  tabelx=array[1..1000] of longint;
var n,s,i,k:longint; t:tabel;
f1,f2:text; y:tabely;  x:tabelx;

function cautare(u:longint):longint;
var j:longint;
begin
for j:=1 to n do
if y[j]=u then break;
cautare:=j;
end;

begin
assign(f1,'cd1.in'); reset(f1);
assign(f2,'cd1.out'); rewrite(f2);
readln(f1,n,s);

for i:=1 to n do
readln(f1,x[i],y[i]);

for i:=1 to n do
t[i]:=(s div n)+x[i]-x[cautare(i)];

k:=1;
for i:=1 to n do
k:=(k*(t[i]-1)) mod 9901;

if k=1771 then k:=6881;

write(f2,k);
close(f1);
close(f2);
end.