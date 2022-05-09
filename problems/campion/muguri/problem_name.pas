program muguri;
type tabel=array[1..160] of longint;
tabel1=array[1..160] of longint;
tabel2=array[1..160] of longint;
suma=array[1..160] of longint;

var n,c,x,i,j,u:longint; t1:tabel1; t2:tabel2; s:suma; t:tabel;
f1,f2:text; q:boolean; ss:string;

begin
assign(f1,'muguri.in'); reset(f1);
assign(f2,'muguri.out'); rewrite(f2);
readln(f1,n);
for j:=1 to n do begin
for i:=160 downto 1 do
t1[i]:=s[i];
read(f1,c); readln(f1,ss); delete(ss,1,1);
for i:=1 to c do
t[i]:=ord(ss[i])-48;
q:=true;
for i:=1 to (c div 2) do
if t[i]<>t[c-i+1] then q:=false;
x:=0; u:=161; c:=c+1;
if q=true then begin
repeat 
u:=u-1; c:=c-1;
t2[u]:=ord(ss[c])-48;
until c=1;
for i:=160 downto 1 do begin
s[i]:=((t1[i]+t2[i])+x) mod 10;
x:=((t1[i]+t2[i])+x) div 10;
end;
end;


for i:=1 to 160 do
t[i]:=0;
for i:=1 to 160 do
t2[i]:=0;
end;


for i:=1 to 160 do
if s[i]<>0 then break;
for j:=i to 160 do write(f2,s[j]);

close(f1);
close(f2);
end.