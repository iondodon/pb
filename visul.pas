program visul;
type tabel=array[0..11] of integer;
     multime=set of 0..255;
	 verific=set of 0..255;
	
var n,i,j:longint; t:tabel; p:boolean;
f1,f2:text; m:multime; v:verific;

begin
assign(f1,'visul.in'); reset(f1);
assign(f2,'visul.out'); rewrite(f2);
readln(f1,n);
p:=false;

m:=m+[11]; m:=m+[13]; m:=m+[17]; m:=m+[19]; m:=m+[23]; m:=m+[29]; m:=m+[31];
m:=m+[37]; m:=m+[41]; m:=m+[43]; m:=m+[47]; m:=m+[53]; m:=m+[59]; m:=m+[61];
m:=m+[67]; m:=m+[71]; m:=m+[73]; m:=m+[79]; m:=m+[83]; m:=m+[89]; m:=m+[97];

t[1]:=n; j:=2;

if (n<>1) and (n<>10) then begin 
repeat
repeat
t[j]:=t[j]+1
until ((t[j-1]*10+t[j] in m=true) and (t[j-1]*10+t[j] in v=false)) or ((t[j]=9) and (t[j-1]*10+t[j] in m=true));

if ((t[j-1]*10+t[j] in m=true) and (t[j-1]*10+t[j] in v=false)) then begin
v:=v+[t[j-1]*10+t[j]]; j:=j+1; end;

if ((t[j]=9) and (t[j-1]*10+t[j] in m=false)) then begin
v:=v-[t[j-2]*10+t[j-1]]; end;

until j=n+1;
for i:=1 to n do write(f2,t[i]); end else
write(f2,'-1');


close(f1);
close(f2);
end.
