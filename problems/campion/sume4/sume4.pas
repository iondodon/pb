program sume4;
var na,nm,n,na1,nm1,i:longint;
nr:array[1..99999] of longint;
f1,f2:text;
begin  na:=0; nm:=0; na1:=0; nm1:=0;
assign(f1,'sume4.in');
assign(f2,'sume4.out');
reset(f1);
rewrite(f2);
readln(f1,n);
for i:=1 to n do
begin
read(f1,nr[i]);
if (nr[i] div 1000)<(nr[i] mod 100) then na:=na+((nr[i] mod 1000) div 100);
if (nr[i] div 1000)>(nr[i] mod 100) then nm:=nm+((nr[i] mod 1000) div 100);
na:=na+(nr[i] div 1000);
nm:=nm+(nr[i] mod 100);
end;
write(f2,na,' ',nm);
close(f1);
close(f2);
end.