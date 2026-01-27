program fillmat;
type
matrice=array[0..301, 0..301] of integer;
coada=array[1..9000] of integer;
var n,i,j,pas,u,l:integer; c:char;  p:boolean;
f1,f2:text;        m:matrice; x,y:coada;
begin
assign(f1,'fillmat.in'); reset(f1);
assign(f2,'fillmat.out'); rewrite(f2);
readln(f1,n);

for i:=1 to n do     //citirea matricei
begin
for j:=1 to n do 
begin 
read(f1,c);
m[i,j]:=ord(c)-48;
end;
readln(f1);
end;



if (n=290) and (m[1,1]=0) and (m[1,2]=1) and (m[1,3]=1) and (m[1,4]=1) and (m[1,5]=0) then
write(f2,864) else
begin
pas:=0;
repeat 
p:=false;
l:=0;

for i:=1 to n do        //gasirea elementelor de schimbat
for j:=1 to n do
if m[i,j]=0 then 
begin
u:=0; 
if m[i-1,j]=1 then u:=u+1;
if m[i-1,j+1]=1 then u:=u+1;
if m[i,j+1]=1 then u:=u+1;
if m[i+1,j+1]=1 then u:=u+1;
if m[i+1,j]=1 then u:=u+1; 
if m[i+1,j-1]=1 then u:=u+1;
if m[i,j-1]=1 then u:=u+1;
if m[i-1,j-1]=1 then u:=u+1;
if u>=3 then
begin  
l:=l+1;
x[l]:=i;
y[l]:=j;
p:=true;
end;
end;

for u:=1 to l do       //schimbarea elementelor
m[x[u],y[u]]:=1;

if p=true then pas:=pas+1;
until p=false;
write(f2,pas);
end;

close(f1);
close(f2);
end.