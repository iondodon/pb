program mxl;
type matrice=array[-1..50, -1..50] of string;
     tab=array[-1..50, -1..50] of qword;
	 tabel=array[-1..3000] of integer;
var n,k,i,j:integer;  m:matrice; t,l:tab; s,ss:string; l1,l2:tabel; p:boolean;
f1,f2:text;






procedure calcul(x,y:integer);             //calcularea recursiva a formulelor cu ajutorul functiei
var i,j,n,u:integer;
s,ss:string;
begin
l[x,y]:=1;
s:=m[x,y]+'+';
i:=0;
ss:=''; j:=1;
repeat
i:=i+1;
if (ord(s[i])>=48) and (ord(s[i])<=57) then
ss:=ss+s[i] else
if ((s[j]=' ') or (s[j]='=')) and (s[i]<>':') then
begin
val(ss,n);
inc(t[x,y],n);
j:=i;
ss:='';
end else
if (s[i]='+') and (s[j]<>':') then
begin
val(ss,n);
ss:='';
inc(t[x,y],n);
j:=i;
end else
if (s[i]=':') then
begin
val(ss,n);
ss:='';
for j:=i+1 to length(s) do
if (ord(s[j])>=48) and (ord(s[j])<=57) then
ss:=ss+s[j] else begin i:=j; break; end;
j:=i;
val(ss,u);
ss:='';
if l[n,u]=0 then
calcul(n,u);
inc(t[x,y],t[n,u]);
end;
until i=length(s);
end;








begin
assign(f1,'mxl.in'); reset(f1);
assign(f2,'mxl.out'); rewrite(f2);
readln(f1,n,k);


read(f1,l1[1],l2[1]);        //citirea matrcei cu formule
readln(f1,ss);
m[l1[1],l2[1]]:=ss;
if k>1 then
for i:=2 to k do
begin
read(f1,l1[i],l2[i]);
readln(f1,ss);
m[l1[i],l2[i]]:=ss;
end;

repeat                 //verificare daca s-au calculat toate formulele
p:=false;
for i:=1 to k do
if t[l1[i],l2[i]]=0 then
begin
p:=true;
calcul(l1[i],l2[i]);
end;
until p=false;


for i:=1 to n do begin
for j:=1 to n do
write(f2,t[i,j],' ');
writeln(f2);
end;

close(f1);
close(f2);
end.
