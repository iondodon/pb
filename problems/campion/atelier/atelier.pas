program atelier;
type tabel=array[1..10000] of integer;
   var n,i,sa,sb,sa1,sb1,nz,suma:longint;
     c:char;
     a,b:tabel;
     f1,f2:text;
begin
 assign(f1,'atelier.in'); reset(f1);
 assign(f2,'atelier.out'); rewrite(f2);
 readln(f1,n);

 sa1:=0;
 sb1:=0;
 sa:=0;
 sb:=0;
 for i:=1 to n do
  begin
   readln(f1,a[i],b[i]);
   sb1:=sb1+b[i];
   sa1:=sa1+a[i];
  end;

 nz:=0;
 

 suma:=0;
 for i:=1 to n-1 do
  begin
   sb:=sb+b[i];
   sa1:=sa1-a[i];
   if (sa1+sb>suma) then
    begin
     nz:=i;
     suma:=sa1+sb;
     c:='B';
    end;

   sa:=sa+a[i];
   sb1:=sb1-b[i];
   if (sa+sb1>=suma) then
    begin
     nz:=i;
     suma:=sa+sb1;
     c:='A'
    end;
  end;

 writeln(f2,suma);
 writeln(f2,c);
 writeln(f2,nz);

 close(f1);
 close(f2);
end.