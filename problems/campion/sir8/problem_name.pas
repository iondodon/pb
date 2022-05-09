Program sir8;
type
lista=^date;
date=record
c:char;
next:lista;
end;
var n:integer; a,it,z,x:lista;
f1,f2:text;

Procedure initiere;
begin
new(a);
a^.c:='1';
a^.next:=nil;
z:=a;
end;

procedure extinde(nr:integer;aux:char;p:boolean);
begin
if p=false then
begin
new(a);
a^.c:=chr(nr+48);
a^.next:=nil;
z:=a;
end else
begin
new(x);
x^.c:=chr(nr+48);
x^.next:=nil;
z^.next:=x;
z:=x;
end;
new(x);
x^.c:=aux;
x^.next:=nil;
z^.next:=x;
z:=x;
end;

Procedure run;
var i,nr:integer; aux:char; p:boolean;
begin
for i:=2 to n do
        begin
        it:=a; aux:=it^.c; p:=false;
        while(it<>nil)do
                begin
                nr:=0;
                while((it<>nil) and (it^.c=aux))do
                        begin inc(nr); it:=it^.next; end;
                extinde(nr,aux,p);
                p:=true;
                if it<>nil then aux:=it^.c;
                end;
        end;
end;

Procedure afisare;
begin
it:=a;
while(it<>nil)do
begin write(f2,it^.c); it:=it^.next; end;
end;

begin
assign(f1,'sir8.in'); reset(f1);
assign(f2,'sir8.out'); rewrite(f2);
        read(f1,n);
        initiere();
        run();
        afisare();
close(f1);
close(f2);
end.