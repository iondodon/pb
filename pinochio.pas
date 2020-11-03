program pinochio;
var ns,n,p,zr,z,i:longint;
f1,f2:text;
begin
assign(f1,'pinochio.in');
assign(f2,'pinochio.out');
reset(f1);
rewrite(f2);
readln(f1,n,p,z);
ns:=0;
for i:=1 to z do
begin
n:=n+p;
if i mod 7=0 then begin
n:=(n-(2*p))-2; ns:=ns+1; end;
end;
zr:=z-(ns*7);
if zr=6 then n:=n-p-1;
write(f2,n);
close(f1);
close(f2);
end.