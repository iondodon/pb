program hora;
type
litere=set of char;
var
lit:litere;
a,c:char;
kpr,k1,k2,x:longint;
f1,f2:text;
begin
assign(f1,'hora.in');
assign(f2,'hora.out');
reset(f1);
rewrite(f2);
lit:=[];
for c:='a' to 'z' do lit:=lit+[c];
for c:='A' to 'Z' do lit:=lit+[c];
c:=' ';
while c=' ' do read(f1,c);
while c in lit do read(f1,c);
if c='*' then k1:=1 else k1:=-1;
kpr:=k1;
while not eoln(f1)do
begin
read(f1,c);
if (a in lit )and(c='*') then begin k2:=1;if k1*k2>0 then x:=x+1;k1:=k2 end else
if (a in lit )and(c=' ') then begin k2:=-1;if k1*k2>0 then x:=x+1;k1:=k2 end else
if eoln(f1)then begin k2:=-1;if k1*k2>0 then x:=x+1;k1:=k2 end ;
a:=c
end;
if k2=kpr then x:=x+1;
writeln(f2,x);
close(f1);
close(f2);
end.