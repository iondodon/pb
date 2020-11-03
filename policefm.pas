program policefm;
var p:qword; i:longint; n,u:string;
f1,f2:text;
begin
assign(f1,'policefm.in'); reset(f1);
assign(f2,'policefm.out'); rewrite(f2);
read(f1,p);

n:='';
if p=0 then write(f2,10) else 
begin 
for i:=9 downto 2 do
if (p mod i=0) and (p<>1) then
while (p mod i=0) do
begin  
p:=p div i;
str(i,u);
n:=u+n;
end;
if p<>1 then write(f2,0) else write(f2,n);
end;
close(f1);
close(f2);
end.
