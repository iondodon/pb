program el;
type matrice1=array[0..201, 0..201] of longint;
     matrice2=array[0..201, 0..201] of longint;
     matrice3=array[0..201, 0..201] of longint;
var n,m,max,i,j,imax,jmax,dir:longint; a:matrice1; c:matrice2; l:matrice3;
f1,f2:text;
begin
assign(f1,'el.in'); reset(f1);
assign(f2,'el.out'); rewrite(f2);
readln(f1,m,n);
for i:=1 to m do begin
for j:=1 to n do read(f1,a[i,j]); readln(f1);
end;
max:=0;

for i:=1 to m do
for j:=1 to n do
begin
l[i,j]:=l[i,j-1]+a[i,j];
c[i,j]:=c[i-1,j]+a[i,j];
end;

for i:=1 to m do
for j:=1 to n do
begin
if l[i,j]+c[m,j]-c[i,j]>max then begin max:=l[i,j]+c[m,j]-c[i,j]; imax:=i; jmax:=j; dir:=0; end;
if l[i,j]+c[i-1,j]>max then begin max:=l[i,j]+c[i-1,j]; imax:=i; jmax:=j; dir:=1; end;
if l[i,n]-l[i,j-1]+c[m,j]-c[i,j]>max then begin max:=l[i,n]-l[i,j-1]+c[m,j]-c[i,j]; imax:=i; jmax:=j; dir:=2; end;
if l[i,n]-l[i,j]+c[i,j]>max then begin max:=l[i,n]-l[i,j]+c[i,j]; imax:=i; jmax:=j; dir:=3; end;
end;

writeln(f2,max);
write(f2,imax,' ',jmax,' ');

if dir=0 then write(f2,-jmax,' ',-m+imax-1);
if dir=1 then write(f2,-jmax,' ',imax);
if dir=2 then write(f2,n-jmax+1,' ',-m+imax-1);
if dir=3 then write(f2,n-jmax+1,' ',imax);

close(f1);
close(f2);
end.