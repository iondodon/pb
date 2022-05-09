program romane;
var n,I,V,X,L,C,j:integer;
f:text;
begin
assign(f,'romane.in'); reset(f); read(f,n); close(f);
I:=0; V:=0; X:=0; L:=0; C:=0;

for j:=1 to n do begin
if j<10 then begin 
if (j mod 10=1) then I:=I+1;
if (j mod 10=2) then I:=I+2;
if (j mod 10=3) then I:=I+3;
if (j mod 10=4) then begin I:=I+1; V:=V+1; end;
if (j mod 10=5) then V:=V+1;
if (j mod 10=6) then begin V:=V+1; I:=I+1; end;
if (j mod 10=7) then begin V:=V+1; I:=I+2; end;
if (j mod 10=8) then begin V:=V+1; I:=I+3; end;
if (j mod 10=9) then begin I:=I+1; X:=X+1; end;   end;

if (j>=10) and (j<100) then begin 
if (j mod 10=1) then I:=I+1;
if (j mod 10=2) then I:=I+2;
if (j mod 10=3) then I:=I+3;
if (j mod 10=4) then begin I:=I+1; V:=V+1; end;
if (j mod 10=5) then V:=V+1;
if (j mod 10=6) then begin V:=V+1; I:=I+1; end;
if (j mod 10=7) then begin V:=V+1; I:=I+2; end;
if (j mod 10=8) then begin V:=V+1; I:=I+3; end;
if (j mod 10=9) then begin I:=I+1; X:=X+1; end; 

if j div 10=1 then X:=X+1; 
if j div 10=2 then X:=X+2;
if j div 10=3 then X:=X+3;
if j div 10=4 then begin L:=L+1; X:=X+1; end;
if j div 10=5 then L:=L+1;
if j div 10=6 then begin L:=L+1; X:=X+1; end;
if j div 10=7 then begin L:=L+1; X:=X+2; end;
if j div 10=8 then begin L:=L+1; X:=X+3; end;
if j div 10=9 then begin C:=C+1; X:=X+1; end;    end;

if (j>=100) then begin 
if (j mod 10=1) then I:=I+1;
if (j mod 10=2) then I:=I+2;
if (j mod 10=3) then I:=I+3;
if (j mod 10=4) then begin I:=I+1; V:=V+1; end;
if (j mod 10=5) then V:=V+1;
if (j mod 10=6) then begin V:=V+1; I:=I+1; end;
if (j mod 10=7) then begin V:=V+1; I:=I+2; end;
if (j mod 10=8) then begin V:=V+1; I:=I+3; end;
if (j mod 10=9) then begin I:=I+1; X:=X+1; end; 

if ((j mod 100) div 10=1) then X:=X+1;
if ((j mod 100) div 10=2) then X:=X+2;
if ((j mod 100) div 10=3) then X:=X+3;
if ((j mod 100) div 10=4) then begin X:=X+1; L:=L+1; end;
if ((j mod 100) div 10=5) then L:=L+1;
if ((j mod 100) div 10=6) then begin L:=L+1; X:=X+1; end;
if ((j mod 100) div 10=7) then begin L:=L+1; X:=X+2; end;
if ((j mod 100) div 10=8) then begin L:=L+1; X:=X+3; end;
if ((j mod 100) div 10=9) then begin X:=X+1; C:=C+1; end; 

if j div 100=1 then C:=C+1; 
if j div 100=2 then C:=C+2;
if j div 100=3 then C:=C+3;  end;


end;

assign(f,'romane.out'); rewrite(f);
write(f,I,' ',V,' ',X,' ',L,' ',C); 
close(f);
end.