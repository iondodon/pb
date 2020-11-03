program cifrab;
var i,sum,baza,maxx,con:longint;
f1,f2:text; c:ansistring;
begin
assign(f1,'cifrab.in'); reset(f1);
assign(f2,'cifrab.out'); rewrite(f2);
read(f1,c);
sum:=0; maxx:=0;
for i:=1 to length(c) do
if ord(c[i])>maxx then maxx:=ord(c[i]);

if maxx>=65 then baza:=maxx-65+11 else
baza:=maxx-48+1;
writeln(f2,baza);


maxx:=0;
for i:=1 to length(c) do
if ord(c[i])>=65 then maxx:=maxx+ord(c[i])-65+10 else
maxx:=maxx+ord(c[i])-48;

maxx:=maxx mod (baza-1);

if maxx=0 then
begin
if baza<=10 then write(f2,baza-1) else write(f2,chr(baza+54));
end else
begin
if maxx<10 then write(f2,maxx) else
write(f2,chr(maxx+55));
end;






close(f1);
close(f2);
end.
