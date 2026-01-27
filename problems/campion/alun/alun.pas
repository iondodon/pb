program alun;
var n1,n2,x,k,y,d,s:longint;
f1,f2:text;
begin
assign(f1,'alun.in'); reset(f1);
assign(f2,'alun.out'); rewrite(f2);
read(f1,n1,n2,x,k,y);

d:=0; s:=0;
repeat
d:=d+1;
if d mod 2=1 then s:=s+n1
else s:=s+n2;
until d=x div 2;

s:=s-(x div k); writeln(f2,s);

d:=0; s:=0;
repeat
d:=d+1;
if d mod 2=1 then s:=s+n1
else s:=s+n2;
until s>=y;

write(f2,d*2);

close(f1);
close(f2);
end.