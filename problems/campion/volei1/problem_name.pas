Program volei1;
type tabel=array[0..2002] of longint;
 tabelc=array[0..4002] of longint;
 var n,m,k,l:longint;
  f1,f2:text;
  f,b:tabel;
  c:tabelc;

Procedure readdata;
var i:longint;
begin
readln(f1,n);
for i:=1 to n do 
 read(f1,f[i]);
readln(f1);
readln(f1,m);
for i:=1 to m do 
 read(f1,b[i]);
n:=n+1;
f[n]:=f[1];
end;

Procedure qsort(st,dr:longint);
var pivot,i,j,aux:longint;
begin 
pivot:=b[(st+dr) div 2];
i:=st; j:=dr;
while i<=j do
 begin  
 while b[i]<pivot do
  i:=i+1;
 while b[j]>pivot do 
  j:=j-1;
 if i<=j then
  begin
  aux:=b[i];
  b[i]:=b[j];
  b[j]:=aux;
  i:=i+1;
  j:=j-1;
  end;
 end;
if i<dr then 
 qsort(i,dr);
if j>st then
 qsort(st,j);
end;

Procedure run;
var i,j:longint; p:boolean;
begin
k:=0; l:=0;
for i:=1 to n-1 do 
 begin
 l:=l+1;
 c[l]:=f[i];
 j:=1;
 p:=false;
 while (j<=m) and (p=false) do
  begin
  if (b[j]>f[i]) and (b[j]>f[i+1]) and (b[j]<>-1) then
   begin
   k:=k+1;
   l:=l+1;
   c[l]:=-b[j];
   b[j]:=-1;
   p:=true;
   end;
  j:=j+1;
  end;
 end;
end;

Procedure rezultat;
var i:longint;
begin
writeln(f2,k);
for i:=1 to l do  
 write(f2,c[i],' ');
end;

begin
assign(f1,'volei1.in'); reset(f1);
assign(f2,'volei1.out'); rewrite(f2);

readdata;
qsort(1,m);
run;
rezultat;

close(f1);
close(f2);
end.