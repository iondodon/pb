Program barca1;
type 
	date=record
	m,pos:longint;
	end;
	tabel=array[0..200010] of date;
	tabell=array[0..200010] of longint;
	 tabelr=array[1..10] of longint;
var k,g,n,m,gr,l,pos:longint;
	heap:tabel;
	v:tabell;
	r:tabelr;
	f1,f2:text;

Procedure readdata;
	var i:longint;
begin
readln(f1,n,g,m);
for i:=1 to 10 do
	read(f1,r[i]);
readln(f1);
end;

Procedure swap(var a,b:date);
var aux:date;
begin
aux:=a;
a:=b;
b:=aux;
end;

Procedure heapup(x,k:longint);
var sus:longint;
begin
sus:=k;
while (sus>1) and ((heap[sus].m>heap[sus div 2].m) or ((heap[sus].m=heap[sus div 2].m) and (heap[sus].pos<heap[sus div 2].pos))) do
	begin
	swap(heap[sus],heap[sus div 2]);
	sus:=sus div 2;
	end;
end;

Procedure heapdown(v:longint);
var w:longint;
begin
w:=v*2;
while (w<=k) do
	begin
	if (w+1<=k) and ((heap[w+1].m>heap[w].m) or ((heap[w+1].m=heap[w].m) and (heap[w+1].pos<heap[w].pos))) then
		w:=w+1;
	if (heap[v].m<heap[w].m) or ((heap[v].m=heap[w].m) and (heap[v].pos>heap[w].pos)) then
		swap(heap[v],heap[w]) else break;
	v:=w;
	w:=v*2;
	end;
end;

Procedure delheap(x:longint);
begin
heap[x]:=heap[k];
k:=k-1;
heapdown(x);
end;

Procedure addheap(x,pos:longint);
begin
heap[k].m:=x;
heap[k].pos:=pos;
heapup(x,k);
end;

Procedure run;
 var i,x:longint;
begin	
k:=0;
l:=0;
gr:=0;
pos:=0;
for i:=1 to n+m do
	begin
	readln(f1,x);
	k:=k+1;
	pos:=pos+1;
	addheap(x,pos);
	gr:=gr+x;
	while (gr>g) do
		begin
		l:=l+1;
		gr:=gr-heap[1].m;
		v[heap[1].pos]:=l;
		delheap(1);
		end;
	end;
end;

Procedure rezultat;
var i:longint;
begin
for i:=1 to 10 do
	writeln(f2,v[r[i]]);
end;

begin
assign(f1,'barca1.in'); reset(f1);
assign(f2,'barca1.out'); rewrite(f2);

readdata;
run;
rezultat;

close(f1);
close(f2);
end.