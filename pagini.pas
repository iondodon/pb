program pagini;
var c,n,i,nc:longint;
f1,f2:text;
begin nc:=0;
assign(f1,'pagini.in'); reset(f1);
assign(f2,'pagini.out'); rewrite(f2);
readln(f1,c); readln(f1,n);

if c=1 then begin 
for i:=1 to n do begin
if i<10 then  inc(nc);
if (i>=10) and (i<=99) then  inc(nc,2);
if (i>=100) and (i<=999) then  inc(nc,3);
if (i>=1000) and (i<=9999) then  inc(nc,4);
if (i>=10000) and (i<=99999) then  inc(nc,5);
if (i>=100000) and (i<=999999) then  inc(nc,6);
if (i>=1000000) and (i<=9999999) then  inc(nc,7);
end;
write(f2,nc);
end;

if c=2 then begin
for i:=1 to 100000 do begin
if i<10 then  inc(nc);
if (i>=10) and (i<=99) then  inc(nc,2);
if (i>=100) and (i<=999) then  inc(nc,3);
if (i>=1000) and (i<=9999) then  inc(nc,4);
if (i>=10000) and (i<=99999) then  inc(nc,5);
if (i>=100000) and (i<=999999) then  inc(nc,6);
if (i>=1000000) and (i<=9999999) then  inc(nc,7);
if nc=n then break;
end;
write(f2,i);
end;

close(f1);
close(f2);
end.