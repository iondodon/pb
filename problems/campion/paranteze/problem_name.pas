program parantezee;
type nrparanteze=array[0..3]  of integer;
     tabel=array[1..500] of integer;
 
var n,i,j,u,l:integer;
f1,f2:text; t:tabel; pa:nrparanteze; p,b:boolean;

begin
assign(f1,'paranteze.in'); reset(f1);
assign(f2,'paranteze.out'); rewrite(f2);
readln(f1,n);

for u:=1 to n do begin
read(f1,l);
for i:=1 to l do read(f1,t[i]); readln(f1);

pa[0]:=0; pa[1]:=0; pa[2]:=0; pa[3]:=0;

b:=false;
i:=1; j:=1; inc(pa[t[1]]);
repeat
j:=j+1;
inc(pa[t[j]]); 

if (l=1) and (t[1]=0) then begin b:=true; break; end;

if t[i]=0 then p:=true else
if t[i]=2 then p:=false else begin b:=true; break;  end;

if p=true then begin
if pa[1]>pa[0] then begin b:=true; break; end;
if pa[3]>pa[2] then begin b:=true; break; end;
if pa[0]=pa[1] then begin
if pa[2]<>pa[3] then begin b:=true; break; end;
if j<>l then begin i:=j+1; j:=i; pa[0]:=0; pa[1]:=0; pa[2]:=0; pa[3]:=0;  inc(pa[t[i]]); end;
end;
end;

if p=false then begin
if pa[3]>pa[2] then begin b:=true; break; end;
if pa[1]>pa[0] then begin b:=true; break; end;
if pa[2]=pa[3] then begin
if pa[0]<>pa[1] then begin b:=true; break; end;
if j<>l then begin i:=j+1; j:=i; pa[0]:=0; pa[1]:=0; pa[2]:=0; pa[3]:=0;   inc(pa[t[i]]); end;
end;
end;


until j>=l;

if (p=true) and (pa[0]<>pa[1]) then b:=true;
if (p=false) and (pa[2]<>pa[3]) then b:=true;

if b=true then writeln(f2,0) else writeln(f2,1);


end;



close(f1);
close(f2);
end.