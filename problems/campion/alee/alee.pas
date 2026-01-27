program alee;
type matrice=array[0..180, 0..180] of integer;
coada=array[0..62000] of integer;
var n,nc,i,j,x1,y1,x2,y2,a,b,x,y,s:integer;
l:matrice; cx,cy:coada;
f1,f2:text; p:boolean;
begin
assign(f1,'alee.in'); reset(f1);
assign(f2,'alee.out'); rewrite(f2);
readln(f1,n,nc);
for i:=1 to nc do begin readln(f1,x,y); l[x,y]:=-1; end;
read(f1,x1,y1,x2,y2);
for j:=1 to n do l[0,j]:=-1;
for i:=1 to n do l[i,n+1]:=-1;
for j:=1 to n do l[n+1,j]:=-1;
for i:=1 to n do l[i,0]:=-1;
a:=0; b:=0; cx[a]:=x1; cy[a]:=y1; l[x1,y1]:=1;
repeat
for i:=a to b do begin
x:=cx[a]; y:=cy[a];
if l[x-1,y]=0 then begin b:=b+1; cx[b]:=x-1; cy[b]:=y; l[x-1,y]:=l[x,y]+1; end;
if l[x,y+1]=0 then begin b:=b+1; cx[b]:=x; cy[b]:=y+1; l[x,y+1]:=l[x,y]+1; end;
if l[x+1,y]=0 then begin b:=b+1; cx[b]:=x+1; cy[b]:=y; l[x+1,y]:=l[x,y]+1; end;
if l[x,y-1]=0 then begin b:=b+1; cx[b]:=x; cy[b]:=y-1; l[x,y-1]:=l[x,y]+1; end;
end;
a:=a+1;
until a>b;
s:=1; x:=x2; y:=y2;
repeat
p:=false;
if p=false then
if (l[x,y]>l[x-1,y]) and (l[x-1,y]<>-1) then begin x:=x-1; s:=s+1; p:=true; end;
if p=false then
if (l[x,y]>l[x,y+1]) and (l[x,y+1]<>-1) then begin y:=y+1; s:=s+1; p:=true; end;
if p=false then
if (l[x,y]>l[x+1,y]) and (l[x+1,y]<>-1) then begin x:=x+1; s:=s+1; p:=true; end;
if p=false then
if (l[x,y]>l[x,y-1]) and (l[x,y-1]<>-1) then begin y:=y-1; s:=s+1; p:=true; end;
until (x=x1) and (y=y1);
write(f2,s);
close(f1);
close(f2);
end.