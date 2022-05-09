program covor1;
var n,k,p,rmax,r,u,i,indmin:longint;
f1,f2:text; q:boolean;

begin
assign(f1,'covor1.in'); reset(f1);
assign(f2,'covor1.out'); rewrite(f2);
readln(f1,n,k);
read(f1,p);
while 2*rmax*(rmax+1)-(rmax-1)<=n do rmax:=rmax+1;
rmax:=rmax-1;
if p=1 then write(f2,rmax) else   //numarul maxim de romburi
begin

r:=0; u:=0; q:=false;
for i:=1 to rmax+1 do  //dus
begin
if sqr(i)-i+1>=k then begin indmin:=i-1; q:=true; break; end;
end;

if q=false then       //intors
begin
u:=sqr(rmax+1)-(rmax+1)+1;
r:=rmax+1;
repeat
r:=r-1;
u:=u+(4*r div 2)-1;
if k<=u then begin indmin:=r; q:=true; break; end;
until (r=0) or (q=true);
end;


write(f2,indmin);
end;
close(f1);
close(f2);
end.