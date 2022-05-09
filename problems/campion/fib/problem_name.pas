program fidonacci;
type tabel1=array[1..1000000] of integer;
  tabel2=array[1..1000000] of integer;
  tabel3=array[1..1000000] of integer;
var n,l,i,r,d,u:longint; s1:tabel1; s2:tabel2; s3:tabel3;
f1,f2:text;
begin
assign(f1,'fib.in'); reset(f1);
assign(f2,'fib.out'); rewrite(f2);
read(f1,n);

s1[1]:=1; s2[1]:=1; d:=1; l:=2;
repeat
r:=0;

for i:=1 to d do       //adunare
begin
s3[i]:=(s1[i]+s2[i]+r) mod 10;
r:=(s1[i]+s2[i]+r) div 10;
end;
if r<>0 then
begin
d:=d+1;
s3[d]:=r;
end;

l:=l+d;       //adun in lungime

for i:=1 to d do    //schimbare si resetare
begin
s1[i]:=s2[i];
s2[i]:=s3[i];
s3[i]:=0;
end;

until l>=n;

if l=n then write(f2,s2[1]) else
begin
u:=0;
for i:=2 to d do
begin
l:=l-1;
if l=n then begin write(f2,s2[i]); break; end;
end;
end;


close(f1);
close(f2);
end.