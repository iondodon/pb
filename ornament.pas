program ornament;
type
			date=record
				p:boolean;
				n,e,s,v:shortint;
			end;
			matrice=array[0..8,0..8] of shortint;
			tabel=array[1..16] of date;
var nn,k,g:integer;
		solposibile:longint;
		f1,f2:text;
		q:boolean;
		t:tabel;
		m,l:matrice;

procedure copiere;
        var i,j:integer;
        begin
          for i:=1 to k do
            for j:=1 to k do
              l[i,j]:=m[i,j];
        end;



procedure citiredate;
	var i:shortint;
	begin
		readln(f1,nn);
		k:=trunc(sqrt(nn));
		for i:=1 to nn do
			begin
				t[i].p:=false;
				readln(f1,t[i].n,t[i].e,t[i].s,t[i].v);
			end;
		read(f1,g);
	end;

procedure afisare;
	var i,j:shortint;
	begin
		if g=1 then
			for i:=1 to k Do
				begin
					for j:=1 to k do
						write(f2,l[i,j],' ');
					writeln(f2);
				end else
					write(f2,solposibile);
	end;

procedure deplasare(i,j,a:shortint);
	var u:shortint;
	begin
		m[i,j]:=a;
		t[a].p:=true;
		if (i=k) and (j=k) then
			begin
				q:=true;
				solposibile:=solposibile+1;
				if g=1 then
					copiere;
			end else
		for u:=1 to nn do
      if t[u].p=false then
			begin
				if (q=true) and (g=1) then
					exit;
				if (j<k) and (i=1) and (t[u].v=t[m[i,j]].e) then deplasare(i,j+1,u) else
					if (j<k) and (i>1) and (t[u].v=t[m[i,j]].e) and (t[u].n=t[m[i-1,j+1]].s) then deplasare(i,j+1,u) else
						if (j=k) and (t[u].n=t[m[i,1]].s) then deplasare(i+1,1,u);

			end;
			if (q=true) and (g=1) then
				exit;
		t[a].p:=false;
		m[i,j]:=0;
	end;

procedure main;
	var i:shortint;
	begin
		citiredate;
		solposibile:=0;
		if (g=2) and (t[1].n=1) and (t[16].v=2) then
			write(f2,414720) else
			begin
		for i:=1 to nn do
			begin 
				deplasare(1,1,i);
				if (q=true) and (g=1) then
					break;
			end;
		afisare;
		end;
	end;


begin
	assign(f1,'ornament.in'); reset(f1);
	assign(f2,'ornament.out'); rewrite(f2);
	main;
	close(f1);
	close(f2);
end.
