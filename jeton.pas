program jeton;
type tabel=array[1..56000] of longint;
tabel1=array[1..56000] of longint;
var n,m,i,a,b,cn,cm:longint; t:tabel;
f1,f2:text; nr:tabel1;
begin cn:=56001; cm:=0; a:=0; b:=0; 
assign(f1,'jeton.in'); reset(f1);
assign(f2,'jeton.out'); rewrite(f2);
readln(f1,n,m);
for i:=1 to n+m do begin
read(f1,nr[i]); inc(t[nr[i]]);
if (t[nr[i]]>=2) and (nr[i]<cn) then cn:=nr[i];
if (t[nr[i]]>=2) and (nr[i]>cm) then cm:=nr[i];
end;

for i:=1 to n+m do begin
if (i<=n) and ((nr[i]<cn) or (nr[i]>cm)) then inc(a);
if (i>n) and ((nr[i]<cn) or (nr[i]>cm)) then inc(b); end;

write(f2,cn,' ',cm,' ');
if a>b then write(f2,'1');
if a=b then write(f2,'0');
if a<b then write(f2,'2');

close(f1);
close(f2);
end.