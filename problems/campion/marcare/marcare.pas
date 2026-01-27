program marcare;
type tabel=array[1..300] of longint;
var k,n,s,i,j,p,l:longint;
f1,f2:text; nr:tabel; q:boolean;
begin
assign(f1,'marcare.in');
assign(f2,'marcare.out');
reset(f1);
rewrite(f2);
read(f1,n,s,k);
i:=s; j:=1; nr[1]:=s;
repeat
i:=i+k;
if i>n then i:=i-n;
if (i<=n) and (i<>s) then begin j:=j+1; nr[j]:=i; end;
if i=n then i:=0;
until i=s;
for i:=1 to j do
write(f2,nr[i],' ');
p:=0; l:=0;
repeat
l:=l+1;
q:=false;
for i:=1 to j do
if nr[i]=l then q:=true;
if q=false then p:=p+1;
until l=n;
writeln(f2);
write(f2,p);
close(f1);
close(f2);
end.