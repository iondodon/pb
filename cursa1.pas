Program cursa1;
type tabel=array[0..502] of integer;
var c,loc,r,cc,d,dd,s:tabel;
	n:longint;
f1,f2:text;

Procedure readdata;
var i:integer;
begin
readln(f1,n);
for i:=1 to n do
	begin
	readln(f1,c[i],d[i]);
        s[i]:=d[i];
	d[i]:=d[i]-s[i-1];
        dd[i]:=d[i];
	loc[i]:=i;
	cc[i]:=c[i];
	end;
end;

Procedure sort;
var i,j,auxc,auxl,auxd:integer;
begin
for i:=1 to n-1 do
	for j:=i+1 to n do
		if (d[i]<d[j]) or ((d[i]=d[j]) and (c[i]>c[j])) then
			begin
			auxc:=c[i];
			auxd:=d[i];
			auxl:=loc[i];

			c[i]:=c[j];
			d[i]:=d[j];
			loc[i]:=loc[j];

			c[j]:=auxc;
			d[j]:=auxd;
			loc[j]:=auxl;
			end;
for i:=1 to n do
	write(f2,c[i],' ');
writeln(f2);
end;

Procedure depasiri;
var nd,i,j:integer;
begin
for i:=1 to n do
	begin
	nd:=0;
	for j:=n downto 1 do
		if (loc[j]<i) and (dd[i]>dd[loc[j]]) then
			begin
			nd:=nd+1;
			r[nd]:=c[j];
			end else
				if dd[i]<dd[loc[j]] then
					break;
	if nd>0 then
		begin
		write(f2,i,' ',cc[i],' ',nd,' ');
		for j:=1 to nd do
			write(f2,r[j],' ');
		writeln(f2);
		end;
	end;
end;

begin
assign(f1,'cursa1.in'); reset(f1);
assign(f2,'cursa1.out'); rewrite(f2);

readdata;
sort;
depasiri;

close(f1);
close(f2);
end.
