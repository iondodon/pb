program pincode;
var p,k,nr,q,s,divv,i:longint;
f1,f2:text;
begin
assign(f1,'pin.in');
assign(f2,'pin.out');
reset(f1);
rewrite(f2);
read(f1,p,k);
nr:=10001;
repeat
divv:=10000;
nr:=nr-2; q:=0; s:=0;
repeat
divv:=divv div 10;
if ((nr div divv) mod 10=p) or ((nr div divv) mod 10=k) then
s:=s+1;
until divv=1;
if s=0 then
for i:=2 to (nr div 2) do
if nr mod i=0 then q:=q+1;
until (q=0) and (s=0);
write(f2,nr);
close(f1);
close(f2);
end.
