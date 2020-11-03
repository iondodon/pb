program triplu;
var p,q,r,r1,rf:longint;
f1,f2:text;
begin
assign(f1,'triplu.in');
assign(f2,'triplu.out');
reset(f1);
rewrite(f2);
read(f1,p,q);
begin
if (q>=0) and (q<10) then r:=(p*10)+q;
if (q>9) and (q<100) then r:=(p*100)+q;
if (q>99) and (q<1000) then r:=(p*1000)+q;
if (q>999) and (q<10000) then r:=(p*10000)+q;
end;
begin
if (p>=0) and (p<10) then r1:=(q*10)+p;
if (p>9) and (p<100) then r1:=(q*100)+p;
if (p>99) and (p<1000) then r1:=(q*1000)+p;
if (p>999) and (p<10000) then r1:=(q*10000)+p;
end;
begin
if r>r1 then rf:=r*3;
if r1>r then rf:=r1*3;
if r=r1 then rf:=r*3;
if (p=q) and (p=0) then rf:=0;
end;
write(f2,rf);
close(f1);
close(f2);
end.


