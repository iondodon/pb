program reziston;
var s:ansistring;
  i:integer;
  f1,f2:text;

function paralel:longint;
forward;

function serie:longint;
  var nr,suma:longint;
 begin
  suma:=0;
    while (s[i]='R') or (s[i]='(') do
     begin
      if s[i]='R' then
       begin
       nr:=0;
       i:=i+1;
       while (ord(s[i])>=48) and (ord(s[i])<=57) do
        begin
         nr:=(nr*10)+(ord(s[i])-48);
         i:=i+1;
        end;
       suma:=suma+nr;
       end else 
        if s[i]='(' then 
         suma:=suma+paralel;
     end;
  serie:=suma;
 end;

function paralel:longint;
 var produs,suma,aux:longint;
 begin
  produs:=1;
  suma:=0;
  i:=i+1;
  while s[i]<>')' do
   begin
    if s[i]=',' then
     i:=i+1;
    if (s[i]='R') or (s[i]='(') then
     begin
      aux:=serie;
      produs:=produs*aux;
      suma:=suma+aux;
     end;
   end;
  i:=i+1;
  paralel:=produs div suma;
 end;

procedure main;
 begin
  read(f1,s);
    s:=s+' ';
    i:=1;
  write(f2,serie);
 end;

begin
 assign(f1,'reziston.in'); reset(f1);
 assign(f2,'reziston.out'); rewrite(f2);
 main;
 close(f1);
 close(f2);
end.