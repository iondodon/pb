Program echer; uses math;
var x,y,m,n,l1,l2,mi,ma,p,k,i:longint;
f1,f2:text;
begin
assign(f1,'echer.in'); reset(f1);
assign(f2,'echer.out'); rewrite(f2);
readln(f1,p);
read(f1,l1,l2,m,n);
x:=m div l1;
y:=n div l2;
mi:=min(x,y);
ma:=max(x,y);

if x=y then k:=(3*x)-2;
if ma-mi=1 then k:=3*mi-1;
if (ma-mi>1) and ((ma-mi) mod 2=0) then k:=3*mi-2+2*(ma-mi);
if (ma-mi>1) and ((ma-mi) mod 2<>0) then k:=3*mi-3+2*(ma-mi);

if p=1 then write(f2,k) else
begin
write(f2,'1 '); k:=k-1;
for i:=1 to mi-1 do begin write(f2,'2 3 1 '); k:=k-3; end;
if x-y=1 then begin write(f2,4); k:=k-1; end else if y-x=1 then begin write(f2,2); k:=k-1; end else 
if x-y>1 then begin
for i:=1 to k div 4 do begin  write(f2,'4 6 3 1 '); k:=k-4; end;
if k=1 then begin  write(f2,4); k:=k-1; end;
end else 
if y-x>1 then begin
for i:=1 to k div 4 do begin write(f2,'2 7 5 1 '); k:=k-4; end;
if k=1 then begin write(f2,2); k:=k-1; end;
end;
end;



close(f1);
close(f2);
end.
