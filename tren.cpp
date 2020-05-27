program tren1;
type tabel=array[1..5000] of longint;
 var n,k,i,u,x,nn,aux,s,l,max:longint;
 	t,a:tabel;
 	f1,f2:text;

 	function putere(n:longint):longint;
 		var i:longint;
 		begin
 			putere:=1;
 			for i:=1 to n do
 				putere:=putere*2;
 		end;
 begin
 	assign(f1,'tren.in'); reset(f1);
 	assign(f2,'tren.out'); rewrite(f2);
 	readln(f1,n,k);

 	nn:=putere(n);
 	for i:=1 to nn do
 		read(f1,t[i]);

 	if k=1 then x:=0 else
 		if k=2 then x:=1 else
 			begin
 				u:=3;
 				aux:=1;
 				while (u<=k) do
 					begin
 						x:=2*aux+1;
 						aux:=x;
 						u:=u+1;
 					end;
 			end;

 	max:=0;
 	for i:=1 to nn do
 		if a[i]=0 then
 			begin
 				s:=0;
 				a[i]:=1;
 				l:=i;
 				while (l<=nn) do
 					begin
 						s:=s+t[l];
 						a[l]:=1;
 						l:=l+x+1;
 					end;
 				if s>max then
 					max:=s;
 			end;

 	write(f2,max);
 	close(f1);
	close(f2);
 end.
