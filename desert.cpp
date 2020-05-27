program desert;
var p,d:real;
		k,n:integer;
		f1,f2:text;

function distanta(n:integer):real;
	begin
		if n<=2 then
			distanta:=n*k/p else
				distanta:=k/((2*n-3)*p)+distanta(n-1);
	end;

procedure main;
	begin
		read(f1,n,k,p);
		p:=p/100;
		d:=distanta(n);
		write(f2,d:0:3);
	end;

begin
	assign(f1,'desert.in'); reset(f1);
	assign(f2,'desert.out'); rewrite(f2);
	main;
	close(f1);
	close(f2);
end.