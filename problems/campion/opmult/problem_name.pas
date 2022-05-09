program opmult;
type
   date=record
   semn:byte;
   n1,n2:integer;
   end;
   type tabel=array[1..1000] of date;
  var n,y,i,j,u,l,in1,in2:integer;
    s:ansistring;
    t:tabel;
        int:array[0..255] of shortint;
    f1,f2:text;

Procedure Resetare;
 var i:integer;
begin
 for i:=1 to 255 do
  int[i]:=0;
end;


Function numar(j:integer):integer;
 var i:integer;
   q:boolean;
begin
 q:=false;
 t[l].n1:=0;
 t[l].n2:=0;
 for i:=j to j+10 do
  if (s[i]<>',') and (q=false) then
   t[l].n1:=(t[l].n1*10)+(ord(s[i])-48) else
    if (s[i]<>',') and (s[i]<>')') and (s[i]<>']') and (s[i]<>'n') and (s[i]<>'u') and (s[i]<>'-') and (q=true) then
     t[l].n2:=(t[l].n2*10)+(ord(s[i])-48) else
      if s[i]=',' then
       q:=true else
        if (s[i]='n') or (s[i]='u') or (s[i]='-') then
         break;
 if s[j-1]='(' then
  inc(t[l].n1);
 if s[i-1]=')' then
  dec(t[l].n2);
 numar:=i;
end;

Procedure Intersectie(n1,n2,n3,n4:integer);
 var i,j:integer;
begin
 Resetare;
 in1:=0;
 in2:=0;
 for i:=n1 to n2 do
  int[i]:=int[i]+1;
 for i:=n3 to n4 do
  int[i]:=int[i]+1;
 for i:=1 to 255 do
  if int[i]=2 then
   begin
    in1:=i;
    break;
   end;
 in2:=in1;
 for i:=in1+1 to 255 do
  if int[i]=2 then
   in2:=in2+1 else
    break;
end;

begin
 assign(f1,'opmult.in'); reset(f1);
 assign(f2,'opmult.out'); rewrite(f2);
 readln(f1,n);

 for u:=1 to n do
  begin
   read(f1,y);
   readln(f1,s);
   s:=s+'u';
   s[1]:='u';
   i:=1;
   j:=i;

   l:=1;
   while j<length(s) do
    begin
     if (s[j]='n') then
      begin
       repeat
        j:=j+2;
        j:=numar(j);
        Intersectie(t[l-1].n1,t[l-1].n2,t[l].n1,t[l].n2);
        t[l-1].n1:=in1;
        t[l-1].n2:=in2;
              until s[j]<>'n';
      end else
       begin
        if s[j]='-' then
         t[l].semn:=1 else
          t[l].semn:=0;
        j:=j+2;
         j:=numar(j);
        l:=l+1;
       end;
    end;

   Resetare;

   for i:=1 to l-1 do
    if t[i].semn=0 then
     begin
      for j:=t[i].n1 to t[i].n2 do
       int[j]:=1;
     end else
      if t[i].semn=1 then
       begin
        for j:=t[i].n1 to t[i].n2 do
         int[j]:=0;
       end;

   if int[y]=1 then
    writeln(f2,'DA') else
     writeln(f2,'NU');

  end;

 close(f1);
 close(f2);
end.