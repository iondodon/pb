program jump;
type tabel=array[1..1000] of longint;
var n,i,u:longint; t:tabel;
f1,f2:text;

begin
assign(f1,'jump.in'); reset(f1);
assign(f2,'jump.out'); rewrite(f2);
read(f1,n);
t[1]:=1; t[2]:=2; t[3]:=4;
if n>3 then begin
u:=3;
repeat
u:=u+1;
t[u]:=(t[u-1]+t[u-2]+t[u-3]) mod 666013;
until u=n;
end;
write(f2,t[n]);
close(f1);
close(f2);
end.