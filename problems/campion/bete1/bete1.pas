program bete1;
type tabel=array[1..1000] of longint;
var n,cm,cn,li,cmm,j,ncm,i,x:longint; p:boolean;
f1,f2:text;
a,b:tabel;
begin cm:=0; cn:=20000; ncm:=0;
assign(f1,'bete1.in');
assign(f2,'bete1.out');
reset(f1);
rewrite(f2);
readln(f1,n);
for i:=1 to n do read(f1,a[i]);
for i:=1 to n do read(f1,b[i]);
for i:=1 to n do
if a[i]>cm then cm:=a[i];
for i:=1 to n do
if b[i]<cn then cn:=b[i];
li:=cm+cn;
cn:=0;
for i:=1 to n do
if b[i]>cn then cn:=b[i];
cmm:=cn+cm;

repeat
p:=true;
if n>1 then
for i:=2 to n do
if a[i]>a[i-1] then begin
x:=a[i-1];
a[i-1]:=a[i];
a[i]:=x; p:=false; end;
until p=true;

repeat
p:=true;
if n>1 then
for i:=2 to n do
if b[i]>b[i-1] then begin
x:=b[i-1];
b[i-1]:=b[i];
b[i]:=x; p:=false; end;
until p=true;

for i:=1 to n do
if a[i]+b[i]=cmm then ncm:=ncm+1;

writeln(f2,li);
writeln(f2,cmm);
writeln(f2,ncm);
close(f1);
close(f2);
end.