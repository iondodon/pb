program figura;
type matrice=array[-1..20, -1..20] of integer;
tabel=array[1..100] of integer;
var n,d,i,j,l,p:integer;
f1,f2:text; u,g:tabel;
ce:matrice;
begin
assign(f1,'figura.in'); reset(f1);
assign(f2,'figura.out'); rewrite(f2);
readln(f1,d);
readln(f1,n);
for i:=1 to n do readln(f1,u[i],g[i]);
for i:=1 to d do
for j:=1 to d do begin
for l:=1 to n do
if (u[l]=i) and (g[l]=j) then ce[i,j]:=9;
end;
p:=0;
for i:=1 to n do begin
if ce[u[i],g[i]-1]<>9 then p:=p+1;
if ce[u[i]-1,g[i]]<>9 then p:=p+1;
if ce[u[i],g[i]+1]<>9 then p:=p+1;
if ce[u[i]+1,g[i]]<>9 then p:=p+1; end;
write(f2,p);
close(f1);
close(f2);
end.