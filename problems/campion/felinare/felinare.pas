program felinare;
type vector=array[0..5000] of byte;
var n,i,j,s:longint; p,q:boolean;
f1,f2:text; v:vector;
begin  s:=0;
assign(f1,'felinare.in'); reset(f1);
assign(f2,'felinare.out'); rewrite(f2);
read(f1,n);
for i:=1 to n do v[i]:=1;
j:=0;
repeat
p:=true; s:=s+1;
j:=j+1; if j>n then j:=1;
i:=j-1; if i=0 then i:=n;
if v[i]=1 then begin
if v[j]=1 then v[j]:=0 else v[j]:=1;
end;
for i:=1 to n do if v[i]=0 then begin p:=false; break; end;
until p=true;

write(f2,s);
close(f1);
close(f2);
end.