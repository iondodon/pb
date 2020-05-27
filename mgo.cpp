program mgo;
type tabel=array[0..101] of integer;
	var p,n:longint;
			f1,f2:text;
			t:tabel;

Procedure verificare;
	var a,b,i:longint;
	begin
		a:=0;
		b:=0;
		for i:=1 to 100 do
			if t[i]=1 then
				a:=a+1 else
					if t[i]=-1 then
						b:=b+1;
		write(f2,a,' ',b);
	end;

Procedure sterge(x,y:longint);
	var i:longint;
	begin
		for i:=x to y do 
			t[i]:=0;	
	end;

procedure cautare(i,x:longint);
	var q,p:boolean; j,u,d,s:longint;
	begin
		q:=true;
		p:=true;
		if i mod 2=1 then
			u:=1 else
				u:=-1;
		for j:=x-1 downto 0 do 
			if t[j]=0 then 
				q:=false else
					if t[j]=u then
						begin
							s:=j+1;
							break;
						end;
		for j:=x+1 to 101 do
			if t[j]=0 then
				p:=false else
					if t[j]=u then
						begin
							d:=j-1;
							break;
						end;
		if q=true then
			sterge(s,x-1);
		if p=true then
			sterge(x+1,d);
	end;

procedure main;
	var i,x:longint;
	begin
		readln(f1,p,n);
		readln(f1,x);
		t[x]:=1;
		readln(f1,x);
		t[x]:=-1;
		for i:=3 to n do 
			begin
				readln(f1,x);
				if i mod 2=1 then
					t[x]:=1 else
						t[x]:=-1;
				cautare(i,x);
			end;
		verificare;
	end;

begin
	assign(f1,'mgo.in'); reset(f1);
	assign(f2,'mgo.out'); rewrite(f2);
	main;
	close(f1);
	close(f2);
end.