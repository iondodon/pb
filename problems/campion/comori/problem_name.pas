program comori;
var
f1,f2:text;
i,n,d,p,x,y:longint;
begin
assign(f1,'comori.in'); reset (f1);
assign(f2,'comori.out'); rewrite (f2);
readln(f1,n);
x:=0;y:=0;

for i:=1 to n do
begin
readln(f1,d,p);
case d of
1: y:=y+p;
2: begin x:=x+p; y:=y+p; end;
3: x:=x+p;
4: begin x:=x+p; y:=y-p; end;
5: y:=y-p;
6: begin x:=x-p; y:=y-p; end;
7: x:=x-p;
8: begin x:=x-p; y:=y+p; end;
end;
end;

writeln(f2,x,' ',y);
close(f1);
close(f2);
end.