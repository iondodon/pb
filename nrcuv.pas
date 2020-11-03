program nrcuv;

var i,nrcv:longint;
f1,f2:text; t:string;

begin
assign(f1,'nrcuv.in'); reset(f1);
assign(f2,'nrcuv.out'); rewrite(f2);
read(f1,t);
nrcv:=0; t:='   '+t;
for i:=3 to length(t) do begin 
if (ord(t[i])>64) and (t[i-1]<>'-') and (ord(t[i-1])<65) then nrcv:=nrcv+1;
if (ord(t[i])>64) and (t[i-1]='-') and (t[i-2]=' ') then nrcv:=nrcv+1;
end;


write(f2,nrcv);
close(f1);
close(f2);
end.
