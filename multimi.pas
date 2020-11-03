program multimi;
var i,n1,m1,n,cn,cm:integer;
f1,f2:text;
begin
assign(f1,'multimi.in');
assign(f2,'multimi.out');
reset(f1);
rewrite(f2);
readln(f1,n);
readln(f1,m1,n1);
cm:=m1; cn:=n1;
for i:=2 to n do begin
readln(f1,m1,n1);
if m1>cm then cm:=m1;
if cn>n1 then cn:=n1;
end;
if cm>cn then write(f2,'multimea vida') else begin
for i:=cm to cn-1 do begin
write(f2,i,' ');
end; write(f2,cn); end;
close(f1);
close(f2);
end.
