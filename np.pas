program np;
type tabel=array[0..100] of integer;
var n,l,r,u,i:longint;
f1,f2:text; t:tabel;

function putere(x:longint):longint;
var j:longint;
begin
if x=0 then putere:=1 else begin
putere:=1;
for j:=1 to x do
putere:=putere*3;
end;
end;



begin
assign(f1,'np.in'); reset(f1);
assign(f2,'np.out'); rewrite(f2);
read(f1,n); l:=-1; u:=n;
repeat
l:=l+1;
t[l]:=u mod 2;
u:=u div 2;
until u=0;
r:=0;
for i:=0 to l do
if t[i]=1 then  r:=r+putere(i);

write(f2,r);
close(f1);
close(f2);
end.
