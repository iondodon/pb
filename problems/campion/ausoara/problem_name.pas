program ausoara1;
type tabel=array[1..1000] of longint;
  var i,j,n,ll,l1,l2,a,b:longint;
   t1,t2,t3:tabel;
   f1,f2:text;
begin
 assign(f1,'ausoara.in'); reset(f1);
 assign(f2,'ausoara.out'); rewrite(f2);
 readln(f1,n);

 read(f1,l1);
 for i:=1 to l1 do
  read(f1,t1[i]);
 if n=1 then
  begin
                        write(f2,l1,' ');
   for i:=1 to l1 do
    write(f2,t1[i],' ');
  end else
 for i:=1 to n-1 do
  begin
   read(f1,l2);
   for j:=1 to l2 do
    read(f1,t2[j]);
   a:=1;
   b:=1;
   while (a<=l1) and (b<=l2) do
    if t1[a]<t2[b] then
     a:=a+1 else
    if t1[a]>t2[b] then
     b:=b+1 else
    if t1[a]=t2[b] then
     begin
                                                ll:=ll+1;
                                                t3[ll]:=t1[a];
      a:=a+1;
      b:=b+1;
     end;
   for j:=1 to ll do
    t1[j]:=t3[j];
   l1:=ll;
                        ll:=0;
   readln(f1);
  end;

 if n>1 then
  begin
   write(f2,l1,' ');
   for j:=1 to l1 do
    write(f2,t1[j],' ');
  end;

 close(f1);
 close(f2);
end.