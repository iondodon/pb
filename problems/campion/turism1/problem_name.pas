program turism1;
type
tabel=array[1..100] of longint;
var n,k,m,i,j,u,l,suma,ss,nr,tur:longint; t:tabel;
f1,f2:text; p:boolean;
begin
assign(f1,'turism1.in'); reset(f1);
assign(f2,'turism1.out'); rewrite(f2);
readln(f1,n,k,m);

suma:=0; ss:=0;
for i:=1 to m do
begin
read(f1,nr); ss:=ss+1;
for j:=1 to nr do
begin
read(f1,u);
for l:=1 to k do
if t[l]=0 then begin t[l]:=u; break; end;
end;
readln(f1);
for l:=1 to k do
if t[l]<>0 then begin t[l]:=t[l]-1; suma:=suma+1; end;
end;

repeat
p:=true;
ss:=ss+1;
for i:=1 to k do
if t[i]<>0 then
begin t[i]:=t[i]-1; p:=false; suma:=suma+1; end;
until p=true;

if ss mod n=0 then tur:=ss div n else tur:=(ss div n)+1;

write(f2,suma,' ',tur);
close(f1);
close(f2);
end.