program convert;
 var 	i:longint;
 			s:ansistring;
 		 p:boolean;
 		 f1,f2:text;
begin
	assign(f1,'convert.in'); reset(f1);
	assign(f2,'convert.out'); rewrite(f2);

	p:=true;
	while not eof(f1) do
		begin
			readln(f1,s);
			for i:=1 to length(s) do
				if (s[i]<>'<') and (s[i]<>'>') and (p=true) then
					write(f2,s[i]) else
						if s[i]='<' then 
							p:=false else
								if s[i]='>' then
									p:=true;
			writeln(f2);
		end;

	close(f1);
	close(f2);
end.