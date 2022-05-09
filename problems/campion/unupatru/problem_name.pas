program unupatru;
type tabel=array[1..10] of qword;
var n,i,k,j:integer; suma:qword; s:string;
f1,f2:text; t:tabel;
begin
assign(f1,'unupatru.in'); reset(f1);
assign(f2,'unupatru.out'); rewrite(f2);
readln(f1,n);
for i:=1 to n do read(f1,t[i]);

for i:=1 to n do begin
k:=0;
str(t[i],s);
repeat
suma:=0;
for j:=1 to length(s) do
suma:=suma+sqr(ord(s[j])-48);
k:=k+1;
if (suma<>1) and (suma<>4) then begin s:=''; str(suma,s); end;
until (suma=1) or (suma=4);
if (t[i]=4) or (t[i]=1) then write(f2,0,' ') else write(f2,k,' ');
end;

close(f1);
close(f2);
end.