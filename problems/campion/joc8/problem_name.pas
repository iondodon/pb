Program joc8;
type per=record x:word;ap:byte end;
     vect=array[0..144]of per;
var f:text;
    k,i,j,x,y,n,m:byte;
    v,d:vect;s:longint;
    c:char;

procedure inser(var v:vect;i,j:byte);
var k:byte;x:word;
begin
   n:=n+1;
   k:=n;
   x:=1 shl i+1 shl j;
   while x<v[k-1].x do begin
      v[k]:=v[k-1];
      k:=k-1
   end;
   v[k].x:=x;
   if i=j then v[k].ap:=1 else v[k].ap:=2
end;

procedure gen;
begin
  n:=0;
  for i:=0 to x do
    for j:=i to y do inser(v,i,j)
end;

begin
  assign(f,'joc8.in');reset(f);
  readln(f,x,y);
  n:=0;
  for i:=x-1 downto 0 do begin
    for j:=y-1 downto 0 do begin
      read(f,c);
      if c='1' then inser(d,i,j)
    end;
    readln(f)
  end;
  close(f);
k:=n;
  gen;
  assign(f,'joc8.out');rewrite(f);
  s:=0;m:=0;
  i:=1;j:=1;
  for n:=1 to k do begin
    if d[i].x=v[j].x then inc(i)
    else inc(m);
    dec(v[j].ap);s:=s+v[j].x;
    if v[j].ap=0 then inc(j)
  end;
  writeln(f,s,' ',m);
  close(f)
end.