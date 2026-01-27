program prime;
type tabelprime=array[1..3002] of longint;
 var s:ansistring;
 n,i,j,l:longint;
 p:tabelprime;
 q:boolean;
 f1,f2:text;

 begin
  assign(f1,'prime.in'); reset(f1);
  assign(f2,'prime.out'); rewrite(f2);

  read(f1,s);

  p[1]:=2;
  p[2]:=3;
  l:=2;

  for i:=4 to 2000000000 do
   begin
    q:=false;
    for j:=2 to trunc(sqrt(i)) do
     if i mod j=0 then
      begin
       q:=true;
       break;
      end;
    if q=false then
     begin
      l:=l+1;
      p[l]:=i;
      if l=3000 then
       break;
     end;
   end;

 n:=0;
 for i:=1 to length(s) do
  if s[i]='1' then
   n:=n+(p[i]);

 write(f2,n);
 close(f1);
 close(f2);
 end.