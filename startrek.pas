program startrek;
type tabel=array[1..4000] of real;
	var n,sol:integer;
			timp:real;
			f1,f2:text;
			t:tabel;

procedure citiredate;
	var i:integer; x:real;
	begin
		readln(f1,n,timp);
		for i:=1 to n do
			read(f1,t[i]);
		readln(f1);
		for i:=1 to n do
			begin
				read(f1,x);
				t[i]:=t[i]/x;
			end;
	end;

procedure qsort(st,dr:integer);
	var i,j:integer;	aux,pivot:real;
	begin
		i:=st;
		j:=dr;
		pivot:=t[(i+j) div 2];
		while (i<=j) do
			begin
				while (t[i]<pivot) do
					i:=i+1;
				while (t[j]>pivot) do 
					j:=j-1;
				if i<=j then 
					begin
						aux:=t[i];
						t[i]:=t[j];
						t[j]:=aux;
						i:=i+1;
						j:=j-1;
					end;
			end;
		if (j>st) then 
			qsort(st,j);
		if (i<dr) then 
			qsort(i,dr);
	end;

procedure main;
	var i:integer;
			s:real;
	begin
		citiredate;
		qsort(1,n);
		s:=0;
		sol:=0;
		for i:=1 to n do
			if t[i]>=s then
				begin
					s:=s+timp;
					sol:=sol+1;
				end;
		write(f2,sol);
	end;

begin
	assign(f1,'startrek.in'); reset(f1);
	assign(f2,'startrek.out'); rewrite(f2);
	main;
	close(f1);
	close(f2);
end.
