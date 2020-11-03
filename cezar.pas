program cezar1;
type matrice=array[1..30, 1..10] of char;
tabel1=array[1..10] of integer;
var c:matrice; chei:tabel1; i,j,g,t:integer;
f1,f2:text; ch,cod:string;
begin g:=0;
assign(f1,'cezar.in'); reset(f1);
assign(f2,'cezar.out'); rewrite(f2);
readln(f1,ch);
for i:=1 to 10 do read(f1,chei[i]);
for i:=1 to (length(ch) div 10)+1 do
for j:=1 to 10 do begin
g:=g+1;
if ch[g]=' ' then g:=g+1;
if (ch[g]<>' ') and (ch[g]<>'') then c[i,j]:=ch[g];
if ch[g]='' then break;
end;
for i:=1 to (g div 10)+1 do
for j:=1 to 10 do begin
if (ord(c[i,j])-chei[j]>=65) then t:=ord(c[i,j])-chei[j];
if (ord(c[i,j])-chei[j]<65) then t:=90-(64-(ord(c[i,j])-chei[j]));
c[i,j]:=chr(t);  end;
t:=0;
cod:='';
for i:=1 to (g div 10)+1 do
for j:=1 to 10 do
if (ord(c[i,j])>64) and (ord(c[i,j])<91) then begin
t:=t+1;
if ch[t]<>' ' then cod:=cod+c[i,j];
if ch[t]=' ' then begin t:=t+1; cod:=cod+' '+c[i,j]; end;
end;
write(f2,cod);
close(f1);
close(f2);
end.
