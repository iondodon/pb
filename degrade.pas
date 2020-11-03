program degrade;
type tabel=array[1..100002] of longint;
var s,z:ansistring;
m:tabel;
i,j,l,g,u,l1,nl:longint;
f1,f2:text;
begin u:=0; l1:=0; nl:=0;
assign(f1,'degrade.in');
assign(f2,'degrade.out');
reset(f1);
rewrite(f2);
readln(f1,s);
readln(f1,z);
for i:=1 to length(s) do
for j:=1 to length(z) do
if s[i]=z[j] then begin u:=u+1; m[j]:=i;  end;
g:=2;
if u>1 then
for i:=g to u do
if ((m[i-1]<m[i]) or (m[i-1]=m[i])) and ((m[i]=m[i+1]) or (m[i]<m[i+1])) then  begin
l:=2; j:=i;
repeat
j:=j+1;
if (m[j]=m[j-1]) or (m[j]>m[j-1]) then l:=l+1;
until m[j]<m[j-1];
g:=j;
if l>l1 then begin l1:=l; nl:=1; end else
if l=l1 then nl:=nl+1;
end;
writeln(f2,l1,' ',nl);
close(f1);
close(f2);
end.
