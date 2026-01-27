program scaune;
var n,u:qword; i:longint;
f1,f2:text;

begin
assign(f1,'scaune.in'); reset(f1);
assign(f2,'scaune.out'); rewrite(f2);

readln(f1,n);
i:=1; u:=1;

repeat
i:=i+2;
u:=u*i;
u:=u mod 30103;

until i=2*n-1;

write(f2,u);
close(f1);
close(f2);
end.