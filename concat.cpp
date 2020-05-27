Program concat;
var n,soln:integer;
	t:array[1..102] of string;
	v,sol:array[1..102] of integer;
	f1,f2:text;
	cuvant_baza:string;

Procedure readdata;
	var i:integer;
	begin
                readln(f1,cuvant_baza);
		readln(f1,n);
		for i:=1 to n do
			readln(f1,t[i]);
	end;

Procedure solutie(l:integer);
var i:integer;
begin
	soln:=l;
	for i:=1 to l do
		sol[i]:=v[i];
end;

Procedure run(auxs:string;j,l:integer);
	var i,loc:integer; adunat:string;
	begin
		if auxs=cuvant_baza then
			begin if l-1>soln then solutie(l-1);  end else
				for i:=j to n do
					begin
						loc:=0;
                                                adunat:=auxs+t[i];
						loc:=pos(adunat,cuvant_baza);
						if loc<>0 then
							begin v[l]:=i; run(auxs+t[i],i+1,l+1) end;
					end;
	end;

Procedure afisare;
	var i:integer;
	begin
		writeln(f2,soln);
		for i:=1 to soln do
			write(f2,sol[i],' ');
	end;

begin
assign(f1,'concat.in'); reset(f1);
assign(f2,'concat.out'); rewrite(f2);
readdata();
run('',1,1);
afisare();
close(f1);
close(f2);
end.
