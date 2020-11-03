Program imagine;
type matrice=array[1..250,1..250] of byte;

var l:integer;
	a:matrice;
	f1,f2:text;

Procedure readdata;
var i,j:integer;
begin
readln(f1,l);
for i:=1 to l do
		begin
		for j:=1 to l do
			read(f1,a[i,j]);
		readln(f1);
		end;
end;

Function verifica(x1,y1,x2,y2:integer):boolean;
var i,j:integer;
begin
verifica:=false;
for i:=x1 to x2 do
	for j:=y1 to y2 do
		if a[i,j]<>a[x1,y1] then
			begin
			verifica:=true;
			break;
			end;
end;

Function compresie(x1,y1,x2,y2:integer):longint;
var mijloc_x,mijloc_y:integer;
begin
compresie:=0;
if verifica(x1,y1,x2,y2)=false then
	inc(compresie,2) else
		begin
		mijloc_x:=(x1+x2) div 2;
		mijloc_y:=(y1+y2) div 2;
		inc(compresie);
		inc(compresie,compresie(x1,y1,mijloc_x,mijloc_y));
		inc(compresie,compresie(x1,mijloc_y+1,mijloc_x,y2));
		inc(compresie,compresie(mijloc_x+1,y1,x2,mijloc_y));
		inc(compresie,compresie(mijloc_x+1,mijloc_y+1,x2,y2));
		end;
end;


begin
assign(f1,'imagine.in'); reset(f1);
assign(f2,'imagine.out'); rewrite(f2);

readdata;
write(f2,compresie(1,1,l,l));

close(f1);
close(f2);
end.-