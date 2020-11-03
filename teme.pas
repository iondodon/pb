program teme;
type matrice=array[1..300,1..300] of boolean;
		tabel=array[1..300] of boolean;
		var n,nm,a,b,i,r:integer;
			m:matrice;
			t:tabel;
			f1,f2:text;

	Procedure Parcurgere(l:integer);
		var j:integer;
		begin
			t[l]:=true;
			for j:=1 to n do
				if (m[l,j]=true) and (t[j]=false) and (j<>l) then
					Parcurgere(j);
		end;

begin
	assign(f1,'teme.in'); reset(f1);
	assign(f2,'teme.out'); rewrite(f2);
	readln(f1,n,nm);

	for i:=1 to nm do
		begin
			readln(f1,a,b);
			m[a,b]:=true;
			m[b,a]:=true;
		end;

	r:=0;
	for i:=1 to n do
		if t[i]=false then
			begin
				r:=r+1;
				parcurgere(i);
			end;


	for i:=1 to n do
		if t[i]=false then
			r:=r+1;

	write(f2,r);

	close(f1);
	close(f2);
end.
