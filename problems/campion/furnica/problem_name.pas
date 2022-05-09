Program furnica;
type matrice=array[1..100,1..100] of longint;
var i,j,k,n,s:longint;
        p,m:matrice;
        f1,f2:text;

Procedure init;
var u,g:longint;
begin
for u:=1 to n do
        for g:=1 to n do
                m[u,g]:=(u+g) mod 6;
s:=m[1,1];
p[1,1]:=1;
m[1,1]:=0;
i:=1;
j:=1;
end;

Procedure rezultat;
var max,i,j,nr:longint;
begin
write(f2,s,' ');
max:=0;
for i:=1 to n do
        for j:=1 to n do
                if p[i,j]>max then
                        max:=p[i,j];
nr:=0;
for i:=1 to n do
        for j:=1 to n do
                if p[i,j]=max then
                        nr:=nr+1;
writeln(f2,nr);
end;

Procedure deplasare;
var l,d:longint;
begin
for l:=1 to k do
        begin
        read(f1,d);
                case d of
                1: begin i:=i-1; end;
                2: begin i:=i-1; j:=j+1; end;
                3: begin j:=j+1; end;
                4: begin i:=i+1; j:=j+1; end;
                5: begin i:=i+1; end;
                6: begin i:=i+1; j:=j-1; end;
                7: begin j:=j-1; end;
                8: begin i:=i-1; j:=j-1; end;
                end;
        s:=s+m[i,j];
        m[i,j]:=0;
        p[i,j]:=p[i,j]+1;
        end;
end;

begin
assign(f1,'furnica.in'); reset(f1);
assign(f2,'furnica.out'); rewrite(f2);
readln(f1,n,k);
init;
deplasare;
rezultat;
close(f1);
close(f2);
end.