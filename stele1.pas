program stele1;
var n,k,c,r,m:int64;
f1,f2:text;
begin c:=0;
assign(f1,'stele1.in'); reset(f1);
assign(f2,'stele1.out'); rewrite(f2);
read(f1,k,n);
r:=sqr(k)-k+1;
repeat c:=c+1; until sqr(c)>=n;
m:=sqr(c)-n+1;
writeln(f2,r);
write(f2,c,' ',m);
close(f1);
close(f2);
end.
