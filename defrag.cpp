Program defrag;
type matrice=array[1..100,0..720] of integer;
var l:matrice;
	f1,f2:text;
	p,s,c,v:integer;

Procedure readdata;
var i,j,x,y:integer;
begin
readln(f1,v);
readln(f1,p,s);
readln(f1,c);
for i:=1 to c do 
	begin
	readln(f1,x,y);
	l[x,y]:=1;
	l[x,s+y]:=1;
	end;
for i:=1 to p do 
	for j:=1 to s do 
		l[i,0]:=l[i,0]+l[i,j];
end;

Procedure cautliber;
var liber,i:integer; 
begin
liber:=0;
for i:=1 to p do
	if l[i,0]=0 then liber:=liber+1;
write(f2,liber);
end;

Procedure defrag;
var i,j,k,aux,max:integer;
begin
for	i:=1 to p do 
	begin 
	max:=0;
	aux:=0;
	k:=l[i,0];
	for j:=1 to k do aux:=aux+l[i,j];
	if aux>max then max:=aux;
	for j:=k+1 to 2*s do 
		begin 
		aux:=aux-l[i,j-k]+l[i,j];
		if aux>max then max:=aux;
		end;
	write(f2,k-max,' ');
	end;
end;



begin
assign(f1,'defrag.in'); reset(f1);
assign(f2,'defrag.out'); rewrite(f2);

readdata;
if v=1 then cautliber else
	defrag;

close(f1);
close(f2);
end.