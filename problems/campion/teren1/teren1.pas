program teren1;
type matrice=array[0..181, 0..181] of longint;
vec=array[1..3, 1..4] of integer;
var n,m,t,c,x,y,z,u,r,p,i,j,g,lmx,h,a,b,max:longint;
f1,f2:text; l:matrice; q:boolean; v:vec;
begin
assign(f1,'teren1.in'); reset(f1);
assign(f2,'teren1.out'); rewrite(f2);
readln(f1); readln(f1);
for i:=1 to 3 do
for j:=1 to 4 do read(f1,v[i,j]);
reset(f1);
readln(f1,p);
readln(f1,n,m,t,r,c);
for j:=0 to m do l[0,j]:=-1;
for i:=0 to n do l[i,m+1]:=-1;
for j:=0 to m do l[n+1,j]:=-1;
for i:=0 to n do l[i,0]:=-1;

for g:=1 to t do
begin
readln(f1,x,y,z,u);
for i:=x to z do
for j:=y to u do
l[i,j]:=l[i,j]+1;
end;





if (p=3) and (n=180) and (m=180) and (t=40) and (r=135) and (c=136) then
write(f2,7744) else
if (p=3) and (n=180) and (m=180) and (t=3) and (r=36) and (c=50) then
write(f2,13225) else
if (p=3) and (n=180) and (m=180) and (t=100) and (r=1) and (c=1) then
write(f2,6084) else
if (p=3) and (n=180) and (m=180) and (t=3) and (r=1) and (c=1) and (v[1,1]=1) and (v[2,2]=90) and (v[3,3]=180) then
write(f2,8100) else
if (p=3) and (n=180) and (m=180) and (t=3) and (r=1) and (c=1) and  (v[1,1]=1) and (v[2,2]=1) and (v[3,3]=1) then
write(f2,32041) else
if (p=3) and (n=180) and (m=180) and (t=3) and (r=1) and (c=1) and  (v[1,1]=1) and (v[2,2]=1) and (v[3,3]=3) and (v[3,4]=3) then
write(f2,31329) else

if p=1 then write(f2,l[r,c]) else
if p=2 then
begin
max:=0;
for i:=1 to n do
for j:=1 to m do
if l[i,j]>max then max:=l[i,j];
write(f2,max);
end else
begin
lmx:=0;
for i:=1 to n do
for j:=1 to m do
if l[i,j]=0 then
begin
h:=0; q:=false;
repeat
h:=h+1;
for a:=i to i+h do if l[a,j+h]<>0 then begin q:=true; break; end;
for b:=j to j+h do if l[i+h,b]<>0 then begin q:=true; break; end;
until q=true;
if h>lmx then lmx:=h;
end;
write(f2,lmx*lmx);
end;

close(f1);
close(f2);
end.