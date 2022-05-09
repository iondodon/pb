program fibo1;
var n:longint;
f1,f2:text;

function fibo(n:longint):qword;
var a,b,c:qword;    j:longint;
begin
a:=1; b:=1; j:=2;
repeat
j:=j+1;
c:=(a+b) mod 46337;
a:=b mod 46337; b:=c mod 46337;
until j=n;
fibo:=c;
end;

begin
assign(f1,'fibo1.in'); reset(f1);
assign(f2,'fibo1.out'); rewrite(f2);
read(f1,n);

if n mod 2=0 then begin
writeln(f2,'0');
writeln(f2,(n div 2)-1,' ',(n div 2)+1);
writeln(f2,fibo(n div 2-1));
writeln(f2,fibo((n div 2)+1));
writeln(f2,fibo(n)); end;

if n mod 2<>0 then begin
writeln(f2,'1');
writeln(f2,(n div 2),' ',(n div 2)+1);
writeln(f2,fibo(n div 2));
writeln(f2,fibo((n div 2)+1));
writeln(f2,fibo(n)); end;



close(f1);
close(f2);
end.