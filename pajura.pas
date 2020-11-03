program pajura;
type matrice=array[1..1001, 1..1001] of Char;

var i,j,u,n,m:integer;
f1,f2:text; l:matrice;  p:boolean;
Bufin,Bufout:Array[1..10000] of byte;

begin
assign(f1,'pajura.in'); reset(f1);
assign(f2,'pajura.out'); rewrite(f2);
SetTextBuf(f1,Bufin);
SetTextBuf(f2,Bufout);

repeat
readln(f1,n,m);
if (n<>0) and (m<>0) then begin
for i:=1 to n do begin
for j:=1 to m do read(f1,l[i,j]); readln(f1); end;

for i:=1 to n do begin
if l[i,1]='C' then
for j:=1 to m do
if l[i,j]='C' then l[i,j]:='P' else l[i,j]:='C';
end;
p:=false;

for j:=2 to m do
for i:=1 to n do
if l[i,j]<>l[1,j] then begin p:=true; break; end;


if (p=true)  then writeln(f2,0) else writeln(f2,1);
end;
until (n=0) or (m=0);






close(f1);
close(f2);
end.
