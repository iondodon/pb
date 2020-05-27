program turn;
type lista=^date;
			date=record
			m:longint;
			next:lista;
			end;
var a,b,x,z,y:lista;
		n,k,l,i,aux:longint;
		p:boolean;
		f1,f2:text;
begin
	assign(f1,'turn.in'); reset(f1);
	assign(f2,'turn.out'); rewrite(f2);
	readln(f1,n,k);

	new(x);
	read(f1,x^.m);
	x^.next:=nil;
	a:=x;
	z:=x;

	for i:=1 to n-1 do
		begin
			new(x);
			read(f1,x^.m);
			x^.next:=nil;
			z^.next:=x;
			z:=x;
		end;

	new(x);
	x^.m:=-1;
	x^.next:=nil;
	z^.next:=x;
        z:=x;
        new(x);
        x^.m:=-2;
        x^.next:=nil;
        z^.next:=x;

	new(b);
	b^.m:=-1;
	b^.next:=a;

	repeat
		p:=false;
		y:=b;
		x:=y^.next^.next;
                aux:=y^.next^.m;
		l:=1;

		while (x^.next<>nil) do
			if (x^.m=aux) then
				begin
					l:=l+1;
					x:=x^.next;
				end else
					if (x^.m<>aux) then
						begin
							if (l>=k) then
								begin
									y^.next:=x;
									n:=n-l;
									p:=true;
									break;
								end else
									begin
                                                                                for i:=1 to l do
										        y:=y^.next;
										aux:=x^.m;
                                                                                x:=x^.next;
                                                                                l:=1;
									end;
						end;

	until p=false;

	writeln(f2,n);
	x:=b^.next;
	while (x^.next^.next<>nil) do
		begin
			write(f2,x^.m,' ');
			x:=x^.next;
		end;


	close(f1);
	close(f2);

        end.
