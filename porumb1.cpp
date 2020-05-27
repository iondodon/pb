program porumb1;

var n,x,nu,a,i,u:longint; 
f1,f2:text;

function putere(u:longint):longint;
var i:longint;
begin
putere:=1;
for i:=1 to u do
putere:=putere*2;
end;

begin
assign(f1,'porumb1.in'); reset(f1);
assign(f2,'porumb1.out'); rewrite(f2);
read(f1,n,x);
writeln(f2,(n+1) div 2);
a:=n; i:=0;
repeat
a:=a div 2;
i:=i+1;
until a=0;
writeln(f2,i);

if x mod 2<>0 then writeln(f2,1) else begin
u:=1;
while (x div putere(u)<>0) and (x mod putere(u)=0) do
u:=u+1;

writeln(f2,u);
end;

nu:=1;
for i:=1 to i do
nu:=nu*2;
write(f2,nu div 2);
close(f1);
close(f2);
end.
