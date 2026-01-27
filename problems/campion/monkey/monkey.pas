program monkey;
type matrice=array[0..21, 0..21] of char;
multime=set of 'A'..'Z';
var i,j,li,co,max:integer;
f1,f2:text;  t:matrice; l:multime;
procedure back(i,j,k:integer);
begin
l:=l+[t[i,j]];
if (not (t[i+1,j] in l))then back(i+1,j,k+1);
if (not (t[i,j+1] in l))then back(i,j+1,k+1);
if (not (t[i-1,j] in l))then back(i-1,j,k+1);
if (not (t[i,j-1] in l))then back(i,j-1,k+1);
Exclude(l,t[i,j]);
if k>max then max:=k;
end;
begin
assign(f1,'monkey.in'); reset(f1);
assign(f2,'monkey.out'); rewrite(f2);
readln(f1,li,co);
for i:=1 to li do begin
for j:=1 to co do read(f1,t[i,j]); readln(f1); end;

for i:=1 to li do t[i,0]:=t[1,1]; for i:=1 to li do t[i,co+1]:=t[1,1];
for j:=1 to co do t[0,j]:=t[1,1]; for j:=1 to co do t[li+1,j]:=t[1,1];

back(1,1,1);
write(f2,max);
close(f1);
close(f2);
end.