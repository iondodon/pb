program conturi;
var i,n,x,cm:longint;
nr:array [1..100] of longint;
f1,f2:text;
begin
assign(f1,'conturi.in');
assign(f2,'conturi.out');
reset(f1);
rewrite(f2);
readln(f1,n,x);
cm:=0;
for i:=1 to n do
begin
readln(f1,nr[i]);
if ((nr[i] div 10000) mod 10=1) and (nr[i] div 100000=x) then
begin
if nr[i] mod 10000>cm then cm:=nr[i] mod 10000;
end;
end;
writeln(f2,cm);
close(f1);
close(f2);
end.