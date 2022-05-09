program cod5;
type fregventa=array[0..99] of longint;
  var n,i,x:longint;
    fr:fregventa;
  f1,f2:text;
begin
 assign(f1,'cod5.in'); reset(f1);
 assign(f2,'cod5.out'); rewrite(f2);
 readln(f1,n);

 for i:=1 to n do
  begin
   read(f1,x);
   fr[x]:=fr[x]+1;
  end;

 for i:=0 to 99 do
  if fr[i] mod 2=1 then
   write(f2,i); 

 close(f1);
 close(f2);
end.