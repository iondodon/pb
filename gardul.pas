program gardul;
var i,n,p,q,na,nv,nr,l:longint;
f1,f2:text;
begin na:=0; nv:=0; nr:=0;
assign(f1,'gardul.in');
assign(f2,'gardul.out');
reset(f1);
rewrite(f2);
readln(f1,n);
read(f1,p,q);
for i:=1 to n do
if (i mod p=0) and (i mod q=0) then nv:=nv+1;
na:=(n div q)-nv;
nr:=(n div p)-nv;
l:=(n-((n div p)+(n div q)))+nv;
writeln(f2,l);
writeln(f2,nr);
writeln(f2,na);
writeln(f2,nv);
close(f1);
close(f2);
end.