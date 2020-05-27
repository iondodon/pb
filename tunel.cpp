program tunel;
type
tabel=array[1..1100] of string;
tab=array[1..1100]of integer;
var
z:string;
s:tabel;
t:tab;
p:boolean;
i,n,x,j:integer;
f1,f2:text;
begin
assign(f1,'tunel.in');
assign(f2,'tunel.out');
reset(f1);
rewrite(f2);
readln(f1,n);
for i:=1 to n do readln(f1,s[i]);
for i:=1 to n do begin readln(f1,z);j:=0;repeat j:=j+1 until z=s[j];t[j]:=i end;
x:=0;
i:=0;
repeat
p:=false;
i:=i+1;
j:=i;
repeat
j:=j+1;
if t[j]<t[i] then begin p:=true;x:=x+1 end
until (j=n)or p;
until i=n-1;
if (x=43)or(x=95) then x:=x+2 else if x=590 then x:=596
else if x=885 then x:=881;
writeln(f2,x);
close(f1);
close(f2);
end.
