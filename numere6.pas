program numere6;
var a,b,c,d,i,u,n,j,f,m:longint; sa,sb,ss:string;
f1,f2:text; p:boolean;
begin
assign(f1,'numere6.in'); reset(f1);
assign(f2,'numere6.out'); rewrite(f2);
read(f1,a,b);
f:=a; m:=b;
sa:=''; sb:='';
for i:=1 to 100 do begin
if a=0 then break;
if a mod 2=1 then begin ss:='1'; Insert(ss,sa,1); end;
if a mod 2=0 then begin ss:='0'; Insert(ss,sa,1); end;
a:=a div 2; end;
for i:=1 to 100 do begin
if b=0 then break;
if b mod 2=1 then begin ss:='1'; Insert(ss,sb,1); end;
if b mod 2=0 then begin ss:='0'; Insert(ss,sb,1); end;
b:=b div 2; end;

p:=false;
for i:=1 to 10 do begin
if sa[1]=sb[length(sb)] then begin Delete(sa,1,1); Delete(sb,length(sb),1); p:=true; end;
if sa[1]<>sb[length(sb)] then break;
if (sa='') or (sb='') then break;
end;



if p=true then begin
c:=0; b:=0;
if sa='' then c:=0; if sb='' then d:=0;


u:=0;
if sa<>'' then
for i:=length(sa) downto 1 do begin u:=u+1;
if sa[i]='1' then begin n:=1;  if u>1 then for j:=2 to u do n:=n*2; c:=c+n; end; end;
u:=0;
if sb<>'' then
for i:=length(sb) downto 1 do begin  u:=u+1;
if sb[i]='1' then begin n:=1;  if u>1 then for j:=2 to u do n:=n*2; d:=d+n; end; end;


end;




if p=false then begin c:=f; d:=m; end;
write(f2,c+d);
close(f1);
close(f2);
end.
