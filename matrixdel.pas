program matrixdel;
type tabel1=array[1..1000, 1..1000] of integer;
type tabel2=array[1..1000] of integer;
var i,j,nl,nc,e,a,b,l,c:integer;
nr:tabel1; 
li,co:tabel2;
f1,f2:text;
begin 
assign(f1,'matrixdel.in');
assign(f2,'matrixdel.out');
reset(f1);
rewrite(f2);
readln(f1,l,c);
for i:=1 to l do begin 
for j:=1 to c do 
read(f1,nr[i,j]); readln(f1); end; 
readln(f1,nl);
for i:=1 to nl do read(f1,li[i]);
readln(f1,nc);
for i:=1 to nc do read(f1,co[i]);

for i:=1 to l do begin
for j:=1 to c do begin 
a:=0; b:=0;
for e:=1 to nl do if li[e]=i then a:=a+1;
for e:=1 to nc do if co[e]=j then b:=b+1;
if (a=0) and (b=0) then begin write(f2,nr[i,j],' '); end; 
end;
if a=0 then begin writeln(f2); end;
end;

close(f1);
close(f2);
end.
