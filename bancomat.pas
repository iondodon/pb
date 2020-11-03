program bancomat;
var s,i,n:longint;
nr:array[1..1000] of longint;
f1,f2:text;
begin
assign(f1,'bancomat.in');
assign(f2,'bancomat.out');
reset(f1);
rewrite(f2);
readln(f1,s);
readln(f1,n);
for i:=1 to n do
readln(f1,nr[i]);
for i:=1 to n do
begin
if nr[i] mod 10=2 then s:=s+(nr[i] div 10);
if nr[i] mod 10=3 then
begin
if s>nr[i] div 10 then s:=s-(nr[i] div 10);
end;
end;
write(f2,s);
close(f1);
close(f2);
end.

