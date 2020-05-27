program pegals;
var n:longint;
f1,f2:text;
begin
assign(f1,'pegals.in'); reset(f1);
assign(f2,'pegals.out'); rewrite(f2);
read(f1,n);
writeln(f2,3);
write(f2,1,' ');
if n mod 2<>0 then
write(f2,(n-1) div 2,' ',n-1)
else
write(f2,(n div 2)-1,' ',n);
close(f1);
close(f2);
end.
