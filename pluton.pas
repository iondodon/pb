program pluton; 
type 	
			tabelp=array[0..9] of integer;
			lista=^datelista;
			datelista=record
				y:longint;
				next,pred:lista;
			end;
			datetabel=record
				lg,nr:longint;
				a,z:lista;
			end;
			tabel=array[1..4000] of datetabel;
var xx:lista;
		n,l:longint;
		t:tabel;
		p:tabelp;
		f1,f2:text;

procedure afisarelista(i:longint);
	begin
		xx:=t[i].a;
		while xx<>nil do 
			begin
				write(f2,xx^.y,' ');
				xx:=xx^.next;
			end;
	end;

procedure afisare;
	var max,i,r:longint;
	begin
		writeln(f2,l);
		max:=0;
		for i:=1 to l do 
			if t[i].lg>max then 
				max:=t[i].lg;
		writeln(f2,max);
		r:=0;
		for i:=1 to l do 
			if t[i].lg=max then 
				r:=r+1;
		writeln(f2,r);
		for i:=1 to l do 
			if t[i].lg=max then 
				begin
					afisarelista(i);
					break;
				end;
	end;

procedure resetare;
	var i:integer;
	begin
		for i:=0 to 9 do 
			p[i]:=0;
	end;

function cifre(s:longint):longint;
	var ss:string; i,x,j:longint;
	begin
		str(s,ss);
		for i:=1 to length(ss) do 
			inc(p[ord(ss[i])-48]);
		x:=0;
		for i:=1 to 9 do 
			if p[i]>0 then 
				for j:=1 to p[i] do 
					x:=(x*10)+i;
		if p[0]>0 then 
			for j:=1 to p[0] do 
				x:=x*10;
		cifre:=x;
		resetare;
	end;

Procedure introdu(s,i:longint);
	begin
		inc(t[i].lg);
		new(xx);
		xx^.y:=s;
		xx^.next:=nil;
		xx^.pred:=t[i].z;
		t[i].z^.next:=xx;
		t[i].z:=xx;
	end;

procedure initiere(c,s,l:longint);
	begin
		t[l].lg:=1;
		t[l].nr:=c;
		new(xx);
		xx^.y:=s;
		xx^.pred:=nil;
		xx^.next:=nil;
		t[l].a:=xx;
		t[l].z:=xx;
	end;

procedure main;
	var i,j,c,s:longint; q:boolean;
	begin
		readln(f1,n);
		l:=0;
		for i:=1 to n do 
			begin
				readln(f1,s);
				c:=cifre(s);
				q:=false;
				for j:=1 to l do 
					if t[j].nr=c then 
						begin
							q:=true;
							introdu(s,j);
							break;
						end;
				if q=false then 
					begin
						l:=l+1;
						initiere(c,s,l);
					end;
			end;
		afisare;
	end;


begin
	assign(f1,'pluton.in'); reset(f1);
	assign(f2,'pluton.out'); rewrite(f2);
	main;
	close(f1);
	close(f2);
end.