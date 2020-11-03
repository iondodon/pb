program grupe;
var n,r:int64;
f1,f2:text;
function fib(x:int64):int64;
var a,b,c,ii:int64;
begin
a:=1; b:=0; ii:=0;
repeat
ii:=ii+1;
c:=a+b;
a:=b; b:=c;
until ii=x;
fib:=b;
end;

begin
assign(f1,'grupe.in'); reset(f1);
assign(f2,'grupe.out'); rewrite(f2);
read(f1,n);
r:=fib(n+2);

write(f2,r-1);
close(f1);
close(f2);
end.
