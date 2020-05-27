program film;
type
        multime='b'..'f';
        tabel=array[1..1000] of multime;
	var f,b,i,j,aa,bb:longint;
	t:tabel;
	f1,f2:text;
begin
	assign(f1,'film.in'); reset(f1);
	assign(f2,'film.out'); rewrite(f2);
	read(f1,f,b);

			aa:=f;
			bb:=b;
			if aa<=bb then 
			begin
			i:=0;
			while (f<>0) do
				begin
					i:=i+3;
					t[i]:='f';
					f:=f-1;
				end;
			i:=3;
			while (t[i]='f') and (b<>0) do
				begin
					t[i-1]:='b';
					b:=b-1;
					i:=i+3;
				end;
			i:=3;
			if b>0 then
				while (b<>0) and (t[i]='f') do
					begin
						t[i+1]:='b';
						b:=b-1;
						i:=i+3;
					end;
				for i:=1 to 1000 do
					if (t[i]='b') or (t[i]='f') then
						write(f2,t[i]);
			end else
			begin
				i:=0;
			while (b<>0) do
				begin
					i:=i+3;
					t[i]:='b';
					b:=b-1;
				end;
			i:=3;
			while (t[i]='b') and (f<>0) do
				begin
					t[i-1]:='f';
					f:=f-1;
					i:=i+3;
				end;
			i:=3;
			if f>0 then
				while (f<>0) and (t[i]='b') do
					begin
						t[i+1]:='f';
						f:=f-1;
						i:=i+3;
					end;
				for i:=1 to 1000 do
					if (t[i]='b') or (t[i]='f') then
						write(f2,t[i]);
			end;

	close(f1);
	close(f2);
end.