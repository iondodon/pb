program magic6;
var s,z,c,g:ansistring; n,i,j:longint;
f1,f2:text; p:boolean; x:char;
begin g:='';
assign(f1,'magic6.in');
assign(f2,'magic6.out');
reset(f1);
rewrite(f2);
readln(f1,n);
readln(f1,s);
z:=''; c:='';
for i:=1 to length(s) do begin
if (ord(s[i])>=97) and (ord(s[i])<=122) then z:=z+(chr(ord(s[i])-32));
if (ord(s[i])>=48) and (ord(s[i])<=57) then  c:=c+s[i];
end;
if length(c)>1 then begin
repeat
p:=true;
for i:=2 to length(c) do
if c[i]<c[i-1] then begin
x:=c[i];
c[i]:=c[i-1];
c[i-1]:=x; p:=false; end;
until p=true;
begin
j:=0; x:='.';
repeat
j:=j+1;
if c[j]<>x then begin x:=c[j]; g:=g+x; end;
until j=length(c);
end;
end;
if length(g)>1 then
if g[1]='0' then begin
g[1]:=g[2];
g[2]:='0';
end;
writeln(f2,z);
writeln(f2,g);
close(f1);
close(f2);
end.
