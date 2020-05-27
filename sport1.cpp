Program sport1; uses math;
var nr,n:longint;
	a,b:real;
	s:extended;
	f1,f2:text;

Procedure readdata;
begin
readln(f1,a,b);
s:=a+b;
nr:=2;
readln(f1,n);
end;

Procedure simulare;
var i:longint; c:real;
begin
for i:=3 to n do 
	if a<>b then 
		begin c:=max(a,b); nr:=nr+1; s:=s+c; a:=b; b:=c; end else
			if (a=4) or (a=3) then
				begin c:=3; nr:=nr+1; s:=s+c; a:=b; b:=c; end else
					if a=5 then
						begin c:=2; nr:=nr+1; s:=s+2; a:=b; b:=c; end;
writeln(f2,(s/nr)); 
end;

begin
assign(f1,'sport1.in'); reset(f1);
assign(f2,'sport1.out'); rewrite(f2);

readdata;
simulare;

close(f1);
close(f2);
end.