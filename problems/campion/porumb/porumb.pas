program porumb;
type q=array[1..100] of integer;
var a:q;
    i,n,t,m,ds,dd : integer;
  f1,f2:text;
begin
 assign(f1,'porumb.in');
 assign(f2,'porumb.out');
reset(f1);
rewrite(f2);
 read(f1,n,m);
 for i:=1 to n do read(f1,a[i]);
 t:=0;
 for i:=1 to n do t:=t+a[i];
 t:=t+n-1;
 ds:=m-1;
 dd:=n-m;
 if ds<dd then t:=t+ds else t:=t+dd;
 write(f2,t);
 close(f1);
close(f2);
end.