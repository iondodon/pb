program compar;
type tabel=array[0..100000] of longint;
var t:tabel; s:ansistring; i,j,a,b:longint;
f1,f2:text;
begin
assign(f1,'compar.in'); reset(f1);
assign(f2,'compar.out'); rewrite(f2);
read(f1,s);

writeln(f2,length(S)+1);

s:=s+s[length(s)];
a:=0; b:=length(s)+1;
s:=s[1]+s;
for i:=2 to length(s)-1 do begin
if (s[i]='>') and (s[i-1]='<') then begin b:=b-1; t[i-2]:=b; end;
if (s[i]='<') and (s[i-1]='>') then begin a:=a+1; t[i-2]:=a; end;
end;
for i:=2 to length(s) do begin
if (s[i]='<') and (s[i-1]='<') then begin a:=a+1; t[i-2]:=a; end;
if (s[i]='>') and (s[i-1]='>') then begin b:=b-1; t[i-2]:=b; end;
end;

for i:=0 to length(s)-2 do write(f2,t[i],' ');



close(f1);
close(f2);
end.