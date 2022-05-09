program aranjare2;
type tabel=array[1..62000] of longint;
 var t,loc:^tabel;
  n,i,s,d:longint;
  f1,f2:text;
begin
 assign(f1,'aranjare2.in'); reset(f1);
 assign(f2,'aranjare2.out'); rewrite(f2);
 read(f1,n);

 new(t); new(loc);

 s:=0;
 d:=n;
 for i:=1 to 2*n do
  if i mod 2=1 then
   begin
    s:=s+1;
    loc^[i]:=s;
    t^[s]:=i;
   end else
    begin
     d:=d+1;
     loc^[i]:=d;
     t^[d]:=i;
    end;

 for i:=1 to 2*n do
  if t^[i]<>i then
   begin
                writeln(f2,i,' ',loc^[i]);
    t^[loc^[i]]:=t^[i];
    loc^[t^[i]]:=loc^[i];
    loc^[i]:=i;
    t^[i]:=i;
   end;

 dispose(t);
 dispose(loc);

 close(f1);
 close(f2);
end.