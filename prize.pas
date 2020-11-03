program prize;
type tabel=array[1..1000] of longint;
var n,i:longint; s:int64;
f1,f2:text;
np:tabel;
begin   s:=0;
assign(f1,'prize.in');
assign(f2,'prize.out');
reset(f1);
rewrite(f2);
readln(f1,n);
for i:=1 to n do readln(f1,np[i]);
if n>2 then
for i:=1 to n-1 do
s:=s+(np[i]-1);
s:=s+np[n];
writeln(f2,s);
close(f1);
close(f2);
end.
