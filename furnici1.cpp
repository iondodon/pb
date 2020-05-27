program furnici;
type
	tabel=array[1..100000] of longint;
	tabeldirectie=array[1..100000] of char;
	var l,n,i,r:longint;
			di:tabeldirectie;
			t:tabel;
      c:char;
			f1,f2:text;
begin
	assign(f1,'furnici1.in'); reset(f1);
	assign(f2,'furnici1.out'); rewrite(f2);
	readln(f1,l,n);

	r:=0;
	for i:=1 to n do
		readln(f1,t[i],c,di[i]);

	for i:=1 to n do
		if di[i]='S' then
			begin
				if t[i]>r then
					r:=t[i];
			end else
				if l-t[i]>r then
					r:=l-t[i];

	write(f2,r);

	close(f1);
	close(f2);
end.
