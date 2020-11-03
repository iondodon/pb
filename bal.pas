program bal; uses math;
type tabel=array[1..1000002] of longint;
	var n,m,perechi,maxyf,maxyb:longint;
			f,b:tabel;
			f1,f2:text;

procedure citiredate;
	var i,x,y:longint;
	begin
		readln(f1,n,m);
		maxyf:=0;
		for i:=1 to n do
			begin
				readln(f1,x,y);
				f[x]:=f[x]+1;
				f[y+1]:=f[y+1]-1;
				if y+1>maxyf then
					maxyf:=y+1;
			end;
		maxyb:=0;
		for i:=1 to m do
			begin
				readln(f1,x,y);
				b[x]:=b[x]+1;
				b[y+1]:=b[y+1]-1;
				if y+1>maxyb then
					maxyb:=y+1;
			end;
	end;

procedure formaretabele;
	var i,u:longint;
	begin
		u:=0;
		for i:=1 to maxyf do
			begin
				u:=u+f[i];
				f[i]:=u;
			end;
		u:=0;
		for i:=1 to maxyb do
			begin
				u:=u+b[i];
				b[i]:=u;
			end;
	end;

procedure verificare;
	var i:longint;
	begin
		perechi:=0;
		for i:=1 to max(maxyf,maxyb) do
			if min(f[i],b[i])>perechi then
				perechi:=min(f[i],b[i]);
	end;

procedure main;
	begin
		citiredate;
		formaretabele;
		verificare;
		write(f2,perechi);
	end;

begin
	assign(f1,'bal.in'); reset(f1);
	assign(f2,'bal.out'); rewrite(f2);
	main;
	close(f1);
	close(f2);
end.
