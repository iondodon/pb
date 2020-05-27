program papusa;
type tabel=array[1..500] of integer;
	var n,i,m,p,k,a,b,l,aux:integer;
		il,an:tabel;
	f1,f2:text;
begin
	assign(f1,'papusa.in'); reset(f1);
	assign(f2,'papusa.out'); rewrite(f2);
	readln(f1,n);
	for i:=1 to (n div 2) do
		read(f1,il[i]);
	for i:=1 to (n div 2) do
		read(f1,an[i]);

	l:=n div 2;
	k:=-1;
	m:=0;
	p:=0;
	repeat
		k:=k+1;

		a:=1;
		b:=1;
		for i:=l-1 downto 1 do
			if il[i]<il[i+1] then
				a:=a+1 else
					break;
		for i:=2 to l do
			if an[i]<an[i-1] then
				b:=b+1 else
					break;
		if a+b>p then
			begin
				m:=k;
				p:=a+b;
			end;

		a:=1;
		b:=1;
		for i:=2 to l do
			if il[i]<il[i-1] then
				a:=a+1 else
					break;
		for i:=l-1 downto 1 do
			if an[i]<an[i+1] then
				b:=b+1 else
					break;
		if a+b>p then
			begin
				m:=k;
				p:=a+b;
			end;

		if k<>l then
			begin
				aux:=il[1];
				for i:=1 to l-1 do
					il[i]:=il[i+1];
				il[l]:=aux;
				aux:=an[l];
				for i:=l downto 2 do
					an[i]:=an[i-1];
                an[1]:=aux;
			end;

	until k=l-1;

	writeln(f2,m);
	writeln(f2,p);

	close(f1);
	close(f2);
end.
