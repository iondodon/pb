program petrol;
type tabel=array[1..100] of real;
var e,d,max:real; i,j,n:longint;  x,y:tabel;
f1,f2:text;
begin
assign(f1,'petrol.in'); reset(f1);
assign(f2,'petrol.out'); rewrite(f2);
readln(f1,n,e,d);
for i:=1 to n do 
readln(f1,x[i],y[i]);

max:=0;
if n<>1 then 
for i:=1 to n do
for j:=1 to n do 
if i<>j then 
if (e/x[i]+d/y[j])>max then
max:=(e/x[i]+d/y[j]);

if n=1 then 
if (e/x[1])>(d/y[1]) then 
max:=e/x[1] else
max:=d/y[1];

writeln(f2,max:0:3);
close(f1);
close(f2);
end.