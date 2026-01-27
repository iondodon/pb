Program maroco;
type
 multime=set of 0..255;
 bat=record
 nr,p,nrb:longint;
 extras:boolean;
 m:multime;
 end;
 tabelbat=array[1..101] of bat;

var n,ion,gigel:longint;
 b:tabelbat;
 f1,f2:text;

Procedure readdata;
var i,j,bd:longint;
begin
readln(f1,n);
for i:=1 to n do
 begin
 b[i].nr:=i;
 read(f1,b[i].p);
 read(f1,b[i].nrb);
 for j:=1 to b[i].nrb do
  begin
  read(f1,bd);
  b[i].m:=b[i].m+[bd];
  end;
 readln(f1);
 end;
end;

Procedure qsort(st,dr:longint);
var pivot,i,j:longint; aux:bat;
begin
pivot:=b[(st+dr) div 2].p;
i:=st; j:=dr;
while i<=j do
 begin
 while b[i].p<pivot do
  i:=i+1;
 while b[j].p>pivot do
  j:=j-1;
 if i<=j then
  begin
  aux:=b[i];
  b[i]:=b[j];
  b[j]:=aux;
        i:=i+1;
        j:=j-1;
  end;
 end;
if j>st then qsort(st,j);
if i<dr then qsort(i,dr);
end;

Procedure simulare;
var i,j,u:longint; aux:bat;
begin
ion:=0;
gigel:=0;
u:=1;

for i:=n downto (n div 2)+1 do 
 begin
 aux:=b[i];
 b[i]:=b[(n-i)+1];
 b[(n-i)+1]:=aux;
 end;

while u<=n do
 begin
 for i:=1 to n do
  if (b[i].extras=false) and (b[i].m=[]) then
   begin
   b[i].extras:=true;
   if u mod 2=1 then
    ion:=ion+b[i].p else
     gigel:=gigel+b[i].p;
   for j:=1 to n do
    if (b[i].nr in b[j].m)=true then
     b[j].m:=b[j].m-[b[i].nr];
   break;
   end;
 u:=u+1;
 end;

if ion>gigel then
 writeln(f2,1,' ',ion) else
  if gigel>ion then writeln(f2,2,' ',gigel) else
   writeln(f2,0,' ',ion);
end;

begin
assign(f1,'maroco.in'); reset(f1);
assign(f2,'maroco.out'); rewrite(f2);

readdata;
qsort(1,n);
simulare;

close(f1);
close(f2);
end.