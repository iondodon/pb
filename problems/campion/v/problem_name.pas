program literaV;
var l:array[1..101,1..101] of longint;
  m,n,suma,c,v,max,ll:longint;
  f1,f2:text;

Procedure citiredate;
 var i,j:integer;
 begin
  readln(f1,m,n);
  for i:=1 to m do
   begin
    for j:=1 to n do
     read(f1,l[i,j]);
    readln(f1);
   end;
 end;

Procedure lucru;
 var i,j,u,f,ff:longint;
 begin

   for j:=1 to n-2 do
    begin
     u:=1;
     while (j+(u*2)<=n) and (u+1<=m) do
      begin
       suma:=l[1,j];
       for i:=1 to u do
        suma:=suma+l[i+1,j+i];
       f:=u+1;
       ff:=j+u;
       repeat
       f:=f-1;
       ff:=ff+1;
       suma:=suma+l[f,ff];
       until (f=1) and (ff=j+(u*2));
       if (suma>max) then
        begin
         ll:=j+(u*2);
         max:=suma;
         c:=j;
         v:=u+1;
        end else
         if (suma=max) then
          if j+(u*2)<ll then
           begin
            ll:=j+(u*2);
            max:=suma;
            c:=j;
            v:=u+1;
           end;
       u:=u+1;
      end;
    end;
 end;

begin
 assign(f1,'v.in'); reset(f1);
 assign(f2,'v.out'); rewrite(f2);
 citiredate;
 max:=0;
 ll:=99999999;
 lucru;
 writeln(f2,max,' ',c,' ',v);
close(f1);
close(f2);
end.