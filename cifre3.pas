program cifre3;
type tabel=array[1..100] of char;
tabel1=array[1..100] of char;
var i,j,n1,n2,g,l:longint; s:char; c:tabel1;
f1,f2:text; a,b:string; t:tabel; p:boolean;
begin  g:=0; s:='-'; l:=0;
assign(f1,'cifre3.in'); reset(f1);
assign(f2,'cifre3.out'); rewrite(f2);
read(f1,n1,n2); str(n1,a); str(n2,b);

for i:=1 to length(a) do
for j:=1 to length(b) do
if a[i]=b[j] then begin inc(g); t[g]:=a[i]; end;

for i:=1 to g do
if t[i]<>s then begin s:=t[i]; inc(l); c[l]:=s; end;

if l>1 then
repeat
p:=false;
for i:=2 to l do
if c[i]<c[i-1] then begin
p:=true;
s:=c[i];
c[i]:=c[i-1];
c[i-1]:=s; end;
until p=false;

for i:=1 to l do write(f2,c[i],' '); writeln(f2);

a:=a+b;
if length(a)>1 then
repeat
p:=false;
for i:=2 to length(a) do
if a[i]>a[i-1] then begin
p:=true;
s:=a[i];
a[i]:=a[i-1];
a[i-1]:=s; end;
until p=false;

write(f2,a);

close(f1);
close(f2);
end.
