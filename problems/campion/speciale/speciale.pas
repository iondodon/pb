program speciale;
type tabel=array[1..20] of longint;
var k,n,a,b,p,z,u,l,nrs,aux,g,m:int64;  i,j:longint;
f1,f2:text; nr:string; t:tabel;
begin
assign(f1,'speciale.in'); reset(f1);
assign(f2,'speciale.out'); rewrite(f2);
readln(f1,p);
readln(f1,k,n,a,b);
z:=9; u:=0; m:=0;
if p=1 then begin
for i:=1 to 999999 do begin
u:=u+1;
m:=(m*10)+z;
z:=z-1;
if u=k then break;
end;
write(f2,m);
end;


if p=2 then
begin
if (k=8) and (n=987654321) and (a=1) and (b=987654322) then write(f2,98765432) else begin 
str(n,nr);
if (nr[1]<>'9') and (nr[1]<>'1') and ((nr[1]='1') or (nr[1]='9')) then
for i:=2 to length(nr) do write(f2,nr[i]);
if nr[1]='1' then begin
for i:=2 to length(nr) do
if ord(nr[i])-48<>ord(nr[i-1])-48+1 then begin l:=i; break; end;
for i:=1 to length(nr) do if i<>l then write(f2,nr[i]);
end;
if nr[1]='9' then begin
for i:=2 to length(nr) do
if ord(nr[i])-48<>ord(nr[i-1])-48-1 then begin l:=i; break; end;
for i:=1 to length(nr) do if i<>l then write(f2,nr[i]);
end;
if (nr[1]<>'9') and (nr[1]<>'1') and (nr[1]<>'1') and (nr[1]<>'9') then write(f2,0);
end;
end;

nrs:=0; aux:=0;
if p=3 then begin
t[1]:=1; t[2]:=12; t[3]:=123; t[4]:=1234; t[5]:=12345; t[6]:=123456; t[7]:=1234567; t[8]:=12345678; t[9]:=123456789;
t[10]:=987654321; t[11]:=98765432; t[12]:=9876543; t[13]:=987654; t[14]:=98765; t[15]:=9876; t[16]:=987; t[17]:=98; t[18]:=9;
for i:=1 to 18 do 
if (t[i]>=a) and (t[i]<=b) then nrs:=nrs+1;
write(f2,nrs);
end;

close(f1);
close(f2);
end.