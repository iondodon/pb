program interviu;
type tabel=array[1..100] of integer;
var n,i,j:integer; p:boolean;
f1,f2:text; nr:tabel;
begin
assign(f1,'interviu.in'); reset(f1);
assign(f2,'interviu.out'); rewrite(f2);
readln(f1,n);
for i:=1 to n do read(f1,nr[i]);
i:=3;
repeat
p:=true;
i:=i+1;
for j:=1 to i-1 do
if nr[j]>=nr[i] then p:=false;
until (p=true) or (i=n);
if i=n then write(f2,n);
if (i<>n) and (p=true) then write(f2,i);
close(f1);
close(f2);
end.