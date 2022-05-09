program elfi;
type tabel=array[1..10000] of longint;
 multime=array[1..20000] of longint;

var n,c,p,i,j,cm:longint; t:tabel;
f1,f2:text; m:multime;          di:boolean;

begin
assign(f1,'elfi.in'); reset(f1);
assign(f2,'elfi.out'); rewrite(f2);
readln(f1,n);
di:=false;

for i:=1 to n do begin
readln(f1,c,p);
t[i]:=(c*2)+p+1; 
if (i<>1) and (t[i]<>t[i-1]) then di:=true;
end;

if di=true then begin
for i:=1 to n do
for j:=1 to 1000000 do begin
if t[i]*j<=14400 then m[t[i]*j]:=m[t[i]*j]+1 else break;
end;

cm:=0;
for i:=1 to 14400 do
if m[i]>cm then cm:=m[i];
write(f2,cm); end
else write(f2,n);


close(f1);
close(f2);
end.