program bile;
var
ta:array[1..2000] of integer;
tb:array[0..2000] of integer;
tc:array[1..2000] of integer;
tv:array[1..2000] of integer;
n,i,j,g,l:integer;     fo:ansistring;   p,q:boolean;
f1,f2:text;
begin          g:=0;  fo:='';   l:=0;     p:=true;
  assign(f1,'bile3.in'); reset(f1);
  assign(f2,'bile3.out'); rewrite(f2);
  readln(f1,n);
  for i:=1 to n do read(f1,ta[i]); readln(f1);
  for i:=1 to n do read(f1,tv[i]);

for i:=1 to n do begin
    if tb[g]=tv[i] then begin fo:=fo+'O'; l:=l+1; tc[l]:=tb[g]; tb[g]:=0; g:=g-1; end else
    begin p:=false; q:=false;
    for j:=1 to n do begin
    if (ta[j]<>tv[i]) and (ta[j]<>0) then
    begin fo:=fo+'I'; g:=g+1; tb[g]:=ta[j]; ta[j]:=0; end else
	if ta[j]<>0 then
    begin fo:=fo+'IO'; l:=l+1; tc[l]:=ta[j]; ta[j]:=0; p:=true; q:=true; end;
	if q=true then break;
end;
end;
if p=false then break;
end;

if p=false then write(f2,'imposibil') else
write(f2,fo);

close(f1);
close(f2);
end.
