program test2;
var n,i:integer;
  x:longint;
  s:string;
  f1,f2:text;
begin
 assign(f1,'test2.in'); reset(f1);
 assign(f2,'test2.out'); rewrite(f2);
 readln(f1,n);

 for i:=1 to n do
  begin
   read(f1,x);
   str(x,s);
   if (i>length(s)) and (i mod length(s)<>0) then
    delete(s,length(s)-(i mod length(s))+1,1) else
     if (i>length(s)) and (i mod length(s)=0) then
      delete(s,1,1) else
       delete(s,length(s)-i+1,1);
   val(s,x);
   write(f2,x,' ');
  end;
  
 close(f1);
 close(f2);
end.