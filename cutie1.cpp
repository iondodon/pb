Program cutie1;
type
	stricate=record
		x,y:longint;
	end;
	tabel=array[1..10002] of longint;
	tabeldate=array[1..10002] of stricate;

var tt,n,k,m,i:longint;
    v:tabel;
    t:tabeldate;
	f1,f2:text;

Procedure resetare;
var i:longint;
begin
        v[1]:=0;
        v[n]:=0;
	for i:=1 to k+2 do
		begin
		t[i].x:=0;
		v[t[i].y]:=0;
		t[i].y:=0;
		end;
end;

Procedure readdata;
	var i,xx:longint;
begin
	readln(f1,n,k,m);
	xx:=1;
	v[xx]:=-1;
	for i:=1 to k do
		begin
		t[i].x:=xx;
		read(f1,t[i].y);
		v[t[i].y]:=-1;
		xx:=t[i].y;
		end;
	i:=k+1;
	t[i].x:=t[i-1].y;
	t[i].y:=n;
	v[n]:=-1;
	readln(f1);
end;

Procedure run;
	var i,j,tip1,tip2,tip3,a,b,xx:longint;
begin
	j:=1;
	i:=1;
	tip1:=0;
	tip2:=0;
	tip3:=0;

	for i:=1 to m do
		begin
		read(f1,xx);
		a:=xx;
		repeat
		a:=a-1;
		until v[a]=-1;
		b:=xx;
		repeat
		b:=b+1;
		until v[b]=-1;
		if ((xx-a) mod 2=0) and ((b-xx) mod 2=0) then
			tip1:=tip1+1 else
				if ((xx-a) mod 2=1) and ((b-xx) mod 2=1) then
					tip2:=tip2+1 else
						tip3:=tip3+1;
		end;

	if tip3 mod 2=1 then
		write(f2,1) else
			if tip2 mod 2=1 then
				write(f2,1) else
					write(f2,0);
	resetare;
end;

begin
	assign(f1,'cutie1.in'); reset(f1);
	assign(f2,'cutie1.out'); rewrite(f2);

	readln(f1,tt);
	for i:=1 to tt do
		begin
		readdata;
		run;
		end;	

	close(f1);
	close(f2);
end.