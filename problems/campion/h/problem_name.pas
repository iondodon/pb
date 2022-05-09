program h;
var n,i,g,s:longint;
f1,f2:text;
begin
assign(f1,'h.in'); reset(f1);
assign(f2,'h.out'); rewrite(f2);
read(f1,n); g:=0;
for i:=1 to (4*n) do
g:=g+i;
g:=g div 2;
s:=0;
for i:=(4*n) downto 1 do begin
s:=s+i;
if s<=g then write(f2,i,' ');
if s>g then s:=s-i;
if s=g then break; end;
close(f1);
close(f2);
end.