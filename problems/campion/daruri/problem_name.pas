program daruri;
var nl,nt,x,y,t,l:longint;
f1,f2:text;
begin
assign(f1,'daruri.in');
assign(f2,'daruri.out');
reset(f1);
rewrite(f2);
readln(f1,t,l);
x:=t; y:=l;
while x<>y do
if x<y then y:=y-x else x:=x-y;
nt:=t div x;
nl:=l div x;
if x=1 then writeln(f2,'0');
if x=1 then writeln(f2,'0',' ','0');
if x<>1 then
writeln(f2,x);
if x<>1 then writeln(f2,nt,' ',nl);
close(f1);
close(f2);
end.