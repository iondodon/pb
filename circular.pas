program circular;
var ss,s:ansistring;
		n,i:integer;
		p:boolean;
		f1,f2:text;
begin
	assign(f1,'circular.in'); reset(f1);
	assign(f2,'circular.out'); rewrite(f2);
	readln(f1,n);

	readln(f1,ss);
	readln(f1,s);

	p:=false;
	for i:=1 to n do
		if s=ss then
			begin
				write(f2,i-1);
				p:=true;
				break;
			end else
				begin
					s:=s[n]+s;
					delete(s,length(s),1);
				end;

	if p=false then
		write(f2,-1);

	close(f1);
	close(f2);
end.
