Program Exp;
type vector = array[1..6000] of integer;
var x, p, y, f: vector;
    m, n, dp, i, k, j: integer;
    sw: boolean;
    ff: text;
procedure cit;
var i: integer;
    f: text;
begin
  assign(f, 'exp1.in'); reset(f);
  readln(f, m);
  readln(f, n);
  for i:=1 to n do
    read(f, x[i]);
  close(f);
end;
function prim(k: integer): boolean;
var i: integer;
begin
  prim := true;
  for i := 2 to trunc(sqrt(k)) do
    if k mod i=0 then
      begin
        prim := false;
        exit;
      end;
end;
procedure prime;
var i, j: integer;
begin
  p[1] := 2;
  p[2] := 3;
  dp := 2;
  i := 5;
  while i<30000 do
    begin
      if prim(i) then
        begin
          inc(dp);
          p[dp] := i;
        end;
      i := i+2;
    end;
end;
begin
  cit;
  prime;
  for i := 1 to dp do
    f[i] := 0;
  for i := 1 to n do
    begin
      j := 1;
      while x[i]<>1 do
        begin
          while x[i] mod p[j]=0 do
            begin
              inc(f[j]);
              x[i] := x[i] div p[j];
            end;
          inc(j);
        end;
    end;
  sw := true;
  for i := 1 to dp do
    if f[i] mod m<>0 then
      begin
        sw := false;
        break;
      end;
  assign(ff, 'exp1.out'); rewrite(ff);
  if not sw then
    writeln(ff, 0)
  else
    begin
      writeln(ff, 1);
      for i := 1 to dp do
        if f[i]>0 then
          writeln(ff, p[i], ' ', f[i] div m);
    end;
  close(ff);
end.