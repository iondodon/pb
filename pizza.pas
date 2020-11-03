Program pizza; 
var n,pe12,pe14,pe34,sol:integer;
		f1,f2:text;

Procedure verificare(s:string);
	begin
		if s='1/2' then
			inc(pe12) else
				if s='1/4' then
					inc(pe14) else
						if s='3/4' then
							inc(pe34);
	end;

procedure main; 
	var i:integer; s:string;
	begin
		pe12:=0;
		pe14:=0;
		pe34:=0;
		readln(f1,n);
		for i:=1 to n do
			begin
				readln(f1,s);
				verificare(s);
			end;

		sol:=0;
		if pe14>=pe34 then
			pe14:=pe14-pe34 else
				begin
					sol:=pe14;
					pe34:=pe34-pe14;
					pe14:=0;
				end;
		if (pe12 mod 2=1) and (pe14>1) then
			begin 
				pe12:=pe12+1;
				pe14:=pe14-2;
			end else
				if (pe12 mod 2=1) and (pe14 mod 4<2) then
					sol:=sol+1 else
						if (pe12 mod 2=0) and (pe14 mod 4<>0) then
							sol:=sol+1;

		sol:=sol+pe34+(pe12 div 2)+(pe14 div 4);

		write(f2,sol);
	end;

begin
	assign(f1,'pizza.in'); reset(f1);
	assign(f2,'pizza.out'); rewrite(f2);
	main;
	close(f1);
	close(f2);
end.
