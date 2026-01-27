program meteo;
type tabel=array[1..1002] of integer;

var i,nrmax,ii,nr,aux:longint; t:tabel;
f1,f2:text;

begin
assign(f1,'meteo1.in'); reset(f1);
assign(f2,'meteo1.out'); rewrite(f2);
readln(f1,nr);
for i:=1 to nr do read(f1,t[i]);
t[nr+1]:=t[nr];

ii:=0; nrmax:=0; aux:=0;
for i:=2 to nr+1 do
if ((t[i]>=0) and (t[i-1]<0)) or ((t[i]<0) and (t[i-1]>=0)) then
aux:=aux+1 else
begin
if aux>=nrmax then begin nrmax:=aux; ii:=i-nrmax; end;
aux:=0;
end;

if nrmax=0 then write(f2,0) else begin
writeln(f2,nrmax+1);
for i:=ii-1 to ii+nrmax-1 do write(f2,t[i],' ');
end;

close(f1);
close(f2);
end.