program zid;
type vector1=array[1..1000] of longint;
	vector2=array[1..1000] of longint;
var n,i,j,sum,u:longint; h:vector1; r:vector2; p:boolean;
f1,f2:text;
begin
assign(f1,'zid.in'); reset(f1);
assign(f2,'zid.out'); rewrite(f2);
readln(f1,n);

sum:=0;             //creare vector pentru resturi
for i:=1 to n do 
begin
read(f1,h[i]);
sum:=sum+h[i];
r[i]:=sum mod n;
end;

p:=false;          //solutia daca este macar un rest de zero
for i:=1 to n do 
if r[i]=0 then
begin
p:=true;
writeln(f2,i);
for j:=1 to i do 
write(f2,h[j],' ');
end;

if p=false then    //solutia daca nu este nici un rest de zero
begin
for i:=1 to n-1 do
for j:=i+1 to n do 
if r[i]=r[j] then 
begin
writeln(f2,j-i);
for u:=i+1 to j do 
write(f2,h[u],' ');
break;
end;
end;

close(f1);
close(f2);
end.