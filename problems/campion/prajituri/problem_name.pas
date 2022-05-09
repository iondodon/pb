program prajituri;
type    fri=array[0..100] of integer;
  frd=array[0..100] of integer;

var si,sd:ansistring; i,n,m,st,dr,nr,min,il,da:longint;
f1,f2:text; fi:fri; fd:frd;

begin nr:=0; min:=32000;   si:=''; sd:='';
assign(f1,'prajituri.in'); reset(f1);
assign(f2,'prajituri.out'); rewrite(f2);
readln(f1,n,m);
for i:=1 to n do begin read(f1,il); inc(fi[il]); si:=si+chr(il+48); end; readln(f1);
for i:=1 to m do begin read(f1,da); inc(fd[da]); sd:=sd+chr(da+48); end;

st:=pos(sd,si)-1; dr:=(length(si)-(pos(sd,si)+length(sd)-1));

while pos(sd,si)<>0 do begin
nr:=nr+1;
si[pos(sd,si)]:='0';
end;

for i:=1 to 100 do
if fd[i]<>0 then
if fi[i] div fd[i]<min then min:=fi[i] div fd[i];


writeln(f2,st,' ',dr);
writeln(f2,nr);
writeln(f2,min);




close(f1);
close(f2);
end.