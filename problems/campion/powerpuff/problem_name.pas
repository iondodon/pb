program powerpuff;
type numeredusmani=array[1..20] of longint;
  puterifetite=array[0..9] of longint;
  puteridusmani=array[0..9] of longint;
var n,i,x1,x2,x3:longint; d:numeredusmani; pf:puterifetite; pd:puteridusmani;
f1,f2:text;

function razboi(x:longint):longint;
var i,j:longint; s:string;
begin
for i:=1 to n do
begin
for j:=0 to 9 do 
begin
pf[j]:=0; 
pd[j]:=0;
end;
str(x,s);
for j:=1 to length(s) do
inc(pf[ord(s[j])-48]);
str(d[i],s);
for j:=1 to length(s) do
inc(pd[ord(s[j])-48]);
for j:=0 to 9 do
if (pf[j]<>0) and (pd[j]=0) then x:=x+(pf[j]*j);
for j:=0 to 9 do 
if (pd[j]<>0) and (pf[j]=0) then x:=x-(pd[j]*j);
end;
razboi:=x;
end;

begin
assign(f1,'powerpuff.in'); reset(f1);
assign(f2,'powerpuff.out'); rewrite(f2);
readln(f1,x1,x2,x3);
readln(f1,n);
for i:=1 to n do
readln(f1,d[i]);

writeln(f2,razboi(x1)); 
writeln(f2,razboi(x2));
write(f2,razboi(x3));

close(f1);
close(f2);
end.