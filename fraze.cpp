program fraze;
type textt=record
s:string;
lo:integer;
end;
	tabel1=array[97..122] of integer;
	tabel3=array[1..255] of integer;
	tabel4=array[1..100] of textt;
var s:string; i,j,frp,fr,u,a,l,aux,aa,v,g:longint; t1:tabel1; t3:tabel3; t4:tabel4;
f1,f2:text; p,q:boolean; au:string;
begin
assign(f1,'fraze.in'); reset(f1);
assign(f2,'fraze.out'); rewrite(f2);

u:=0; fr:=0; frp:=0; j:=0;
while not eoln(f1) do begin
j:=j+1;
readln(f1,t4[j].s); end;

for l:=1 to j do
begin
u:=u+1;
for i:=1 to length(t4[l].s)-1 do
if (ord(t4[l].s[i])>=97) and (ord(t4[l].s[i])<=122) then inc(t1[ord(t4[l].s[i])]) else
if (ord(t4[l].s[i])>=65) and (ord(t4[l].s[i])<=90) then inc(t1[ord(t4[l].s[i])+32]);
p:=false; q:=false;
for i:=97 to 122 do
begin
if t1[i]=0 then p:=true;
if t1[i]>1 then q:=true;
end;
if p=false then begin fr:=fr+1; t4[l].lo:=ord(t4[l].s[1])+32; t3[l]:=1;  end;
if (p=false) and (q=false) then frp:=frp+1;
for i:=97 to 122 do t1[i]:=0;
end;

repeat
p:=false;
for i:=2 to j do
if (t4[i].s>t4[i-1].s) then
begin
aux:=t4[i-1].lo;      au:=t4[i-1].s;       aa:=t3[i-1];
t4[i-1].lo:=t4[i].lo; t4[i-1].s:=t4[i].s;  t3[i-1]:=t3[i];
t4[i].lo:=aux;        t4[i].s:=au;         t3[i]:=aa;
p:=true;
end;
until not p;



writeln(f2,fr,' ',frp);
for i:=j downto 1 do
if t3[i]=1 then writeln(f2,t4[i].s);

close(f1);
close(f2);
end.
