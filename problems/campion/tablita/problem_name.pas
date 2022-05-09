program tablita;
var i,j:longint; n,a,b:int64;
f1,f2:text;
begin
assign(f1,'tablita.in'); reset(f1);
assign(f2,'tablita.out'); rewrite(f2);
read(f1,n);

a:=0; b:=0;
for i:=1 to 1000000000 do begin
inc(a,i-1); inc(b,i);
if (n>=a) and (n<=b) then begin write(f2,i); break; end;
end;

close(f1);
close(f2);
end.