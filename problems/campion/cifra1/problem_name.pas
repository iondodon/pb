program cifra1;
type tabel=array[1..100000] of longint;
var n,x,ci,i,m,j:longint;
nr:tabel;
s:string;
f1,f2:text;
begin
assign(f1,'cifra1.in');
assign(f2,'cifra1.out');
reset(f1);
rewrite(f2);
readln(f1,n,m);
str(n,s);
ci:=0;
for i:=1 to length(s) do begin
val(s[i],x);
ci:=ci+x;
if x<>0 then
for j:=ci-x+1 to ci do
nr[j]:=x;
end;
writeln(f2,nr[m]);
close(f1);
close(f2);
end.