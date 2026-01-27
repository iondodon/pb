program desen1;
type matrice1=array[1..1001, 1..1001] of integer;
matrice2=array[1..1001, 1..1001] of integer;

var n,m,i,j:integer; b:matrice2; a:matrice1;
f1,f2:text;

function stare(i,j:integer):integer;
var c:integer;
begin
c:=0;
if b[i-1,j]+b[i-1,j-1]=1 then  c:=c+1;
if i>2 then if b[i-1,j]+b[i-2,j]=1 then  c:=c+1;
if b[i-1,j]+b[i-1,j+1]=1 then  c:=c+1;
stare:=c;
end;

begin
assign(f1,'desen1.in'); reset(f1);
assign(f2,'desen1.out'); rewrite(f2);
readln(f1,n,m);
for i:=1 to n do begin
for j:=1 to m do read(f1,a[i,j]); readln(f1); end;

for i:=2 to n-1 do
for j:=2 to m-1 do
if stare(i,j)=a[i-1,j] then
       b[i,j]:=b[i-1,j]
     else
       b[i,j]:=1-b[i-1,j];

  
for i:=1 to n do begin
write(f2,'.');
for j:=2 to m do
begin
if b[i,j-1]=b[i,j] then  write(f2,'.')
    else write(f2,'|');
    if b[i+1,j]=b[i,j] then  write(f2,'.')
    else write(f2,'_');
    end;
writeln(f2);
  
end;



close(f1);
close(f2);
end.