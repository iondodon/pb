Program EvaluareaUneiExpresii;
type tabel=array[0..100000] of char;
var     s:tabel;
  f1,f2:text;
  i,r:longint;

Procedure citiresir;
begin
  i:=0;
  while not eoln(f1) do
  begin
    i:=i+1;
    read(f1,s[i]);
  end;
end;

Function eval():longint;
Forward;

Function factor():longint;
begin
  factor:=0;
  if s[i]='(' then
  begin
    i:=i+1;
    factor:=eval();
    i:=i+1;
  end else
    while (s[i]>='0') and (s[i]<='9') do
    begin
      factor:=factor*10+ord(s[i])-48;
      i:=i+1;
    end;
end;


Function termen():longint;
begin
  termen:=factor();
  while (s[i]='*') or (s[i]='/') do
    case s[i] of
      '*': begin i:=i+1; termen:=termen*factor; end;
      '/': begin i:=i+1; termen:=termen div factor; end;
    end;
end;

Function eval():longint;
begin
  eval:=termen();
  while (s[i]='+') or (s[i]='-') do
    case s[i] of
      '+': begin i:=i+1; eval:=eval+termen(); end;
      '-': begin i:=i+1; eval:=eval-termen(); end;
    end;
end;


begin
  assign(f1,'evaluare.in'); reset(f1);
  assign(f2,'evaluare.out'); rewrite(f2);

  citiresir;
  i:=1;
  write(f2,eval());

  close(f1);
  close(f2);
end.