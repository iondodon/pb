program sumacifre;
var i,k,suma,n,p,x:longint; s,m,r:string;
f1,f2:text;

begin
assign(f1,'sumacifre.in'); reset(f1);
assign(f2,'sumacifre.out'); rewrite(f2);
read(f1,n,k);
str(n,s);

p:=0; suma:=0;
repeat
m:=''; p:=p+1;
if length(s)=1 then
begin
val(s,x);
end;
if length(s)>1 then
begin
for i:=2 to length(s) do
if ord(s[i])>ord(s[i-1]) then
begin str(ord(s[i])-ord(s[i-1]),r); m:=m+r; end else
begin str(ord(s[i-1])-ord(s[i]),r); m:=m+r; end;
while (length(m)>0) and (m[1]='0') do delete(m,1,1);
val(m,x);
s:=m;
end;
suma:=suma+x;
until (p=k);

write(f2,suma);
close(f1);
close(f2);
end.