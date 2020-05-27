program tv1; uses math;
type tabel=array[0..86400] of longint;
		var p,n,i,d,h,m,s,rez:longint;
				t:tabel;
				ss:string;
				f1,f2:text;

Procedure convertiresiafisare(rez:longint);
	var h,m,s:integer;
	begin
		ss:='';
		h:=rez div 3600;
		rez:=rez mod 3600;
		m:=rez div 60;
		rez:=rez mod 60;
		s:=rez;
		if h<10 then
			write(f2,0,h,':') else
				write(f2,h,':');
		if m<10 then
			write(f2,0,m,':') else
				write(f2,m,':');
		if s<10 then
			write(f2,0,s) else
				write(f2,s);
	end;

Procedure rezultat(p:integer);
	var max:longint;
	begin
		rez:=0;
		if p=1 then 
			begin
				for i:=0 to 86399 do
					if t[i]=0 then
						rez:=rez+1;
			end else
				begin
					max:=maxvalue(t);
					for i:=0 to 86399 do
						if t[i]=max then
							begin
								rez:=i;
								break;
							end;
				end;
		convertiresiafisare(rez);
	end;

Procedure rezolvare(p:integer);
	var u:longint;
	begin
		u:=0;
		for i:=0 to 86399 do
			begin
				u:=u+t[i];
				t[i]:=u;
			end;

		rezultat(p);

	end;

begin
	assign(f1,'tv1.in'); reset(f1);
	assign(f2,'tv1.out'); rewrite(f2);
	readln(f1,p);
	readln(f1,n);

	for i:=1 to n do
		begin
			read(f1,d);
			readln(f1,ss);
      delete(ss,1,1);
      h:=0;
      m:=0;
      s:=0;
			h:=(h+ord(ss[1])-48)*10+(ord(ss[2])-48);
			m:=(m+ord(ss[4])-48)*10+(ord(ss[5])-48);
			s:=(s+ord(ss[7])-48)*10+(ord(ss[8])-48);

			inc(t[(h*3600)+(m*60)+s]);
			dec(t[(h*3600)+(m*60)+s+d]);
		end;

		rezolvare(p);

	close(f1);
	close(f2);
end.
