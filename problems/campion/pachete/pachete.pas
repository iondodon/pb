program pachete; uses math;
type 
 celula=^date;
 date=record
  inst,d:Integer;
  min:longint;
 end;
 tabel=array[1..100000] of celula;
 var n:longint;
   t:tabel;
   f1,f2:text;

Procedure citiredate;
 var i:longint;
 begin
  readln(f1,n);
  for i:=1 to n do
   begin 
    new(t[i]);
    readln(f1,t[i]^.inst,t[i]^.d);
   end;
 end;

Procedure main;
 var i:longint;
 begin
  citiredate;
  t[n]^.min:=t[n]^.d;
  for i:=n-1 downto 1 do
   t[i]^.min:=t[i]^.d+max(0,t[i+1]^.min-t[i]^.inst);
  write(f2,t[1]^.min);
 end;

begin
 assign(f1,'pachete.in'); reset(f1);
 assign(f2,'pachete.out'); rewrite(f2);
 main;
 close(f1);
 close(f2);
end.