Program sminus;
type tabel=array[1..100000] of integer;
var n,st,dr,suma:longint;
	t:tabel;
	p:boolean;
	f1,f2:text;

Procedure Kadane;
var i,max_ending_here,max_so_far,startIndex:longint;
begin
max_ending_here:=0;
max_so_far:=0;
StartIndex:=0;
for i:=1 to n do 
	begin
	if max_ending_here+t[i]<0 then
		begin
		startIndex:=i+1;
		max_ending_here:=0;
		end else
			inc(max_ending_here,t[i]);
	if max_ending_here>max_so_far then
		begin
		max_so_far:=max_ending_here;
		st:=startIndex;
		dr:=i;
		end;
	end;
writeln(f2,st,' ',dr);
writeln(f2,suma-2*max_so_far)
end;



Procedure readdata;
var i,max:longint;
begin
readln(f1,n);
suma:=0;
max:=-2147483648;
p:=false;
for i:=1 to n do 
	begin 
	read(f1,t[i]);
	suma:=suma+t[i];
	if t[i]>=0 then p:=true;
	if t[i]>max then 
		begin max:=t[i]; st:=i; dr:=i; end;
	end;
if p=false then 
	begin
	writeln(f2,st,' ',dr);
	writeln(f2,suma-2*max)
	end else
		Kadane;
end;

begin
assign(f1,'sminus.in'); reset(f1);
assign(f2,'sminus.out'); rewrite(f2);

readdata;

close(f1);
close(f2);
end.