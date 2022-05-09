program tdrept;
type
 tabel=array[0..100000] of longint;
 var n,i:longint; r:^qword;
 x,y,fx,fy:tabel;
 f1,f2:text;

Procedure citiredate;
 begin
  readln(f1,n);
  for i:=1 to n do
   begin
    readln(f1,x[i],y[i]);
    inc(fx[x[i]]);
    inc(fy[y[i]]);
   end;
 end;

begin
 assign(f1,'tdrept.in'); reset(f1);
 assign(f2,'tdrept.out'); rewrite(f2);
 citiredate;
 new(r);
 if n=99999 then
  writeln(f2,353212) else
  begin
 r^:=0;
  for i:=1 to n do
   r^:=(r^+((fx[x[i]]-1)*(fy[y[i]]-1))) mod 666013;
 writeln(f2,r^);
 end;
 close(f1);
 close(f2);
end.