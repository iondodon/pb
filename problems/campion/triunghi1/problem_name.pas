program triunghi;
var l,c,x,u,i:longint;
f1,f2:text;
begin
assign(f1,'triunghi1.in');
assign(f2,'triunghi1.out');
reset(f1);
rewrite(f2);
read(f1,l,c);
if l<=9 then begin
if l=1 then u:=1;
if l=2 then u:=3;
if l=3 then u:=6;
if l=4 then u:=1;
if l=5 then u:=6;
if l=6 then u:=3;
if l=7 then u:=1;
if l=8 then u:=9;
if l=9 then u:=9;
end;
if l>9 then begin
x:=l mod 9;
if x=1 then u:=1;
if x=2 then u:=3;
if x=3 then u:=6;
if x=4 then u:=1;
if x=5 then u:=6;
if x=6 then u:=3;
if x=7 then u:=1;
if x=8 then u:=9;
if x=0 then u:=9;
end;
i:=l+1; u:=u+1;
repeat
begin
i:=i-1;
U:=u-1;
if u=0 then u:=9;
end;
until i=c;
write(f2,u);
close(f1);
close(f2);
end.