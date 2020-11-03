program tort;
var n,m,x,y,nmin:longint;
f1,f2:text;
begin
assign(f1,'tort.in');
assign(f2,'tort.out');
reset(f1);
rewrite(f2);
readln(f1,m,n);
if (m-n=1) or (n-m=1) then x:=1
else begin x:=m; y:=n;
while x<>y do
if x<y then y:=y-x else x:=x-y;
end;
nmin:=(m div x)*(n div x);
write(f2,nmin,' ',x);
close(f1);
close(f2);
end.
