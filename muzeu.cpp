program muzeu;
var aa,bb,a,b,m,k,i:longint;
f1,f2:text;
begin
assign(f1,'muzeu.in'); reset(f1);
assign(f2,'muzeu.out'); rewrite(f2);
readln(f1,m,k);
aa:=k; bb:=0;
for i:=1 to m do 
begin
readln(f1,a,b);
if (b>=bb) then begin aa:=aa-(b-bb); bb:=b; end;
if (b<bb) and (a>=bb-b) then begin aa:=aa+(bb-b); bb:=b; end;
if (b<bb) and (a<bb-b) then begin bb:=bb-a; aa:=aa+a; end;
end;

write(f2,aa);
close(f1);
close(f2);
end.