program concurs3;
var h,n,o,s,v,o1,i,s1:integer;
ce:array[1..1000] of integer;
f1,f2:text;
begin
assign(f1,'concurs3.in');
assign(f2,'concurs3.out');
reset(f1);
rewrite(f2);
readln(f1,h);
readln(f1,n);
o:=h div 100;
s:=(h mod 100) div 10;
v:=0; o1:=0; s1:=0;
for i:=1 to n do begin
read(f1,ce[i]);
if ce[i]=h then v:=v+1;
if ce[i] div 100=o then o1:=o1+1;
if ((ce[i] mod 100) div 10=s) and (ce[i] div 100=o) then s1:=s1+1;
end;
if v=1 then writeln(f2,'DA');
if v=0 then writeln(f2,'NU');
writeln(f2,o1);
writeln(f2,s1);
close(f1);
close(f2);
end.