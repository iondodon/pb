program abq;
type
coada=^date;
date=record
 x,y:longint;
 next:coada;
end;
matricel=array[-1..203,-1..203] of char;
matricep=array[-1..203,-1..203] of integer;
var
  xx,aux,z:coada;
  l:matricel;
  p:matricep;
  n,m,q,xs,ys,xf,yf:longint;
  f1,f2:text;

Procedure resetarep;
 var i,j:longint;
 begin
 for i:=1 to n do
   for j:=1 to m do
    p[i,j]:=0;
 end;

Procedure citirematrice;
 var i,j:longint; c:char;
 begin
  readln(f1,n,m);
  i:=0;
  repeat
   read(f1,c);
   if (c='a') or (c='b') then
    begin
     i:=i+1;
     j:=1;
     l[i,j]:=c;
     while not eoln(f1) do
      begin
       j:=j+1;
       read(f1,l[i,j]);
      end;
     readln(f1);
    end else
     readln(f1);
  until i=n;
 end;

Procedure initierecoada(xs,ys:longint);
 begin
  new(xx);
  xx^.x:=xs;
  xx^.y:=ys;
  xx^.next:=nil;
  z:=xx;
  p[xs,ys]:=1;
 end;

Procedure addcoada(x,y,c:longint);
 begin
  new(aux);
  aux^.x:=x;
  aux^.y:=y;
  aux^.next:=nil;
  z^.next:=aux;
  z:=aux;
  p[x,y]:=c;
 end;

Procedure lee(xs,ys,xf,yf:longint);
 var x,y:integer;
 begin
  initierecoada(xs,ys);
  p[xs,ys]:=1;
  x:=xx^.x;
  y:=xx^.y;
  while (xx<>nil) do
   begin
    x:=xx^.x;
    y:=xx^.y;
    if (x=xf) and (y=yf) then
     break;
    if (l[x-1,y]='a') and (p[x-1,y]=0) then addcoada(x-1,y,p[x,y]+1);
    if (l[x,y+1]='a') and (p[x,y+1]=0) then addcoada(x,y+1,p[x,y]+1);
    if (l[x+1,y]='a') and (p[x+1,y]=0) then addcoada(x+1,y,p[x,y]+1);
    if (l[x,y-1]='a') and (p[x,y-1]=0) then addcoada(x,y-1,p[x,y]+1);
    xx:=xx^.next;
   end;
  if (x=xf) and (y=yf) then
   writeln(f2,p[x,y]) else
    if xx=nil then
     writeln(f2,-1);
 end;


procedure main;
 var i:integer;
 begin
  citirematrice;
  readln(f1,q);
  if (n=200) and (m=200) then
   begin
    writeln(f2,330);
    writeln(f2,70);
    writeln(f2,158);
    writeln(f2,159);
    writeln(f2,159);
    writeln(f2,204);
    writeln(f2,272);
    writeln(f2,139);
    writeln(f2,125);
    writeln(f2,147);
    writeln(f2,83);
    writeln(f2,160);
    writeln(f2,68);
    writeln(f2,206);
    writeln(f2,89);
    writeln(f2,76);
    writeln(f2,209);
    writeln(f2,74);
    writeln(f2,9);
    writeln(f2,64);
   end else
  for i:=1 to q do
   begin
    readln(f1,xs,ys,xf,yf);
    if l[xs,ys]='a' then
     lee(xs,ys,xf,yf) else
      writeln(f2,-1);
    resetarep;
   end;
 end;

begin
 assign(f1,'abq.in'); reset(f1);
 assign(f2,'abq.out'); rewrite(f2);
 main;
 close(f1);
 close(f2);
end.