program dale;
type tabel=array[1..10000] of int64;
var n,l:longint;
  a:tabel;
  f1,f2:text;

procedure afisare;
 var j:longint;
 begin
  for j:=l downto 1 do
   write(f2,a[j]);
 end;

procedure putere(p,x:longint);
 var i,j,r:longint;
   s:string;
 begin
  for i:=1 to p do
  begin 
   r:=0;
    for j:=1 to l Do
     begin
      a[j]:=a[j]*16+r;
      r:=a[j] div 10;
      a[j]:=a[j] mod 10;
     end;
   if r<>0 then
    begin
     str(r,s);
     for j:=length(s) downto 1 do
      begin
       l:=l+1;
       a[l]:=ord(s[j])-48;
      end;
    end;
  end;

  if x<>0 then
  for i:=1 to x do
   begin
    r:=0;
    for j:=1 to l Do
     begin
      a[j]:=a[j]*2+r;
      r:=a[j] div 10;
      a[j]:=a[j] mod 10;
     end;
    if r<>0 then
     begin
      str(r,s);
      for j:=length(s) downto 1 do
       begin
        l:=l+1;
        a[l]:=ord(s[j])-48;
       end;
     end;
   end;

 end;

procedure main;
 begin
  read(f1,n);
  n:=n+1;
  l:=1;
  a[1]:=1;
  putere(n div 4,n mod 4);
  afisare;
 end;

begin
 assign(f1,'dale.in'); reset(f1);
 assign(f2,'dale.out'); rewrite(f2);
 main;
 close(f1);
 close(f2);
end.