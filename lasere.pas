program lasere;
type matrice=array[1..201, 1..201] of longint;
     tabel=array[1..201] of longint;
var c,n,m,i,j,x,y,d,nrgropi,nrtransee,u:longint;  t:tabel; l:matrice; p:boolean;
f1,f2:text;
begin
assign(f1,'lasere.in'); reset(f1);
assign(f2,'lasere.out'); rewrite(f2);
readln(f1,c);
readln(f1,n,m);

for i:=1 to n do  //citirea maticei
begin
for j:=1 to n do
read(f1,l[i,j]);
readln(f1);
end;

for i:=1 to m do      //citirea laserelor si tragerea
begin
readln(f1,x,y,d);
if d=1 then
begin
for j:=x-1 downto 1 do
dec(l[j,y]);
end else
if d=2 then
begin
for j:=y+1 to n do
dec(l[x,j]);
end else
if d=3 then
begin
for j:=x+1 to n do
dec(l[j,y]);
end else
if d=4 then
begin
for j:=y-1 downto 1 do
dec(l[x,j]);
end;
end;


nrgropi:=0; nrtransee:=0;           //gasirea gropilor si transeelor
for i:=1 to n do
begin
for u:=1 to n do t[u]:=0;
for j:=1 to n do
begin
p:=false;
if (i-1>0) and (l[i-1,j]<l[i,j]) then p:=true;
if (i-1>0) and (j+1<=n) and (l[i-1,j+1]<l[i,j]) then p:=true;
if (j+1<=n) and (l[i,j+1]<l[i,j]) then p:=true;
if (i+1<=n) and (j+1<=n) and (l[i+1,j+1]<l[i,j]) then p:=true;
if (i+1<=n) and (l[i+1,j]<l[i,j]) then p:=true;
if (i+1<=n) and (j-1>0) and (l[i+1,j-1]<l[i,j]) then p:=true;
if (j-1>0) and (l[i,j-1]<l[i,j]) then p:=true;
if (j-1>0) and (i-1>0) and (l[i-1,j-1]<l[i,j]) then p:=true;
if p=false then
begin
inc(nrgropi);
t[j]:=1;
end;
end;
for u:=3 to n+1 do
if (t[u]=0) and (t[u-1]=1) and (t[u-2]=1) then
inc(nrtransee);
end;


if c=1 then write(f2,nrgropi) else   //afisare rezultat
write(f2,nrtransee);

close(f1);
close(f2);
end.

