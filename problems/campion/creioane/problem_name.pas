program creioane;
type tabel1=array[1..9000] of longint;
     tabel2=array[1..9000] of longint;
  frecventa=array[1..9000] of longint;
 
var n,i,max,k:longint; a:tabel1; b:tabel2; fr:frecventa;
f1,f2:text;

begin
assign(f1,'creioane.in'); reset(f1);
assign(f2,'creioane.out'); rewrite(f2);
readln(f1,n);
for i:=1 to n do readln(f1,a[i],b[i]);

for i:=1 to n do  begin
fr[i]:=0;
k:=i;
while k<>0 do begin
k:=a[k];
inc(fr[i]);

end;
end;

max:=0;
for i:=1 to 9000 do
if fr[i]>max then max:=fr[i];

write(f2,max);
close(f1);
close(f2);
end.