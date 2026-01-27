program pepsi;
type tip=array[1..1000] of longint;
volum=array[1..1000] of longint;
final=array[1..1000] of longint;
sol=array[1..1000] of longint;
aa=array[1..1000] of longint;

var np,ns,vin,i,j,max,min,u:longint; ti:tip; v:volum; fi:final; s:sol;
f1,f2:text; c:char; a:aa;

begin
assign(f1,'pepsi.in'); reset(f1);
assign(f2,'pepsi.out'); rewrite(f2);
readln(f1,np,ns,vin);
for i:=1 to np do begin read(f1,c);
if c='E' then ti[i]:=0 else ti[i]:=1; end;
readln(f1);
for i:=1 to ns do read(f1,fi[i]);
for i:=1 to ns do v[i]:=vin;

for i:=1 to np do begin
if ti[i]=0 then begin
min:=999999;
for u:=1 to ns do
if (fi[u]<min) and (fi[u]+a[u]<vin) then min:=fi[u];
for j:=1 to ns do
if (fi[j]=min) and (fi[j]+a[j]<vin) then begin s[i]:=j; a[j]:=a[j]+1; break; end;
end;
if ti[i]=1 then begin
max:=0;
for u:=ns downto 1 do
if (fi[u]>max) and (fi[u]+a[u]<vin) then max:=fi[u];
for j:=ns downto 1 do
if (fi[j]=max) and (fi[j]+a[j]<vin) then begin s[i]:=j; a[j]:=a[j]+1; break; end;
end;

end;



for i:=1 to np do write(f2,s[i],' ');
close(f1);
close(f2);
end.