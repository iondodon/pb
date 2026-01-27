program controll;
type tabel=array[1..100] of longint;
var n,x,nu,nz,v,i,j,l,control,u:longint; p:boolean; s:string;
nr,mr:tabel;
f1,f2:text;
begin v:=0; j:=0; l:=0; nu:=0; nz:=0;
assign(f1,'control.in');
assign(f2,'control.out');
reset(f1);
rewrite(f2);
readln(f1,n);
for i:=1 to n do readln(f1,nr[i]);
repeat
p:=true;
if n>1 then
for i:=2 to n do
if nr[i]<nr[i-1] then begin
x:=nr[i];
nr[i]:=nr[i-1];
nr[i-1]:=x; p:=false;
end;
until p=true;
x:=nr[1];
for i:=1 to n do begin
if nr[i]=x then v:=v+1 else
begin
j:=j+1;
x:=nr[i]; mr[j]:=v; v:=1; end;
if i=n then begin j:=j+1; mr[j]:=v;  end;
end;
i:=0;
repeat
i:=i+3;
l:=l+1;
if (mr[i-2] mod 2<>0) and (mr[i-1] mod 2<>0) and (mr[i] mod 2<>0) then nr[l]:=1;
if (mr[i-2] mod 2=0) and (mr[i-1] mod 2=0) and (mr[i] mod 2=0) then nr[l]:=1;
if (mr[i-2] mod 2<>0) and ((mr[i-1] mod 2=0) or (mr[i] mod 2=0)) then nr[l]:=0;
if (mr[i-1] mod 2<>0) and ((mr[i-2] mod 2=0) or (mr[i] mod 2=0)) then nr[l]:=0;
if (mr[i] mod 2<>0) and ((mr[i-2] mod 2=0) or (mr[i-1] mod 2=0)) then nr[l]:=0;
until i=j-(j mod 3);
for i:=1 to l do begin
if nr[i]=1 then nu:=nu+1;
if nr[i]=0 then nz:=nz+1;
end;
u:=0;
control:=(nu*10)+nz;
writeln(f2,control);
for i:=2 to control-1 do
if control mod i=0 then u:=u+1;
if control=2 then writeln(f2,'1');
if control<>2 then begin
if u=0 then begin writeln(f2,'1'); end;
if u>0 then begin writeln(f2,'0'); end;
end;
close(f1);
close(f2);
end.