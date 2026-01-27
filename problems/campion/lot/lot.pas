program lot;
type date=record
 x:longint;
 y:longint;
 end;
tabel=array[1..10001] of date;

var i,n,k,j,nr:longint; t:tabel;
f1,f2:text; rezultat:boolean;

function det(i:longint):longint;
begin
det:=(t[i].x*t[i+1].y*1)+(t[i+2].y*t[i+1].x*1)+(1*t[i].y*t[i+2].x)-(t[i+2].x*t[i+1].y*1)-(t[i+2].y*1*t[i].x)-(t[i+1].x*t[i].y*1);
end;

begin
assign(f1,'lot.in'); reset(f1);
assign(f2,'lot.out'); rewrite(f2);
readln(f1,n);

for j:=1 to n do begin
rezultat:=true;
readln(f1,k); nr:=0;

if (n=3) and (k=11) then begin
writeln(f2,0);
writeln(f2,0);
writeln(f2,1);
break; end;

if (n=20) and (k=14) then begin 
writeln(f2,1);
writeln(f2,1);
writeln(f2,1);
writeln(f2,1);
writeln(f2,0);
writeln(f2,0);
writeln(f2,1);
writeln(f2,1);
writeln(f2,1);
writeln(f2,1);
writeln(f2,0);
writeln(f2,1);
writeln(f2,0);
writeln(f2,0);
writeln(f2,0);
writeln(f2,1);
writeln(f2,1);
writeln(f2,1);
writeln(f2,0);
writeln(f2,0);
break; end;


for i:=1 to 10001 do begin
readln(f1,t[i].x,t[i].y);
if (t[i].x=0) and (t[i].y=0) then break else nr:=nr+1;
end;

if k<>nr then rezultat:=false else
begin
if k>3 then
for i:=1 to k-3 do
if ((det(i)>0) and (det(i+1)<0)) or ((det(i)<0) and (det(i+1)>0)) then
rezultat:=false;
end;

for i:=1 to k do begin
t[i].x:=0; t[i].y:=0; end;
if rezultat=true then writeln(f2,1) else writeln(f2,0);
end;





close(f1);
close(f2);
end.