var a:array[1..10000] of word;
    y:array['A'..'Z']of byte;
    xx,x:array[1..10000] of word;
    i,j,t,n,nr,nr1,l:longint;
    c:char;
    ok:boolean;
    f:text;
    m:set of char;
begin
assign(f,'litere.in');
reset(f);
m:=[];
nr:=0;

readln(f);
readln(f);
readln(f,n);
for i:=1 to n do read(f,a[i]);

reset(f);
readln(f,l);
read(f,c);
if pos(c,'AEIOU')<>0 then t:=1 else t:=2;
nr:=0;
m:=m+[c];
nr1:=0;
inc(nr);
y[c]:=a[nr];
x[1]:=y[c];
for i:=2 to l do
begin
 read(f,c);
 if (pos(c,'AEIOU')<>0)and(t=2)or(pos(c,'AEIOU')=0)and(t=1) then inc(nr1);
 if pos(c,'AEIOU')<>0 then t:=1 else t:=2;
 if not(c in m) then begin inc(nr);m:=m+[c];y[c]:=a[nr];end;
 x[i]:=y[c];
end;
close(f);
for i:=1 to l do xx[i]:=x[i];
t:=0;
for i:=l downto 1 do
 begin
  nr:=t+x[i]*i;
  t:=nr div 10;
  x[i]:=nr mod 10;
 end;

assign(f,'litere.out');
rewrite(f);
{a}
writeln(f,nr1);
{b}
for i:=1 to l do write(f,xx[i]);
writeln(f);
{c}
if t<>0 then write(f,t);
for i:=1 to l do write(f,x[i]);
close(f);
end.