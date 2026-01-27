program numere7;
type tabel=array[0..250000] of integer;
var v,n,i,j,max,min:longint; t:tabel;
f1,f2:text;
begin
assign(f1,'numere7.in'); reset(f1);
assign(f2,'numere7.out'); rewrite(f2);
readln(f1,n);

for i:=1 to n do    //citire date si formarea tabloului
begin 
for j:=1 to n do  
begin
read(f1,v);
t[v]:=1;
end;
readln(f1);
end;

for i:=1 to sqr(n) do   //gasire min 
if t[i]=0 then 
begin
min:=i;
break;
end;

for i:=sqr(n) downto 1 do   //gasire max
if t[i]=0 then 
begin
max:=i;
break;
end;

write(f2,min,' ',max); //afisare rezultat

close(f1);
close(f2);
end.