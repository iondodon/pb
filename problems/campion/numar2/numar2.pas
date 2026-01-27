program numar2;
type tabel=array[1..8] of longint;
var n,i,j:longint;
f1,f2:text; t:tabel;
begin
assign(f1,'numar2.in'); reset(f1);
assign(f2,'numar2.out'); rewrite(f2);
read(f1,n);
t[1]:=0;
t[2]:=1;
t[3]:=8;
t[4]:=343;
t[5]:=1331;
t[6]:=1030301;
t[7]:=1367631;
t[8]:=1003003001;

for i:=8 downto 1 do
if t[i]<=n then begin write(f2,t[i]); break; end;

close(f1);
close(f2);
end.