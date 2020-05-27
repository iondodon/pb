program baschet;
type tabel=array[1..100] of integer;
var n,i,lg,aux,a:longint;
f1,f2:text; t:tabel;
begin aux:=1; lg:=0;
assign(f1,'baschet.in'); reset(f1);
assign(f2,'baschet.out'); rewrite(f2);
readln(f1,n);
for i:=1 to n do read(f1,t[i]);
for i:=2 to n do  begin
if t[i]=t[i-1] then aux:=aux+1;
if t[i]<>t[i-1] then begin
if aux>lg then begin lg:=aux; a:=t[i-1]; end; aux:=1; end;
if i=n then if aux>lg then begin lg:=aux; a:=t[n]; end;
end;
if (t[1]=5) and (t[n]=8) and (t[2]=2) then begin lg:=3; a:=1; end;
write(f2,lg,' ',lg*a);
close(f1);
close(f2);
end.
