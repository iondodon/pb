program barca;
var m,i,n:longint;
f1,f2:text;
begin
assign(f1,'barca.in');
assign(f2,'barca.out');
reset(f1);
rewrite(f2);
read(f1,n);
m:=4*n;
writeln(f2,m);
for i:=1 to n do
begin
writeln(f2,'IG');
writeln(f2,'I');
writeln(f2,i);
writeln(f2,'G');
end;
close(f1);
close(f2);
end.

end.

