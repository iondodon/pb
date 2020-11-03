program cladire;
type matrice=array[-1..1005, -1..1005] of longint;
var l:matrice; i,j,cm,m,n,k,s:longint;
f1,f2:text;  s1,x,y:longint;
begin cm:=0;
assign(f1,'cladire.in'); reset(f1);
assign(f2,'cladire.out'); rewrite(f2);
readln(f1,m,n);
readln(f1,k);
for i:=1 to k do begin readln(f1,x,y); l[x,y]:=-1; end;
for i:=1 to m do
for j:=1 to n do 
if l[i,j]<>-1 then begin
begin
s1:=10000000;
if l[i-1,j]<>-1 then s:=l[i-1,j]+1 else s:=1;
if s<s1 then s1:=s;
if l[i,j-1]<>-1 then s:=l[i,j-1]+1 else s:=1;
if s<s1 then s1:=s;
if l[i-1,j-1]<>-1 then s:=l[i-1,j-1]+1 else  s:=1;
if s<s1 then s1:=s;
end;
l[i,j]:=s1;
if s1>cm then cm:=s1;
end;
writeln(f2,cm);
close(f1);
close(f2);
end.

