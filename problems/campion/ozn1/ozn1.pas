Program ozn1;
type tabel=array[0..2000001] of longint;
var n,k,x1,x2,y1,y2,nr:longint;
 fr:tabel;
 f1,f2:text;

Procedure readdata;
var i,maxx2:longint;
begin
readln(f1,n,k);
maxx2:=0;
for i:=1 to n do
 begin
 readln(f1,x1,y1,x2,y2,nr);
 inc(fr[x1],nr); dec(fr[x2+1],nr);
 if x2>maxx2 then maxx2:=x2;
 end;
for i:=1 to maxx2+1 do 
 fr[i]:=fr[i]+fr[i-1];
end;

Procedure run;
var i,x:longint;
begin
for i:=1 to k do 
 begin
 read(f1,x);
 writeln(f2,fr[x]);
 end;
end;

begin
assign(f1,'ozn1.in'); reset(f1);
assign(f2,'ozn1.out'); rewrite(f2);

readdata;
run;

close(f1);
close(f2);
end.