type tab=array[0..50009]of longint;
var t1,t2,c,f:tab;
n,i,j,k,p,m,d:longint;


procedure inter(s,m,d:longint);
var i,j,k:longint;
begin
i:=s;j:=m+1;k:=0;
while (i<=m)and(j<=d) do
if t2[i]<=t2[j] then begin inc(k);c[k]:=t2[i];inc(i); end else
begin inc(k);c[k]:=t2[j];inc(j); end;
while (i<=m) do begin inc(k);c[k]:=t2[i];inc(i); end;
while (j<=d) do begin inc(k);c[k]:=t2[j];inc(j); end;
k:=0;
for i:=s to d do
begin
inc(k);t2[i]:=c[k];
end;
end;

procedure sort(s,d:longint);
var m:longint;
begin
if s<d then
begin
m:=(s+d) div 2;
sort(s,m);
sort(m+1,d);
inter(s,m,d);
end;
end;


function bin(x:longint):longint;
var p1,i:longint;
begin
p1:=p;
i:=m+1;
while p1>0 do
begin
if i-p1>0 then
if t2[i-p1]>=x then i:=i-p1;
p1:=p1 div 2;
end;
bin:=i;
end;

begin
assign(input,'unudoi.in');reset(input);
assign(output,'unudoi.out');rewrite(output);
readln(n,m);
for i:=1 to n do read(t1[i]); readln();
for i:=1 to m do read(t2[i]);
sort(1,m); t2[m+1]:=2000000000;
p:=1;
while p<=m do p:=p*2; j:=0;
for i:=1 to n do
inc(f[bin(t1[i])]);
for i:=1 to 50009 do
if f[i]>0 then inc(j);
writeln(j);
close(input);close(output);
end.