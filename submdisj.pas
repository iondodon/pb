program submdisj;
type matrice=array[1..200, 1..200] of longint;
var n,i,j,a,s,b:longint; m:matrice;
f1,f2:text;
begin
assign(f1,'submdisj.in'); reset(f1);
assign(f2,'submdisj.out'); rewrite(f2);
read(f1,n);
a:=0; s:=sqr(n);
for i:=1 to (2*n)-1 do
for j:=1 to n do begin
inc(a); if a<=s then m[i,j]:=a else begin m[i,j]:=1; a:=1; end;
end;

for i:=1 to n do begin
a:=i; b:=1;
for j:=1 to n do begin
write(f2,m[a,b],' ');
a:=a+1; b:=b+1;
end;
writeln(f2);
end;

close(f1);
close(f2);
end.
