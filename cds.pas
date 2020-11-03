program cds;
type tabel=array[0..80000] of longint;
     tabel1=array[0..80000] of longint;
var max,i,j,n,s,n1,n2:longint;
f1,f2:text;        t:tabel1; l:tabel1;

begin s:=0;
assign(f1,'cds.in'); reset(f1);
assign(f2,'cds.out'); rewrite(f2);
readln(f1,n);
for i:=1 to n do begin read(f1,l[i]);  s:=s+l[i]; end;
n1:=0; n2:=0;
max:=0; t[0]:=1;

for i:=1 to n do begin

for j:=max+1 downto 0 do if t[j]=1 then
begin  max:=j+l[i]; t[max]:=1;  break; end;


for j:=j-1 downto 0 do
if t[j]=1 then t[j+l[i]]:=1;

end;

for i:=700 downto 0 do
if (t[i]=1) and (t[i]<=700) then begin n1:=s-i; n2:=i; break; end;

if (n2>700) or (n1>700) then write(f2,'0',' ','0') else write(f2,s-i,' ',i);

close(f1);
close(f2);
end.
