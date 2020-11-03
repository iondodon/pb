program psp;
type tt=array[1..10000]of integer;
var t:tt; f1,f2:text;
n,i:integer; s,m,p:longint;
begin
assign(f1,'psp.in');
assign(f2,'psp.out');
reset(f1);
rewrite(f2);
readln(f1,n,s);
 for i:=1 to n do read(f1,t[i]);
  m:=0; p:=0;

  for i:=1 to n do
   if m+(t[i])<=s then begin m:=m+t[i]; p:=p+1;
   end;
   s:=s-m;
   write(f2,p,' ',s);

close(f1);
close(f2);
end.