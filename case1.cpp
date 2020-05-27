program case1;
var    ncc,i,nb,nf,g1,g2,g3,n,b,c,f:integer;
nc:array[1..50] of integer;
f1,f2:text;
begin
assign(f1,'case1.in');
assign(f2,'case1.out');
reset(f1);
rewrite(f2);
read(f1,n); g1:=0; g2:=0; g3:=0; nf:=0; ncc:=0; nb:=0;
for i:=1 to n do
begin
read(f1,nc[i]);
if nc[i] div 1000=1 then g1:=g1+1;
if nc[i] div 1000=2 then g2:=g2+1;
if nc[i] div 1000=3 then g3:=g3+1;
b:=(nc[i] mod 1000) div 100;
nb:=nb+b;
f:=(nc[i] mod 100) div 10;
nf:=nf+f;
c:=nc[i] mod 10;
ncc:=ncc+c;
end;

writeln(f2,g1);
writeln(f2,g2);
writeln(f2,g3);
writeln(f2,nb);
writeln(f2,nf);
writeln(f2,ncc);
close(f1);
close(f2);
end.
