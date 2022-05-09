program criptmat;
type tabel=array[1..100, 1..100] of string;
var n,i,u,j:integer;
ce:tabel;
s:string; f1,f2:text;
begin
assign(f1,'criptmat.in');
assign(f2,'criptmat.out');
reset(f1);
rewrite(f2);
readln(f1,n);
readln(f1,s);
i:=1;  u:=0;
repeat
j:=0;
repeat
j:=j+1;
u:=u+1;
ce[i,j]:=s[u];
until j=n;
u:=u+n;
i:=i+2;
until i>length(s) div n;
i:=2;  u:=n;
repeat
j:=n+1;
repeat
j:=j-1;
u:=u+1;
ce[i,j]:=s[u];
until j=1;
u:=u+n;
i:=i+2;
until i>length(s) div n;
for j:=1 to n do
for i:=1 to (length(s) div n) do
write(f2,ce[i,j]);
close(f1);
close(f2);
end.