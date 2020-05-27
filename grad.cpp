program grad;
type tabel1=array[1..3000] of longint;
tabel2=array[0..300] of char;

var n,gr,ncv,i,aux:longint; c:tabel2; t:tabel1;
f1,f2:text;

begin
assign(f1,'grad.in'); reset(f1);
assign(f2,'grad.out'); rewrite(f2);
readln(f1,n);
for i:=1 to n do read(f1,c[i]);
ncv:=0; gr:=0; aux:=0; c[n+1]:=' ';
for i:=1 to n+1 do begin
if (ord(c[i])>66) and (ord(c[i-1])=32) then ncv:=ncv+1;
if ord(c[i])>66 then aux:=aux+(ord(c[i])-96);
if (ord(c[i])=32) and (ord(c[i-1])>66) then
if t[aux]=0 then begin gr:=gr+1; t[aux]:=t[aux]+1; aux:=0; end else
begin t[aux]:=t[aux]+1; aux:=0; end;
end;
writeln(f2,ncv+1);
writeln(f2,gr);
close(f1);
close(f2);
end.
