program tema;
type tabel1=array[1..100] of integer;
tabel2=array[1..100] of integer;
var n,m,i,j,g,aux:integer; t:tabel1; nr:tabel2;
f1,f2:text; p:boolean;
begin g:=0;
assign(f1,'tema.in'); reset(f1);
assign(f2,'tema.out'); rewrite(f2);
readln(f1,n); readln(f1,m);
for i:=1 to m do read(f1,t[i]);

for i:=1 to n do begin
p:=false;
for j:=1 to m do if i=t[j] then p:=true;
if p=false then begin inc(g); nr[g]:=i; end;
end;

if g=1 then begin write(f2,nr[1]); end;

if g>1 then
repeat
p:=false;
for i:=2 to g do
if nr[g]<nr[g-1] then begin
p:=true;
aux:=nr[g];
nr[g]:=nr[g-1];
nr[g-1]:=aux; end;
until p=false;

if g>1 then
for i:=1 to g do write(f2,nr[i],' ');

close(f1);
close(f2);
end.
