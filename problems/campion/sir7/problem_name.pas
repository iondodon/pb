program sir7;
 var n,s,x,a:int64;
 r:longint;
 f1,f2:text;

procedure Main(n:longint);
begin
 x:=0;
 for r:=1 to (n div 2) Do
  begin
   s:=0;
   a:=n-(2*r);
   repeat
   s:=s+a;
   a:=a-r;
   until a<=0;
   x:=x+s;
  end;
 write(f2,x);
end;

begin
 assign(f1,'sir7.in'); reset(f1);
 assign(f2,'sir7.out'); rewrite(f2);
 read(f1,n);
 Main(n);
 close(f1);
 close(f2);
end.