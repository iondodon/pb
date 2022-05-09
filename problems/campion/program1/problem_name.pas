program program1;
type date=record
s:string;
stare:longint;
end;
     tabeldate=array[1..10000] of date;
var i,j,u,sol,g:longint; t:tabeldate; ss:string;
f1,f2:text;


procedure parcurgere(i:longint);
var j,n,m:longint; p:boolean;
begin
t[i].stare:=1;
if t[i].s='EXECUTA' then
if t[i+1].stare=0 then parcurgere(i+1);
if (t[i].s<>'EXECUTA') and (i<=g) then
begin
p:=false;
for j:=1 to length(t[i].s)-2 do
if (t[i].s[j]='S') and (t[i].s[j+2]='U') then p:=true;

if p=false then
begin
n:=0;
for j:=6 to length(t[i].s) do
n:=(n*10)+(ord(t[i].s[j])-48);
if t[n].stare=0 then parcurgere(n);
end;
if p=true then
begin
n:=0; m:=0; u:=0;
for j:=6 to 200 do
if (t[i].s[j]<>' ') then begin n:=(n*10)+(ord(t[i].s[j])-48); u:=u+1; end else break;
for j:=12+u-1 to length(t[i].s) do
m:=(m*10)+(ord(t[i].s[j])-48);
if t[n].stare=0 then parcurgere(n);
if t[m].stare=0 then parcurgere(m);
end;
end;
end;


begin
assign(f1,'program1.in'); reset(f1);
assign(f2,'program1.out'); rewrite(f2);

i:=0; g:=0;
repeat
readln(f1,ss);
if ss<>'.' then
begin
i:=i+1; g:=g+1;
t[i].s:=ss;
t[i].stare:=0;
end;
until ss='.';

parcurgere(1);

sol:=0;
for i:=1 to g do
if t[i].stare=0 then
sol:=sol+1;

writeln(f2,sol);
close(f1);
close(f2);
end.