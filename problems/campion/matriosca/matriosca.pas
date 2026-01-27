program matrisca;
type matrice=array[0..2500,0..100] of longint;
 var m:matrice;
 n,i,x,j,l:longint;
 p:boolean;
 f1,f2:text;
begin
 assign(f1,'matriosca.in'); reset(f1);
 assign(f2,'matriosca.out'); rewrite(f2);
 readln(f1,n);

 l:=0;
 for i:=1 to n do
  begin
   readln(f1,x);
   p:=false;
   for j:=1 to l do
    if m[j,0]>x then
     begin
      m[j,1]:=m[j,1]+1;
      m[j,m[j,1]+1]:=i;
      m[j,0]:=x;
      p:=true;
      break;
     end;
  if p=false then
   begin
   l:=l+1;
   m[l,1]:=m[l,1]+1;
   m[l,2]:=i;
   m[l,0]:=x;
   end;
  end;

 writeln(f2,l);
 for i:=1 to l do
  begin
   write(f2,m[i,1],' ');
   for j:=2 to m[i,1]+1 do
    write(f2,m[i,j],' ');
   writeln(f2);
  end;
 
 close(f1);
 close(f2);
end.