program cluburi;
type tabel=array[1..100] of longint;
var n,a,m,k,i:longint;
f1,f2:text; l:tabel;
begin k:=0;
assign(f1,'cluburi.in'); reset(f1);
assign(f2,'cluburi.out'); rewrite(f2);
read(f1,n); m:=n;
if n mod 2<>0 then m:=m-1; 

if m<>0 then begin
repeat
a:=1;
repeat
a:=a*2;
until a>=m;
if a>m then a:=a div 2;
k:=k+1; l[k]:=a;
m:=m-a;
until m=0;
if n mod 2<>0 then begin k:=k+1; l[k]:=1; end;
writeln(f2,k);
for i:=k downto 1 do write(f2,l[i],' ');
end;


if n=1 then begin
writeln(f2,'1');
write(f2,'1'); end;

close(f1);
close(f2);
end.
