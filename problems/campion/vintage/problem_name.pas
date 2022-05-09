program vintage;
type cost=array[1..1000] of longint;
        valoare=array[1..1000] of integer;
        rind=array[1..1000] of integer;
var n,k,i,x,y,z,vmax,cmax:longint; co:cost; va:valoare; ri:rind; p:boolean;
f1,f2:text;
begin
assign(f1,'vintage.in'); reset(f1);
assign(f2,'vintage.out'); rewrite(f2);
readln(f1,n,k);
for i:=1 to n do readln(f1,co[i],va[i]); for i:=1 to n do ri[i]:=i;

repeat
p:=false;
if n>1 then
for i:=2 to n do if va[i]>va[i-1] then begin
x:=va[i];         y:=ri[i];            z:=co[i];
va[i]:=va[i-1];   ri[i]:=ri[i-1];       co[i]:=co[i-1];
va[i-1]:=x;         ri[i-1]:=y;          co[i-1]:=z;
p:=true;
end;
until p=false;

repeat
p:=false;
if n>1 then
for i:=2 to n do if (va[i]=va[i-1]) and (co[i]<co[i-1]) then begin
x:=va[i];         y:=ri[i];            z:=co[i];
va[i]:=va[i-1];   ri[i]:=ri[i-1];       co[i]:=co[i-1];
va[i-1]:=x;         ri[i-1]:=y;          co[i-1]:=z;
p:=true;
end;
until p=false;

for i:=1 to k do begin
cmax:=cmax+co[i]; vmax:=vmax+va[i];
end;
writeln(f2,vmax,' ',cmax);
for i:=1 to k do
write(f2,ri[i],' ');



close(f1);
close(f2);
end.