program cadouri;
type a=array[1..1000] of integer;
var
t:a;
f1,f2:text ;
x,y,n,i,f,b,p,s:longint;

begin
assign(f1,'cadouri.in');
assign(f2,'cadouri.out');
reset  (f1);
rewrite(f2);
 p:=0;s:=0;x:=0;y:=0;
readln(f1,f,b,n);

for i:=1 to n do  read(f1,t[i]);

for i:=1 to n do
if(t[i]mod 2=0) then p:=p+1 else
if(t[i] mod 2<>0)then s:=s+1;
if p<f then x:=f-p  else  x:=0;
if s<b then y:=b-s  else   y:=0;

writeln(f2,x);
writeln(f2,y);
close(f1);
close(f2)

end.