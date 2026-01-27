program linie;
type matrice=array[1..13,1..13] of integer;
 tabel1=array[1..13] of integer;
 tabel2=array[1..13] of integer;
 var
  n,i,j,k,aux,s,min,a,b,u:longint;
  m:matrice;
  t:tabel1;
  tt:tabel2;
  f1,f2:text;

Procedure Parcurgere(l,k,s1,s2:longint);
begin
 t[k]:=l;
 aux:=0;
 for j:=1 to l do
  aux:=aux+m[k,j];
 s1:=s1+aux;
 s2:=s-s1;

 if (k=n) and (abs(s1-s2)<min) then
  begin
   for i:=1 to n do
    tt[i]:=t[i];
   min:=abs(s1-s2);
                        a:=s1;
                        b:=s2;
  end;

 if (l-1<>0) and (k+1<=n) then
  Parcurgere(l-1,k+1,s1,s2);
 if (k+1<=n) then
  Parcurgere(l,k+1,s1,s2);
 if (l+1<=n) and (k+1<=n) then
  Parcurgere(l+1,k+1,s1,s2);

end;

begin
assign(f1,'linie.in'); reset(f1);
assign(f2,'linie.out'); rewrite(f2);
s:=0;
min:=99999999;
readln(f1,n);
for i:=1 to n do
 begin
  for j:=1 to n do
   begin
    read(f1,m[i,j]);
    s:=s+m[i,j];
   end;
  readln(f1);
 end;

for u:=1 to n-1 do
Parcurgere(u,1,0,0);

writeln(f2,a);
writeln(f2,b);
for i:=1 to n do
        write(f2,tt[i],' ');
close(f1);
close(f2);
end.