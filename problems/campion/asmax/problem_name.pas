program asmax;
type
lista=^date;
date=record
   next:lista;
   m:longint;
end;

nod=record
a,x,z:lista;
v:longint;
p:boolean;
end;
tabel=array[0..16001] of nod;
tabels=array[0..16001] of longint;
var n,i:longint;
smax:tabels;
   t:tabel;
   f1,f2:text;

Procedure init;
var i:longint;
begin
readln(f1,n);
for i:=0 to n do
   begin
   new(t[i].x);
   t[i].x^.m:=-1;
   t[i].x^.next:=nil;
   t[i].a:=t[i].x;
   t[i].z:=t[i].x;
   end;
end;

Procedure readdata;
var i,a,b:longint;
begin
for i:=1 to n do
   begin
   read(f1,t[i].v);
   smax[i]:=t[i].v;
   end;
for i:=1 to n-1 do
   begin
   readln(f1,a,b);
   new(t[a].x);
   t[a].x^.m:=b;
   t[a].x^.next:=nil;
   t[a].z^.next:=t[a].x;
   t[a].z:=t[a].x;
   new(t[b].x);
   t[b].x^.m:=a;
   t[b].x^.next:=nil;
   t[b].z^.next:=t[b].x;
   t[b].z:=t[b].x;
   end;
end;

Procedure rezultat;
var max,i:longint;
begin
max:=-2000000000;
for i:=1 to n do
    if smax[i]>max then
        max:=smax[i];
write(f2,max);
end;

Function run(i:longint):longint;
var x:longint;
begin
t[i].p:=true;
t[i].x:=t[i].a^.next;
while t[i].x<>nil do
    begin
    if t[t[i].x^.m].p=false then
      begin
        x:=run(t[i].x^.m);
        if smax[i]+x>smax[i] then
          smax[i]:=smax[i]+x;
      end;
    t[i].x:=t[i].x^.next;
    end;
  run:=smax[i];
end;

begin
assign(f1,'asmax.in'); reset(f1);
assign(f2,'asmax.out'); rewrite(f2);

init;
readdata;
for i:=1 to n do
    if t[i].p=false then
        run(i);
rezultat;



close(f1);
close(f2);
end.