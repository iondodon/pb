program maraton1;
type tabel=array[1..5000] of shortint;
			var n,k,i,a:integer;
					t:tabel;
					time:longint;
					f1,f2:text;
begin
	assign(f1,'maraton1.in'); reset(f1);
	assign(f2,'maraton1.out'); rewrite(f2);
	readln(f1,n,k);

	for i:=1 to n do
		read(f1,t[i]);

	time:=k;

	for i:=1 to n do
		begin
			if t[i]=0 then
				a:=((time mod 10)+8) mod 10 else
					if t[i]=-1 then
						a:=((time mod 10)+5) mod 10 else
							if t[i]=-2 then
								a:=(time mod 10);
			if a<8 then
				time:=time+(8-a);
			time:=time+k;
		end;

	write(f2,time);

	close(f1);
	close(f2);

end.
