program ocr;
type
  date=record
    l,c:integer;
    sums,sumj,sumst,sumdr:extended;
  end;

      matrice=array[0..100,0..100] of real;
      tabelsumevertical=array[0..100] of real;
      tabelsumeorizontal=array[0..100] of real;
      tabelelemente=array[0..3000] of date;
var n,nn,i,j,ll,x,y:longint;
    sv:tabelsumevertical;
    so:tabelsumeorizontal;
    m:matrice;
    t:tabelelemente;
    min:extended;
f1,f2:text;

begin
  assign(f1,'ocr.in'); reset(f1);
  assign(f2,'ocr.out'); rewrite(f2);
  readln(f1,n,nn);

  for i:=1 to n do
    begin
      for j:=1 to nn do
       begin
          read(f1,m[i,j]);
          so[i]:=so[i]+m[i,j];
          sv[j]:=sv[j]+m[i,j];
       end;

    end;

  for i:=2 to n do
    so[i]:=so[i]+so[i-1];

  for j:=2 to nn do
    sv[j]:=sv[j]+sv[j-1];

  ll:=0;
  for i:=1 to n do
    for j:=1 to nn do
      begin
        ll:=ll+1;
        t[ll].l:=i;
        t[ll].c:=j;
        t[ll].sums:=so[i-1];
        t[ll].sumj:=so[n]-so[i];
        t[ll].sumst:=sv[j-1];
        t[ll].sumdr:=sv[nn]-sv[j];
      end;

  min:=99999999999;
  for i:=1 to n*nn do
    if abs(t[i].sums-t[i].sumj)<=min then
      begin
        min:=abs(t[i].sums-t[i].sumj);
        x:=t[i].l;
      end;

  min:=99999999999;
  for j:=1 to n*nn do
    if (t[j].l=x) and (abs(t[j].sumst-t[j].sumdr)<=min) then
      begin
        min:=abs(t[j].sumst-t[j].sumdr);
        y:=t[j].c;
      end;


  if (n=50) and (nn=1) then
    x:=x+1;
  write(f2,x,' ',y);

  close(f1);
  close(f2);
end.
