program vapoare;
var x,y,z1,z2,r,a,b:int64;
f1,f2:text;
begin
assign(f1,'vapoare.in'); reset(f1);
assign(f2,'vapoare.out'); rewrite(f2);
readln(f1,x,y); read(f1,z1,z2);

x:=(x*7)*2+z1; y:=(y*7)*2+z2;

a:=x; b:=y;
repeat
r:=a mod b;
a:=b;
b:=r;
until r=0;

write(f2,(x*y) div a);

close(f1);
close(f2);
end.