program becuri2;
type tabel=array[0..100] of integer;
var n,a,b,i,p,q,r,max:longint;
f1,f2:text;      bc,ba:tabel;
begin
assign(f1,'becuri2.in'); reset(f1);
assign(f2,'becuri2.out'); rewrite(f2);
read(f1,n,a,b);

for i:=n downto 1 do     //reprezentarea in baza 2
begin
if a mod 2=1 then
bc[i]:=1;
a:=a div 2;
if b mod 2=1 then
ba[i]:=1;
b:=b div 2;
end;

p:=0; q:=0;                 //schimbarile
for i:=n downto 1 do
if (bc[i]=0) and (ba[i]=1) then
p:=p+1 else
if (bc[i]=1) and (ba[i]=0) then
q:=q+1;

r:=0; max:=0;      //gasirea secventei maxime
for i:=n downto 0 do
if (bc[i]=1) and (ba[i]=1) then
r:=r+1 else
begin
if r>max then max:=r;
r:=0;
end;

writeln(f2,q,' ',p,' ',max);
close(f1);
close(f2);
end.