Program sant;
type matrice=array[1..500,1..100] of longint;
        tabel=array[1..100] of longint;
var s,n,c,i,j,ll:longint;
        a,b:matrice;
        l,p,sol:tabel;
        f1,f2:text;
Procedure init;
begin
for i:=1 to n do
    for j:=1 to s do
        a[i,j]:=2000000000;
end;

Procedure readdata;
begin
readln(f1,s,n,c);
for i:=1 to c do
readln(f1,l[i],p[i]);
end;

Procedure make;
var u:longint;
begin
for j:=1 to c do
    begin
    a[1,l[j]]:=p[j];
    b[1,l[j]]:=j;
    end;
for i:=2 to n do
for j:=1 to s do
    for u:=1 to c do
        if j>l[u] then
            if p[u]+a[i-1,j-l[u]]<=a[i,j] then
                begin
                b[i,j]:=u;
                a[i,j]:=p[u]+a[i-1,j-l[u]];
                end;

end;

Procedure sort;
var i,j,aux:longint;
begin
for i:=1 to ll-1 do
    for j:=i+1 to ll do
        if sol[i]>sol[j] then
            begin
            aux:=sol[i];
            sol[i]:=sol[j];
            sol[j]:=aux;
            end;
end;

Procedure afisare;
var r:longint;
begin
r:=a[n,s];
ll:=0;
for i:=n downto 1 do
    for j:=s downto 1 do
        if a[i,j]=r then
            begin
            ll:=ll+1;
            sol[ll]:=b[i,j];
            r:=r-p[b[i,j]];
            break;
            end;
if (r=0) and (ll=n) then
    begin
    writeln(f2,a[n,s]);
    sort;
    for i:=1 to ll do
        write(f2,sol[i],' ');
    end else
        write(f2,0);
end;

begin
assign(f1,'sant.in'); reset(f1);
assign(f2,'sant.out'); rewrite(f2);

readdata;
init;
make;
afisare;

close(f1);
close(f2);
end.