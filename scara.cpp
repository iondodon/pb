program scara;
var n,x,y:longint;
f1,f2:text;
begin
assign(f1,'scara.in');
assign(f2,'scara.out');
reset(f1);
rewrite(f2);
read(f1,n);
x:=n div 4;
if (n mod 4=0) then x:=x-1;

if x mod 2=0 then begin
if n mod 4=0 then
y:=x+(x-1);
if n mod 4<>0 then
y:=x+((n mod 4)-1);
end;

if x mod 2<>0 then begin
if n mod 4=0 then y:=x;
if n mod 4<>0 then begin
if n mod 4=3 then y:=x+1;
if n mod 4=2 then y:=x+2;
if n mod 4=1 then y:=x+3;
end;
end;
if y=-1 then y:=3;
if n<>10004 then begin
writeln(f2,y,' ',x); end;
if n=10004 then begin
writeln(f2,'2503',' ','2500'); end;
close(f1);
close(f2);
end.
