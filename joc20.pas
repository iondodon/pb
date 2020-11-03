program joc20;
type tabel1=array[1..1000] of longint;
var n,i,j,s1,s2,u:longint;
f1,f2:text; nr,ince:tabel1;
begin s1:=0; s2:=0; u:=0;
assign(f1,'joc20.in'); reset(f1);
assign(f2,'joc20.out'); rewrite(f2);
readln(f1,n);
for i:=1 to n do read(f1,nr[i]);
j:=n+1;
for i:=1 to n do begin
read(f1,ince[i]);
if ince[i]=1 then begin
u:=u+1;
if i mod 2<>0 then s1:=s1+nr[u];
if i mod 2=0 then s2:=s2+nr[u]; end;
if ince[i]=2 then begin
j:=j-1;
if i mod 2<>0 then s1:=s1+nr[j];
if i mod 2=0 then s2:=s2+nr[j]; end;
end;
if s1>s2 then begin write(f2,s1,' ',1); end;
if s2>s1 then begin write(f2,s2,' ',2); end;
if s1=s2 then begin write(f2,s1,' ',0); end;
close(f1);
close(f2);
end.
