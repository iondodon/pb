program joc14;
type tabel=array[1..9] of longint;
			var n,c,l,i,j,x,ll,u:longint;
			fr,t:tabel;
			f1,f2:text;
begin
	assign(f1,'joc14.in'); reset(f1);
	assign(f2,'joc14.out'); rewrite(f2);

	readln(f1,n);
	for i:=1 to n do
		begin
			readln(f1,x);
			fr[x]:=fr[x]+1;
		end;

	for i:=1 to 9 do
		t[i]:=i;

	for i:=1 to 8 do
		for j:=i+1 to 9 do
			if (fr[t[i]]<fr[t[j]]) then
				begin
					x:=t[i];
					t[i]:=t[j];
					t[j]:=x;
				end;

	c:=0;
	for i:=1 to 9 do
		if fr[i]<>0 then
			c:=c+1;

	writeln(f2,c);
	l:=trunc(sqrt(n));
        writeln(f2,l);

  i:=1;
  ll:=l*l;
  u:=0;
  while (fr[t[i]]<=ll) do
  	begin
  		for j:=1 to fr[t[i]] do
  			begin
  				write(f2,t[i]);
  				if (u+j) mod l=0 then
  					writeln(f2);
  			end;
  		u:=(u+j) mod l;
  		ll:=ll-fr[t[i]];
  		i:=i+1;
  	end;

  if fr[t[i]]>ll then
  	for j:=1 to ll do
  		begin
  			write(f2,t[i]);
  			if (u+j) mod l=0 then
  				writeln(f2);
  		end;





	close(f1);
	close(f2);
end.
