Program CiurulLuiEratosthenes;
type tabel=array[2..2000000] of boolean;
var n,i,r:longint;
  j:qword;
  f1,f2:text;
  p:tabel;

begin
  assign(f1,'ciur.in'); reset(f1);
  assign(f2,'ciur.out'); rewrite(f2);

  readln(f1,n);

  for i:=2 to trunc(sqrt(n)) do
    if p[i]=false then
    begin
      j:=i*i;
      while j<=n do
      begin
        p[j]:=true;
        j:=j+i;
      end;
    end;


  for i:=2 to n do
    if p[i]=false then
      r:=r+1;

  writeln(f2,r);



  close(f1);
  close(f2);
end.
