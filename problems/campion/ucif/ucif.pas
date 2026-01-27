program ucif;
var n,i,j,us,up:integer; 
f1,f2:text;
begin  
assign(f1,'ucif.in'); reset(f1);
assign(f2,'ucif.out'); rewrite(f2);
read(f1,n);
us:=0;
for i:=1 to n do
begin
up:=1;
for j:=1 to i do
up:= up*i mod 10;
us:=(us+up) mod 10;
end;
write(f2,us);
close(f1);
close(f2);
end.