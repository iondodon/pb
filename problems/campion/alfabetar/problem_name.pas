program alfabetar;
type matrice1=array[1..100] of string;
matrice2=array[1..300, 1..300] of char;
var n,i,j,cm:integer; s:matrice1; c:matrice2;
f1,f2:text;
begin cm:=0;
assign(f1,'alfabetar.in'); reset(f1);
assign(f2,'alfabetar.out'); rewrite(f2);
readln(f1,n);
for i:=1 to n do begin readln(f1,s[i]); if length(s[i])>cm then cm:=length(s[i]); end;

for j:=1 to n do
for i:=cm downto 1 do c[i,j]:=s[j][i];

for i:=cm downto 1 do begin
for j:=1 to n do
if (ord(c[i,j])>=48) and  (ord(c[i,j])<123) then write(f2,c[i,j]) else write(f2,' ');
writeln(f2); end;

close(f1);
close(f2);
end.