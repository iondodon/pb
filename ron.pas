program ron;
var k,rl,rs,sol:^longint;
f1,f2:text;
begin
	assign(f1,'ron.in'); reset(f1);
	assign(f2,'ron.out'); rewrite(f2);
	new(k); new(rl); new(rs);
	readln(f1,k^);
	read(f1,rl^,rs^);

	if (rl^=rs^) then 
		write(f2,'O') else
			begin 
				new(sol);sol^:=0;
				repeat
					k^:=k^-(k^ div 3)*2;
					sol^:=sol^+1;
				until k^<3;
				if (rl^=sol^) then 
					write(f2,'L') else
						if (rs^=sol^) then 
							write(f2,'S') else
								write(f2,'O');
			end;


	close(f1);
	close(f2);
end.