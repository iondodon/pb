program nice;
var n,i:longint;
f1,f2:text;

function putere(x:int64):int64;
var j,u:longint;
begin
putere:=1; j:=0; u:=3;
if x>0 then
repeat
j:=j+1;
putere:=putere*u;
until j=x;
if x=0 then putere:=1;
end;

begin
assign(f1,'nice.in'); reset(f1);
assign(f2,'nice.out'); rewrite(f2);
readln(f1,n);
for i:=0 to n-1 do
write(f2,putere(i),' ');
writeln(f2);
write(f2,((putere(n)-1) div 2)+1);
close(f1);
close(f2);
end.
