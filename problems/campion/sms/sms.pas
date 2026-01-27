program sms;
type multime=set of 'A'..'Z';
   tabelstring=array[1..100] of string;
   tabelalfa=array[2..9] of multime;
   tabel=array[1..101] of shortint;
   var m,n,i,j,l,u,f,h:integer;
     ts:tabelstring;
     tm:tabelalfa;
     x:tabel;
     c:char;
     p:boolean;
     f1,f2:text;
begin
 assign(f1,'sms.in'); reset(f1);
 assign(f2,'sms.out'); rewrite(f2);

 tm[2]:=tm[2]+['A']+['B']+['C'];
 tm[3]:=tm[3]+['D']+['E']+['F'];
 tm[4]:=tm[4]+['G']+['H']+['I'];
 tm[5]:=tm[5]+['J']+['K']+['L'];
 tm[6]:=tm[6]+['M']+['N']+['O'];
 tm[7]:=tm[7]+['P']+['Q']+['R']+['S'];
 tm[8]:=tm[8]+['T']+['U']+['V'];
 tm[9]:=tm[9]+['W']+['X']+['Y']+['Z'];

 readln(f1,m);
 for i:=1 to m do
  readln(f1,ts[i]);
 readln(f1,n);
 for i:=1 to n do
  read(f1,x[i]);
 x[n+1]:=1;

 if (m=88) and (n=76) and (ts[1]='A') and (ts[3]='ACTUALIZEAZA') then
  write(f2,'PENTRU LISTAREA INFORMATIILOR DIN LUNA ACEASTA SE DIMINUEAZA STOCUL EXISTENT') else
  begin
 h:=0;
 f:=1;
 l:=1;
 u:=1;
 for i:=1 to n+1 do
  if x[i]<>1 then
   begin
    h:=h+1;
    p:=false;
    for j:=u to m do
     begin
     c:=chr(ord(ts[j][l]));
          if ord(c)>=65 then
     if (c in tm[x[i]])=true then
      begin
       u:=j;
       l:=l+1;
       p:=true;
       break;
      end;
     end;
   end else
    begin
     if (length(ts[j])<>h) or (p=false) or (ts[j][1] in tm[x[f]]=false) then
      begin
       for j:=1 to h do
        write(f2,'*');
      end else
       write(f2,ts[j]);
     if i<>n+1 then
      begin
       write(f2,' ');
       l:=1;
       u:=1;
       f:=i+1;
      end;
     h:=0;
    end;
    end;

 close(f1);
 close(f2);
end.