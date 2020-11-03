program jucarii; uses math;
   const NMax = 20 ;
   type   Indice=0 .. NMax;
   tabel=array[0..20] of longint;
   fragmente=array[1..100] of longint;
   Permutare = array[Indice] of Indice;
   tabel1=array[0..10] of longint;
   var    n:Indice; p:Permutare; t1:tabel1;
   ImF:set of Indice;  kk,pp,b:longint;
   f1,f2:text; fr:fragmente;

function cauta:boolean;
var i,j,maxx:longint;
begin
cauta:=false;
for i:=0 to 10 do t1[i]:=0;
t1[1]:=1;
for i:=2 to n do
begin
maxx:=0;
for j:=1 to i-1 do
if (p[j]<p[i]) and (maxx<t1[j]) then maxx:=t1[j];
t1[i]:=maxx+1;
end;
if maxvalue(t1)>=kk then cauta:=true;
end;



procedure Afisare;
var i,j:longint;
begin
if cauta then b:=b+1 else exit;
if b=pp then
for i:=1 to n do write(f2,p[i],' ');
end;


procedure GenPermutari(k:Indice);
var i:Indice;
begin

if k-1=n then  Afisare
 else
  for i:=1 to n do
  if not (i in Imf) then   begin
     p[k]:=i;
	 Imf:=Imf+[i];
      GenPermutari(k+1);
if b=pp then exit;
      Imf:=Imf-[i];
	  end;

   end;

begin
 assign(f1, 'jucarii.in'); reset(f1);
 assign(f2,'jucarii.out'); rewrite(f2);
 read(f1,n,kk,pp);

 b:=0;
  GenPermutari(1);
  close(f2);
  close(f1);
 end.
