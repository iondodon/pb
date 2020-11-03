Program cern;
var p:char;
	s,t,gr,c:longint;
	f1,f2:text;

Procedure runi;
begin
case p of 
	'A': t:=t+0;
	'B': t:=t+1020;
	'C': t:=t+360;
	'D': t:=t+300;
	'E': t:=t+720;
	'F': t:=t+660;
end;
t:=t mod 1080;
case t of
	0..119:   begin gr:=360-t; c:=1; end;
	120..179: begin gr:=t-60; c:=3; end;
	180..479: begin gr:=480-t; c:=2; end;
	480..539: begin gr:=t-300; c:=1; end;
	540..599:begin gr:=600-t;c:=3; end;
  	600..839:begin gr:=960-t;c:=3; end;
  	840..899:begin gr:=t-480;c:=2; end;
  	900..1200:begin gr:=1080-t;c:=1 end;
end;
end;

Procedure run;
	var r:longint;
begin
case p of 
	'A': t:=t+0;
	'B': t:=t+60;
	'C': t:=t+720;
	'D': t:=t+780;
	'E': t:=t+360;
	'F': t:=t+420;
end;
t:=t mod 1080;
case t of 
	0..179:   begin gr:=t; c:=1; end;
	180..239: begin gr:=540-t; c:=2; end;
	240..539: begin 
				r:=t-120;
				if r>=360 then gr:=r-360 else gr:=r;
				c:=3;
	          end;
	540..599: begin gr:=840-t; c:=1; end;
	600..899: begin gr:=t-600; c:=2; end;
	900..959: begin gr:=0; c:=3; end;
	960..1079: begin gr:=t-720; c:=1; end;
end;
end;

begin
assign(f1,'cern.in'); reset(f1);
assign(f2,'cern.out'); rewrite(f2);

readln(f1,p);
read(f1,s,t);

if s=1 then
	run else
		runi;
if gr=360 then gr:=0;
write(f2,gr,' ',c);
close(f1);
close(f2);
end.