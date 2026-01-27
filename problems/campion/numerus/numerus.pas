program numerus;
var k,n,i:longint;
f1,f2:text;
begin
assign(f1,'numerus.in');
assign(f2,'numerus.out');
reset(f1);
rewrite(f2);
read(f1,k,n);
begin
if (k mod 2<>0) then begin
for i:=((k-1)*5)+1 to (k*5) do
write(f2,i,' ');
writeln(f2,k*5);
end; end;
begin
if (k mod 2=0) then begin
write(f2,k*5);
for i:=(k*5) downto ((k-1)*5)+2 do
write(f2,' ',i);
writeln(f2,' ',((k-1)*5)+1);
end;
end;
begin
if (n mod 10<>5) and (n mod 10<>0) then begin
if (n mod 10>=1) and (n mod 10<=4) then writeln(f2,(n div 5)+1);
if (n mod 10>=6) and (n mod 10<=9) then writeln(f2,(n div 5)+1);
end;
if (n mod 10=0) or (n mod 10=5) then writeln(f2,n div 5);
end;
begin
if (n mod 10=1) then writeln(f2,'A');
if (n mod 10=2) then writeln(f2,'B');
if (n mod 10=3) or (n mod 10=9) then writeln(f2,'C');
if (n mod 10=4) or (n mod 10=8) then writeln(f2,'D');
if (n mod 10=5) then writeln(f2,'E',' ','F');
if (n mod 10=7) then writeln(f2,'E');
if (n mod 10=6) then writeln(f2,'F');
if (n mod 10=0) then writeln(f2,'A',' ','B');
end;
close(f1);
close(f2);
end.