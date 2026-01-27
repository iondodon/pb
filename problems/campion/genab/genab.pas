program genab;
type tabel=array[1..100] of char;
var n,i,j:longint; s:tabel;
f1,f2:text; p:boolean;

function dputere(x:longint):longint;
var r:longint;
begin
r:=1;
for i:=1 to x do r:=r*2;
dputere:=r;
end;

begin
assign(f1,'genab.in'); reset(f1);
assign(f2,'genab.out'); rewrite(f2);

read(f1,n);

for i:=1 to n do s[i]:='a';

for j:=1 to dputere(n) do begin

p:=false;
for i:=2 to n do if (s[i]='b') and (s[i-1]='b') then p:=true;
if p=false then begin for i:=1 to n do write(f2,s[i]); writeln(f2); end;

if s[n]='a' then s[n]:='b' else
for i:=n downto 1 do if s[i]='a' then begin s[i]:='b'; break; end else s[i]:='a';



end;

close(f1);
close(f2);
end.