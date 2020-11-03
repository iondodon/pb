program renju;
type matrice=array[-25..25, -25..25] of integer;

var i,j,aux,u,h,x,y:integer; p,q:boolean;
f1,f2:text; l:matrice;

begin
assign(f1,'renju.in'); reset(f1);
assign(f2,'renju.out'); rewrite(f2);
for i:=1 to 19 do begin
for j:=1 to 19 do read(f1,l[i,j]); readln(f1); end;
p:=false; q:=false; aux:=4;

if p=false then begin
for i:=1 to 19 do
for j:=1 to 19 do
if l[i,j]=1 then begin
if p=true then break;
for u:=1 to 4 do
if l[i,j+u]=1 then aux:=aux-1;
if (aux=0) and (l[i,j-1]<>1) and (l[i,j+5]<>1) then begin p:=true; x:=i; y:=j; end else aux:=4;
end;
aux:=4;
if p=false then
for j:=1 to 19 do
for i:=1 to 19 do
if l[i,j]=1 then begin
if p=true then break;
for u:=1 to 4 do
if l[i+u,j]=1 then aux:=aux-1;
if (aux=0) and (l[i-1,j]<>1) and (l[i+5,j]<>1) then begin p:=true; x:=i; y:=j; end else aux:=4;
end;
aux:=4;
if p=false then
for i:=1 to 19 do
for j:=1 to 19 do
if l[i,j]=1 then begin
if p=true then break;
h:=4; x:=i; y:=j;
repeat
h:=h-1;
x:=x+1; y:=y+1;
if l[x,y]=1 then aux:=aux-1;
until h=0;
if (aux=0) and (l[x-5,y-5]<>1) and (l[x+1,y+1]<>1) then begin p:=true; x:=x-4; y:=y-4; end else aux:=4;
end;
aux:=4;
if p=false then
for i:=1 to 19 do
for j:=1 to 19 do
if l[i,j]=1 then begin
if p=true then break;
h:=4; x:=i; y:=j;
repeat
h:=h-1;
x:=x+1; y:=y-1;
if l[x,y]=1 then aux:=aux-1;
until h=0;
if (aux=0) and (l[x-5,y+5]<>1) and (l[x+1,y-1]<>1) then begin p:=true; y:=y; x:=x; end else aux:=4;
end;
end;

if p=false then begin
for i:=1 to 19 do
for j:=1 to 19 do
if l[i,j]=2 then begin
if q=true then break;
for u:=1 to 4 do
if l[i,j+u]=2 then aux:=aux-1;
if (aux=0) and (l[i,j-1]<>2) and (l[i,j+5]<>2) then begin q:=true; x:=i; y:=j; end else aux:=4;
end;
aux:=4;
if q=false then
for j:=1 to 19 do
for i:=1 to 19 do
if l[i,j]=2 then begin
if q=true then break;
for u:=1 to 4 do
if l[i+u,j]=2 then aux:=aux-1;
if (aux=0) and (l[i-1,j]<>2) and (l[i+5,j]<>2) then begin q:=true; x:=i; y:=j; end else aux:=4;
end;
aux:=4;
if q=false then
for i:=1 to 19 do
for j:=1 to 19 do
if l[i,j]=2 then begin
if q=true then break;
h:=4; x:=i; y:=j;
repeat
h:=h-1;
x:=x+1; y:=y+1;
if l[x,y]=2 then aux:=aux-1;
until h=0;
if (aux=0) and (l[x-5,y-5]<>2) and (l[x+1,y+1]<>2) then begin q:=true; x:=x-4; y:=y-4; end else aux:=4;
end;
aux:=4;
if q=false then
for i:=1 to 19 do
for j:=1 to 19 do
if l[i,j]=2 then begin
if q=true then break;
h:=4; x:=i; y:=j;
repeat
h:=h-1;
x:=x+1; y:=y-1;
if l[x,y]=2 then aux:=aux-1;
until h=0;
if (aux=0) and (l[x-5,y+5]<>2) and (l[x+1,y-1]<>2) then begin q:=true;  y:=y; x:=y-4; end else aux:=4;
end;
end;


if p=true then begin writeln(f2,1); write(f2,x,' ',y); end;
if q=true then begin writeln(f2,2); write(f2,x,' ',y); end;
if (p=false) and (q=false) then write(f2,0);

close(f1);
close(f2);
end.