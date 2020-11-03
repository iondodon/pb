program traseu2;
var
ce:array[0..101, 0..101] of 0..1;
n,i,j,l,c,x,y:integer; s:string;
f:text;
begin
	assign(f,'traseu2.in'); reset(f);
readln(f,n); readln(f,x,y);
for i:=1 to n do begin
	for j:=1 to n do read(f,ce[i,j]);
	readln(f);
end;
read(f,s); close(f);

l:=x; c:=y;
for i:=1 to length(s) do begin
if s[i]='N' then if ce[x-1,y]=0 then x:=x-1;
if s[i]='S' then if ce[x+1,y]=0 then x:=x+1;
if s[i]='E' then if ce[x,y+1]=0 then y:=y+1;
if s[i]='V' then if ce[x,y-1]=0 then y:=y-1;
 if (x=0) or (y=0) or (x>n) or (y>n) then break else begin l:=x; c:=y; end;
 end;


assign(f,'traseu2.out'); rewrite(f);
write(f,l,' ',c);

close(f);
end.
