Program romeo;
var x,y:longint;
	f1,f2:text;

Procedure run;
var n,m,z,e1,e2,i:longint;
begin
if x>=y-1 then
	writeln(f2,x+y) else
		if x<y-1 then
			begin
			z:=y div (x+1);
			n:=y-x*z-z;
			m:=x+1-n;
			e1:=0; e2:=0;
			for i:=1 to z do e1:=e1+i*m;
			for i:=1 to z+1 do e2:=e2+i*n;
			writeln(f2,x+e1+e2);
			end;
end;

begin
assign(f1,'romeo.in'); reset(f1);
assign(f2,'romeo.out'); rewrite(f2);
readln(f1,x,y);
run;
close(f1);
close(f2);
end.