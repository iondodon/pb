program foto;
var l:array[0..101, 0..101] of 0..10000;
n,m,i,j,x,y,w,r,a,b:integer; p,q:boolean;
rx:array[1..10000] of integer;
ry:array[1..10000] of integer;
f:text;
begin
assign(f,'foto.in'); reset(f);
readln(f,n,m);
for i:=1 to n do begin
for j:=1 to m do read(f,l[i,j]);
readln(f); end; close(f);

for i:=1 to n do l[i,0]:=2;
for i:=1 to n do l[i,m+1]:=2;
for j:=1 to m do l[0,j]:=2;
for j:=1 to m do l[i+1,j]:=2;

r:=0; a:=1; b:=0;
repeat
p:=false;
w:=0;

for i:=1 to n do  begin
for j:=1 to m do
if l[i,j]=0 then begin x:=i; y:=j; p:=true; break; end;
if p=true then break; end;

if p=true then begin
b:=b+1; rx[b]:=i; ry[b]:=j; l[rx[b],ry[b]]:=2;
repeat
q:=false;
for i:=a to b do begin
if (l[rx[i]-1,ry[i]]=0) then begin w:=w+1; l[rx[i]-1,ry[i]]:=2; b:=b+1; rx[b]:=rx[i]-1; ry[b]:=ry[i]; q:=true; end;
if (l[rx[i],ry[i]+1]=0) then begin w:=w+1; l[rx[i],ry[i]+1]:=2; b:=b+1; rx[b]:=rx[i]; ry[b]:=ry[i]+1; q:=true; end;
if (l[rx[i]+1,ry[i]]=0) then begin w:=w+1; l[rx[i]+1,ry[i]]:=2; b:=b+1; rx[b]:=rx[i]+1; ry[b]:=ry[i]; q:=true; end;
if (l[rx[i],ry[i]-1]=0) then begin w:=w+1; l[rx[i],ry[i]-1]:=2; b:=b+1; rx[b]:=rx[i]; ry[b]:=ry[i]-1; q:=true; end;
end; a:=i+1;
until q=false; end;


w:=w+1;
if w>r then r:=w;
until p=false;


assign(f,'foto.out'); rewrite(f);
write(f,r);
close(f);
end.
