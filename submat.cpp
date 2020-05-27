program submat;
type vector=array[1..1000] of longint;
var n,m,max,i,j,x:longint; c:vector; p:boolean;
f1,f2:text;
begin
assign(f1,'submat.in'); reset(f1);
assign(f2,'submat.out'); rewrite(f2);
readln(f1,n,m);

for i:=1 to n do         //formare vector
begin
for j:=1 to m do
begin
read(f1,x);
if x=0 then c[i]:=j;
end;
readln(f1);
end;

repeat                   //sortare
p:=false;
for i:=2 to n do
if (c[i]>c[i-1]) then
begin
p:=true;
x:=c[i];
c[i]:=c[i-1];
c[i-1]:=x;
end;
until p=false;

max:=0;                  //gasirea lui max
for i:=1 to n do
if i*c[i]>max then max:=i*c[i];

write(f2,max);
close(f1);
close(f2);
end.
