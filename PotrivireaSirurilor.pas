Program PotrivireaSirurilor;
type tabelchar=array[0..2000010] of char;
  tabelpi=array[0..2000010] of longint;
  solutie=array[1..2000010] of longint;
  buf=array[1..10000] of byte;
var a,b:tabelchar;
  pi:tabelpi;
  sol:solutie;
  la,lb,i,r:longint;
  c:char;
  bufin,bufout:buf;
  f1,f2:text;

Procedure prefix;
var i,k:longint;
begin
  k:=0;
  pi[1]:=0;
  for i:=2 to la do
  begin
    while (k>0) and (a[k+1]<>a[i]) do
      k:=pi[k];
    if a[k+1]=a[i] then
      k:=k+1;
    pi[i]:=k;
  end;
end;

Procedure KMP;
var i,k:longint;
begin
  k:=0;
  for i:=1 to lb do
  begin
    while (k>0) and (b[i]<>a[k+1]) do
      k:=pi[k];
    if a[k+1]=b[i] then
      k:=k+1;
    if k=la then
    begin
      r:=r+1;
      sol[r]:=i-la;
    end;
  end;
end;

begin
  assign(f1,'strmatch.in'); reset(f1);
  assign(f2,'strmatch.out'); rewrite(f2);

  SetTextBuf(f1,bufin);
  SetTextBuf(f2,bufout);

  la:=0;
  while not eoln(f1) do
  begin
    la:=la+1;
    read(f1,c);
    a[la]:=c;
  end;
  readln(f1);
  lb:=0;
  while not eoln(f1) do
  begin
    lb:=lb+1;
    read(f1,c);
    b[lb]:=c;
  end;

  r:=0;
  if la<=lb then
  begin
    prefix;
    KMP;
  end;

  writeln(f2,r);
  if r>1000 then r:=1000;
  for i:=1 to r do
    write(f2,sol[i],' ');

  close(f1);
  close(f2);
end.