program comp;
type tabel=array[1..1000] of integer;
var d1,s1,c:string; semn:char;
f1,f2:text; n,mm,g,i,j,d,s,d2,s2:longint; t:tabel; p:boolean;
begin d:=0; s:=0; d1:=''; s1:=''; g:=0; mm:=0;
assign(f1,'comp.in'); reset(f1);
assign(f2,'comp.out'); rewrite(f2);
readln(f1,n);
for i:=1 to n do begin
readln(f1,c); p:=false;
for j:=1 to length(c) do begin

if p=false then begin
if (ord(c[j])>47) and (ord(c[j])<58) then d1:=d1+c[j];
if c[j]='u' then begin val(d1,d2); d:=d+d2; d1:=''; end;
if c[j]='z' then begin val(d1,d2); d:=d+d2*10; d1:=''; end;
if c[j]='s' then begin val(d1,d2); d:=d+d2*100; d1:=''; end;
if c[j]='m' then begin val(d1,d2); d:=d+d2*1000; d1:='';  end;
if c[j]='<' then begin semn:='<'; mm:=mm+1; p:=true; end;
if c[j]='>' then begin semn:='>'; p:=true; end; end;

if p=true then begin
if (ord(c[j])>47) and (ord(c[j])<58) then s1:=s1+c[j];
if c[j]='u' then begin val(s1,s2); s:=s+s2; s1:=''; end;
if c[j]='z' then begin val(s1,s2); s:=s+s2*10; s1:=''; end;
if c[j]='s' then begin val(s1,s2); s:=s+s2*100; s1:=''; end;
if c[j]='m' then begin val(s1,s2); s:=s+s2*1000; s1:='';  end;
end;

end;
g:=g+1;
if (semn='<') and (d<s) then t[g]:=1;
if (semn='>') and (d>s) then t[g]:=1;
if (semn='<') and (d>s) then t[g]:=0;
if (semn='>') and (d<s) then t[g]:=0;
d:=0; s:=0;
end;

writeln(f2,mm);
for i:=1 to n do writeln(f2,t[i]);

close(f1);
close(f2);
end.