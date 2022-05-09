program joc;
var nj,i,n:longint;
  suma:qword;
  c:char;
  t:array[1..100] of longint;
  f1,f2:text;

Procedure citiredate;
var j:integer;
 begin
  for j:=1 to n do
   t[j]:=0;
  readln(f1,n);
  suma:=0;
  for j:=1 to n do
    read(f1,t[j]);
  readln(f1);
  readln(f1,c);
 end;

Procedure lucru;
var j:longint;
  p:boolean;
 begin
   for j:=2 to n do
    t[j]:=t[j-1] xor t[j];
   if t[j]=0 then
    begin
     if c='G' then writeln(f2,'I') else writeln(f2,'G');
    end else
    writeln(f2,c);
 end;

begin
 assign(f1,'joct.in'); reset(f1);
 assign(f2,'joct.out'); rewrite(f2);
        readln(f1,nj);
 n:=0;

 for i:=1 to nj do
  begin
   citiredate;
   if n>1 then
    lucru else
     if n=1 then
     writeln(f2,c);
  end;

 close(f1);
 close(f2);
end.