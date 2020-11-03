program noroc;
type
tabel1=array[1..200] of longint;
tabel2=array[1..200] of longint;
suma=array[0..200] of longint;

var n,i,l,j:longint; t1:tabel1; t2:tabel2; s:suma; q:boolean;
f1,f2:text;

begin
assign(f1,'noroc.in'); reset(f1);
assign(f2,'noroc.out'); rewrite(f2);
readln(f1,n);
for i:=1 to n do read(f1,t1[i]);
for i:=1 to n do t2[i]:=t1[i]*t1[i];

for i:=1 to n do
s[i]:=s[i-1]+t2[i];
q:=false;
for i:=1 to n do
if s[i] mod n=0 then begin
q:=true;
writeln(f2,i);
for j:=1 to i do write(f2,t1[j],' ');
break; end;
if q=false then
for i:=1 to n-1 do
for j:=i+1 to n do
if (s[i] mod n=s[j] mod n) then begin
writeln(f2,j-i);
for l:=i+1 to j do write(f2,t1[l],' ');
break;
end;


close(f1);
close(f2);
end.
