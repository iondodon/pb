program nrpomi1;
type tabel=array[1..1002] of longint;

var n,ti,nr,i,j:longint; t:tabel;
f1,f2:text;

begin
assign(f1,'nrpomi.in'); reset(f1);
assign(f2,'nrpomi.out'); rewrite(f2);
readln(f1,n,ti);
for i:=1 to n do read(f1,t[i]);

nr:=1;
t[n+1]:=t[n-1];
i:=0;
repeat
i:=i+2;
if t[i-1]=t[i+1] then
nr:=(nr*(ti-1)) mod 1234 else
nr:=(nr*(ti-2)) mod 1234;

until (i=n-1) or (i=n);

write(f2,nr);
close(f1);
close(f2);
end.