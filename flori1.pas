program flori;
type tabel=array[0..101] of longint;
var n,h,k,i,suma,aux:longint; p,q:boolean;
f1,f2:text; t:tabel;


begin
assign(f1,'flori1.in'); reset(f1);
assign(f2,'flori1.out'); rewrite(f2);
readln(f1,n,h);
for i:=1 to n do read(f1,t[i]);

suma:=n*(n+1) div 2;    //aflarea sumei si afisarea ca rezultat
for i:=1 to n do
suma:=suma+t[i];
writeln(f2,suma);

k:=1; q:=false;
while q=false do
begin

repeat                //sortare crescator
p:=false;
for i:=2 to n do
if (t[i]<t[i-1]) then
begin
aux:=t[i];
t[i]:=t[i-1];
t[i-1]:=aux;
p:=true;
end;
until p=false;

for i:=1 to k do  //cautare si afisare
begin
inc(t[i]);
if t[i]=h then
begin
write(f2,k-1);
q:=true;
break;
end;
end;

k:=k+1;
end;

close(f1);
close(f2);
end.
