program bile1;
type matrice=array[1..300, 1..300] of byte;
   tabel=array[1..300] of integer;
 var n,m,l,i,x,y,r:longint;
   c:matrice;
   a:tabel;
   p:boolean;
   f1,f2:text;

 Procedure resett;
  var j:longint;
  begin
   for j:=1 to n do
   a[j]:=0;
  end;

 Procedure parcurgere(i,x:longint);
  var j:longint;
  begin
   a[i]:=1;
   l:=l+1;
   if l=(n+1) div 2 then
    begin
     r:=r+1;
     p:=true;
    end else
     for j:=1 to n do
      if (c[i,j]=x) and (a[j]=0) then
       parcurgere(j,x);
   if p=true then
    exit;
  end;

begin
 assign(f1,'bile1.in'); reset(f1);
 assign(f2,'bile1.out'); rewrite(f2);
 readln(f1,n,m);

 for i:=1 to m do
  begin
   readln(f1,x,y);
   c[x,y]:=2;
   c[y,x]:=1;
  end;

 r:=0;
 for i:=1 to n do
  begin
   p:=false;
   l:=-1;
   Resett;
   parcurgere(i,1);
   if l<(n+1) div 2 then
   begin
    p:=false;
    l:=-1;
    Resett;
    parcurgere(i,2);
   end;
  end;

 write(f2,r);

 close(f1);
 close(f2);
end.