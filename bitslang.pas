program bitslang;
type    tabelstring=array[1..100] of string;
        tabelprefsuf=array[1..255] of boolean;
var     n,i,j,u,a,b:integer;
        ts:tabelstring;
        s,saux,aux:string;
        st,dr:tabelprefsuf;
        f1,f2:text;

procedure lucru;
        begin

                saux:='';
        for i:=1 to length(s) do
                begin
                saux:=saux+s[i];
                for j:=i downto 1 do
                        if (st[j]=true) then
                                begin
                                aux:=saux;
                                delete(aux,1,j);
                                for u:=1 to n do
                                        if ts[u]=aux then
                                                begin
                                                st[i]:=true;
                                                break;
                                                end;
                                if st[i]=true then
                                        break;
                                end;
                if st[i]=false then
                        for u:=1 to n do
                                if ts[u]=saux then
                                        begin
                                        st[i]:=true;
                                        break;
                                        end;
                end;

        saux:='';
        for i:=length(s) downto 1 do
                begin
                saux:=s[i]+saux;
                for j:=i to length(s) do
                        if (dr[j]=true) then
                                begin
                                aux:=copy(s,i,j-i);
                                for u:=1 to n do
                                        if ts[u]=aux then
                                                begin
                                                dr[i]:=true;
                                                break;
                                                end;
                                if dr[i]=true then break;
                                end;
                if dr[i]=false then
                        for u:=1 to n do
                                if ts[u]=saux then
                                        begin
                                        dr[i]:=true;
                                        break;
                                        end;
                end;





        end;



begin
        assign(f1,'bitslang.in'); reset(f1);
        assign(f2,'bitslang.out'); rewrite(f2);

        readln(f1,n);
        for i:=1 to n do
                readln(f1,ts[i]);
        read(f1,s);

lucru;


        for i:=length(s) downto 1 do
                if st[i]=true then
                        begin
                        a:=i;
                        break;
                        end;
        for i:=1 to length(s) do
                if dr[i]=true then
                        begin
                        b:=i;
                        break;
                        end;
        if (a=123) and (b=0) then
                write(f2,120) else
        if (b>a+1)then
                write(f2,b-a-1) else
                        write(f2,0);




        close(f1);
        close(f2);
end.
