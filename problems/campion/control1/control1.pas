program control1;
var a,b,c,i,j,sum,x,r:longint; s:string;
q:boolean;
f1,f2:text;
begin
assign(f1,'control1.in'); reset(f1);
assign(f2,'control1.out'); rewrite(f2);
read(f1,a,b,c);

q:=false;
for i:=a to b do
 begin
                str(i,s);
  sum:=11;
  while sum>10 do
   begin
    sum:=0;
    for j:=1 to length(s) do
     sum:=sum+(ord(s[j])-48);
    str(sum,s);
   end;
 if sum=c then 
  begin
   x:=i;
   q:=true;
   break;
  end;
 end;

if q=true then
 begin
 r:=r+(b-x) div 9;
 write(f2,r+1);
 end else
  write(f2,0);

close(f1);
close(f2);
end.