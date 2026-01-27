Program grupe2;
var v:array[1..200] of longint;
    w:array[1..200] of longint;

function nr_div(nr:longint):longint;
var i,d:longint;
begin
 if nr=1 then d:=1
  else
  begin
   d:=2;
   for i:=2 to trunc(sqrt(nr)) do
     if nr mod i=0 then d:=d+2;
   if nr=sqr(trunc(sqrt(nr))) then d:=d-1;
  end;
  nr_div:=d;
end;


procedure calcul;
var f,g:text;
    t,i,m,n,poz1:integer;
    k,q,a,max1,max2:longint;
begin
 assign(f,'grupe2.in');
 reset(f);
 assign(g,'grupe2.out');
 rewrite(g);
 readln(f,m,n);
 k:=0;q:=0;
 for i:=1 to m*n do begin
      read(f,a);
      t:=nr_div(a);
      inc(v[t]);
      if k<t then k:=t;
      if q<v[t] then begin q:=v[t];poz1:=t;end
      else if q=v[t] then if w[poz1]<a then begin w[t]:=a;poz1:=t;end;
      if w[t]<a then begin w[t]:=a;end;
  end;
  writeln(g,poz1,' ',v[poz1],' ',w[poz1]);
  max1:=v[poz1];
  max2:=0;t:=0;
  for i:=1 to k do
    if (max2<v[i]) and (i<>poz1) then begin max2:=v[i];t:=i;end
    else
    if (max2=v[i]) and (i<>poz1) then t:=i;
  if max2=0 then writeln(g,'0 0 0')
         else writeln(g,t,' ',max2,' ',w[t]);
 close(f);
 close(g);
end;


{procedure calcul;
var g:text;
    nr,t,aux,max1,max2,k,i,j,poz:longint;
    ok:boolean;
begin

 k:=0;
 for i:=1 to m do
  for j:=1 to n do
   begin
     t:=nr_div(a[i,j]);
     inc(v[t]);
     if k<t then k:=t;
     if v[t]=1 then w[t]:=a[i,j]
       else if w[t]<a[i,j] then w[t]:=a[i,j];
   end;
  for i:=1 to k do
    writeln('     ',i,' ',v[i]);
  nr:=0;
  for i:=1 to k do
    if v[i]<>0 then begin nr:=nr+1;poz:=i;end;
  if nr=1 then
       begin
        write(g,poz,' ');
        write(g,v[poz],' ');
        writeln(g,w[poz]);
        writeln(g,'0 0 0');
       end
       else
       begin
       ok:=false;
       i:=1;t:=1;
       while not ok do begin
        if v[i]<>0 then if t=1 then begin
                                      t:=t+1;
                                      max1:=v[i];
                                    end
                                    else
                                      begin
                                       max2:=v[i];poz:=i;
                                       ok:=true;
                                      end;
          i:=i+1;
         end;
       if max1<max2 then
        begin
         aux:=max1;
         max1:=max2;max2:=aux;
        end;
       for i:=poz+1 to k do
        if max1<=v[i] then
          begin
            max2:=max1;
            max1:=v[i];
          end
          else
            if max2<v[i] then max2:=v[i];
       ok:=false;
       i:=k;
       writeln('        Grupele');

       while not ok do
       begin
        if v[i]=max1 then begin
               write(g,i,' ');ok:=true;poz:=i;end;
        i:=i-1;
       end;
       write(g,max1,' ');
       writeln(g,w[poz]);
       i:=k;
       ok:=false;
       while not ok do
       begin
        if (v[i]=max2) and (i<>poz) then begin
               write(g,i,' ');poz:=i;ok:=true;end;
        i:=i-1;
      end;
      write(g,max2,' ');
      writeln(g,w[poz]);
      end;
   close(g);}



begin
 calcul;
end.