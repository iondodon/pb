program paritate;
type tabel=array[1..60000] of longint;
var i,nu,cod,l,ll,h:longint;
  t,v:tabel;
  s:string;
  p,q:boolean;
  c:char;
  f1,f2:text;
begin
 assign(f1,'paritate.in'); reset(f1);
 assign(f2,'paritate.out'); rewrite(f2);

 l:=0; ll:=0; h:=0; q:=true;
 while not eoln(f1) do
  begin
   h:=h+1;
   s:=''; nu:=0;
   for i:=1 to 8 do
    begin
     read(f1,c);
     s:=s+chr(ord(c));
     if c='1' then
      nu:=nu+1;
    end;
   p:=false;
   if s[1]='1' then
    if (nu-1) mod 2=1 then p:=true;
   if ((nu mod 2=0) and (s[1]='0')) or (p=true) then
    begin
     cod:=0;
     if s[1]='1' then
         s[1]:='0';
     for i:=1 to 8 do
      begin
       cod:=cod*2;
       if s[i]='1' then
        cod:=cod+1;
      end;
       l:=l+1;
       t[l]:=cod;
    end else
     begin
      q:=false;
      ll:=ll+1;
      v[ll]:=h-1;
     end;
  end;

 if q=true then
  begin
   writeln(f2,'DA');
   for i:=1 to l do
    if t[i]<>13 then
     write(f2,chr(t[i])) else
      writeln(f2);
  end else
   begin
    writeln(f2,'NU');
    for i:=1 to ll do
     write(f2,v[i],' ');
   end;

 close(f1);
 close(f2);
end.