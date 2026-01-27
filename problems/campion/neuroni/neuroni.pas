program neuroni;
type tabel=array[1..5050] of longint;
  tabelnivel=array[1..4950] of integer;
  var n,m,k,u,i,f:longint;
  t:tabel;
  ni:tabelnivel;
  f1,f2:text;

begin
 assign(f1,'neuroni.in'); reset(f1);
 assign(f2,'neuroni.out'); rewrite(f2);
 read(f1,n,m);

 u:=0;
 k:=0;
 repeat
  k:=k+1;
  if k mod 2=1 then
   for i:=u+1 to u+k do
    t[i]:=1;
  for i:=u+1 to u+k do
   ni[i]:=k;
  u:=u+k;
 until u=n*(n-1) div 2;

 f:=0;
 repeat
 f:=f+1;

  k:=0;
  u:=1;
  repeat
   k:=k+1;
   if t[u]=1 then
    begin
     t[u]:=0;
     u:=u+ni[u]+1;
    end else
     begin
      t[u]:=1;
      u:=u+ni[u];
     end;
  until k=n-1;
  inc(t[u]);
 until f=m;

 for i:=(n*(n-1) div 2)+1 to (n*(n+1) div 2) do
  write(f2,t[i],' ');

 close(f1);
 close(f2);
end.