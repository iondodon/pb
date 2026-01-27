program prodmax;
var nr,s1,s2:string; n1,n2,i,j,aux,auxx:longint; prod:longint; p:boolean;
f1,f2:text;
begin n1:=0; n2:=0; prod:=0; s1:=''; s2:='';
assign(f1,'prodmax.in');
assign(f2,'prodmax.out');
reset(f1);
rewrite(f2);
read(f1,nr);
if length(nr)>2 then begin
for i:=1 to length(nr)-1 do begin
for j:=1 to i do s1:=s1+nr[j];
for j:=i+1 to length(nr) do s2:=s2+nr[j];
if (s2[1]<>'0') then begin
val(s1,n1); val(s2,n2);
if n1*n2>prod then begin prod:=n1*n2; aux:=n1; auxx:=n2; end;
if n1*n2=prod then
if n1>aux then begin n1:=aux; n2:=auxx; end;
end;
s1:=''; s2:='';
end;
p:=true;
for i:=2 to length(nr) do
if nr[i]<>'0' then p:=false;
if p=true then begin 
val(nr[1],n1); n2:=0; prod:=0; aux:=n1; auxx:=n2;   end;
end;
if length(nr)=2 then begin
if (nr[1]='0') or (nr[2]='0') then begin 
val(nr[1],n1); val(nr[2],n2);
prod:=0; aux:=n1; auxx:=n2; end;
if (nr[1]<>'0') and (nr[2]<>'0') then begin 
val(nr[1],n1); val(nr[2],n2);
prod:=n1*n2; aux:=n1; auxx:=n2; end;
end;
writeln(f2,prod);
writeln(f2,aux);
write(f2,auxx);
close(f1);
close(f2);
end.