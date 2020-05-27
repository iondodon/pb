program grupe1;
type tabel1=array[1..200] of integer;
type tabel2=array[1..200, 1..200] of integer;
var ng,i,j,n:integer; nm,nf,nb:tabel1; s:string;
f1,f2:text;        p,q:boolean;  e:tabel2;
begin p:=true; q:=true;
assign(f1,'grupe1.in');
assign(f2,'grupe1.out');
reset(f1);
rewrite(f2);
readln(f1,n,ng);
readln(f1,s);
for i:=1 to ng do begin
read(f1,nm[i]);
if i>1 then
if (nm[i]-nm[i-1]>=2) or (nm[i-1]-nm[i]>=2) then p:=false;
for j:=1 to nm[i] do read(f1,e[i,j]);
readln(f1);
end;
for i:=1 to ng do begin
for j:=1 to nm[i] do begin
if s[e[i,j]]='f' then nf[i]:=nf[i]+1;
if s[e[i,j]]='b' then nb[i]:=nb[i]+1; end;
if (nf[i]-nb[i]>1) or (nb[i]-nf[i]>1) then q:=false
end;
for i:=1 to ng do writeln(f2,nb[i],' ',nf[i]);
if (p=true) and (q=true) then write(f2,'DA');
if (p=false) or (q=false) then write(f2,'NU');
close(f1);
close(f2);
end.
