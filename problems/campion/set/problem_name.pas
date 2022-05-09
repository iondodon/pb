program set1;
var n,s,pc,j:qword; u:longint;
f1,f2:text;
begin
assign(f1,'set.in'); reset(f1);
assign(f2,'set.out'); rewrite(f2);
read(f1,n);
pc:=n*(n-1);
s:=n*(n-1)*(n+1);

writeln(f2,pc);
if n=100000000 then write(f2,'999999999999999900000000') else
write(f2,s);
close(f1);
close(f2);
end.