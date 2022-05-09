program numar1;
var nr:array[1..50] of integer;   z:array[0..50] of longint;
n,i,g,j,u:shortint; s,b,fin:longint;
f:text;
begin
assign(f,'numar1.in'); reset(f);
readln(f,n); for i:=1 to n do read(f,nr[i]);
close(f);

g:=1; u:=0;
for i:=1 to n do begin
if (nr[i]>nr[i+1]) or ((nr[i]=0) and (nr[i+1]=0)) then begin
s:=0;
for j:=g to i do s:=s+nr[j];
g:=i+1; 

b:=0;
repeat
b:=b+(s mod 10);
s:=s div 10;
if (s=0) and (b>9) then begin s:=b; b:=0; end;
until s=0;
z[b]:=b;
if (i=n) and (nr[n]=0) and (nr[n-1]>nr[n]) then  z[0]:=1;
if b=0 then z[0]:=1;
end;
end;

fin:=0;
for i:=9 downto 0 do
if z[i]=0 then fin:=(fin*10)+i;

if fin=0 then fin:=-1;
assign(f,'numar1.out'); rewrite(f);
write(f,fin);

close(f);
end.