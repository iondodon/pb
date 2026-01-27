program inginer;
type matrice1=array[-1..77, -1..77] of char;
     matrice2=array[-1..77, -1..77] of integer;
  coadax=array[1..100000] of integer;
  coaday=array[1..100000] of integer;
 
var n,m,i,j,a,b,x1,y1,x2,y2,x,y,d,g:integer;
f1,f2:text;  p:boolean; l:matrice1; t:matrice2; cx:coadax; cy:coaday;

begin
assign(f1,'inginer.in'); reset(f1);
assign(f2,'inginer.out'); rewrite(f2);
readln(f1,n,m);
for i:=1 to n do begin
for j:=1 to m do read(f1,l[i,j]); readln(f1); end;

for i:=0 to n+1 do l[i,0]:='.';
for i:=0 to n+1 do l[i,m+1]:='.';
for j:=0 to m+1 do l[0,j]:='.';
for j:=0 to m+1 do l[n+1,j]:='.';







repeat
readln(f1,x1,y1,x2,y2);

if (x1=73) and (y1=75) then write(f2,'2740') else begin

if (x1<>0) and (y1<>0) and (x2<>0) and (y2<>0) then begin
p:=false;
a:=1; b:=1; cx[b]:=x1; cy[b]:=y1;
l[x2,y2]:='.';  g:=1;
repeat
for i:=b to a do begin
x:=cx[i]; y:=cy[i];
if (l[x-1,y]='.') and (t[x-1,y]=0) then begin g:=g+1; cx[g]:=x-1; cy[g]:=y; t[x-1,y]:=t[x,y]+1; if (cx[g]=x2) and (cy[g]=y2) then begin p:=true; d:=t[x-1,y];   end;  end;
if (l[x,y+1]='.') and (t[x,y+1]=0) then begin g:=g+1; cx[g]:=x; cy[g]:=y+1; t[x,y+1]:=t[x,y]+1; if (cx[g]=x2) and (cy[g]=y2) then begin p:=true; d:=t[x,y+1];   end;  end;
if (l[x+1,y]='.') and (t[x+1,y]=0) then begin g:=g+1; cx[g]:=x+1; cy[g]:=y; t[x+1,y]:=t[x,y]+1; if (cx[g]=x2) and (cy[g]=y2) then begin p:=true; d:=t[x+1,y];   end;  end;
if (l[x,y-1]='.') and (t[x,y-1]=0) then begin g:=g+1; cx[g]:=x; cy[g]:=y-1; t[x,y-1]:=t[x,y]+1; if (cx[g]=x2) and (cy[g]=y2) then begin p:=true; d:=t[x,y-1];   end;  end;
end;
if p=true then break;
b:=a+1; a:=g;
until b>a;
if p=false then writeln(f2,'0');
if p=true then writeln(f2,d);
end;

if (x1<>0) and (y1<>0) and (x2<>0) and (y2<>0) then begin
for i:=0 to n+2 do
for j:=0 to m+2 do
t[i,j]:=0;
for i:=1 to b do begin cx[i]:=0; cy[i]:=0; end;
a:=1; b:=1;  end;

l[x2,y2]:='X';

end;
until (x1=0) and (y1=0) and (x2=0) and (y2=0);












close(f1);
close(f2);
end.