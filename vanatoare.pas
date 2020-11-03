program vanatoare;
var sa,sn,a,b,c,u:longint; p:boolean;
f:text;
begin assign(f,'vanatoare.in'); reset(f);
readln(f,sa); readln(f,sn); close(f);

a:=0; b:=1; u:=0;
repeat
p:=false;
c:=a+b;
a:=b; b:=c;
if c mod 2=0 then
if (c div 2<=sa) and (c div 2<=sn) then  begin sa:=sa-(c div 2); sn:=sn-(c div 2); u:=u+1; p:=true; end;
if c mod 2<>0 then
if ((c div 2)+1<=sa) and (c div 2<=sn) then begin sa:=sa-((c div 2)+1); sn:=sn-(c div 2); u:=u+1; p:=true; end;
until p=false;

assign(f,'vanatoare.out'); rewrite(f);
writeln(f,u); writeln(f,sa); writeln(f,sn);
close(f);
end.
