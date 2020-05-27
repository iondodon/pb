program joc13;
type casute=array[1..101] of longint;
     aruncarezar=array[1..1000] of longint;
var n,m,i,j,p1,p2,loc1,loc2:longint; z:aruncarezar; c:casute; p:boolean;
f1,f2:text;
begin
assign(f1,'joc13.in'); reset(f1);
assign(f2,'joc13.out'); rewrite(f2);
readln(f1,n);
for i:=1 to n do read(f1,c[i]);
readln(f1);
readln(f1,m);
for i:=1 to m do read(f1,z[i]);





p1:=0; p2:=0; loc1:=1; loc2:=1; i:=0; p:=false; 
repeat
i:=i+1;
if i mod 2=1 then
begin
if loc1+z[i]<=n then
loc1:=loc1+z[i] else loc1:=loc1+z[i]-n;
if c[loc1]=0 then begin p1:=0; loc1:=1; end else
p1:=p1+c[loc1];
if (loc1=1) and (p1<>0) then
begin
writeln(f2,1);
writeln(f2,loc1,' ',p1);
writeln(f2,loc2,' ',p2);
p:=true;
break;
end;
if (loc1=loc2) and (loc2<>1) then begin p1:=0; loc1:=1; end;
end else
begin
if loc2+z[i]<=n then
loc2:=loc2+z[i] else loc2:=loc2+z[i]-n;
if c[loc2]=0 then begin p2:=0; loc2:=1; end else
p2:=p2+c[loc2];
if (loc2=1) and (p2<>0) then
begin
writeln(f2,2);
writeln(f2,loc1,' ',p1);
writeln(f2,loc2,' ',p2);
p:=true;
break;
end;
if (loc2=loc1) and (loc1<>1) then begin p2:=0; loc2:=1; end;
end;
until i=m;







if p=false then
begin
if p1>p2 then writeln(f2,1) else
if p1<p2 then writeln(f2,2) else
if p1=p2 then
if loc1>loc2 then writeln(f2,1) else
if loc1<loc2 then writeln(f2,2);

writeln(f2,loc1,' ',p1);
writeln(f2,loc2,' ',p2);
end;






close(f1);
close(f2);
end.
