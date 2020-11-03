program ecuatii;
	
var u,n,i,j,nr1,nr2,nrx1,nrx2,nr,a:longint; s,ss,g:ansistring;
f1,f2:text;

begin
assign(f1,'ecuatii.in'); reset(f1);
assign(f2,'ecuatii.out'); rewrite(f2);
readln(f1,n);
u:=0;


repeat
u:=u+1;
readln(f1,s);
s:=' '+s+' ';
i:=1; nr1:=0; nr2:=0; nrx1:=0; nrx2:=0;  ss:='';

repeat
i:=i+1;
if (ord(s[i])>=48) and (ord(s[i])<=57) then begin
a:=i;
repeat
ss:=ss+s[i];
i:=i+1;
until (s[i]='x') or (s[i]='-') or (s[i]='+') or (s[i]='=');
val(ss,nr);
if (s[a-1]='-') then nr:=nr*(-1);
if s[i]='x' then nrx1:=nrx1+nr else nr1:=nr1+nr;
end else
if (s[i]='x') and (s[i-1]='-') and ((s[i+1]='+') or (s[i+1]='=') or (s[i+1]='-')) then nrx1:=nrx1-1 else
if (s[i]='x') and ((s[i-1]='+') or (s[i-1]=' ')) and ((s[i+1]='+') or (s[i+1]=' ') or (s[i+1]='-') or (s[i+1]='=')) then nrx1:=nrx1+1;
ss:='';
if s[i]='=' then break;
until s[i]='=';
ss:='';

repeat
i:=i+1;
if (ord(s[i])>=48) and (ord(s[i])<=57) then begin
a:=i;
repeat
ss:=ss+s[i];
i:=i+1;
until (s[i]='x') or (s[i]='-') or (s[i]='+') or (s[i]=' ');
val(ss,nr);
if (s[a-1]='-') then nr:=nr*(-1);
if s[i]='x' then nrx2:=nrx2+nr else nr2:=nr2+nr;
end else
if (s[i]='x') and (s[i-1]='-') and ((s[i+1]='+') or (s[i+1]=' ') or (s[i+1]='-')) then nrx2:=nrx2-1 else
if (s[i]='x') and ((s[i-1]='+') or (s[i-1]='=')) and ((s[i+1]='+') or (s[i+1]=' ') or (s[i+1]='-')) then nrx2:=nrx2+1;
ss:='';
if s[i]=' ' then break;
until i=length(s);







if nrx1<>nrx2 then begin
str((nr2-nr1)/(nrx1-nrx2),ss);
g:='';
for i:=22 to 25 do g:=g+ss[i];
val(g,nr);

if nr<>0 then begin
if ss[1]='-' then write(f2,'-');
if ss[21]='+' then begin
for i:=2 to nr+3 do if ss[i]<>'.' then write(f2,ss[i]);
write(f2,'.');
for i:=nr+4 to (nr+7) do write(f2,ss[i]);
end;
if ss[21]='-' then begin
write(f2,0,'.');
for i:=1 to (nr-1) do write(f2,0);
for i:=2 to 4-nr+3 do
if ss[i]<>'.' then write(f2,ss[i]);
end;
writeln(f2);
end else
begin
if ss[1]='-' then write(f2,'-');
for i:=2 to 7 do write(f2,ss[i]);
writeln(f2);
end;

end else
if (nrx1=nrx2) and (nr1<>nr2) then writeln(f2,'imposibil') else
if (nrx1=nrx2) and (nr1=nr2) then writeln(f2,'infinit');













ss:='';
until u=n;

close(f1);
close(f2);
end.
