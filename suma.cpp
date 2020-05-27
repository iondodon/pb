program suma;
type tabel=array[1..1000] of integer;
	var t:tabel;
			n:integer;
			f1,f2:text;

procedure main;
	var m,i:integer;
begin
	read(f1,n);
	m:=n;
	t[1]:=1;
	i:=n;
	n:=n-1;
	while n<>0 Do
		begin
			if n>=9 then 
				begin
					t[i]:=9;
					n:=n-9;
				end else
					begin
						t[i]:=n;
						n:=0;
					end;
			i:=i-1;
		end;
	n:=m;
	for i:=1 to m do 
		begin
			write(f2,t[i]);
			t[i]:=0;
		end;
	writeln(f2);
	i:=1;
	while n<>0 do
		begin
			if n>=9 then
				begin
					t[i]:=9;
					n:=n-9;
				end else
					begin
						t[i]:=n;
						n:=0;
					end;
			i:=i+1;
		end;
	for i:=1 to m Do
		write(f2,t[i]);
end;

begin
	assign(f1,'suma.in'); reset(f1);
	assign(f2,'suma.out'); rewrite(f2);
	main;
	close(f1);
	close(f2);
end.