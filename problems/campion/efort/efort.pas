program efort;
type tabel=array[1..1000] of shortint;
 var n,k:integer;
   t:tabel;
   picaturi:longint;
   f1,f2:text;

procedure citiredate;
 var i:longint;
 begin
  readln(f1,n,k);
  for i:=1 to n Do
   read(f1,t[i]);
 end;

function fibo(x:longint):longint;
 var a,b,c,i,s:longint;
 begin
  if x=0 then
   fibo:=0 else
    begin
     i:=0;
     a:=1;
     b:=1;
     c:=0;
     s:=0;
     repeat
      i:=i+1;
      c:=a+b;
      a:=b;
      b:=c;
      s:=s+b;
     until i=x;
     fibo:=s;
    end;
 end;

Procedure main;
 var i,d:integer;
 begin
  citiredate;
  picaturi:=0;
  i:=0;
  d:=0;

  repeat
   while (d<k) and (i<n) Do
    begin
     i:=i+1;
     d:=d+t[i];
    end;
   if d>=k then
    begin
     picaturi:=picaturi+k+fibo(d-k);
     d:=0;
    end;
  until i=n;

  if (d<k) then 
   picaturi:=picaturi+k-(k-d);

  write(f2,picaturi);
 end;

begin
 assign(f1,'efort.in'); reset(f1);
 assign(f2,'efort.out'); rewrite(f2);
 main;
 close(f1);
 close(f2);
end.