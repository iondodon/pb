program xor1;
type tabel1=array[1..2000] of longint;
     tabel2=array[0..2000] of longint;
 
var i,n,k,p,x1,x2,x3,max:longint;
f1,f2:text; t:tabel1; x:tabel2;

begin max:=0;
assign(f1,'xor1.in'); reset(f1);
assign(f2,'xor1.out'); rewrite(f2);
readln(f1,n);
for i:=1 to n do read(f1,t[i]);

for i:=1 to n do
x[i]:=x[i-1] xor t[i];

k:=0; 
repeat
k:=k+1; p:=k;
repeat
p:=p+1;
x1:=x[k];
x2:=x[p] xor x[k];
x3:=x[n] xor x[p];
if x1+x2+x3>max then max:=x1+x2+x3;
until p=n;
until k=n-1;

writeln(f2,max);


close(f1);
close(f2);
end.