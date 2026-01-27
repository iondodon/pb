program genab;
type tabel1=array[1..100] of char;
tabel2=array[1..200] of longint;

var n,i,j,r,ss:longint; s:tabel1; t:tabel2;
f1,f2:text; p:boolean;

function dputere(x:longint):longint;
var r:longint;
begin
r:=1;
for i:=1 to x do r:=r*2;
dputere:=r;
end;

begin
assign(f1,'adunscad.in'); reset(f1);
assign(f2,'adunscad.out'); rewrite(f2);
p:=false;
readln(f1,r,n);
for i:=1 to n do read(f1,t[i]);
for i:=1 to n do s[i]:='+';

for j:=1 to dputere(n) div 2+n do begin
ss:=0;
for i:=1 to n do
if s[i]='+' then ss:=ss+t[i] else ss:=ss-t[i];
if ss=r then begin 
for i:=1 to n do 
if i>1 then write(f2,s[i],t[i]) else 
if s[i]='-' then write(f2,s[i],t[i]) else write(f2,t[i]);
p:=true;
break;
end;
if (p=false) then begin
ss:=0;
for i:=1 to n do
if s[i]='+' then ss:=ss-t[i] else ss:=ss+t[i];
if ss=r then begin 
for i:=1 to n do begin
if (i=1) and (s[i]='-') then write(f2,t[i]);
if (i=1) and (s[i]='+') then write(f2,'-',t[i]);
if i>1 then 
if s[i]='+' then write(f2,'-',t[i]) else write(f2,'+',t[i]);
end;
p:=true;
break; end;
end;
if s[n]='+' then s[n]:='-' else
for i:=n downto 1 do if s[i]='+' then begin s[i]:='-';  break; end else s[i]:='+';
end;

if p=false then write(f2,0);
writeln(f2);
close(f1);
close(f2);
end.