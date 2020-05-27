program asociativ;
var n:longint;
        f1,f2:text;
		s:ansistring;
		a,b,c,r1,r2:string;

function adunare(a,b:string):string;
	var i:longint;
			x:string;
	begin
		for i:=length(a) to length(b)-1 do 
			a:='0'+a;
		for i:=length(b) to length(a)-1 do
			b:='0'+b;
		adunare:='';
		for i:=1 to length(a) do
			begin
				 	str(ord(a[i])+ord(b[i])-96,x);
				 	adunare:=adunare+x;
			end; 
	end;

procedure main;
	var i:longint;
	begin
		readln(f1,n);
		for i:=1 to n Do
			begin
				readln(f1,s);
				a:=copy(s,1,pos(' ',s)-1);
				delete(s,1,pos(' ',s));
				b:=copy(s,1,pos(' ',s)-1);
				delete(s,1,pos(' ',s));
				c:=s;
				r1:=adunare(adunare(a,b),c);
				r2:=adunare(adunare(b,c),a);
				if r1=r2 then
					writeln(f2,r1) else
						writeln(f2,0);
			end;
	end;

begin
	assign(f1,'asociativ.in'); reset(f1);
	assign(f2,'asociativ.out'); rewrite(f2);
	main;
	close(f1);
	close(f2);
end.