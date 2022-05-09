program aliniere;
var a,b,n,r,k,c:longint;
f1,f2:text;

begin
assign(f1,'aliniere.in'); reset(f1);
assign(f2,'aliniere.out'); rewrite(f2);
read(f1,n);

a:=1; b:=2; k:=2;
repeat
k:=k+1;
c:=(a+b) mod 9973;
a:=b;
b:=c;
until k=n;

write(f2,b);
close(f1);
close(f2);
end.