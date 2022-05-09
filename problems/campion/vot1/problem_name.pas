program vot1;
type tabel=array[1..1001] of integer;
var n,i,nrgr:integer; t,vot:tabel; p:boolean;
f1,f2:text;
begin
 assign(f1,'vot1.in'); reset(f1);
 assign(f2,'vot1.out'); rewrite(f2);
 readln(f1,n);
 for i:=1 to n do 
  read(f1,t[i]);
 for i:=1 to n do 
  inc(vot[t[i]]);

 repeat
  p:=false;
  for i:=1 to n do 
   if vot[i]=0 then 
    begin
     p:=true;
     vot[i]:=-1;
     dec(vot[t[i]]);
    end; 
 until p=false;

 nrgr:=0;
 for i:=1 to n do 
  if vot[i]=1 then
   inc(nrgr);


 writeln(f2,nrgr);
 for i:=1 to n do
  if vot[i]=1 then 
   write(f2,i,' ');

 close(f1);
 close(f2);
end.