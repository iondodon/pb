program drenaj;
type
matrice=array[0..101, 0..101] of integer;
lista=^date;
   date=record
   ri,co:integer;
   next:lista;
   end;
var n,m,i,j,r:integer;
  z,a,x,y:lista;
  l,s:matrice;
  q:boolean;
  f1,f2:text;

Procedure fill(rind,col,c:integer);
begin
 s[rind,col]:=1;
 a^.next:=nil;
 a^.co:=0;
 a^.ri:=0;
 z:=a;
 new(x);
 x^.ri:=rind;
 x^.co:=col;
 x^.next:=nil;
 a^.next:=x;
 z:=x;
 y:=a^.next;

 while y<>nil do
  begin
   if (l[y^.ri-1,y^.co]=c) and (s[y^.ri-1,y^.co]=0) then
    begin new(x); x^.ri:=y^.ri-1; x^.co:=y^.co; x^.next:=nil; z^.next:=x; z:=x; s[x^.ri,x^.co]:=1; end;
   if (l[y^.ri,y^.co+1]=c) and (s[y^.ri,y^.co+1]=0) then
    begin new(x); x^.ri:=y^.ri; x^.co:=y^.co+1; x^.next:=nil; z^.next:=x; z:=x; s[x^.ri,x^.co]:=1; end;
   if (l[y^.ri+1,y^.co]=c) and (s[y^.ri+1,y^.co]=0) then
    begin new(x); x^.ri:=y^.ri+1; x^.co:=y^.co; x^.next:=nil; z^.next:=x; z:=x; s[x^.ri,x^.co]:=1; end;
   if (l[y^.ri,y^.co-1]=c) and (s[y^.ri,y^.co-1]=0) then
    begin new(x); x^.ri:=y^.ri; x^.co:=y^.co-1; x^.next:=nil; z^.next:=x; z:=x; s[x^.ri,x^.co]:=1; end;
   if ((l[y^.ri-1,y^.co]<c) and (l[y^.ri-1,y^.co]<>-1)) or
   ((l[y^.ri,y^.co+1]<c) and (l[y^.ri,y^.co+1]<>-1)) or
   ((l[y^.ri+1,y^.co]<c) and (l[y^.ri+1,y^.co]<>-1)) or
   ((l[y^.ri,y^.co-1]<c) and (l[y^.ri,y^.co-1]<>-1)) then
    q:=true;
   y:=y^.next;
  end;
end;



begin
 assign(f1,'drenaj.in'); reset(f1);
 assign(f2,'drenaj.out'); rewrite(f2);
 readln(f1,n,m);

 for i:=0 to n+1 do
  begin
   l[i,0]:=-1;
   l[i,m+1]:=-1;
  end;
 for j:=0 to m+1 do
  begin
   l[0,j]:=-1;
   l[n+1,j]:=-1;
  end;

 for i:=1 to n do
  begin
   for j:=1 to m do
    read(f1,l[i,j]);
   readln(f1);
  end;

 new(a);
 a^.ri:=0;
 a^.co:=0;
 a^.next:=nil;
 z:=a;

 r:=0;
 for i:=1 to n do
  for j:=1 to m do
   if s[i,j]=0 then
    begin
     q:=false;
     fill(i,j,l[i,j]);
     if q=false then
      r:=r+1;
    end;

 writeln(f2,r);

 close(f1);
 close(f2);
end.