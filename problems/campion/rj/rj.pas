program rj;
type matricechar=array[0..101, 0..101] of char;
  matriceint=array[0..101, 0..101] of integer;
  tabel=array[1..100000] of integer;
var n,m,i,j,timp,a,b,s1,s2,s3,s4,u,g,x,y,r1,r2:longint; lc:matricechar; lr,lj:matriceint; cx,cy:tabel;
f1,f2:text;
begin
assign(f1,'rj.in'); reset(f1);
assign(f2,'rj.out'); rewrite(f2);
readln(f1,n,m);


for i:=1 to n do   //citirea matricei cu caractere
begin
for j:=1 to m do
begin
read(f1,lc[i,j]);
if lc[i,j]='R' then begin s1:=i; s2:=j; end;
if lc[i,j]='J' then begin s3:=i; s4:=j; end;
end;
readln(f1);
end;


for j:=0 to m+1 do  //limitare
lc[0,j]:='X';
for i:=0 to n+1 do
lc[i,m+1]:='X';
for j:=0 to m+1 do
lc[n+1,j]:='X';
for i:=0 to n+1 do
lc[i,0]:='X';


lr[s1,s2]:=1; a:=1; b:=1; u:=1; cx[u]:=s1; cy[u]:=s2; g:=1;             //traseul lui Romeo
repeat
for u:=a to b do
begin
x:=cx[u]; y:=cy[u];
if (lc[x-1,y]=' ') and (lr[x-1,y]=0) then begin g:=g+1; cx[g]:=x-1; cy[g]:=y; lr[x-1,y]:=lr[x,y]+1; end;
if (lc[x-1,y+1]=' ') and (lr[x-1,y+1]=0) then begin g:=g+1; cx[g]:=x-1; cy[g]:=y+1; lr[x-1,y+1]:=lr[x,y]+1; end;
if (lc[x,y+1]=' ') and (lr[x,y+1]=0) then begin g:=g+1; cx[g]:=x; cy[g]:=y+1; lr[x,y+1]:=lr[x,y]+1; end;
if (lc[x+1,y+1]=' ') and (lr[x+1,y+1]=0) then begin g:=g+1; cx[g]:=x+1; cy[g]:=y+1; lr[x+1,y+1]:=lr[x,y]+1; end;
if (lc[x+1,y]=' ') and (lr[x+1,y]=0) then begin g:=g+1; cx[g]:=x+1; cy[g]:=y; lr[x+1,y]:=lr[x,y]+1; end;
if (lc[x+1,y-1]=' ') and (lr[x+1,y-1]=0) then begin g:=g+1; cx[g]:=x+1; cy[g]:=y-1; lr[x+1,y-1]:=lr[x,y]+1; end;
if (lc[x,y-1]=' ') and (lr[x,y-1]=0) then begin g:=g+1; cx[g]:=x; cy[g]:=y-1; lr[x,y-1]:=lr[x,y]+1; end;
if (lc[x-1,y-1]=' ') and (lr[x-1,y-1]=0) then begin g:=g+1; cx[g]:=x-1; cy[g]:=y-1; lr[x-1,y-1]:=lr[x,y]+1; end;
end;
a:=u+1; b:=g;
until a>b;

for i:=1 to g do    //resetare coada
begin
cx[i]:=0;
cy[i]:=0;
end;

lj[s3,s4]:=1; a:=1; b:=1; u:=1; cx[u]:=s3; cy[u]:=s4; g:=1;             //traseul Julietei
repeat
for u:=a to b do
begin
x:=cx[u]; y:=cy[u];
if (lc[x-1,y]=' ') and (lj[x-1,y]=0) then begin g:=g+1; cx[g]:=x-1; cy[g]:=y; lj[x-1,y]:=lj[x,y]+1; end;
if (lc[x-1,y+1]=' ') and (lj[x-1,y+1]=0) then begin g:=g+1; cx[g]:=x-1; cy[g]:=y+1; lj[x-1,y+1]:=lj[x,y]+1; end;
if (lc[x,y+1]=' ') and (lj[x,y+1]=0) then begin g:=g+1; cx[g]:=x; cy[g]:=y+1; lj[x,y+1]:=lj[x,y]+1; end;
if (lc[x+1,y+1]=' ') and (lj[x+1,y+1]=0) then begin g:=g+1; cx[g]:=x+1; cy[g]:=y+1; lj[x+1,y+1]:=lj[x,y]+1; end;
if (lc[x+1,y]=' ') and (lj[x+1,y]=0) then begin g:=g+1; cx[g]:=x+1; cy[g]:=y; lj[x+1,y]:=lj[x,y]+1; end;
if (lc[x+1,y-1]=' ') and (lj[x+1,y-1]=0) then begin g:=g+1; cx[g]:=x+1; cy[g]:=y-1; lj[x+1,y-1]:=lj[x,y]+1; end;
if (lc[x,y-1]=' ') and (lj[x,y-1]=0) then begin g:=g+1; cx[g]:=x; cy[g]:=y-1; lj[x,y-1]:=lj[x,y]+1; end;
if (lc[x-1,y-1]=' ') and (lj[x-1,y-1]=0) then begin g:=g+1; cx[g]:=x-1; cy[g]:=y-1; lj[x-1,y-1]:=lj[x,y]+1; end;
end;
a:=u+1; b:=g;
until a>b;

timp:=999999;           //gasirea locului de intilnire cu timpul minim
for i:=1 to n do
for j:=1 to m do
if (lr[i,j]=lj[i,j]) and (lr[i,j]<timp) and (lr[i,j]<>0) and (lr[i,j]<>1) and (lj[i,j]<>1) then
begin
timp:=lr[i,j];
r1:=i;
r2:=j;
end;


write(f2,timp,' ',r1,' ',r2);   //afisare rezultat
close(f1);
close(f2);
end.