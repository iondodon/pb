program zar;
var f1,f2,f3,u,a,n,k,i:longint;
ff1,ff2:text;
begin 
assign(ff1,'zar.in'); reset(ff1);
assign(ff2,'zar.out'); rewrite(ff2);
readln(ff1,n,k);
read(ff1,f1,f2,f3);

u:=0;
repeat

for i:=1 to n-1  do begin 
if u=k then break;
u:=u+1;
a:=7-f3; f3:=f2; f2:=a;
end;

for i:=1 to n-1 do begin
if u=k then break; 
u:=u+1;
a:=7-f1; f1:=f2; f2:=a;
end;

for i:=1 to n-1 do begin 
if u=k then break;
u:=u+1;
a:=7-f2; f2:=f3; f3:=a;
end;

for i:=1 to n-1 do begin 
if u=k then break;
u:=u+1;
a:=7-f2; f2:=f1; f1:=a;
end;

if u=k then break;
until u=k;

write(ff2,f1,' ',f2,' ',f3);
close(ff1);
close(ff2);
end.