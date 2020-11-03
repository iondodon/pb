program joc17;
type matrice=array[1..110, 1..110] of char;
var n,m,i,j,s:longint; p:boolean;
f1,f2:text; l:matrice;
begin
assign(f1,'joc17.in'); reset(f1);
assign(f2,'joc17.out'); rewrite(f2);
readln(f1,n,m);
for i:=1 to n do begin
for j:=1 to m do read(f1,l[i,j]);
readln(f1); end;

s:=0;
for i:=1 to n do begin
for j:=1 to m do
if l[i,j]='1' then begin

if (l[i+1,j]='1') and (l[i+2,j]='1') and (l[i+2,j+1]='1') and (l[i+2,j+2]='1') then s:=s+1;
if (l[i+1,j]='1') and (l[i+2,j]='1') and (l[i,j+1]='1') and (l[i,j+2]='1') then s:=s+1;
if (l[i,j+1]='1') and (l[i,j+2]='1') and (l[i+1,j+2]='1') and (l[i+2,j+2]='1') then s:=s+1;
if (l[i+1,j]='1') and (l[i+2,j]='1') and (l[i+2,j-1]='1') and (l[i+2,j-2]='1') then s:=s+1;

if (l[i+1,j]='1') and (l[i+2,j]='1') and (l[i+1,j+1]='1') and (l[i+1,j+2]='1') then s:=s+1;
if (l[i,j+1]='1') and (l[i,j+2]='1') and (l[i+1,j+1]='1') and (l[i+2,j+1]='1') then s:=s+1;
if (l[i+1,j]='1') and (l[i+2,j]='1') and (l[i+1,j-1]='1') and (l[i+1,j-2]='1') then s:=s+1;
if (l[i+1,j]='1') and (l[i+2,j]='1') and (l[i+2,j-1]='1') and (l[i+2,j+1]='1') then s:=s+1;

if (l[i+1,j]='1') and (l[i+1,j-1]='1') and (l[i,j+1]='1') and (l[i+2,j]='1') then s:=s+1;
if (l[i+1,j-1]='1') and (l[i+1,j]='1') and (l[i+1,j+1]='1') and (l[i+2,j+1]='1') then s:=s+1;
if (l[i+2,j-1]='1') and (l[i+2,j]='1') and (l[i+1,j]='1') and (l[i+1,j+1]='1') then s:=s+1;
if (l[i+1,j]='1') and (l[i+1,j+1]='1') and (l[i+1,j+2]='1') and (l[i+2,j+1]='1') then s:=s+1;

end;
end;

write(f2,s);
close(f1);
close(f2);
end.
