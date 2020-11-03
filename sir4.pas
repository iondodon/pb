program sir4;
type tabel=array[1..20000] of longint;
	 fregventa=array[0..99] of longint;
var k,i,l,j:longint; a:tabel; fr:fregventa;
f1,f2:text;
begin
assign(f1,'sir4.in'); reset(f1);
assign(f2,'sir4.out'); rewrite(f2);
read(f1,k);
a[1]:=((k*k) mod 1000) div 10; inc(fr[a[1]]);

for i:=2 to 10000000 do
begin
a[i]:=((a[i-1]*a[i-1]) mod 1000) div 10;
inc(fr[a[i]]);
if fr[a[i]]>1 then break;
end;
l:=i-1;
for i:=1 to l do
write(f2,a[i],' ');
writeln(f2);

for j:=0 to 9 do
for i:=1 to l do
if a[i] div 10=0 then begin 
if a[i] mod 10=j then write(f2,a[i],' ');
end else
if a[i] div 10=j then write(f2,a[i],' ');

close(f1);
close(f2);
end.
