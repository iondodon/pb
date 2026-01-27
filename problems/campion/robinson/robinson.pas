program robinson;
type matrice=array[1..20, 1..20] of longint;
tabel1=array[1..500] of longint;
tabel2=array[1..500] of longint;
var n,m,i,j,x,y,g:longint; t:matrice;
f1,f2:text; l:tabel1; c:tabel2; p,q:boolean;
begin
assign(f1,'robinson.in'); reset(f1);
assign(f2,'robinson.out'); rewrite(f2);
read(f1,m,n,l[1],c[1]);

for i:=1 to m do t[i,1]:=n+i-1;
for j:=1 to m do t[1,j]:=n+j-1;

if m>1 then 
for i:=2 to m do
for j:=2 to m do begin
if t[i-1,j]+t[i,j-1]<=999 then t[i,j]:=t[i-1,j]+t[i,j-1];
if t[i-1,j]+t[i,j-1]>999 then t[i,j]:=(t[i-1,j]+t[i,j-1]) mod 1000;
end;

g:=1; x:=l[g]; y:=c[g];
repeat
inc(g); l[g]:=x; c[g]:=y; 
p:=false; q:=false;
if p=false then 
if t[x,y] mod 4=0 then begin p:=true; x:=x-1; end;
if p=false then 
if t[x,y] mod 4=1 then begin p:=true; y:=y+1; end;
if p=false then 
if t[x,y] mod 4=2 then begin p:=true; x:=x+1; end;
if p=false then  
if t[x,y] mod 4=3 then begin p:=true; y:=y-1; end;
for i:=1 to g do if (l[i]=x) and (c[i]=y) then q:=true;
until (x>m) or (x<1) or (y>m) or (y<1) or (q=true);

writeln(f2,t[m,m]);
for i:=2 to g do writeln(f2,l[i],' ',c[i]);

close(f1);
close(f2);
end.