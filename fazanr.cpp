program fazanr;
var n,g,p,i:longint;
nr:array[1..10000] of integer;
f1,f2:text;
begin
assign(f1,'fazanr.in');
assign(f2,'fazanr.out');
reset(f1);
rewrite(f2);
readln(f1,n);
g:=0;
for i:=1 to n do
read(f1,nr[i]);
begin
for i:=2 to n do begin
p:=nr[i];
while p>9 do
p:=p div 10;
if p<>(nr[i-1] mod 10) then g:=g+1;
end;
end;
write(f2,g);
close(f1);
close(f2);
end.

