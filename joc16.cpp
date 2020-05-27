program joc16;
type tabel=array[1..50000] of longint;
var n,r,b,t,i,x,y,ns:longint; l:tabel;
f1,f2:text; p:boolean;
begin
assign(f1,'joc16.in'); reset(f1);
assign(f2,'joc16.out'); rewrite(f2);
read(f1,n,x,y);

r:=n+1; b:=1; l[1]:=12; ns:=0;
repeat
p:=false;
b:=b+x; r:=r-y;
if b>n then b:=b-n;
if r<1 then r:=n+r;
if (l[b]=21) or (l[b]=12) or (l[r]=12) or (l[r]=21) then p:=true;
if l[b]=1 then p:=true;
if l[r]=2 then p:=true;
if l[b]=2 then l[b]:=l[b]*10+1;
if l[b]=1 then l[b]:=l[b]*10+2;
if l[b]=0 then l[b]:=1;
if l[r]=0 then l[r]:=2;
ns:=ns+1;
until (p=true) or (r=b);

for i:=1 to n do if l[i]=0 then t:=t+1;

write(f2,t,' ',ns,' ',b,' ',r);
close(f1);
close(f2);
end.
