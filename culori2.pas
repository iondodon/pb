program culori2;
type lista=^Date;
	tabel=array[1..100] of longint;
	Date=record
	m:integer;
	pred,next:lista;
	end;
	var a,z,x,y:lista;
			n,k,i,max,nv:integer;
			t:tabel;
			f1,f2:text;
begin
	assign(f1,'culori2.in'); reset(f1);
	assign(f2,'culori2.out'); rewrite(f2);
	readln(f1,n,k);

	new(a);
	readln(f1,a^.m);
	a^.pred:=nil;
	a^.next:=nil;
	z:=a;

	for i:=1 to n-1 do
		begin
			new(x);
			readln(f1,x^.m);
			x^.pred:=z;
			x^.next:=nil;
			z^.next:=x;
			z:=x;
		end;

	a^.pred:=z;
	z^.next:=a;

	x:=a;
	max:=0;
	nv:=0;

	for i:=1 to k do
		begin
			inc(t[x^.m]);
			if t[x^.m]>max then
				max:=t[x^.m];
      x:=x^.next;
		end;

	y:=a;
        x:=x^.pred;
	for i:=1 to n do
		begin
			if (x^.pred^.m=x^.m) and (x^.pred^.pred^.m=x^.m) then
				nv:=nv+1;
			x:=x^.next;
			inc(t[x^.m]);
			dec(t[y^.m]);
			y:=y^.next;
			if t[x^.m]>max then
				max:=t[x^.m];
		end;

	writeln(f2,nv);
	write(f2,max);

	close(f1);
	close(f2);
end.
