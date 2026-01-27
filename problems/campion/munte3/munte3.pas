program munte3;
type tabel=array[1..100] of longint;
var t:tabel; i,j,n,nm,x,nsi:integer; p:boolean;
f1,f2:text;
begin
assign(f1,'munte3.in'); reset(f1);
assign(f2,'munte3.out'); rewrite(f2);
readln(f1,n);
for i:=1 to n do read(f1,t[i]);
nm:=0; nsi:=0;

for i:=2 to n-1 do
if (t[i]>t[i-1]) and (t[i]>t[i+1]) then nsi:=nsi+1;


repeat
p:=false;
for i:=2 to n-1 do
if (t[i]>t[i-1]) and (t[i]>t[i+1]) then begin nm:=nm+1; x:=i; p:=true; break; end;

for i:=x to n do t[i]:=t[i+1];
t[n]:=0;
n:=n-1;
until p=false;

writeln(f2,nsi);
writeln(f2,nm);
writeln(f2,n+1);

close(f1);
close(f2);
end.