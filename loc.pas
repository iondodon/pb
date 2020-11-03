program loc;
type tabel=array[1..1001] of integer;
tabel1=array[1..1000] of integer;
var l:tabel; n,i,f,g,u,r:integer; s:tabel1; p:boolean;
f1,f2:text;
begin f:=0; u:=1; r:=0;
assign(f1,'loc.in'); reset(f1);
assign(f2,'loc.out'); rewrite(f2);
readln(f1,n);
for i:=1 to n do readln(f1,l[i]);
repeat
r:=r+1;
p:=true;
for i:=1 to n do begin
if l[i]<>i then p:=false;
if l[i]<>i then break; end;
if p=false then repeat 
if (l[i]<>i) and (l[i]<>0) then 
begin f:=f+1; s[f]:=l[i]; g:=i; i:=l[i]; l[g]:=0; end;
until l[i]=0;
for i:=1 to f do l[s[i]]:=s[i];
f:=0;
until p=true;
write(f2,r-1);
close(f1);
close(f2);
end.