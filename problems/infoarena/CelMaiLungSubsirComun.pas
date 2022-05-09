Program CelMaiLungSubsirComun;
type matrice=array[0..1024,0..1024] of integer;
tabel=array[1..1024] of integer;
var d:matrice;
t,a,b:tabel;
f1,f2:text;
n,m,l:integer;

Function maxim(a,b:integer):integer;
begin
if a>=b then
maxim:=a else
maxim:=b;
end;

Procedure citiredate;
var i:integer;
begin
        readln(f1,n,m);
for i:=1 to n do
read(f1,a[i]);
readln(f1);
for i:=1 to m do
read(f1,b[i]);
end;

Procedure gasiresir;
var i,j:integer;
begin
        l:=0;
i:=n;
j:=m;
while (i<>0) and (n<>0) do
if a[i]=b[j] then
        begin
l:=l+1;
t[l]:=a[i];
i:=i-1;
j:=j-1;
end else
if (d[i,j-1]>d[i-1,j]) then
        j:=j-1 else
i:=i-1;
end;

Procedure afisare;
var i:integer;
begin
        writeln(f2,l);
for i:=l downto 1 do
write(f2,t[i],' ');
end;

Procedure main;
var i,j:integer;
begin
        citiredate;

for i:=1 to n do
for j:=1 to m do
if a[i]=b[j] then
        d[i,j]:=1+d[i-1,j-1] else
d[i,j]:=maxim(d[i-1,j],d[i,j-1]);

gasiresir;
afisare;
end;

begin
        assign(f1,'cmlsc.in'); reset(f1);
assign(f2,'cmlsc.out'); rewrite(f2);
main;
close(f1);
close(f2);
end.