program secvb;
type tabel=array[0..50000] of longint;
	 biti=array[0..50000] of longint;
	 bitti=array[0..50000] of longint;
	
var n,tt,i,j,num,x,aux,ii:longint; t:tabel;
f1,f2:text; b:biti; bi:bitti;
Bufin,Bufout : Array[1..50000] of byte;

begin num:=0;   aux:=0;  ii:=1;

assign(f1,'secvb.in'); reset(f1);
assign(f2,'secvb.out'); rewrite(f2);
SetTextBuf (f1,Bufin);
SetTextBuf (f2,Bufout);
readln(f1,n,tt);
for i:=1 to n do read(f1,t[i]);
for i:=1 to n do begin
x:=t[i];
repeat
if x mod 2=1 then aux:=aux+1;
x:=x div 2;
until x=0;
b[i]:=aux+b[i-1];
bi[i]:=aux;
aux:=0;
if b[i]=tt then num:=num+1;

repeat
if b[i]-b[ii]>tt then ii:=ii+1;
if b[i]-b[ii]=tt then num:=num+1;
until (b[i]-b[ii]<=tt);

end;





writeln(f2,num);
close(f1);
close(f2);
end.
