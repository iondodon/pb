program prieteni3;
type matrice=array[1..100, 1..100] of integer;
aa=array[1..100, 1..100] of integer;
bb=array[1..100] of integer;
zz=array[1..100] of integer;
imf=set of 0..255;
var i,j,n,p,k,m,u,r,f,h:integer; l:matrice; a:aa; b:bb; z:zz;
f1,f2:text; im:imf;

begin
assign(f1,'prieteni3.in'); reset(f1);
assign(f2,'prieteni3.out'); rewrite(f2);
readln(f1,n,p,k); u:=0;
for i:=1 to n do begin
read(f1,m); u:=u+1; b[u]:=m;
for j:=1 to m do read(f1,l[i,j]);
readln(f1);
end;
i:=p; j:=0; u:=0;
repeat
j:=j+1;
if l[i,j]<>0 then begin u:=u+1; a[1,u]:=l[i,j]; im:=im+[l[i,j]] end;
until l[i,j]=0;



i:=0; r:=1;
repeat
r:=r+1; i:=i+1; h:=u; u:=0;
for j:=1 to h do begin
for f:=1 to b[a[i,j]] do
if ((l[a[i,j],f] in im)=false) and (l[a[i,j],f]<>p) then
begin u:=u+1; a[r,u]:=l[a[i,j],f]; im:=im+[a[r,u]] end;
end;
until r=k;


writeln(f2,u);
for i:=1 to u do inc(z[a[r,i]]);
for i:=1 to 100 do
if z[i]<>0 then write(f2,i,' ');



close(f1);
close(f2);
end.