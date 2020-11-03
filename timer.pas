program timer;
var h,m,s,a,b,c,d,l,i,x:longint; ss,aa,bb,cc:string;
f1,f2:text;
begin
assign(f1,'timer.in'); reset(f1);
assign(f2,'timer.out'); rewrite(f2);

readln(f1,ss);
h:=0;
h:=ord(ss[1])-48;
h:=h*10+(ord(ss[2])-48);
m:=0;
m:=ord(ss[4])-48;
m:=m*10+(ord(ss[5])-48);
s:=0;
s:=ord(ss[7])-48;
s:=s*10+(ord(ss[8])-48);

l:=1; aa:=''; bb:=''; cc:=''; a:=0; b:=0; c:=0; 
read(f1,ss);
for i:=length(ss) downto 1 do 
if ss[i]=':' then inc(l) else
	if l=1 then cc:=ss[i]+cc else
	if l=2 then bb:=ss[i]+bb else
	if l=3 then aa:=ss[i]+aa;
if length(cc)>0 then begin val(cc,x); c:=x; end;
if length(bb)>0 then begin val(bb,x); b:=x; end;
if length(aa)>0 then begin val(aa,x); a:=x; end;

s:=s+c;
m:=m+b;
h:=h+a;

d:=0;
if s>=60 then begin m:=m+(s div 60); s:=s mod 60; end;
if m>=60 then begin h:=h+(m div 60); m:=m mod 60; end;
if h>=24 then begin d:=h div 24; h:=h mod 24; end;

if s=60 then begin m:=m+1; s:=0; end;
if m=60 then begin h:=h+1; m:=0; end;
if h=24 then h:=0;

if h<10 then write(f2,0,h) else write(f2,h);
write(f2,':');
if m<10 then write(f2,0,m) else write(f2,m);
write(f2,':');
if s<10 then write(f2,0,s) else write(f2,s);
if d<>0 then write(f2,'+',d);

close(f1);
close(f2);
end.