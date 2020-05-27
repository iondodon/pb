program cuburi3;
type tabel=array[1..1000] of integer;
var i,n,x,y,ds,cs:integer; p,q:boolean;
d,c:tabel;
f1,f2:text;
begin
assign(f1,'cuburi3.in');
assign(f2,'cuburi3.out');
reset(f1);
rewrite(f2);
readln(f1,n);
for i:=1 to n do readln(f1,d[i],c[i]);
repeat
p:=true; q:=true;
for i:=2 to n do begin
if d[i]<d[i-1] then begin
p:=false;
x:=d[i];
d[i]:=d[i-1];
d[i-1]:=x; end;
if c[i]<c[i-1] then begin
q:=false;
y:=c[i];
c[i]:=c[i-1];
c[i-1]:=y; end; end;
until (p=true) and (q=true);
ds:=1; cs:=1;
for i:=2 to n do begin
if d[i]<>d[i-1] then ds:=ds+1;
if c[i]<>c[i-1] then cs:=cs+1;
end;
if ds>cs then begin write(f2,'C',' ',cs); end;
if cs>ds then begin write(f2,'D',' ',ds); end;
if cs=ds then begin write(f2,'DC',' ',cs); end;
writeln(f2);
close(f1);
close(f2);
end.
