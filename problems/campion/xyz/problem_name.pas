program xyz;
var i,x,y,z,n:longint;
f1,f2:text;
begin
assign(f1,'xyz.in');
assign(f2,'xyz.out');
reset(f1);
rewrite(f2);
read(f1,x,y,z);
n:=x-1;
for i:=1 to n do
y:=y*10+z;
writeln(f2,y);
close(f1);
close(f2);
end.