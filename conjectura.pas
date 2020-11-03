program conjectura;
var n,i,j,u:longint; x,x1:qword;
f1,f2:text; s,si:string; p:boolean;
begin
assign(f1,'conjectura.in'); reset(f1);
assign(f2,'conjectura.out'); rewrite(f2);
readln(f1,n);

for i:=1 to n do begin
readln(f1,x);
str(x,s);

p:=false;
if length(s)=1 then writeln(f2,'0') else 
begin
for j:=1 to length(s) div 2 do
if s[j]<>s[length(s)-j+1] then p:=true;
if p=false then writeln(f2,'0') end;
if p=true then
begin
for j:=1 to 50 do begin
si:=''; p:=false; 
for u:=length(s) downto 1 do si:=si+s[u];
val(si,x1);
x:=x+x1;
str(x,s);
for u:=1 to length(s) div 2 do
if s[u]<>s[length(s)-u+1] then p:=true;
if p=false then begin writeln(f2,j); break; end else 
end;
if j=50 then begin writeln(f2,'LYCHREL'); end;
end;

end;

close(f1);
close(f2);
end.
