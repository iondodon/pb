program cartonas;
type tabel=array[1..100] of longint;
	var n,x,i,l,aux,niv,j,nivelx:longint;
			t,s,ni:tabel;
			f1,f2:text;
begin
	assign(f1,'cartonas.in'); reset(f1);
	assign(f2,'cartonas.out'); rewrite(f2);

	readln(f1,n);
	readln(f1,x);

	for i:=1 to n do
		begin
			read(f1,t[i]);
			if t[i]=x then
				nivelx:=1;
		end;
  
	for i:=1 to n do
		s[1]:=s[1]+t[i];
	aux:=0;
	repeat
		aux:=aux+(s[1] mod 2);
		s[1]:=s[1] div 2;
	until s[1]=0;
	ni[1]:=aux;

  l:=n; niv:=1;
  repeat
  	niv:=niv+1;
  	l:=l-1;
  	for i:=1 to l do
  		begin
  			t[i]:=t[i]+t[i+1];
  			s[niv]:=s[niv]+t[i];
  			if t[i]=x then
  				nivelx:=niv;
  		end;
  	aux:=0;
		repeat
			aux:=aux+(s[niv] mod 2);
			s[niv]:=s[niv] div 2;
		until s[niv]=0;
		ni[niv]:=aux;
  until l=1;

  for i:=1 to n do
  	s[i]:=i;

  writeln(f2,t[1]);
  writeln(f2,nivelx);
  for i:=20 downto 0 do
  	for j:=1 to n do
  		if ni[j]=i then
  			write(f2,j,' ');


	close(f1);
	close(f2);
end.