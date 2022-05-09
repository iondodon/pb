program printesa;
type tabel1=array[1..100] of integer;
tabel2=array[1..10] of integer;
var h,k,i,j,g:integer; r:tabel2; s:tabel1; p:boolean;
f1,f2:text;
begin g:=0;
assign(f1,'printesa.in'); reset(f1);
assign(f2,'printesa.out'); rewrite(f2);
readln(f1,k); readln(f1,h);
if h>0 then
for i:=1 to h do readln(f1,r[i]);


if (k>1) and (h>0) then begin p:=false;
for i:=1 to h do if r[i]=2 then p:=true;
if p=false then begin g:=g+1; s[g]:=2; end; end;


if (k>1) and (h=0) then begin g:=g+1; s[g]:=2; end;

if g<>k then 
for i:=3 to 1000 do  begin
p:=false;
for j:=2 to (i div 2)+1 do
if i mod j=0 then begin p:=true; break; end;
if p=false then
if h>1 then for j:=1 to h do
if i=r[j] then begin p:=true; break; end;
if p=false then begin g:=g+1; s[g]:=i; end;
if g=k then break;
end;

for i:=g downto 1 do write(f2,s[i],' ');

close(f1);
close(f2);
end.