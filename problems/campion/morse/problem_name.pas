program morse;
type tabel=array[1..3000] of string;
var a,b,i,n,j,l,u,cm:integer;
f1,f2:text; cod:tabel;
begin u:=0; cm:=0;
assign(f1,'morse.in'); reset(f1);
assign(f2,'morse.out'); rewrite(f2);
read(f1,a,b);
for i:=a to b do begin
n:=i; u:=u+1;
repeat
if n mod 2=1 then cod[u]:='-'+cod[u];
if n mod 2=0 then cod[u]:='.'+cod[u];
n:=n div 2;
until n=0; end;
for i:=1 to u do begin
l:=0; 
for j:=1 to length(cod[i]) do
if cod[i][j]='-' then l:=l+1;
if l>cm then cm:=l;
end;
for i:=1 to u do begin
l:=0; 
for j:=1 to length(cod[i]) do
if cod[i][j]='-' then l:=l+1;
if l=cm then begin write(f2,cod[i],' '); end;
end;
close(f1);
close(f2);
end.