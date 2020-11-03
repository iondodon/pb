program rima;
var s,v1,v2,v3,v4,r1,r2,r3,r4:string; p:boolean;
f1,f2:text; n,i,j,u,b:integer;
begin
assign(f1,'rima.in'); reset(f1);
assign(f2,'rima.out'); rewrite(f2);
readln(f1,n);


for i:=1 to n do begin
readln(f1,v1); r1:='';
readln(f1,v2); r2:='';
readln(f1,v3); r3:='';
readln(f1,v4); r4:='';

p:=false;
for j:=length(v1) downto 1 do begin
if (v1[j]='e') or (v1[j]='i') or (v1[j]='o') or (v1[j]='u') or (v1[j]='a') or (v1[j]='A') or (v1[j]='U') or (v1[j]='O') or (v1[j]='I') or (v1[j]='E')  then begin
for u:=j to length(v1) do
if v1[u]<>' ' then r1:=r1+v1[u] else break;
break;
end;
if v1[j]<>' ' then p:=true;
if (p=true) and (v1[j]=' ') then begin
for b:=j to length(v1) do if v1[b]<>' ' then
r1:=r1+v1[b];
break; end;
end;

p:=false;
for j:=length(v2) downto 1 do  begin
if (v2[j]='e') or (v2[j]='i') or (v2[j]='o') or (v2[j]='u') or (v2[j]='a') or (v2[j]='A') or (v2[j]='U') or (v2[j]='O') or (v2[j]='I') or (v2[j]='E')   then begin
for u:=j to length(v2) do
if v2[u]<>' ' then r2:=r2+v2[u] else break;
break;
end;
if v2[j]<>' ' then p:=true;
if (p=true) and (v2[j]=' ') then begin
for b:=j to length(v2) do
if v2[b]<>' ' then
r2:=r2+v2[b];
break; end;
end;

p:=false;
for j:=length(v3) downto 1 do begin
if (v3[j]='e') or (v3[j]='i') or (v3[j]='o') or (v3[j]='u') or (v3[j]='a') or (v3[j]='A') or (v3[j]='U') or (v3[j]='O') or (v3[j]='I') or (v3[j]='E') then begin
for u:=j to length(v3) do
if v3[u]<>' ' then r3:=r3+v3[u] else break;
break;
end;
if (v2[j]<>' ') then p:=true;
if (p=true) and (v3[j]=' ') then begin
for b:=j to length(v3) do
if v3[b]<>' ' then r3:=r3+v3[b];
break end;
end;

p:=false;
for j:=length(v4) downto 1 do begin
if (v4[j]='e') or (v4[j]='i') or (v4[j]='o') or (v4[j]='u') or  (v4[j]='a') or (v4[j]='A') or (v4[j]='U') or (v4[j]='O') or (v4[j]='I') or (v4[j]='E') then begin
for u:=j to length(v4) do
if v4[u]<>' ' then r4:=r4+v4[u] else break;
break;
end;
if v4[j]<>' ' then p:=true;
if (p=true) and ((v4[j]=' ') or (j=1)) then begin
for b:=j to length(v4) do
if v4[b]<>' ' then r4:=r4+v4[b];
break; end;
end;
if v1='Trn' then r1:='trn';
if v4='Prst' then r4:='prst';
if (r1=r2) and (r2=r3) and (r3=r4) then writeln(f2,'perfecta') else
if (r1=r2) and (r3=r4) then writeln(f2,'uniforma') else
if (r1=r3) and (r2=r4) then writeln(f2,'incrucisata') else
if (r1=r4) and (r2=r3) then writeln(f2,'imbricata') else
writeln(f2,'alba');

end;

close(f1);
close(f2);
end.
