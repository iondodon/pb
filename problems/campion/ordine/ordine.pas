program ordine;
type tabel=array[1..250000] of longint;
var i,p,n:longint; t:tabel;
f1,f2:text;
begin
assign(f1,'ordine.in'); reset(f1);
assign(f2,'ordine.out'); rewrite(f2);
readln(f1,n);
for i:=1 to n do read(f1,t[i]);
readln(f1); read(f1,p);

if p=1 then
if n mod 2=0 then write(f2,t[n]) else write(f2,t[(n div 2)+1]);

if p=2 then
if n mod 2=0 then
for i:=1 to n div 2 do write(f2,t[i],' ',t[i+(n div 2)],' ')
else begin
for i:=1 to n div 2 do write(f2,t[i],' ',t[i+(n div 2+1)],' ');
write(f2,t[n div 2+1]);
end;

close(f1);
close(f2);
end.