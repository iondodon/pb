program cifru4;
type tabel=array[1..10] of int64;
var x,y,i,j:integer; a:string;
pre:tabel;  div1,n:int64;
f1,f2:text;
begin x:=0; y:=0; i:=0;
assign(f1,'cifru4.in');
assign(f2,'cifru4.out');
reset(f1);
rewrite(f2);
read(f1,a);
val(a,n);
div1:=10000000000;
while n div div1=0 do 
div1:=div1 div 10;
while div1<>0 do begin 
if (n div div1) mod length(a)=0 then x:=x+1 else
begin i:=i+1; pre[i]:=n div div1; end;
div1:=div1 div 10;
end;
j:=i+1;
while j<>1 do begin 
j:=j-1; i:=1;
while i<>j do begin 
if (pre[j]-pre[i]) mod length(a)=0 then y:=y+1;
i:=i+1;
end;
end;
writeln(f2,x+y);
close(f1);
close(f2);
end.
