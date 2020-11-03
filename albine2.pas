program albine2;
	var n,m,x,polen,toate,a1,b1,l,h,i:longint;
	f1,f2:text;

Procedure ariecomuna(a1,b1:integer);
	var q:boolean;
	begin
		q:=true;
		l:=0;
		h:=0;

		if (a1>0) and (a1<=n) then
			l:=n-a1+1 else
				if (a1<=0) and (a1>-n) then
					l:=n-(1-a1) else
						if (a1>n) or (a1<=-n) then
							q:=false;

		if q=true then
			if (b1>0) and (b1<=n) then
				h:=n-b1+1 else
					if (b1<=0) and (b1>-n) then
						h:=n-(1-b1) else
							if (b1>n) or (b1<=-n) then
								q:=false;

		if q=false then
			inc(polen,toate) else
				inc(polen,toate-(l*h));

	end;

begin
	assign(f1,'albine2.in'); reset(f1);
	assign(f2,'albine2.out'); rewrite(f2);
	readln(f1,n,m);

	polen:=0;
	toate:=sqr(n);
	a1:=1;
	b1:=1;

	for i:=1 to m do
		begin
			read(f1,x);
			if x=0 then
				begin
					dec(a1);
				end else
					if x=1 then
						begin
							inc(b1);
						end else
							if x=2 then
								begin
									inc(a1);
								end else
									begin
										dec(b1);
									end;
			ariecomuna(a1,b1);
		end;

	write(f2,polen);

	close(f1);
	close(f2);
end.
