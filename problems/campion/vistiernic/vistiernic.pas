program vistiernic;
var n,x,p2,p5,i:longint;
f1,f2:text;
begin
assign(f1,'vistiernic.in'); reset(f1);
assign(f2,'vistiernic.out'); rewrite(f2);
readln(f1,n);

p2:=0; p5:=0;
for i:=1 to n do begin
read(f1,x);
while x mod 2=0 do begin x:=x div 2; p2:=p2+1; end;
while x mod 5=0 do begin x:=x div 5; p5:=p5+1; end;
end;


write(f2,(p2+p5-(p2-p5)) div 2);
close(f1);
close(f2);
end.