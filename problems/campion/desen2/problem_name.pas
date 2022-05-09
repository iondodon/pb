program desen2;
var  m,n,l,num,x,y,r:longint;
f1,f2:text;
begin
assign(f1,'desen2.in');
assign(f2,'desen2.out');
reset(f1);
rewrite(f2);
read(f1,m,n);

begin
x:=n; y:=m;
repeat
r:=x mod y;
x:=y;
y:=r;
until r=0;
l:=(m*n) div x;
num:=(l div m)*(l div n);
end;
writeln(f2,l);
writeln(f2,num);
close(f1);
close(f2);
end.