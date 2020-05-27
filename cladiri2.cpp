program cladiri;
type tabel=array[1..10000] of longint;
var i,j,u,ncm,eg,n,g,m,l:longint;
s,cm,z:string;
nr:tabel;
f1,f2:text;
begin cm:='0'; ncm:=0; eg:=0; u:=0; l:=0;
assign(f1,'cladiri2.in');
assign(f2,'cladiri2.out');
reset(f1);
rewrite(f2);
readln(f1,n);
for i:=1 to n do
readln(f1,nr[i]);
for i:=1 to n do
begin
str(nr[i],s);
for j:=1 to length(s) do
if (s[j])>(cm) then cm:=s[j];
end;
for i:=1 to n do begin
str(nr[i],s); u:=0;
for j:=1 to length(s) do
if s[j]=cm then u:=u+1;
if u>0 then ncm:=ncm+1;
end;
for i:=1 to n do begin
str(nr[i],s); z:='';
for j:=1 to length(s) do
z:=s[j]+z;
if z=s then eg:=eg+1;
end;
for i:=1 to n do begin
str(nr[i],s); j:=0;
repeat
j:=j+1;
if s[j]>s[length(s)-j+1] then begin
val(s[j],g); val(s[length(s)-j+1],m);
l:=l+(g-m); end;
if s[j]<s[length(s)-j+1] then begin
val(s[j],g);
val(s[length(s)-j+1],m);
l:=l+(m-g); end;
until j=(length(s) div 2);
end;
writeln(f2,cm,' ',ncm);
writeln(f2,eg);
writeln(f2,l);
close(f1);
close(f2);
end.







