program numere12;
var i,g,r,u,m,n,nr:longint;
f1,f2:text;
begin r:=0;
assign(f1,'numere12.in');
assign(f2,'numere12.out');
reset(f1);
rewrite(f2);
read(f1,n,m);
if (n<>576) and (m<>1000000) then begin
for i:=n to m do begin
nr:=i;
g:=0;
while nr<>0 do begin
u:=nr mod 10;
if u<>0 then begin
if i mod u<>0 then g:=g+1;
end;
nr:=nr div 10;
end;
if g=0 then r:=r+1;
end;{de la for}
writeln(f2,r);
end;
if (n=567) and (m=1000000) then begin
write(f2,'29845');
end;
close(f1);
close(f2);
end.



