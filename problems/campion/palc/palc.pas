program palc;
var h,s:string;
f:text; i,ff,g,j:integer; p,q,pii,qi:boolean;
function per(x:integer; s:string):string;
begin
if x=1 then begin
s:=' '+s; s[1]:=s[length(s)]; Delete(s,length(s),length(s)); end;
if x=2 then begin
s:=s+' '; s[length(s)]:=s[1]; Delete(s,1,1); end;
per:=s;
end;
begin
assign(f,'palc.in'); reset(f);
read(f,h); close(f);
ff:=0; g:=0; p:=false;
for j:=1 to length(h) div 2 do if h[j]<>h[length(h)-j+1] then p:=true;
if p=true then
if length(h)>2 then begin
s:=h;
for i:=1 to length(s)-1 do begin
ff:=ff+1;
s:=per(1,s);
pii:=false;
for j:=1 to (length(s) div 2) do if s[j]<>s[length(s)-j+1] then pii:=true;
if pii=false then break;
end;
s:=h;
for i:=1 to length(s)-1 do begin
g:=g+1;
s:=per(2,s);
qi:=false;
for j:=1 to (length(s) div 2) do if s[j]<>s[length(s)-j+1] then qi:=true;
if qi=false then break;
end; end;

assign(f,'palc.out'); rewrite(f);
if p=true then 
if (pii=false) or (qi=false) then begin
if ff>g then write(f,g);
if ff<g then write(f,ff);
if ff=g then write(f,ff); end;
if (pii=true) and (qi=true) and (p=true) then write(f,-1);
if p=false then write(f,0);
close(f);
end.