program dp;
var s,ss,a,c:ansistring;
 i,j,x,u:longint;
 q:boolean;
 f1,f2:text;

procedure lucru;
 begin

 x:=1;
 repeat
 for i:=length(ss) downto x do
  begin
   s:='';
   for u:=x to i do
    s:=s+ss[u];
   a:=s;
   q:=false;
   for u:=1 to length(s)-1 do
    begin
     c:=a[length(a)];
     for j:=length(a) downto 2 do
      a[j]:=a[j-1];
     a[1]:=chr(ord(c[1]));
     j:=1;
     while (s[j]=a[j]) and (j<length(s)-1) do
      j:=j+1;
     if a[j]<s[j] then
      begin
       q:=true;
       break;
      end;
     if j=length(s) then
      begin
       q:=false;
       break;
      end;
    end;
    if  q=false then
     begin
      write(f2,'(');
      for u:=x to i do
       write(f2,ss[u]);
      write(f2,')');
      x:=i+1;
      break;
     end;
  end;
 until x>length(ss);



 end;


begin
 assign(f1,'dp.in'); reset(f1);
 assign(f2,'dp.out'); rewrite(f2);
 read(f1,ss);
 Lucru;
 close(f1);
 close(f2);
end.