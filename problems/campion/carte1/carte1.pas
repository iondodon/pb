Program carte1;
type tabel=array[1..10001] of integer;
 var n,nz,acz,max:integer;
 f1,f2:text;
 t:tabel;

procedure citiredate;
 var i,x:integer;
 begin
  readln(f1,n);
  for i:=1 to n do 
   begin
    read(f1,x);
    t[x]:=i;
   end;
  t[n+1]:=0;
 end;

procedure main;
 var i,u,l:integer;
 begin
  citiredate;
  nz:=1;
  acz:=0;
  max:=0;
  u:=0;
  l:=0;
  for i:=1 to n+1 do
   if t[i]>u then

    begin
     u:=t[i];
     l:=l+1;
    end else
     begin
      if l>max then
       begin
        acz:=nz;
        max:=l;
       end;
      nz:=nz+1;
      l:=1;
      u:=t[i];
     end;
  write(f2,nz-1,' ',acz,' ',max);
 end;

begin
 assign(f1,'carte1.in'); reset(f1);
 assign(f2,'carte1.out'); rewrite(f2);
 main;
 close(f1);
 close(f2);
end.