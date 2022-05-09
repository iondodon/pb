Program joc9;
type matrice=array[-101..201,-101..201] of char;
var n,x,y,c,lg,lgp,orientareprec,orientare:integer;
 ch:char;
 l:matrice;
 p:boolean;
 f1,f2:text;

Procedure marcare;
var i,j:integer;
begin
for i:=1 to n do
 for j:=1 to n do
  l[i,j]:='.';
end;

Procedure rezultat;
var i,j:integer;
begin
for i:=1 to n do
 begin
 for j:=1 to n do
  write(f2,l[i,j]);
 writeln(f2);
 end;
end;

Procedure afisare(orientare:integer);
var i,j:integer;
begin
case orientare of
 1: begin
  for j:=y to y+lg-1 do
   for i:=x downto x-(j-y) do l[i,j]:=ch;
  x:=i; y:=j;
  end;
 2: begin
  for i:=x downto x-lg+1 do
   for j:=y downto y-(x-i) do l[i,j]:=ch;
  x:=i; y:=j;
  end;
 3: begin
  for j:=y downto y-lg+1 do
   for i:=x to x+(y-j) do l[i,j]:=ch;
  x:=i; y:=j;
  end;
 4: begin
  for i:=x to x+lg-1 do
   for j:=y to y+(i-x) do l[i,j]:=ch;
  x:=i; y:=j;
  end;
 end;
end;

Procedure cautare(orientare:integer);
var i,j:integer;
begin
p:=true;
case orientare of
 1: begin
  for j:=y to y+lg-1 do
   for i:=x downto x-(j-y) do if l[i,j]<>'.' then p:=false;
  end;
 2: begin
  for i:=x downto x-lg+1 do
   for j:=y downto y-(x-i) do if l[i,j]<>'.' then p:=false;
  end;
 3: begin
  for j:=y downto y-lg+1 do
   for i:=x to x+(y-j) do if l[i,j]<>'.' then p:=false;
  end;
 4: begin
  for i:=x to x+lg-1 do
   for j:=y to y+(i-x) do if l[i,j]<>'.' then p:=false;
  end;
 end;
end;

Procedure verificare(c,lg:integer);
begin
case orientareprec of
 0:;
 1:  if c=2 then begin y:=y+1; x:=x+lgp-1; end else if c=3 then x:=x-1;
 2: if c=2 then begin x:=x-1; y:=y+lgp-1; end else if c=3 then y:=y-1;
 3: if c=2 then begin y:=y-1; x:=x-lgp+1; end else if c=3 then x:=x+1;
 4: if c=2 then begin x:=x+1; y:=y-lgp+1; end else if c=3 then y:=y+1;
 end;
 cautare(orientare);
 if p=false then
  begin
  inc(orientare);
  if orientare>4 then orientare:=1;
  cautare(orientare);
  end;
 if p=true then
  afisare(orientare);
end;



begin
assign(f1,'joc9.in'); reset(f1);
assign(f2,'joc9.out'); rewrite(f2);

lg:=0;
lgp:=0;
ch:='a';
p:=true;
readln(f1,n);
marcare;
readln(f1,x,y,lg);
orientareprec:=1;
orientare:=1;
verificare(0,lg);
lgp:=lg;
if p=true then
 while (p=true) and (not eof(f1)) do
  begin
  orientare:=orientareprec;
  ch:=chr(ord(ch)+1);
  if ch>'z' then ch:='a';
  readln(f1,c,lg);
  verificare(c,lg);
  lgp:=lg;
  orientareprec:=orientare;
  end;
rezultat;

close(f1);
close(f2);
end.