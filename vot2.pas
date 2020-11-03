program vot2;
type tabel=array[1..200] of longint;
var n,m,i,k,aux,j,a:longint; nr:tabel; s:string;
f1,f2:text;
begin
assign(f1,'vot2.in'); reset(f1);
assign(f2,'vot2.out'); rewrite(f2);
readln(f1,n,m);

for i:=1 to m do begin
readln(f1,s); aux:=0;
for j:=1 to length(s) do if s[j]='+' then begin  inc(aux); a:=j; end;
if aux=1 then begin inc(nr[a]); inc(k); end;
end;

for i:=1 to n do
if nr[i]>=(k*5)/100 then begin write(f2,i,' '); end;

close(f1);
close(f2);
end.
