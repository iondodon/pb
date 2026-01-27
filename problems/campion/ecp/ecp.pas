program ecp;
type tabel=array[1..1001] of char;
var doi,tre,ci,i,l:longint;
f1,f2:text; c:tabel;
begin doi:=0; tre:=0; ci:=0; i:=0;
assign(f1,'ecp.in'); reset(f1);
assign(f2,'ecp.out'); rewrite(f2);
for l:=1 to 1001 do begin
read(f1,c[l]);
if c[l]='' then break;
end;

for i:=1 to l-1 do begin
if (c[i]='(') and (c[i+1]<>')') then inc(doi,2);
if (c[i]='(') and (c[i+1]=')') then inc(doi);
if (c[i]='[') and (c[i+1]<>']') then inc(tre,3);
if (c[i]='[') and (c[i+1]=']') then inc(tre);
if (c[i]='{') and (c[i+1]<>'}') then inc(ci,5);
if (c[i]='{') and (c[i+1]='}') then inc(ci);
end;

write(f2,doi,' ',tre,' ',ci);

close(f1);
close(f2);
end.