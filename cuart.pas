program cuart;
type tabelg=array[1..1001] of longint;
tabelm=array[1..1001] of longint;

var n,pnrg,cug,pnrm,cum,i,j,tip,x,k,uu,omis:longint;
f1,f2:text; tg:tabelg; tm:tabelm; s,s1:string; p:boolean;

begin cug:=0; cum:=0; omis:=0;
assign(f1,'cuart.in'); reset(f1);
assign(f2,'cuart.out'); rewrite(f2);
readln(f1,tip);
readln(f1,n);
for i:=1 to n do read(f1,tg[i]);
for i:=1 to n do read(f1,tm[i]);

p:=false;
for i:=1 to n do begin
str(tg[i],s); s1:='';
for j:=1 to length(s) do
if ((ord(s[j]))-48) mod 2<>0 then s1:=s1+s[j];
val(s1,x);
if p=false then
if (x<>0) then begin pnrg:=x; p:=true; end;
if x=0 then if tg[i]>omis then omis:=tg[i];
if x<>0 then begin
uu:=0; k:=1;
repeat
uu:=uu+k;
k:=k+4;
until uu>=x;

if uu=x then cug:=cug+1;
end;
end;



p:=false;
for i:=1 to n do  begin
str(tm[i],s); s1:='';
for j:=1 to length(s) do
if ((ord(s[j]))-48) mod 2=0 then s1:=s1+s[j];
val(s1,x);
if p=false then
if (x<>0) then begin pnrm:=x; p:=true; end;
if x=0 then if tm[i]>omis then omis:=tm[i];
if x<>0 then begin
uu:=0; k:=1;
repeat
uu:=uu+k;
k:=k+4;
until uu>=x;

if uu=x then cum:=cum+1;
end;
end;



if tip=1 then write(f2,omis) else
if tip=2 then begin
if cug>cum then writeln (f2,1) else
if cum>cug then writeln (f2,2) else
if pnrg>pnrm then writeln (f2,1) else
if pnrm>pnrg then writeln (f2,2) else
writeln (f2,0);
end else begin
if cug>cum then writeln (f2,cug) else
if cum>cug then writeln (f2,cum) else
if pnrg>pnrm then writeln (f2,pnrg) else
if pnrm>pnrg then writeln (f2,pnrm) else
writeln (f2,0);
end;


close(f1);
close(f2);
end.
