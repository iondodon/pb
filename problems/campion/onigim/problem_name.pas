program onigim; uses math;
type fregventa=array[1..1000] of longint;
     puncte=array[0..1000] of integer;
  tabel=array[1..1000] of integer;
  aa=array[1..1000] of integer;
  vector=array[1..1000] of integer;

var n,k,i,j,nap,maax,u:integer; fr:fregventa; p:puncte; a:aa; v:vector;
f1,f2:text;  b:boolean;  n1,n2,n3:integer; t:tabel;

Procedure qSort(var t:tabel; st,dr:integer);
Var pivot, i,j,aux,m:integer;
begin
 i:=st;j:=dr;m:=(st+dr) div 2;
pivot:=t[m];
while i<=j do
 begin
 while t[i] <pivot do
  i:=i+1;
 while t[j]>pivot do
  j:=j-1;
                              if i<=j then
 begin
    aux :=t[i];
    t[i] :=t[j];
    t[j] :=aux;
    i:=i+1;
    j:=j-1;
 end;
                         end;
               if st<j then
                      qSort(t,st,j);
                if i<dr then
                      qSort(t,i,dr);
end;




begin nap:=0;
assign(f1,'onigim.in'); reset(f1);
assign(f2,'onigim.out'); rewrite(f2);
readln(f1,n,k);
for i:=1 to k do read(f1,p[i]);  readln(f1);
for i:=1 to n do begin read(f1,a[i]); t[i]:=a[i]; end;

qsort(t,1,n);
u:=k; t[n+1]:=t[n];

for i:=n downto 1 do begin
if t[i]<>t[i+1] then u:=u-1;
for j:=1 to n do begin
if (a[j]=t[i]) and (v[j]=0) then begin
v[j]:=p[u]; break; end;
end;
end;

maax:=0;
for i:=1 to k do
if p[i]>maax then maax:=p[i]; n1:=maax;
maax:=0;
for i:=1 to k do
if (p[i]>maax) and (p[i]<n1) then maax:=p[i]; n2:=maax;
maax:=0;
for i:=1 to k do
if (p[i]>maax) and (p[i]<n2) then maax:=p[i]; n3:=maax;

for i:=1 to n do
if (v[i]=n1) or (v[i]=n2) or (v[i]=n3) then nap:=nap+1;

for i:=1 to n do
for j:=1 to n do
if a[j]=i then inc(fr[i]);

for i:=1 to n do write(f2,v[i],' '); writeln(f2);
writeln(f2,nap);
writeln(f2,MaxValue(fr));

close(f1);
close(f2);
end.