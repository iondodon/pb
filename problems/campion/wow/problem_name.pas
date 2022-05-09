program wow;
type matrice=array[0..101, 0..101] of longint;
verificare=array[0..101, 0..101] of longint;
coadax=array[1..100000] of longint;
coaday=array[1..100000] of longint;
aliantex=array[1..1500] of longint; aliantey=array[1..1500] of longint;
var li,co,m,i,j,a,b,u,g,cm,q,w,d,x,y:longint; v:verificare; l:matrice; xx:coadax; yy:coaday;
f1,f2:text; x1:aliantex; y1:aliantey; p:boolean;
begin cm:=999999;
assign(f1,'wow.in'); reset(f1);
assign(f2,'wow.out'); rewrite(f2);
readln(f1,li,co,m);
for i:=1 to li do begin
for j:=1 to co do  begin read(f1,l[i,j]);
if l[i,j]=1 then l[i,j]:=-1; v[i,j]:=l[i,j]; end; readln(f1); end;

for i:=1 to li do begin l[i,0]:=-1;     v[i,0]:=-1; end;
for i:=1 to li do begin l[i,co+1]:=-1;  v[i,co+1]:=-1; end;
for j:=1 to co do begin l[0,j]:=-1;     v[0,j]:=-1;  end;
for j:=1 to co do begin l[li+1,j]:=-1;  v[li+1,j]:=-1; end;

for i:=1 to m do readln(f1,x1[i],y1[i]);

for i:=1 to m do begin
a:=1; b:=1;
xx[a]:=x1[i]+1; yy[a]:=y1[i]+1;
v[x1[i]+1,y1[i]+1]:=1;
repeat
for j:=a to b do begin
x:=xx[j]; y:=yy[j];
if (v[x-1,y]=0) then begin v[x-1,y]:=v[x,y]+1; b:=b+1; xx[b]:=x-1; yy[b]:=y; end;
if (v[x,y+1]=0) then begin v[x,y+1]:=v[x,y]+1; b:=b+1; xx[b]:=x;   yy[b]:=y+1; end;
if (v[x+1,y]=0) then begin v[x+1,y]:=v[x,y]+1; b:=b+1; xx[b]:=x+1; yy[b]:=y; end;
if (v[x,y-1]=0) then begin v[x,y-1]:=v[x,y]+1; b:=b+1; xx[b]:=x;   yy[b]:=y-1; end;
end;
a:=j+1;
until a>b;

for u:=1 to b do xx[u]:=0; for u:=1 to b do yy[u]:=0;

for u:=1 to li do
for g:=1 to co do
if l[u,g]<>-1 then
l[u,g]:=l[u,g]+v[u,g];

if i=m then
for u:=1 to li do
for g:=1 to co do
if (l[u,g]<cm) and (l[u,g]<>-1) and (l[u,g]<>0) then cm:=l[u,g];

for u:=1 to li do
for g:=1 to co do
if v[u,g]<>-1 then v[u,g]:=0;
end;

p:=false;
for i:=1 to li do begin
for j:=1 to co do
if l[i,j]=cm then begin q:=i; w:=j; p:=true; break; end;
if p=true then break; end;


a:=1; b:=1;
xx[a]:=q; yy[a]:=w;
repeat
for j:=a to b do begin
x:=xx[j]; y:=yy[j];
if (v[x-1,y]=0) then begin v[x-1,y]:=v[x,y]+1; b:=b+1; xx[b]:=x-1; yy[b]:=y; end;
if (v[x,y+1]=0) then begin v[x,y+1]:=v[x,y]+1; b:=b+1; xx[b]:=x;   yy[b]:=y+1; end;
if (v[x+1,y]=0) then begin v[x+1,y]:=v[x,y]+1; b:=b+1; xx[b]:=x+1; yy[b]:=y; end;
if (v[x,y-1]=0) then begin v[x,y-1]:=v[x,y]+1; b:=b+1; xx[b]:=x;   yy[b]:=y-1; end;
end;
a:=j+1;
until a>b;

for i:=1 to m do
if (x1[i]+1<>q) or (y1[i]+1<>w) then 
d:=d+v[x1[i]+1,y1[i]+1];






writeln(f2,d);
writeln(f2,q-1,' ',w-1);

close(f1);
close(f2);
end.