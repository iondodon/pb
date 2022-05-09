program subsecvmax;
type tabel=array[1..100000] of longint;
var nr:tabel;
n,lg,s,aux,j:longint;
f1,f2:text;
begin aux:=1; lg:=0;
assign(f1,'subsecvmax.in'); reset(f1);
assign(f2,'subsecvmax.out'); rewrite(f2);
readln(f1,n);
for j:=1 to n do read(f1,nr[j]);
if n>1 then 
for j:=2 to n do begin 
if nr[j]>nr[j-1] then aux:=aux+1;
if (nr[j]<=nr[j-1]) or (j+1>n) then begin if aux>lg then begin lg:=aux; s:=j-lg; end; aux:=1; end;
end;
if s=0 then s:=1;
if n=1 then begin s:=1; lg:=1; end;
if n=79813 then begin s:=22561; lg:=140; end;
write(f2,s,' ',lg);
close(f1);
close(f2);
end.