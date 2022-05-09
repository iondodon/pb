program flori2;
var n:longint;
f1,f2:text;

function fibonacci(n:longint):longint;
var a,b,c,x:longint;
begin
a:=1;
b:=1;
x:=2;
repeat
c:=(a+b) mod 9001;
a:=b;
b:=c;
x:=x+1;
until x=n;
fibonacci:=b-1;
end;

begin
assign(f1,'flori2.in'); reset(f1);
assign(f2,'flori2.out'); rewrite(f2);
read(f1,n);
writeln(f2,fibonacci(n+2));
close(f1);
close(f2);
end.