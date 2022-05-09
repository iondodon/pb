program prieteni2;
type tabel=array[1..1000] of integer;
var n,i,x:integer; p:boolean;
t:tabel; s:longint;
f1,f2:text;
begin s:=0;
assign(f1,'prieteni2.in');
assign(f2,'prieteni2.out');
reset(f1);
rewrite(f2);
readln(f1,n);
for i:=1 to n do readln(f1,t[i]);
if n>2 then begin
repeat
p:=true;
for i:=2 to n do
if t[i]<t[i-1] then begin
p:=false;
x:=t[i]; t[i]:=t[i-1];
t[i-1]:=x; end;
until p=true;
for i:=2 to n do
s:=s+t[i];
s:=s+(t[1]*(n-2));
end;
if n=2 then begin
if t[1]>t[2] then s:=t[1];
if t[2]>t[1] then s:=t[2];
if t[1]=t[2] then s:=t[1]; end;
if n=1 then s:=t[1];
write(f2,s);
close(f1);
close(f2);
end.