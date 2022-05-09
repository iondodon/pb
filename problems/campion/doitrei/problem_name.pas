program doitrei;
var n:int64; i:longint;
f1,f2:text;
begin
assign(f1,'doitrei.in'); reset(f1);
assign(f2,'doitrei.out'); rewrite(f2);
read(f1,n);
if n=2 then write(f2,'529');

if n>2 then begin
write(f2,'5');
for i:=1 to n-2 do write(f2,'4');
write(f2,'2');
for i:=1 to n-2 do write(f2,'8');
write(f2,'9')
end;

close(f1);
close(f2);
end.