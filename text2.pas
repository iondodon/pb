program text2;
type alfabet=set of char;
     textt=array[0..1005] of char;
     secvente=array[1..1005] of integer;

var n,i,j,colturi,len,cu,cm,cmm,nr,f:integer; alfa:alfabet;
f1,f2:text; t:textt; se:secvente; s:string; p:boolean;

begin colturi:=0;   cmm:=0;
assign(f1,'text2.in'); reset(f1);
assign(f2,'text2.out'); rewrite(f2);
readln(f1,n);
for i:=97 to 122 do alfa:=alfa+[chr(i)];
for i:=1 to n do  begin read(f1,t[i]); if (t[i] in alfa=true) then begin colturi:=colturi+1; alfa:=alfa-[t[i]]; end;
end;
t[n+1]:='*';
f:=0;
repeat f:=f+1; until t[f]<>'*';

cu:=1; len:=1; p:=false;
for i:=f to n+1 do
if t[i]<>'*' then begin s:=s+t[i]; p:=false;  end
else begin

for j:=2 to length(s) do
if s[j]>s[j-1] then len:=len+1 else
begin if len>cm then begin  cm:=len; se[cu]:=cm; if cm>cmm then cmm:=cm; end; len:=1; end;
s:='';
if len>cm then begin cm:=len; se[cu]:=cm; if cm>cmm then cmm:=cm; end;
len:=1;
if p=false then begin  se[cu]:=cm; if cm>cmm then cmm:=cm; cu:=cu+1; cm:=1; p:=true;   end;
end;

nr:=0;
for i:=1 to cu do
if se[i]=cmm then nr:=nr+1;

writeln(f2,nr);
for i:=1 to cu do
if se[i]=cmm then write(f2,i,' ');
writeln(f2);
write(f2,colturi);

close(f1);
close(f2);
end.
