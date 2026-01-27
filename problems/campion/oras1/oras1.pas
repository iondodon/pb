program oras1;
type matrice=array[1..200,1..200] of boolean;
  matricechar=array[0..201,0..201] of char;
  lista=^date;
  date=record
   x,y:integer;
   next:lista;
  end;
var n,m,i,j,contur,cladiri,parc:longint;
  l:matricechar;
  lp:matrice;
  a,u,z,xx:lista;
  f1,f2:text;

Procedure resetarematricelp;
 begin
  for i:=1 to n do
   for j:=1 to m do 
    lp[i,j]:=false;
 end;

Procedure limitare;
 begin
  for j:=0 to m+1 do
   begin
    l[0,j]:='_';
    l[n+1,j]:='_';
   end;
  for i:=0 to n+1 do
   begin
    l[i,0]:='_';
    l[i,m+1]:='_';
   end;
 end;

Procedure citirematrice;
 begin
  for i:=1 to n do
   begin
    for j:=1 to m do
     read(f1,l[i,j]);
    readln(f1);
   end;
  limitare;
 end;

Function cautare(x,y:integer):boolean;
var n:integer;
 begin
  n:=0;
  cautare:=false;
  if (l[x-1,y]='S') or (l[x-1,y]='P') or (l[x-1,y]='C') then
   n:=n+1;
  if (l[x-1,y+1]='S') or (l[x-1,y+1]='P') or (l[x-1,y+1]='C') then
   n:=n+1;
  if (l[x,y+1]='S') or (l[x,y+1]='P') or (l[x,y+1]='C') then
   n:=n+1;
  if (l[x+1,y+1]='S') or (l[x+1,y+1]='P') or (l[x+1,y+1]='C') then
   n:=n+1;
  if (l[x+1,y]='S') or (l[x+1,y]='P') or (l[x+1,y]='C') then
   n:=n+1;
  if (l[x+1,y-1]='S') or (l[x+1,y-1]='P') or (l[x+1,y-1]='C') then
   n:=n+1;
  if (l[x,y-1]='S') or (l[x,y-1]='P') or (l[x,y-1]='C') then
   n:=n+1;
  if (l[x-1,y-1]='S') or (l[x-1,y-1]='P') or (l[x-1,y-1]='C') then
   n:=n+1;
  if n<8 then
  cautare:=true;
 end;

Procedure cautarecontur;
 begin
  for i:=1 to n do
   for j:=1 to m do
    if ((l[i,j]='S') or (l[i,j]='P') or (l[i,j]='C')) and (cautare(i,j)) then
     inc(contur);
 end;

Procedure resetarecoada(i,j:integer);
 begin
  new(a);
  a^.x:=-1;
  a^.y:=-1;
  a^.next:=nil;
  z:=a;
  u:=a;
  new(xx);
  xx^.x:=i;
  xx^.y:=j;
  xx^.next:=nil;
  z^.next:=xx;
  z:=xx;
 end;

Procedure addcoada(i,j:integer);
 begin
  new(xx);
  xx^.next:=nil;
  xx^.x:=i;
  xx^.y:=j;
  z^.next:=xx;
  z:=xx;
 end;

Procedure lee(c:char;i,j:integer);
 var x,y:integer; marime:integer;
 begin
  if c='P' then
   marime:=1;
  resetarecoada(i,j);
 repeat
  u:=u^.next;
  x:=u^.x;
  y:=u^.y;
  lp[x,y]:=true;
  if (l[x-1,y]=c) and (lp[x-1,y]=false) then
   begin
    lp[x-1,y]:=true;
    addcoada(x-1,y);
    if c='P' then inc(marime);
   end;
  if (l[x,y+1]=c) and (lp[x,y+1]=false) then
   begin
    lp[x,y+1]:=true;
    addcoada(x,y+1);
    if c='P' then inc(marime);
   end;
  if (l[x+1,y]=c) and (lp[x+1,y]=false) then
   begin
    lp[x+1,y]:=true;
    addcoada(x+1,y);
    if c='P' then inc(marime);
   end;
  if (l[x,y-1]=c) and (lp[x,y-1]=false) then
   begin
    lp[x,y-1]:=true;
    addcoada(x,y-1);
    if c='P' then inc(marime);
   end;
 until u^.next=nil;
  if marime>parc then
   parc:=marime;
 end;

Procedure extindere(c:char);
 begin
  for i:=1 to n do
   for j:=1 to m do
    if (l[i,j]=c) and (lp[i,j]=false) then
     begin
      if c='C' then
       inc(cladiri);
      lee(c,i,j);
     end;
 end;

begin
 assign(f1,'oras1.in'); reset(f1);
 assign(f2,'oras1.out'); rewrite(f2);
 readln(f1,n,m);

 citirematrice;
 cautarecontur;
 parc:=0;
 cladiri:=0;
 resetarematricelp;
 extindere('P');
 resetarematricelp;
 extindere('C');


 write(f2,contur,' ',cladiri,' ',parc);
 close(f1);
 close(f2);
end.