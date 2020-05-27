program dartz;
type tabel1=array[1..1000] of longint;

var s,k,i,j,n1,n2,x1,x2:longint; x:tabel1;
f1,f2:text; q:boolean;

begin
assign(f1,'dartz.in'); reset(f1);
assign(f2,'dartz.out'); rewrite(f2);
read(f1,s);

k:=0;
repeat
k:=k+1;
until k*(k-1)*(k+1)>=s;
if k*(k-1)*(k+1)>s then k:=k-1;

for i:=1 to k do
x[i]:=i*(i-1)*(i+1);

q:=false;
for i:=1 to k do begin
for j:=1 to k do
if (s div 2)-x[i]=x[j] then begin n1:=x[i]; n2:=(s div 2)-x[i]; q:=true; break; end;
if q=true then break;
end;

for i:=1 to 9999999 do
if i*(i+1)*(i+2)=n1 then begin x1:=i; break; end;
for i:=1 to 9999999 do
if i*(i+1)*(i+2)=n2 then begin x2:=i; break; end;

writeln(f2,x1,' ',x2,' ',x1,' ',x2);
close(f1);
close(f2);
end.
