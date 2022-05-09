Program RoyFloydWarshall;
type matrice=array[1..100,1..100] of longint;
var n:shortint;
  f1,f2:text;
  l:matrice;

Procedure afisare;
var i,j:shortint;
begin
  for i:=1 to n do
  begin
    for j:=1 to n do
      write(f2,l[i,j],' ');
    writeln(f2);
  end;
end;

Procedure citiredate;
var i,j:shortint;
begin
  readln(f1,n);
  for i:=1 to n do
  begin
    for j:=1 to n do
      read(f1,l[i,j]);
    readln(f1);
  end;
  for i:=1 to n do
    l[i,i]:=0;
end;

Procedure royfloyd;
var i,j,k:shortint;
begin
  for k:=1 to n do
    for i:=1 to n do
      for j:=1 to n do
        if (l[i,k]<>0) and (l[k,j]<>0) and (i<>j) then
          if (l[i,j]>l[i,k]+l[k,j]) or (l[i,j]=0) then
            l[i,j]:=l[i,k]+l[k,j];

end;

Procedure main;
begin
  citiredate;
  royfloyd;
  afisare;
end;



begin
  assign(f1,'royfloyd.in'); reset(f1);
  assign(f2,'royfloyd.out'); rewrite(f2);
  main;
  close(f1);
  close(f2);
end.