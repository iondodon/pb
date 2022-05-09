program test1;
var s1,s2,a,b:string;
  x,max,maxprim,n,m:longint;
  f1,f2:text;

Function prim(x:longint):boolean;
 var i:longint;
 begin
  prim:=true;
   for i:=2 to trunc(sqrt(x)) do
    if x mod i=0 then
     begin
      prim:=false;
      break;
     end;
 end;

Procedure verificare(s2:string);
 begin
 val(s2,x);
 if x>max then
  max:=x;
 if (prim(x)=true) and (x>maxprim) then
  maxprim:=x;
 end;

begin
 assign(f1,'test1.in'); reset(f1);
 assign(f2,'test1.out'); rewrite(f2);
 readln(f1,n,m);
        str(n,s1);
        str(m,s2);

 a:=s1;
 b:=s2;
 verificare(s1);
 verificare(s2);

 repeat
  s2:=b;
  s2[1]:=s1[1];
  verificare(s2);
  s2:=b;
  s2[length(s2)]:=s1[1];
  verificare(s2);
  delete(s1,1,1);
 until s1='';

 if maxprim<>0 then
  write(f2,maxprim) else
   write(f2,max);

 close(f1);
 close(f2);
end.