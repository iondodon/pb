program cladiri1; uses math;
type     fregventa=array[0..100000] of longint;
var long,lat,int,afectate,i,mmax,x,y,g:longint; fr:fregventa;
f1,f2:text;
begin afectate:=0;
assign(f1,'cladiri1.in'); reset(f1);
assign(f2,'cladiri1.out'); rewrite(f2);
readln(f1,long,lat,int);
while not eof(f1) do begin
readln(f1,x,y,g);
mmax:=Max(abs(x-long),abs(y-lat));
if g<=(int-mmax) then
begin
afectate:=afectate+1;
fr[mmax]:=fr[mmax]+1;
end;
end;
mmax:=MaxValue(fr);
writeln(f2,afectate);
writeln(f2,mmax);
if mmax>0 then
for i:=0 to 10000 do
if fr[i]=mmax then write(f2,i,' ');
close(f1);
close(f2);
end.
