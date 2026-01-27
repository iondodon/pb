Program cod4;
type tabel=array[1..100] of longint;
        tabelcif=array[1..11] of longint;
var n,p:longint;
        s,c,t:tabel;
        cifs,cifc,inn,vmax:tabelcif;
        f1,f2:text;

Procedure readdata;
var i:longint;
begin
readln(f1,n,p);
for i:=1 to n do
        read(f1,s[i]);
readln(f1);
for i:=1 to p do
        read(f1,c[i]);
end;

Procedure afisare;
var i:longint;
begin
for i:=1 to n do
        write(f2,t[i],' ');
end;

Procedure find;
var i,k,j,l,aux,ns,nc,ncom,max:longint;
begin
for i:=1 to n do
        begin

        max:=0;
        aux:=s[i];
        ns:=0;

        while (aux<>0) do
                begin
                ns:=ns+1;
                cifs[ns]:=aux mod 10;
                aux:=aux div 10;
                end;

        for k:=1 to p do
            begin
            aux:=c[k];
            nc:=0;
            while (aux<>0) do
               begin
               nc:=nc+1;
               cifc[nc]:=aux mod 10;
               aux:=aux div 10;
               end;

            ncom:=0;
            for j:=1 to ns do
               for l:=1 to nc do
                  if cifs[j]=cifc[l] then
                     begin
                     ncom:=ncom+1;
                     inn[ncom]:=cifs[j];
                     cifc[l]:=-1;
                     break;
                     end;

            if ((ns mod 2=1) and (ncom>=ns div 2+1)) or ((ns mod 2=0) and (ncom>=ns div 2)) then
               if ncom>max then
                  begin
                  max:=ncom;
                  for j:=1 to max do
                     vmax[j]:=inn[j];
                  end;

            end;

         if max<>0 then
            begin
               for j:=1 to max do
                  for k:=1 to ns do
                     if vmax[j]=cifs[k] then
                        begin
                           for l:=k to ns do
                              cifs[l]:=cifs[l+1];
                           ns:=ns-1;
                           break;
                        end;
               aux:=0;
                  for j:=9 downto 0 do
                     for l:=1 to ns do
                        if j=cifs[l] then
                           aux:=aux*10+j;
                     if aux<12345 then
                        aux:=aux+12345;
                     t[i]:=aux;
            end else
               t[i]:=s[i];
      end;
end;

begin
assign(f1,'cod4.in'); reset(f1);
assign(f2,'cod4.out'); rewrite(f2);

readdata;
find;
afisare;

close(f1);
close(f2);
end.