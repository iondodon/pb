program prieteni; uses math;
type tabel=array[1..100] of longint;
	 tabelprime=array[1..70000] of longint;
var n,s,i,j,minim,maxim,num,a,l:longint;
	t,nr:tabel; p,m:tabelprime;
	nn:string;
	f1,f2:text;

function cmmdc(a,b:longint):longint;
var t:longint;
begin
	while (b<>0) do
	begin
		t:=b;
		b:=a mod b;
		a:=t;
	end;
	cmmdc:=a;
end;


begin
	assign(f1,'prieteni.in'); reset(f1);
	assign(f2,'prieteni.out'); rewrite(f2);
	readln(f1,n);
	for i:=1 to n do
		begin
			read(f1,t[i]);
			p[t[i]]:=1;
		end;

for i:=3 to 65535 do 
	for j:=2 to trunc(sqrt(i)) do
		if i mod j=0 then
			begin
				p[i]:=1;
				break;
			end;

	num:=n; a:=2; l:=0;
	for i:=1 to n do
		begin
			s:=0;
			str(t[i],nn);
			for j:=1 to length(nn) do
				s:=s+(ord(nn[j])-48);
			minim:=min(s,t[i]);
			maxim:=max(s,t[i]);
			if cmmdc(s,t[i])=1 then
				begin
					for j:=minim to maxim do
					if p[j]=0 then
						begin
							nr[i]:=nr[i]+1;
							l:=l+1;
							m[l]:=j;
							num:=num+1;
							p[j]:=1;
						end;
				end;
		end;

	a:=0;
	writeln(f2,num);
	for i:=1 to n do
		begin
			for j:=1 to nr[i] do
					write(f2,m[a+j],' ');
			a:=a+nr[i];
			write(f2,t[i],' ')
		end;

	close(f1);
	close(f2);
end.
