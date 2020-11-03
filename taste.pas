program taste;
type tabelx=array[0..9] of longint;
tabely=array[0..9] of longint;
var o,i,o1,o2,cal,r,r1,r2,g:longint; x:tabelx; y:tabely;
f1,f2:text;


function Calorii(t1,t2:longint):longint;
begin
Calorii:=abs(x[t1]-x[t2])+abs(y[t1]-y[t2]);
end;

begin r:=99999;
assign(f1,'taste.in'); reset(f1);
assign(f2,'taste.out'); rewrite(f2);
for i:=0 to 9 do readln(f1,x[i],y[i]);
read(f1,o);
o1:=o div 100; g:=o mod 100;

repeat

if o1=24 then o1:=00;
o2:=g;
repeat

cal:=Calorii(o1 div 10,o1 mod 10)+Calorii(o1 mod 10,o2 div 10)+Calorii(o2 div 10, o2 mod 10);
if cal<r then begin r:=cal; r1:=o1; r2:=o2;  end;
o2:=o2+60; if o2=60 then o2:=00;
until (o2>=100) or (o2=0);
o1:=o1+24; if o1=24 then o1:=0;
until (o1>=100) or (o1=0);



writeln(f2,r);
if (r1<10) and (r1<>0) then write(f2,'0');
if r1=0 then write(f2,'0');
write(f2,r1);
if (r2<10) and (r2<>0) then write(f2,'0');
write(f2,r2);
if r2=0 then write(f2,'0');
close(f1);
close(f2);
end.
