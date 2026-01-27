program balcon;
type tabel1=array[-1..50, -1..50] of integer;
tabel2=array[-1..3000] of integer;
var n,i,j,u,x,g:integer; inal:tabel1;
f1,f2:text;        ina:tabel2;  p:boolean;
begin   u:=0;
assign(f1,'balcon.in');
assign(f2,'balcon.out');
reset(f1);
rewrite(f2);
readln(f1,n);
for i:=1 to n do begin
for j:=1 to n do begin
read(f1,inal[i,j]); u:=u+1; ina[u]:=inal[i,j]; end;
readln(f1); end;
repeat
p:=true;
for i:=2 to u do
if ina[i]<ina[i-1] then begin
x:=ina[i];
ina[i]:=ina[i-1];
ina[i-1]:=x; p:=false; end;
until p=true;
for i:=1 to n do
for j:=1 to n do
inal[i,j]:=-1;
g:=u;
u:=0; i:=1; j:=0;
repeat
repeat
j:=j+1;
if inal[i,j]=-1 then begin u:=u+1; inal[i,j]:=ina[u]; end;
until (inal[i,j+1]<>-1);
repeat
i:=i+1;
if inal[i,j]=-1 then begin u:=u+1; inal[i,j]:=ina[u]; end;
until (inal[i+1,j]<>-1);
repeat
j:=j-1;
if inal[i,j]=-1 then begin u:=u+1; inal[i,j]:=ina[u]; end;
until (inal[i,j-1]<>-1);
repeat
i:=i-1;
if inal[i,j]=-1 then begin u:=u+1; inal[i,j]:=ina[u]; end;
until (inal[i-1,j]<>-1);
until u=g;
for i:=1 to n do begin 
for j:=1 to n do
write(f2,inal[i,j],' ');
writeln(f2);
end;
close(f1);
close(f2);
end.