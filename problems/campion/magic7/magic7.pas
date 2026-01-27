program magic7;
var c,n,p:longint;
  f1,f2:text;

procedure citiredate;
 begin
  read(f1,c,n,p);
 end;

function putere(c,n:qword):qword;
 var r:qword;
 begin
  r:=1;
  while (n>0) do
   begin
    if (n mod 2=1) then
     r:=(r*c) mod p;
    c:=(c*c) mod p;
    n:=n div 2;
   end;
  if r=0 then
   r:=p;
  putere:=r;
 end;

Procedure lucru;
 begin
  if (n<>0) and (p<>0) then
   write(f2,putere(c,n-1)) else
    write(f2,p);
 end;
 
begin
 assign(f1,'magic7.in'); reset(f1);
 assign(f2,'magic7.out'); rewrite(f2);
 citiredate;
 lucru;
 close(f1);
 close(f2);
end.