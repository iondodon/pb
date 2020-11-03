program cabina;
type tabel=array[1..100] of integer;
var n,l,spec,i,no:integer;
o,s:tabel;
f1,f2:text;
begin
assign(f1,'cabina.in');
assign(f2,'cabina.out');
reset(f1);
rewrite(f2);
read(f1,n);
for i:=1 to n do
readln(f1,s[i],o[i]);
no:=0; l:=0; spec:=0;
for i:=1 to n do
no:=no+o[i];
begin
for i:=2 to n do begin
if s[i]>s[i-1] then l:=l+((s[i]-s[i-1])*3);
if s[i]<s[i-1] then l:=l+(s[i-1]-s[i]);
end;
begin
for i:=2 to n-1 do begin
if (s[i]>s[i-1]) and (s[i]>s[i+1]) then spec:=spec+1;
if (s[i]<s[i-1]) and (s[i]<s[i+1]) then spec:=spec+1;
end;
end; end;
writeln(f2,no);
writeln(f2,l);
write(f2,spec);
close(f1);
close(f2);
end.



