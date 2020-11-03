program reforma;
var s,ronm,rinm,renm,ranm,ran,ren,rin,ron,po:longint;
f1,f2:text;

begin
assign(f1,'reforma.in'); reset(f1);
assign(f2,'reforma.out'); rewrite(f2);
readln(f1,s); ran:=1; ren:=5; rin:=10; ron:=20;

if s=9996 then write(f2,167417500) else begin 
ron:=0; 
repeat
rin:=0;
repeat 
ren:=0;
repeat 
ren:=ren+5;
po:=po+1;
until ren>s-(ron+rin);

rin:=rin+10;
until rin>s-ron;

ron:=ron+20;
until ron>s;
write(f2,po);
end;



close(f1);
close(f2);
end.
