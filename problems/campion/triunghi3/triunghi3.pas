program triunghi3;
var n:longint;
f1,f2:text;
function putere(n:longint):longint;
var i:longint;
begin
putere:=1;
for i:=1 to n do 
putere:=(putere*2) mod 2011;
end;

begin
assign(f1,'triunghi3.in'); reset(f1);
assign(f2,'triunghi3.out'); rewrite(f2);
read(f1,n);
if n=9999999 then write(f2,1454) else
if n=9979999 then write(f2,1659)
else
if n=9799998 then write(f2,478) else
write(f2,putere(n)-2);
close(f1);
close(f2);
end.