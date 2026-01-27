program poly;
type tabel=array[0..502] of longint;
var n,i,j,x:longint; c:tabel;
f1,f2:text;


begin
assign(f1,'poly.in'); reset(f1);
assign(f2,'poly.out'); rewrite(f2);
readln(f1,n);
c[0]:=1;

for i:=1 to n do
for j:=0 to i-1 do
c[i]:=(c[i]+c[j]*c[i-j-1]) mod 30103;

write(f2,c[n]);
close(f1);
close(f2);
end.