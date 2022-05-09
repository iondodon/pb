program codcorect;
type tabel=array[1..30] of longint;
var n,i:longint; s:string; c:char;
f1,f2:text;
nr:tabel;
begin
assign(f1,'codcorect.in');
assign(f2,'codcorect.out');
reset(f1);
rewrite(f2);
readln(f1,n);
for i:=1 to n do read(f1,nr[i]);
if n>1 then
for i:=1 to n-1 do begin
str(nr[i],s);
if length(s) mod 2<>0 then
if s[1]<s[length(s)] then begin
c:=s[1];
s[1]:=s[length(s)];
s[length(s)]:=c;
end;
write(f2,s,' '); end;
str(nr[n],s);
if length(s) mod 2<>0 then
if s[1]<s[length(s)] then begin
c:=s[1];
s[1]:=s[length(s)];
s[length(s)]:=c; end;
write(f2,s);
close(f1);
close(f2);
end.