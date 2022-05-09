program oneton;
var n,poz,rs:longint;
f1,f2:text;
begin
assign(f1,'oneton.in'); reset(f1);
assign(f2,'oneton.out'); rewrite(f2);
read(f1,n);
poz:=3; rs:=2; n:=n*2;

while poz<>n do
begin
rs:=rs+1;
if (poz<=n div 2) then begin poz:=poz*2; poz:=poz-1; end else
if poz=(n div 2)+1 then poz:=n else
begin poz:=poz-(n div 2+1); poz:=n-2*poz; end;
end;

write(f2,rs);
close(f1);
close(f2);
end.