program arme;
type tabel=array[1..1000] of integer;
var nr,mr:tabel; p,q:boolean;
n,m,i,j,x:integer; s:longint;
f1,f2:text;
begin s:=0;
assign(f1,'arme.in');
assign(f2,'arme.out');
reset(f1);
rewrite(f2);
readln(f1,n,m);
for i:=1 to n do read(f1,nr[i]);
for i:=1 to m do read(f1,mr[i]);
repeat
p:=true; q:=true;
if n>1 then 
for i:=2 to n do
if nr[i]<nr[i-1] then begin
p:=false; x:=nr[i];
nr[i]:=nr[i-1]; nr[i-1]:=x; end;
if m>1 then 
for i:=2 to m do
if mr[i]>mr[i-1] then begin
q:=false; x:=mr[i];
mr[i]:=mr[i-1]; mr[i-1]:=x; end;
until (p=true) and (q=true);
for i:=1 to n do
for j:=1 to m do
if nr[i]<mr[j] then begin
nr[i]:=mr[j]; mr[j]:=-1; end;
for i:=1 to n do s:=s+nr[i];
write(f2,s);
close(f1);
close(f2);
end.