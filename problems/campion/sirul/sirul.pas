program sirul;
type tabel=array[1..21000] of ansistring;
var n,i:longint;
s:tabel;
f1,f2:text;
begin
assign(f1,'sirul.in');
assign(f2,'sirul.out');
reset(f1);
rewrite(f2);
read(f1,n);
if n=1 then begin write(f2,'a'); end;
if n=2 then begin write(f2,'b'); end;
if n>=3 then begin
s[1]:='a'; s[2]:='b';
for i:=3 to n do
s[i]:=s[i-1]+s[i-2];
write(f2,s[n]);
end;
close(f1);
close(f2);
end.