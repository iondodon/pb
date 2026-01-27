program pion; uses math;
type
 matrice =array[1..201, 1..201] of integer;
var m,n,i,j:integer; l:matrice;
f1,f2:text;

begin
assign(f1,'pion.in'); reset(f1);
assign(f2,'pion.out'); rewrite(f2);
readln(f1,m,n);

for i:=1 to n do read(f1,l[m+1,i]);
for i:=1 to m do read(f1,l[i,n+1]);

for i:=m downto 1 do
for j:=n downto 1 do
if (i+j) mod 2=0 then l[i,j]:=Max(l[i+1,j],l[i,j+1])
else l[i,j]:=Min(l[i+1,j],l[i,j+1]);



write(f2,l[1,1]);
close(f1);
close(f2);
end.