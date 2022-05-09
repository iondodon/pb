program ordonare;
type
 date=record
  st:string;
  val:longint;
 end;
 tabel=array[1..1000] of date;
  tabelcaractere=array[0..26] of longint;
 var t:tabel; c:tabelcaractere;
  ss:ansistring; s,auxs,sss:string;
  i,j,l,auxx,k,n1,m1:longint;
  q:boolean;
  f1,f2:text;

begin
assign(f1,'ordonare.in'); reset(f1);
assign(f2,'ordonare.out'); rewrite(f2);
readln(f1,s);

sss:='abcdefghijklmnopqrstuvwxyz';
for i:=1 to length(sss) do
 for j:=1 to length(s) do
  if sss[i]=s[j] then
            begin
    c[i-1]:=j;
                break;
            end;

s:='';
l:=0;
read(f1,ss);
ss:=ss+'.';
for i:=1 to length(ss) do
 if (ord(ss[i])>=97) and (ord(ss[i])<=122) then
  s:=s+ss[i] else
   if (length(s)>=1) then
    begin
     q:=false;
     for j:=1 to l do
      if t[j].st=s then
       begin
        inc(t[j].val);
        q:=true;
       end;
     if q=false then
      begin
       l:=l+1;
       t[l].st:=s;
       t[l].val:=1;
      end;
     s:='';
    end;

for i:=1 to l do
 for j:=i+1 to l do
  begin
   k:=1;
   n1:=length(t[i].st);
   m1:=length(t[j].st);
   while (k<=n1) and (k<=m1) and (t[i].st[k]=t[j].st[k]) do
    k:=k+1;
   if (k<=n1) and (k<=m1) and (c[ord(t[i].st[k])-97]>c[ord(t[j].st[k])-97]) then
    begin
     auxs:=t[i].st;        auxx:=t[i].val;
     t[i].st:=t[j].st;     t[i].val:=t[j].val;
     t[j].st:=auxs;          t[j].val:=auxx;
    end;
  end;

repeat
 q:=false;
 for i:=2 to l do
        if (length(t[i].st)<length(t[i-1].st)) and (copy(t[i-1].st,1,length(t[i].st))=t[i].st) then
   begin
    auxs:=t[i-1].st;        auxx:=t[i-1].val;
    t[i-1].st:=t[i].st;     t[i-1].val:=t[i].val;
    t[i].st:=auxs;          t[i].val:=auxx;
                q:=true;
   end;
until q=false;

for i:=1 to l do
 for j:=1 to t[i].val do
  write(f2,t[i].st,' ');
writeln(f2);


close(f1);
close(f2);
end.