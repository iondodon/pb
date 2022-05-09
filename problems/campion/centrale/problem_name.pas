program centrale;
type tabel=array[1..100] of longint;
var n,ce,i,j:longint; nr:tabel;
f1,f2:text; s:string; p:boolean;
begin ce:=0;
assign(f1,'centrale.in'); reset(f1);
assign(f2,'centrale.out'); rewrite(f2);
readln(f1,n);

for i:=1 to n do begin
read(f1,nr[i]); str(nr[i],s);
if length(s)=3 then inc(ce) else begin
p:=false;
for j:=3 to length(s)-1 do
if s[j]<>s[j-1] then p:=true;
if p=false then inc(ce); end;
end;

write(f2,ce);

close(f1);
close(f2);
end.