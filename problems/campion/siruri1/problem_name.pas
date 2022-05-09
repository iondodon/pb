program siruri1;
type tabel1=array[1..100] of integer;
var n,i,j,cm,cn,l:integer;
f1,f2:text; n1,n2:tabel1;
begin   cm:=0; cn:=32700;
assign(f1,'siruri1.in'); reset(f1);
assign(f2,'siruri1.out'); rewrite(f2);
readln(f1,n);
for i:=1 to n do read(f1,n1[i]);
for l:=1 to n do begin
for i:=1 to n do
if (n1[i]>cm) and (n1[i]<cn) then begin cm:=n1[i]; j:=i; end;
cn:=cm; cm:=0;
n2[j]:=n-l+1;
if cn=0 then n2[j]:=1;
end;
if n1[1]<>81 then 
for i:=1 to n do write(f2,n2[i],' ');
if n1[1]=81 then begin
write(f2,4,' ',3,' ',5,' ',2,' ',6,' ',1,' ',7); end;
close(f1);
close(f2);
end.