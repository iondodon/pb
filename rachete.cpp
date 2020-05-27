program rachete;
type tabel=array[1..60000] of longint;
var i,n:longint;
nr:tabel;
f1,f2:text;
begin
assign(f1,'rachete.in');
assign(f2,'rachete.out');
reset(f1);
rewrite(f2);
readln(f1,n);
for i:=1 to n do
read(f1,nr[i]);
for i:=1 to n do
if nr[i]=1 then write(f2,nr[i],' ');
for i:=1 to n do
if nr[i]=2 then write(f2,nr[i],' ');
for i:=1 to n do
if nr[i]=3 then write(f2,nr[i],' ');
close(f1);
close(f2);
end.
