program anagramabil;
type tabel1=array[1..10] of integer;
var n:int64; i,l,j,u,f:integer;
f1,f2:text;  nr:tabel1; s,m:string; p:boolean;
begin u:=0;
assign(f1,'anagramabil.in'); reset(f1);
assign(f2,'anagramabil.out'); rewrite(f2);
read(f1,n); str(n,m);


for i:=2 to 9 do begin
str(n*i,s); f:=0;
for j:=1 to length(m) do begin
p:=false;
for l:=1 to length(s) do
if m[j]=s[l] then p:=true;
if p=true then f:=f+1;
end;
if f=length(s) then begin u:=u+1; nr[u]:=i; end;
end;



if nr[1]=0 then begin write(f2,'NU'); end;
if nr[1]<>0 then begin
writeln(f2,'DA');
for i:=1 to u do write(f2,nr[i]); end;
close(f1);
close(f2);
end.
