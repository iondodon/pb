program matrice4;
type matrice=array[1..51, 1..51] of longint;
     tabel=array[1..38000] of longint;
var n,m,i,j,l,paij,u,max:longint; a,b:matrice; c,p:tabel;
f1,f2:text;

Procedure quickSort(var v:tabel; st,dr:longint);
Var pivot, i,j,aux,m:longint;
begin
	i:=st;j:=dr;m:=(st+dr) div 2;
pivot:=v[m];
while i<=j do
	begin
	while v[i] <pivot do
		i:=i+1;
	while v[j]>pivot do
		j:=j-1;
                              if i<=j then
	begin
				aux :=v[i];
				v[i] :=v[j];
				v[j] :=aux;
				i:=i+1;
				j:=j-1;
	end;
                         end;
               if st<j then
                      quickSort(v,st,j);
                if i<dr then
                      quickSort(v,i,dr);
end;




begin
	assign(f1,'matrice4.in'); reset(f1);
	assign(f2,'matrice4.out'); rewrite(f2);
	readln(f1,n,m);
	
	for i:=1 to n do
		begin
			for j:=1 to m do
				read(f1,a[i,j]);
			readln(f1);
		end;

i:=4;
while (i<=38000) do
	begin
		p[i]:=1;
		i:=i+2;
	end;
i:=3;
while (i*i<=38000) do
	begin
		if p[i]=0 then
			begin
				j:=i*i;
				while (j<=38000) do
					begin
						p[j]:=1;
						j:=j+i;
					end;
			end;
	i:=i+2;
	end;


for i:=1 to n do
	for j:=1 to m do
		begin
			for u:=a[i,j] to 38000 do
				if p[u]=0 then
					begin
						paij:=u;
						break;
					end;		
			b[i,j]:=paij-a[i,j];
		end;

max:=0;
for i:=1 to n do
	for j:=1 to m do
		if b[i,j]>max then
			max:=b[i,j];

l:=0;
for i:=1 to n do
	for j:=1 to m do
		if b[i,j]=max then
			begin
				inc(l);
				c[l]:=a[i,j]+max;
			end;

quickSort(c,1,l);

writeln(f2,max+1,' ',l);

for i:=1 to l do
	write(f2,c[i],' ');

close(f1);
close(f2);
end.
