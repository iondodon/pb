program consiliu; 
type tabel=array[0..1439] of longint;
 var n,hs,ms,hf,mf,i,j,r:integer;
 t:tabel;
 f1,f2:text;
begin
 assign(f1,'consiliu.in'); reset(f1);
 assign(f2,'consiliu.out'); rewrite(f2);
 readln(f1,n);

 for i:=1 to n do
  begin
   readln(f1,hs,ms,hf,mf);
   if (hs<hf) or ((hs=hf) and (ms<mf)) then
    begin
     for j:=hs*60+ms to hf*60+mf-1 do
      t[j]:=t[j]+1;
    end else
   if (hs=hf) and (ms=mf)then
    begin
     for j:=0 to 1439 do
      t[j]:=t[j]+1;
    end else
   if (hs>hf) or ((hs=hf) and (ms>mf)) then
    begin
     for j:=hs*60+ms to 1439 do
      t[j]:=t[j]+1;
     for j:=0 to hf*60+mf-1 do
      t[j]:=t[j]+1;
    end;
  end;

  r:=0;
  for j:=0 to 1439 do
   if t[j]=n then
    r:=r+1;

  writeln(f2,r);

close(f1);
close(f2);
end.