Program gradina1_v2;
type matrice=array[-10..1000,-10..1000] of longint;
        var n,p,k:longint;
        s:matrice;
        f1,f2:text;

Procedure readdata;
var i,x,y:longint;
begin
readln(f1,n,p,k);
for i:=1 to p do
        begin
        readln(f1,x,y);
        s[x,y]:=1;
        end;
end;

Procedure sume;
var i,j,x:longint;
begin
for i:=1 to n do
        begin
        x:=0;
        for j:=1 to n do
                begin
                x:=x+s[i,j];
                s[i,j]:=s[i-1,j]+x;
                end;
        end;
end;

Procedure run;
var i,j,np,max,egal:longint;
begin
max:=0;
egal:=0;
for i:=k to n do
        for j:=k to n do
                begin
                np:=s[i,j]-s[i-k,j]-s[i,j-k]+s[i-k,j-k];
                if np>max then
                        begin
                        max:=np;
                        egal:=1;
                        end else
                                if np=max then
                                        egal:=egal+1;
                end;
writeln(f2,max);
write(f2,egal);
end;

begin
assign(f1,'gradina1.in'); reset(f1);
assign(f2,'gradina1.out'); rewrite(f2);

readdata;
sume;
run;

close(f1);
close(f2);
end.