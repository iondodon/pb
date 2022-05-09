program lightbot; uses math;
type tabel=array[1..400000] of longint;
frecventa=array[0..200000] of longint;
trecut=array[1..200000] of longint;
var i,niv,p,nrp,max,n:longint;
f1,f2:text; fr:frecventa; x:tabel;  pas:trecut;
begin
assign(f1,'lightbot.in'); reset(f1);
assign(f2,'lightbot.out'); rewrite(f2);
readln(f1,p);
readln(f1,niv);
i:=0;
repeat
i:=i+1;
read(f1,x[i]);
inc(fr[x[i]]);
until x[i]=0;
n:=i-1;


nrp:=0; i:=0;
repeat
i:=i+1;
if (x[i+1]=x[i]+2) then
begin
nrp:=nrp+1;
pas[nrp]:=x[i]+1;
i:=i+1;
end;
until i>n;

if p=1 then write(f2,nrp) else
if p=2 then begin
max:=maxvalue(fr);
for i:=maxvalue(x) downto 1 do
if fr[i]=max then begin write(f2,i); break; end;
end else
begin
for i:=1 to nrp do
write(f2,pas[i],' ');
end;

close(f1);
close(f2);
end.