{
    Se pastreaza un vector A[0..20], unde A[i]=1 daca se poate realiza
  prefixul pana la pozitia curenta-i.
    Se repeta urmatoarea secventa, pana cand A[i]=0 pentru orice i intre
  0 si lungimea secventei maxime sau s-a ajuns la finalul fisierului:
    - se citeste un caracter;
    - se decaleaza cu 1 valorile din A si A[0]:=0;
    - se actualizeaza valoarea A[0], astfel: daca exista o secventa de
  lungime L care se suprapune pe ultimele L pozitii ale sirului si A[L]=1,
  atunci A[0]:=1 si se actualizeaza lungimea prefixului maximal.

}

var f1,f2:text;
    i,j,k,l,curent,m,nr,n:longint;
    s:string;
    c:char;
    pr:array[1..100]of string[20];
    a:array[0..20]of byte;

procedure readdata;
begin
  readln(f1,nr);
  for i:=1 to nr do
      begin
        readln(f1,l);if l>m then m:=l;
        readln(f1,pr[i]);
      end;
end;

procedure solve;
begin
  curent:=0;
  a[0]:=1;
  n:=0;
  readln(f1,c);
  while c<>'.' do
    begin
      inc(curent);
      s:=s+c;if length(s)>m then s:=copy(s,2,m);
      for j:=m downto 1 do a[j]:=a[j-1];
      a[0]:=0;
      for i:=1 to nr do
          if a[0]=0 then
          if copy(s,length(s)-length(pr[i])+1,length(pr[i]))=pr[i] then
             if a[length(pr[i])]=1 then
             begin
               n:=curent;
               a[0]:=1;
             end;
      readln(f1,c);
      if curent-n>m then c:='.';
    end;
  writeln(f2,n);
end;

begin
assign(f1,'prefix.in'); reset(f1);
assign(f2,'prefix.out'); rewrite(f2);
  readdata;
  solve;
close(f1);
close(f2);
end.