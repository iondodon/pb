const nmax=100;
type
indice=0..nmax+1;
matrice=array[indice,indice]of 0..1;
var a,b:matrice;
    n,m,min:indice;
    posibil:boolean;
    f:text;
function final:boolean;
var i,j:indice;
begin
final:=true;
for i:=1 to n do
    for j:=1 to m do
        if a[i,j]=0 then
                    begin
                    final:=false;
                    exit;
                    end;
end;
procedure citire;
var i,j:indice;
    f:text;
begin
assign(f,'copaci1.in');reset(f);
readln(f,n,m);
for i:=1 to n do
    begin
         for j:=1 to m do
             read(f,a[i,j]);
    readln(f);
    end;
close(f);
end;
procedure padure;
var i,j:indice;
begin
posibil:=true;
while not final and posibil do
                 begin
                 posibil:=false;
                 for i:=1 to n do
                     for j:=1 to m do
                         if a[i,j]=0 then
                           if a[i,j+1]+a[i-1,j]+a[i+1,j]+a[i,j-1]>=2 then
                                                                begin
                                                                 b[i,j]:=1;
                                                                 posibil:=true;
                                                                 end;

                  if posibil then inc(min);
                  for i:=1 to n do
                     for j:=1 to m do
                         if b[i,j]=1 then a[i,j]:=1;
                 end;
end;
begin{pp}
citire;
padure;
assign(f,'copaci1.out');rewrite(f);
if final then write(f,min)
         else write(f,min,#10,'IMPOSIBIL');
close(f);
end.
